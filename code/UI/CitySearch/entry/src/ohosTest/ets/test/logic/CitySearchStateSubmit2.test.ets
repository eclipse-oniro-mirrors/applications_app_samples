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

/** Logic checks for CitySearchState.submit (66 cases). */
export default function citySearchStateSubmit2Test(): void {
  describe('CitySearchStateSubmit2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0067
     * @tc.name      CitySearch_CitySearchStateSubmit_0067
     * @tc.desc      CitySearchState.submit(value="DDI") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0067 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('DDI');
      logInfo(`submit(value="DDI"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="DDI") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DDI');
      logInfo(`submit(value="DDI") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="DDI") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0068
     * @tc.name      CitySearch_CitySearchStateSubmit_0068
     * @tc.desc      CitySearchState.submit(value="onzIJMH") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0068 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('onzIJMH');
      logInfo(`submit(value="onzIJMH"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="onzIJMH") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('onzIJMH');
      logInfo(`submit(value="onzIJMH") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="onzIJMH") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0069
     * @tc.name      CitySearch_CitySearchStateSubmit_0069
     * @tc.desc      CitySearchState.submit(value="wHDpmYuU") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0069 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('wHDpmYuU');
      logInfo(`submit(value="wHDpmYuU"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="wHDpmYuU") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('wHDpmYuU');
      logInfo(`submit(value="wHDpmYuU") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="wHDpmYuU") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0070
     * @tc.name      CitySearch_CitySearchStateSubmit_0070
     * @tc.desc      CitySearchState.submit(value="FEXC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0070 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('FEXC');
      logInfo(`submit(value="FEXC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="FEXC") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FEXC');
      logInfo(`submit(value="FEXC") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="FEXC") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0071
     * @tc.name      CitySearch_CitySearchStateSubmit_0071
     * @tc.desc      CitySearchState.submit(value="XX95wyeo8gIQ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0071 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('XX95wyeo8gIQ');
      logInfo(`submit(value="XX95wyeo8gIQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="XX95wyeo8gIQ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XX95wyeo8gIQ');
      logInfo(`submit(value="XX95wyeo8gIQ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="XX95wyeo8gIQ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0072
     * @tc.name      CitySearch_CitySearchStateSubmit_0072
     * @tc.desc      CitySearchState.submit(value="MtfxqZlXkqbX") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0072 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('MtfxqZlXkqbX');
      logInfo(`submit(value="MtfxqZlXkqbX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="MtfxqZlXkqbX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('MtfxqZlXkqbX');
      logInfo(`submit(value="MtfxqZlXkqbX") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="MtfxqZlXkqbX") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0073
     * @tc.name      CitySearch_CitySearchStateSubmit_0073
     * @tc.desc      CitySearchState.submit(value="Wbdei3n0cB") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0073 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Wbdei3n0cB');
      logInfo(`submit(value="Wbdei3n0cB"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Wbdei3n0cB") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Wbdei3n0cB');
      logInfo(`submit(value="Wbdei3n0cB") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Wbdei3n0cB") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0074
     * @tc.name      CitySearch_CitySearchStateSubmit_0074
     * @tc.desc      CitySearchState.submit(value="5fxkMi9DG") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0074 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('5fxkMi9DG');
      logInfo(`submit(value="5fxkMi9DG"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="5fxkMi9DG") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5fxkMi9DG');
      logInfo(`submit(value="5fxkMi9DG") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="5fxkMi9DG") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0075
     * @tc.name      CitySearch_CitySearchStateSubmit_0075
     * @tc.desc      CitySearchState.submit(value="KJL1oXbjZN") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0075 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('KJL1oXbjZN');
      logInfo(`submit(value="KJL1oXbjZN"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="KJL1oXbjZN") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KJL1oXbjZN');
      logInfo(`submit(value="KJL1oXbjZN") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="KJL1oXbjZN") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0076
     * @tc.name      CitySearch_CitySearchStateSubmit_0076
     * @tc.desc      CitySearchState.submit(value="qDppagFgof5") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0076 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('qDppagFgof5');
      logInfo(`submit(value="qDppagFgof5"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="qDppagFgof5") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('qDppagFgof5');
      logInfo(`submit(value="qDppagFgof5") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="qDppagFgof5") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0077
     * @tc.name      CitySearch_CitySearchStateSubmit_0077
     * @tc.desc      CitySearchState.submit(value="7aibXh7") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0077 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('7aibXh7');
      logInfo(`submit(value="7aibXh7"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="7aibXh7") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7aibXh7');
      logInfo(`submit(value="7aibXh7") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="7aibXh7") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0078
     * @tc.name      CitySearch_CitySearchStateSubmit_0078
     * @tc.desc      CitySearchState.submit(value="Q7EC0FoRgN") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0078 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Q7EC0FoRgN');
      logInfo(`submit(value="Q7EC0FoRgN"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Q7EC0FoRgN") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Q7EC0FoRgN');
      logInfo(`submit(value="Q7EC0FoRgN") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Q7EC0FoRgN") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0079
     * @tc.name      CitySearch_CitySearchStateSubmit_0079
     * @tc.desc      CitySearchState.submit(value="2ndRkkn") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0079 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('2ndRkkn');
      logInfo(`submit(value="2ndRkkn"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="2ndRkkn") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2ndRkkn');
      logInfo(`submit(value="2ndRkkn") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="2ndRkkn") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0080
     * @tc.name      CitySearch_CitySearchStateSubmit_0080
     * @tc.desc      CitySearchState.submit(value="IaJG") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0080 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('IaJG');
      logInfo(`submit(value="IaJG"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="IaJG") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IaJG');
      logInfo(`submit(value="IaJG") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="IaJG") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0081
     * @tc.name      CitySearch_CitySearchStateSubmit_0081
     * @tc.desc      CitySearchState.submit(value="LOP8R7Yhl") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0081 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('LOP8R7Yhl');
      logInfo(`submit(value="LOP8R7Yhl"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="LOP8R7Yhl") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('LOP8R7Yhl');
      logInfo(`submit(value="LOP8R7Yhl") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="LOP8R7Yhl") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0082
     * @tc.name      CitySearch_CitySearchStateSubmit_0082
     * @tc.desc      CitySearchState.submit(value="6cRm") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0082 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('6cRm');
      logInfo(`submit(value="6cRm"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="6cRm") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6cRm');
      logInfo(`submit(value="6cRm") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="6cRm") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0083
     * @tc.name      CitySearch_CitySearchStateSubmit_0083
     * @tc.desc      CitySearchState.submit(value="dwyHcXv29") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0083 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('dwyHcXv29');
      logInfo(`submit(value="dwyHcXv29"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="dwyHcXv29") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dwyHcXv29');
      logInfo(`submit(value="dwyHcXv29") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="dwyHcXv29") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0084
     * @tc.name      CitySearch_CitySearchStateSubmit_0084
     * @tc.desc      CitySearchState.submit(value="j3ooZzy") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0084 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('j3ooZzy');
      logInfo(`submit(value="j3ooZzy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="j3ooZzy") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('j3ooZzy');
      logInfo(`submit(value="j3ooZzy") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="j3ooZzy") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0085
     * @tc.name      CitySearch_CitySearchStateSubmit_0085
     * @tc.desc      CitySearchState.submit(value="NIKzts") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0085 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('NIKzts');
      logInfo(`submit(value="NIKzts"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="NIKzts") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('NIKzts');
      logInfo(`submit(value="NIKzts") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="NIKzts") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0086
     * @tc.name      CitySearch_CitySearchStateSubmit_0086
     * @tc.desc      CitySearchState.submit(value="J") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0086 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('J');
      logInfo(`submit(value="J"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`submit(value="J") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('J');
      logInfo(`submit(value="J") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="J") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`submit(value="J") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u6d4e\u5357","\u4e5d\u6c5f","\u4f73\u6728\u65af"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0087
     * @tc.name      CitySearch_CitySearchStateSubmit_0087
     * @tc.desc      CitySearchState.submit(value="gcZW7F") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0087 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('gcZW7F');
      logInfo(`submit(value="gcZW7F"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="gcZW7F") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('gcZW7F');
      logInfo(`submit(value="gcZW7F") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="gcZW7F") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0088
     * @tc.name      CitySearch_CitySearchStateSubmit_0088
     * @tc.desc      CitySearchState.submit(value="eS1ZW") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0088 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('eS1ZW');
      logInfo(`submit(value="eS1ZW"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="eS1ZW") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('eS1ZW');
      logInfo(`submit(value="eS1ZW") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="eS1ZW") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0089
     * @tc.name      CitySearch_CitySearchStateSubmit_0089
     * @tc.desc      CitySearchState.submit(value="1vB1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0089 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('1vB1');
      logInfo(`submit(value="1vB1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="1vB1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1vB1');
      logInfo(`submit(value="1vB1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="1vB1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0090
     * @tc.name      CitySearch_CitySearchStateSubmit_0090
     * @tc.desc      CitySearchState.submit(value="T") yields 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0090 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('T');
      logInfo(`submit(value="T"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`submit(value="T") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('T');
      logInfo(`submit(value="T") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="T") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(6);
      logInfo(`submit(value="T") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(0, 3))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 3)))
        .assertEqual('["\u5929\u6d25","\u592a\u539f","\u5410\u9c81\u756a"]');
      logInfo(`submit(value="T") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(3, 6))}`);
      expect(JSON.stringify(subject.searchList.slice(3, 6)))
        .assertEqual('["\u53f0\u5317","\u53f0\u6e7e","\u5510\u5c71"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0091
     * @tc.name      CitySearch_CitySearchStateSubmit_0091
     * @tc.desc      CitySearchState.submit(value="vSgR") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0091 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('vSgR');
      logInfo(`submit(value="vSgR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="vSgR") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vSgR');
      logInfo(`submit(value="vSgR") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="vSgR") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0092
     * @tc.name      CitySearch_CitySearchStateSubmit_0092
     * @tc.desc      CitySearchState.submit(value="lHzVw") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0092 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('lHzVw');
      logInfo(`submit(value="lHzVw"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="lHzVw") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lHzVw');
      logInfo(`submit(value="lHzVw") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="lHzVw") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0093
     * @tc.name      CitySearch_CitySearchStateSubmit_0093
     * @tc.desc      CitySearchState.submit(value="zBTZ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0093 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('zBTZ');
      logInfo(`submit(value="zBTZ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="zBTZ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zBTZ');
      logInfo(`submit(value="zBTZ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="zBTZ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0094
     * @tc.name      CitySearch_CitySearchStateSubmit_0094
     * @tc.desc      CitySearchState.submit(value="B92nGx") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0094 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('B92nGx');
      logInfo(`submit(value="B92nGx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="B92nGx") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('B92nGx');
      logInfo(`submit(value="B92nGx") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="B92nGx") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0095
     * @tc.name      CitySearch_CitySearchStateSubmit_0095
     * @tc.desc      CitySearchState.submit(value="HzotfGfQ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0095 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('HzotfGfQ');
      logInfo(`submit(value="HzotfGfQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="HzotfGfQ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HzotfGfQ');
      logInfo(`submit(value="HzotfGfQ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="HzotfGfQ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0096
     * @tc.name      CitySearch_CitySearchStateSubmit_0096
     * @tc.desc      CitySearchState.submit(value="FpjztP2") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0096 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('FpjztP2');
      logInfo(`submit(value="FpjztP2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="FpjztP2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FpjztP2');
      logInfo(`submit(value="FpjztP2") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="FpjztP2") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0096 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0097
     * @tc.name      CitySearch_CitySearchStateSubmit_0097
     * @tc.desc      CitySearchState.submit(value="IyLZGlPd5T") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0097 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('IyLZGlPd5T');
      logInfo(`submit(value="IyLZGlPd5T"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="IyLZGlPd5T") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IyLZGlPd5T');
      logInfo(`submit(value="IyLZGlPd5T") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="IyLZGlPd5T") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0098
     * @tc.name      CitySearch_CitySearchStateSubmit_0098
     * @tc.desc      CitySearchState.submit(value="w") yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0098 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('w');
      logInfo(`submit(value="w"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`submit(value="w") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('w');
      logInfo(`submit(value="w") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="w") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(5);
      logInfo(`submit(value="w") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(0, 3))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 3)))
        .assertEqual('["\u6b66\u6c49","\u6587\u660c","\u6e29\u5cad"]');
      logInfo(`submit(value="w") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(3, 5))}`);
      expect(JSON.stringify(subject.searchList.slice(3, 5))).assertEqual('["\u6e29\u5dde","\u829c\u6e56"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0099
     * @tc.name      CitySearch_CitySearchStateSubmit_0099
     * @tc.desc      CitySearchState.submit(value="udu47vZe3") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0099 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('udu47vZe3');
      logInfo(`submit(value="udu47vZe3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="udu47vZe3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('udu47vZe3');
      logInfo(`submit(value="udu47vZe3") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="udu47vZe3") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0100
     * @tc.name      CitySearch_CitySearchStateSubmit_0100
     * @tc.desc      CitySearchState.submit(value="5fC8") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0100 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('5fC8');
      logInfo(`submit(value="5fC8"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="5fC8") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5fC8');
      logInfo(`submit(value="5fC8") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="5fC8") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0101
     * @tc.name      CitySearch_CitySearchStateSubmit_0101
     * @tc.desc      CitySearchState.submit(value="3A") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0101 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('3A');
      logInfo(`submit(value="3A"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="3A") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('3A');
      logInfo(`submit(value="3A") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="3A") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0102
     * @tc.name      CitySearch_CitySearchStateSubmit_0102
     * @tc.desc      CitySearchState.submit(value="2vdR0KEAiKps") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0102 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('2vdR0KEAiKps');
      logInfo(`submit(value="2vdR0KEAiKps"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="2vdR0KEAiKps") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2vdR0KEAiKps');
      logInfo(`submit(value="2vdR0KEAiKps") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="2vdR0KEAiKps") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0103
     * @tc.name      CitySearch_CitySearchStateSubmit_0103
     * @tc.desc      CitySearchState.submit(value="V3UDZf4FTD") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0103 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('V3UDZf4FTD');
      logInfo(`submit(value="V3UDZf4FTD"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="V3UDZf4FTD") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('V3UDZf4FTD');
      logInfo(`submit(value="V3UDZf4FTD") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="V3UDZf4FTD") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0104
     * @tc.name      CitySearch_CitySearchStateSubmit_0104
     * @tc.desc      CitySearchState.submit(value="Q") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0104 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Q');
      logInfo(`submit(value="Q"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`submit(value="Q") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Q');
      logInfo(`submit(value="Q") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Q") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`submit(value="Q") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList))
        .assertEqual('["\u9752\u5c9b","\u4e03\u53f0\u6cb3","\u79e6\u7687\u5c9b"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0105
     * @tc.name      CitySearch_CitySearchStateSubmit_0105
     * @tc.desc      CitySearchState.submit(value="5mD6szpnX2Ab") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0105 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('5mD6szpnX2Ab');
      logInfo(`submit(value="5mD6szpnX2Ab"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="5mD6szpnX2Ab") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5mD6szpnX2Ab');
      logInfo(`submit(value="5mD6szpnX2Ab") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="5mD6szpnX2Ab") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0106
     * @tc.name      CitySearch_CitySearchStateSubmit_0106
     * @tc.desc      CitySearchState.submit(value="WDDCxooHO") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0106 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('WDDCxooHO');
      logInfo(`submit(value="WDDCxooHO"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="WDDCxooHO") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('WDDCxooHO');
      logInfo(`submit(value="WDDCxooHO") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="WDDCxooHO") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0107
     * @tc.name      CitySearch_CitySearchStateSubmit_0107
     * @tc.desc      CitySearchState.submit(value="laBOMJTh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0107 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('laBOMJTh');
      logInfo(`submit(value="laBOMJTh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="laBOMJTh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('laBOMJTh');
      logInfo(`submit(value="laBOMJTh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="laBOMJTh") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0108
     * @tc.name      CitySearch_CitySearchStateSubmit_0108
     * @tc.desc      CitySearchState.submit(value="5nToS") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0108 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('5nToS');
      logInfo(`submit(value="5nToS"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="5nToS") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5nToS');
      logInfo(`submit(value="5nToS") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="5nToS") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0109
     * @tc.name      CitySearch_CitySearchStateSubmit_0109
     * @tc.desc      CitySearchState.submit(value="vpX") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0109 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('vpX');
      logInfo(`submit(value="vpX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="vpX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vpX');
      logInfo(`submit(value="vpX") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="vpX") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0110
     * @tc.name      CitySearch_CitySearchStateSubmit_0110
     * @tc.desc      CitySearchState.submit(value="xO8vbe3RHuN") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0110 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xO8vbe3RHuN');
      logInfo(`submit(value="xO8vbe3RHuN"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xO8vbe3RHuN") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xO8vbe3RHuN');
      logInfo(`submit(value="xO8vbe3RHuN") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xO8vbe3RHuN") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0111
     * @tc.name      CitySearch_CitySearchStateSubmit_0111
     * @tc.desc      CitySearchState.submit(value="lQqF5kX") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0111 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('lQqF5kX');
      logInfo(`submit(value="lQqF5kX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="lQqF5kX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lQqF5kX');
      logInfo(`submit(value="lQqF5kX") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="lQqF5kX") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0112
     * @tc.name      CitySearch_CitySearchStateSubmit_0112
     * @tc.desc      CitySearchState.submit(value="Nib17NUggkFZ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0112 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Nib17NUggkFZ');
      logInfo(`submit(value="Nib17NUggkFZ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Nib17NUggkFZ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Nib17NUggkFZ');
      logInfo(`submit(value="Nib17NUggkFZ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Nib17NUggkFZ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0113
     * @tc.name      CitySearch_CitySearchStateSubmit_0113
     * @tc.desc      CitySearchState.submit(value="6DrR") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0113 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('6DrR');
      logInfo(`submit(value="6DrR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="6DrR") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6DrR');
      logInfo(`submit(value="6DrR") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="6DrR") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0114
     * @tc.name      CitySearch_CitySearchStateSubmit_0114
     * @tc.desc      CitySearchState.submit(value="RGQHA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0114 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('RGQHA');
      logInfo(`submit(value="RGQHA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="RGQHA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('RGQHA');
      logInfo(`submit(value="RGQHA") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="RGQHA") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0115
     * @tc.name      CitySearch_CitySearchStateSubmit_0115
     * @tc.desc      CitySearchState.submit(value="d9FYW") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0115 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('d9FYW');
      logInfo(`submit(value="d9FYW"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="d9FYW") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('d9FYW');
      logInfo(`submit(value="d9FYW") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="d9FYW") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0116
     * @tc.name      CitySearch_CitySearchStateSubmit_0116
     * @tc.desc      CitySearchState.submit(value="dQHt") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0116 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('dQHt');
      logInfo(`submit(value="dQHt"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="dQHt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dQHt');
      logInfo(`submit(value="dQHt") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="dQHt") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0117
     * @tc.name      CitySearch_CitySearchStateSubmit_0117
     * @tc.desc      CitySearchState.submit(value="QrNUjLjHy") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0117 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('QrNUjLjHy');
      logInfo(`submit(value="QrNUjLjHy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="QrNUjLjHy") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('QrNUjLjHy');
      logInfo(`submit(value="QrNUjLjHy") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="QrNUjLjHy") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0118
     * @tc.name      CitySearch_CitySearchStateSubmit_0118
     * @tc.desc      CitySearchState.submit(value="i2rWDWQ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0118 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('i2rWDWQ');
      logInfo(`submit(value="i2rWDWQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="i2rWDWQ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('i2rWDWQ');
      logInfo(`submit(value="i2rWDWQ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="i2rWDWQ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0119
     * @tc.name      CitySearch_CitySearchStateSubmit_0119
     * @tc.desc      CitySearchState.submit(value="OqRWEpRJU") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0119 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('OqRWEpRJU');
      logInfo(`submit(value="OqRWEpRJU"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="OqRWEpRJU") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('OqRWEpRJU');
      logInfo(`submit(value="OqRWEpRJU") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="OqRWEpRJU") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0120
     * @tc.name      CitySearch_CitySearchStateSubmit_0120
     * @tc.desc      CitySearchState.submit(value="mgggzPkEnwB") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0120 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('mgggzPkEnwB');
      logInfo(`submit(value="mgggzPkEnwB"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="mgggzPkEnwB") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mgggzPkEnwB');
      logInfo(`submit(value="mgggzPkEnwB") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="mgggzPkEnwB") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0121
     * @tc.name      CitySearch_CitySearchStateSubmit_0121
     * @tc.desc      CitySearchState.submit(value="iTH") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0121 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('iTH');
      logInfo(`submit(value="iTH"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="iTH") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iTH');
      logInfo(`submit(value="iTH") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="iTH") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0122
     * @tc.name      CitySearch_CitySearchStateSubmit_0122
     * @tc.desc      CitySearchState.submit(value="Wiym") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0122 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Wiym');
      logInfo(`submit(value="Wiym"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Wiym") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Wiym');
      logInfo(`submit(value="Wiym") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Wiym") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0123
     * @tc.name      CitySearch_CitySearchStateSubmit_0123
     * @tc.desc      CitySearchState.submit(value="Wf") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0123 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Wf');
      logInfo(`submit(value="Wf"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Wf") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Wf');
      logInfo(`submit(value="Wf") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Wf") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0124
     * @tc.name      CitySearch_CitySearchStateSubmit_0124
     * @tc.desc      CitySearchState.submit(value="0SQYOAFEky2") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0124 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('0SQYOAFEky2');
      logInfo(`submit(value="0SQYOAFEky2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="0SQYOAFEky2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0SQYOAFEky2');
      logInfo(`submit(value="0SQYOAFEky2") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="0SQYOAFEky2") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0125
     * @tc.name      CitySearch_CitySearchStateSubmit_0125
     * @tc.desc      CitySearchState.submit(value="FkFdWMQ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0125 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('FkFdWMQ');
      logInfo(`submit(value="FkFdWMQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="FkFdWMQ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FkFdWMQ');
      logInfo(`submit(value="FkFdWMQ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="FkFdWMQ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0126
     * @tc.name      CitySearch_CitySearchStateSubmit_0126
     * @tc.desc      CitySearchState.submit(value="rwhBL") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0126 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('rwhBL');
      logInfo(`submit(value="rwhBL"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="rwhBL") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('rwhBL');
      logInfo(`submit(value="rwhBL") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="rwhBL") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0127
     * @tc.name      CitySearch_CitySearchStateSubmit_0127
     * @tc.desc      CitySearchState.submit(value="80gTLTN") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0127 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('80gTLTN');
      logInfo(`submit(value="80gTLTN"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="80gTLTN") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('80gTLTN');
      logInfo(`submit(value="80gTLTN") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="80gTLTN") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0128
     * @tc.name      CitySearch_CitySearchStateSubmit_0128
     * @tc.desc      CitySearchState.submit(value="N") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0128 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('N');
      logInfo(`submit(value="N"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`submit(value="N") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('N');
      logInfo(`submit(value="N") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="N") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`submit(value="N") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u5357\u660c","\u5357\u4eac","\u5b81\u6ce2"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0129
     * @tc.name      CitySearch_CitySearchStateSubmit_0129
     * @tc.desc      CitySearchState.submit(value="SyrixarYwx") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0129 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('SyrixarYwx');
      logInfo(`submit(value="SyrixarYwx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="SyrixarYwx") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SyrixarYwx');
      logInfo(`submit(value="SyrixarYwx") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="SyrixarYwx") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0130
     * @tc.name      CitySearch_CitySearchStateSubmit_0130
     * @tc.desc      CitySearchState.submit(value="Xwrs9uz") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0130 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Xwrs9uz');
      logInfo(`submit(value="Xwrs9uz"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Xwrs9uz") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Xwrs9uz');
      logInfo(`submit(value="Xwrs9uz") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Xwrs9uz") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0131
     * @tc.name      CitySearch_CitySearchStateSubmit_0131
     * @tc.desc      CitySearchState.submit(value="bFsn") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0131 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('bFsn');
      logInfo(`submit(value="bFsn"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="bFsn") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('bFsn');
      logInfo(`submit(value="bFsn") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="bFsn") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0132
     * @tc.name      CitySearch_CitySearchStateSubmit_0132
     * @tc.desc      CitySearchState.submit(value="kjSb3") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0132 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('kjSb3');
      logInfo(`submit(value="kjSb3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="kjSb3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kjSb3');
      logInfo(`submit(value="kjSb3") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="kjSb3") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0132 end`);
    });
  });
}
