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

/** Logic checks for CitySearchState.change (72 cases). */
export default function citySearchStateChange2Test(): void {
  describe('CitySearchStateChange2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0073
     * @tc.name      CitySearch_CitySearchStateChange_0073
     * @tc.desc      CitySearchState.change(value="PWf3") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0073 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('PWf3');
      logInfo(`change(value="PWf3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="PWf3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('PWf3');
      logInfo(`change(value="PWf3") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0074
     * @tc.name      CitySearch_CitySearchStateChange_0074
     * @tc.desc      CitySearchState.change(value="8xfL") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0074 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('8xfL');
      logInfo(`change(value="8xfL"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="8xfL") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8xfL');
      logInfo(`change(value="8xfL") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0075
     * @tc.name      CitySearch_CitySearchStateChange_0075
     * @tc.desc      CitySearchState.change(value="pS8TmyJL") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0075 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('pS8TmyJL');
      logInfo(`change(value="pS8TmyJL"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="pS8TmyJL") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pS8TmyJL');
      logInfo(`change(value="pS8TmyJL") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0076
     * @tc.name      CitySearch_CitySearchStateChange_0076
     * @tc.desc      CitySearchState.change(value="V4wgDLW8uz") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0076 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('V4wgDLW8uz');
      logInfo(`change(value="V4wgDLW8uz"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="V4wgDLW8uz") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('V4wgDLW8uz');
      logInfo(`change(value="V4wgDLW8uz") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0077
     * @tc.name      CitySearch_CitySearchStateChange_0077
     * @tc.desc      CitySearchState.change(value="DVpU9pn") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0077 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('DVpU9pn');
      logInfo(`change(value="DVpU9pn"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="DVpU9pn") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DVpU9pn');
      logInfo(`change(value="DVpU9pn") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0078
     * @tc.name      CitySearch_CitySearchStateChange_0078
     * @tc.desc      CitySearchState.change(value="vtmoh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0078 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('vtmoh');
      logInfo(`change(value="vtmoh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="vtmoh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vtmoh');
      logInfo(`change(value="vtmoh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0079
     * @tc.name      CitySearch_CitySearchStateChange_0079
     * @tc.desc      CitySearchState.change(value="ZXHJbv") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0079 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('ZXHJbv');
      logInfo(`change(value="ZXHJbv"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="ZXHJbv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZXHJbv');
      logInfo(`change(value="ZXHJbv") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0080
     * @tc.name      CitySearch_CitySearchStateChange_0080
     * @tc.desc      CitySearchState.change(value="9V4xz") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0080 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('9V4xz');
      logInfo(`change(value="9V4xz"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="9V4xz") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('9V4xz');
      logInfo(`change(value="9V4xz") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0081
     * @tc.name      CitySearch_CitySearchStateChange_0081
     * @tc.desc      CitySearchState.change(value="IhBQj1futm") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0081 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('IhBQj1futm');
      logInfo(`change(value="IhBQj1futm"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="IhBQj1futm") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IhBQj1futm');
      logInfo(`change(value="IhBQj1futm") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0082
     * @tc.name      CitySearch_CitySearchStateChange_0082
     * @tc.desc      CitySearchState.change(value="G0VssGJm9") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0082 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('G0VssGJm9');
      logInfo(`change(value="G0VssGJm9"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="G0VssGJm9") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('G0VssGJm9');
      logInfo(`change(value="G0VssGJm9") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0083
     * @tc.name      CitySearch_CitySearchStateChange_0083
     * @tc.desc      CitySearchState.change(value="UeePnY9D8M") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0083 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('UeePnY9D8M');
      logInfo(`change(value="UeePnY9D8M"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="UeePnY9D8M") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('UeePnY9D8M');
      logInfo(`change(value="UeePnY9D8M") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0084
     * @tc.name      CitySearch_CitySearchStateChange_0084
     * @tc.desc      CitySearchState.change(value="cY0zy") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0084 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('cY0zy');
      logInfo(`change(value="cY0zy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="cY0zy") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('cY0zy');
      logInfo(`change(value="cY0zy") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0085
     * @tc.name      CitySearch_CitySearchStateChange_0085
     * @tc.desc      CitySearchState.change(value="W4qHFzFakj") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0085 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('W4qHFzFakj');
      logInfo(`change(value="W4qHFzFakj"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="W4qHFzFakj") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('W4qHFzFakj');
      logInfo(`change(value="W4qHFzFakj") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0086
     * @tc.name      CitySearch_CitySearchStateChange_0086
     * @tc.desc      CitySearchState.change(value="TF8IhX") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0086 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('TF8IhX');
      logInfo(`change(value="TF8IhX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="TF8IhX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('TF8IhX');
      logInfo(`change(value="TF8IhX") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0087
     * @tc.name      CitySearch_CitySearchStateChange_0087
     * @tc.desc      CitySearchState.change(value="G8") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0087 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('G8');
      logInfo(`change(value="G8"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="G8") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('G8');
      logInfo(`change(value="G8") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0088
     * @tc.name      CitySearch_CitySearchStateChange_0088
     * @tc.desc      CitySearchState.change(value="L5") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0088 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('L5');
      logInfo(`change(value="L5"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="L5") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('L5');
      logInfo(`change(value="L5") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0089
     * @tc.name      CitySearch_CitySearchStateChange_0089
     * @tc.desc      CitySearchState.change(value="Ju") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0089 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Ju');
      logInfo(`change(value="Ju"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Ju") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Ju');
      logInfo(`change(value="Ju") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0090
     * @tc.name      CitySearch_CitySearchStateChange_0090
     * @tc.desc      CitySearchState.change(value="l8h0") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0090 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('l8h0');
      logInfo(`change(value="l8h0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="l8h0") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('l8h0');
      logInfo(`change(value="l8h0") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0091
     * @tc.name      CitySearch_CitySearchStateChange_0091
     * @tc.desc      CitySearchState.change(value="ZpqmY") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0091 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('ZpqmY');
      logInfo(`change(value="ZpqmY"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="ZpqmY") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZpqmY');
      logInfo(`change(value="ZpqmY") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0092
     * @tc.name      CitySearch_CitySearchStateChange_0092
     * @tc.desc      CitySearchState.change(value="WChlHemF7") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0092 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('WChlHemF7');
      logInfo(`change(value="WChlHemF7"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="WChlHemF7") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('WChlHemF7');
      logInfo(`change(value="WChlHemF7") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0093
     * @tc.name      CitySearch_CitySearchStateChange_0093
     * @tc.desc      CitySearchState.change(value="6qe") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0093 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('6qe');
      logInfo(`change(value="6qe"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="6qe") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6qe');
      logInfo(`change(value="6qe") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0094
     * @tc.name      CitySearch_CitySearchStateChange_0094
     * @tc.desc      CitySearchState.change(value="GD5w5uoMB") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0094 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('GD5w5uoMB');
      logInfo(`change(value="GD5w5uoMB"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="GD5w5uoMB") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('GD5w5uoMB');
      logInfo(`change(value="GD5w5uoMB") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0095
     * @tc.name      CitySearch_CitySearchStateChange_0095
     * @tc.desc      CitySearchState.change(value="PmynBSwOERW") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0095 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('PmynBSwOERW');
      logInfo(`change(value="PmynBSwOERW"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="PmynBSwOERW") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('PmynBSwOERW');
      logInfo(`change(value="PmynBSwOERW") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0096
     * @tc.name      CitySearch_CitySearchStateChange_0096
     * @tc.desc      CitySearchState.change(value="1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0096 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('1');
      logInfo(`change(value="1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1');
      logInfo(`change(value="1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0096 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0097
     * @tc.name      CitySearch_CitySearchStateChange_0097
     * @tc.desc      CitySearchState.change(value="mX3G3r9YBD0") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0097 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('mX3G3r9YBD0');
      logInfo(`change(value="mX3G3r9YBD0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="mX3G3r9YBD0") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mX3G3r9YBD0');
      logInfo(`change(value="mX3G3r9YBD0") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0098
     * @tc.name      CitySearch_CitySearchStateChange_0098
     * @tc.desc      CitySearchState.change(value="lYu9W") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0098 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('lYu9W');
      logInfo(`change(value="lYu9W"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="lYu9W") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lYu9W');
      logInfo(`change(value="lYu9W") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0099
     * @tc.name      CitySearch_CitySearchStateChange_0099
     * @tc.desc      CitySearchState.change(value="Gjyxl3R2C") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0099 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Gjyxl3R2C');
      logInfo(`change(value="Gjyxl3R2C"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Gjyxl3R2C") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Gjyxl3R2C');
      logInfo(`change(value="Gjyxl3R2C") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0100
     * @tc.name      CitySearch_CitySearchStateChange_0100
     * @tc.desc      CitySearchState.change(value="bQzTD") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0100 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('bQzTD');
      logInfo(`change(value="bQzTD"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="bQzTD") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('bQzTD');
      logInfo(`change(value="bQzTD") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0101
     * @tc.name      CitySearch_CitySearchStateChange_0101
     * @tc.desc      CitySearchState.change(value="deHh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0101 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('deHh');
      logInfo(`change(value="deHh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="deHh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('deHh');
      logInfo(`change(value="deHh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0102
     * @tc.name      CitySearch_CitySearchStateChange_0102
     * @tc.desc      CitySearchState.change(value="W4oYy5") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0102 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('W4oYy5');
      logInfo(`change(value="W4oYy5"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="W4oYy5") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('W4oYy5');
      logInfo(`change(value="W4oYy5") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0103
     * @tc.name      CitySearch_CitySearchStateChange_0103
     * @tc.desc      CitySearchState.change(value="78gqvKxsX") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0103 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('78gqvKxsX');
      logInfo(`change(value="78gqvKxsX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="78gqvKxsX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('78gqvKxsX');
      logInfo(`change(value="78gqvKxsX") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0104
     * @tc.name      CitySearch_CitySearchStateChange_0104
     * @tc.desc      CitySearchState.change(value="Grl5FY") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0104 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Grl5FY');
      logInfo(`change(value="Grl5FY"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Grl5FY") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Grl5FY');
      logInfo(`change(value="Grl5FY") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0105
     * @tc.name      CitySearch_CitySearchStateChange_0105
     * @tc.desc      CitySearchState.change(value="g49D") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0105 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('g49D');
      logInfo(`change(value="g49D"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="g49D") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('g49D');
      logInfo(`change(value="g49D") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0106
     * @tc.name      CitySearch_CitySearchStateChange_0106
     * @tc.desc      CitySearchState.change(value="pqOF4XT2q") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0106 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('pqOF4XT2q');
      logInfo(`change(value="pqOF4XT2q"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="pqOF4XT2q") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pqOF4XT2q');
      logInfo(`change(value="pqOF4XT2q") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0107
     * @tc.name      CitySearch_CitySearchStateChange_0107
     * @tc.desc      CitySearchState.change(value="LKPrfe") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0107 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('LKPrfe');
      logInfo(`change(value="LKPrfe"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="LKPrfe") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('LKPrfe');
      logInfo(`change(value="LKPrfe") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0108
     * @tc.name      CitySearch_CitySearchStateChange_0108
     * @tc.desc      CitySearchState.change(value="LgL2k") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0108 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('LgL2k');
      logInfo(`change(value="LgL2k"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="LgL2k") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('LgL2k');
      logInfo(`change(value="LgL2k") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0109
     * @tc.name      CitySearch_CitySearchStateChange_0109
     * @tc.desc      CitySearchState.change(value="N") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0109 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('N');
      logInfo(`change(value="N"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`change(value="N") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('N');
      logInfo(`change(value="N") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change(value="N") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`change(value="N") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u5357\u660c","\u5357\u4eac","\u5b81\u6ce2"]');
      logInfo(`${BUNDLE}CitySearchStateChange_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0110
     * @tc.name      CitySearch_CitySearchStateChange_0110
     * @tc.desc      CitySearchState.change(value="1AzT2lv4c") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0110 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('1AzT2lv4c');
      logInfo(`change(value="1AzT2lv4c"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="1AzT2lv4c") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1AzT2lv4c');
      logInfo(`change(value="1AzT2lv4c") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0111
     * @tc.name      CitySearch_CitySearchStateChange_0111
     * @tc.desc      CitySearchState.change(value="OthPqQqY6q") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0111 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('OthPqQqY6q');
      logInfo(`change(value="OthPqQqY6q"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="OthPqQqY6q") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('OthPqQqY6q');
      logInfo(`change(value="OthPqQqY6q") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0112
     * @tc.name      CitySearch_CitySearchStateChange_0112
     * @tc.desc      CitySearchState.change(value="zApe6qNiX4fy") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0112 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('zApe6qNiX4fy');
      logInfo(`change(value="zApe6qNiX4fy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="zApe6qNiX4fy") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zApe6qNiX4fy');
      logInfo(`change(value="zApe6qNiX4fy") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0113
     * @tc.name      CitySearch_CitySearchStateChange_0113
     * @tc.desc      CitySearchState.change(value="rsRk") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0113 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('rsRk');
      logInfo(`change(value="rsRk"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="rsRk") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('rsRk');
      logInfo(`change(value="rsRk") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0114
     * @tc.name      CitySearch_CitySearchStateChange_0114
     * @tc.desc      CitySearchState.change(value="F5wtX") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0114 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('F5wtX');
      logInfo(`change(value="F5wtX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="F5wtX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('F5wtX');
      logInfo(`change(value="F5wtX") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0115
     * @tc.name      CitySearch_CitySearchStateChange_0115
     * @tc.desc      CitySearchState.change(value="w38") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0115 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('w38');
      logInfo(`change(value="w38"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="w38") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('w38');
      logInfo(`change(value="w38") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0116
     * @tc.name      CitySearch_CitySearchStateChange_0116
     * @tc.desc      CitySearchState.change(value="j19E7xTv7w") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0116 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('j19E7xTv7w');
      logInfo(`change(value="j19E7xTv7w"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="j19E7xTv7w") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('j19E7xTv7w');
      logInfo(`change(value="j19E7xTv7w") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0117
     * @tc.name      CitySearch_CitySearchStateChange_0117
     * @tc.desc      CitySearchState.change(value="dzGksFNZC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0117 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('dzGksFNZC');
      logInfo(`change(value="dzGksFNZC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="dzGksFNZC") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dzGksFNZC');
      logInfo(`change(value="dzGksFNZC") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0118
     * @tc.name      CitySearch_CitySearchStateChange_0118
     * @tc.desc      CitySearchState.change(value="BFtWKfVFLS4") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0118 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('BFtWKfVFLS4');
      logInfo(`change(value="BFtWKfVFLS4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="BFtWKfVFLS4") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('BFtWKfVFLS4');
      logInfo(`change(value="BFtWKfVFLS4") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0119
     * @tc.name      CitySearch_CitySearchStateChange_0119
     * @tc.desc      CitySearchState.change(value="FTYXufzbJ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0119 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('FTYXufzbJ');
      logInfo(`change(value="FTYXufzbJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="FTYXufzbJ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FTYXufzbJ');
      logInfo(`change(value="FTYXufzbJ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0120
     * @tc.name      CitySearch_CitySearchStateChange_0120
     * @tc.desc      CitySearchState.change(value="VyGo4") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0120 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('VyGo4');
      logInfo(`change(value="VyGo4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="VyGo4") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VyGo4');
      logInfo(`change(value="VyGo4") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0121
     * @tc.name      CitySearch_CitySearchStateChange_0121
     * @tc.desc      CitySearchState.change(value="ZZTC8VD") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0121 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('ZZTC8VD');
      logInfo(`change(value="ZZTC8VD"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="ZZTC8VD") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZZTC8VD');
      logInfo(`change(value="ZZTC8VD") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0122
     * @tc.name      CitySearch_CitySearchStateChange_0122
     * @tc.desc      CitySearchState.change(value="VB1hZ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0122 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('VB1hZ');
      logInfo(`change(value="VB1hZ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="VB1hZ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VB1hZ');
      logInfo(`change(value="VB1hZ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0123
     * @tc.name      CitySearch_CitySearchStateChange_0123
     * @tc.desc      CitySearchState.change(value="B") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0123 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('B');
      logInfo(`change(value="B"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`change(value="B") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('B');
      logInfo(`change(value="B") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change(value="B") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`change(value="B") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList))
        .assertEqual('["\u5317\u4eac","\u4eb3\u5dde","\u5305\u5934","\u5b9d\u9e21"]');
      logInfo(`${BUNDLE}CitySearchStateChange_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0124
     * @tc.name      CitySearch_CitySearchStateChange_0124
     * @tc.desc      CitySearchState.change(value="sefhzp8bFs") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0124 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('sefhzp8bFs');
      logInfo(`change(value="sefhzp8bFs"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="sefhzp8bFs") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sefhzp8bFs');
      logInfo(`change(value="sefhzp8bFs") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0125
     * @tc.name      CitySearch_CitySearchStateChange_0125
     * @tc.desc      CitySearchState.change(value="Yxs2qV") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0125 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Yxs2qV');
      logInfo(`change(value="Yxs2qV"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Yxs2qV") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Yxs2qV');
      logInfo(`change(value="Yxs2qV") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0126
     * @tc.name      CitySearch_CitySearchStateChange_0126
     * @tc.desc      CitySearchState.change(value="SWSt7dh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0126 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('SWSt7dh');
      logInfo(`change(value="SWSt7dh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="SWSt7dh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SWSt7dh');
      logInfo(`change(value="SWSt7dh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0127
     * @tc.name      CitySearch_CitySearchStateChange_0127
     * @tc.desc      CitySearchState.change(value="UqcdQPxjr") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0127 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('UqcdQPxjr');
      logInfo(`change(value="UqcdQPxjr"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="UqcdQPxjr") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('UqcdQPxjr');
      logInfo(`change(value="UqcdQPxjr") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0128
     * @tc.name      CitySearch_CitySearchStateChange_0128
     * @tc.desc      CitySearchState.change(value="z645m") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0128 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('z645m');
      logInfo(`change(value="z645m"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="z645m") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('z645m');
      logInfo(`change(value="z645m") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0129
     * @tc.name      CitySearch_CitySearchStateChange_0129
     * @tc.desc      CitySearchState.change(value="7K") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0129 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('7K');
      logInfo(`change(value="7K"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="7K") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7K');
      logInfo(`change(value="7K") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0130
     * @tc.name      CitySearch_CitySearchStateChange_0130
     * @tc.desc      CitySearchState.change(value="o0Sioa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0130 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('o0Sioa');
      logInfo(`change(value="o0Sioa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="o0Sioa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('o0Sioa');
      logInfo(`change(value="o0Sioa") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0131
     * @tc.name      CitySearch_CitySearchStateChange_0131
     * @tc.desc      CitySearchState.change(value="5R2yk9zNCX") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0131 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('5R2yk9zNCX');
      logInfo(`change(value="5R2yk9zNCX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="5R2yk9zNCX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5R2yk9zNCX');
      logInfo(`change(value="5R2yk9zNCX") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0132
     * @tc.name      CitySearch_CitySearchStateChange_0132
     * @tc.desc      CitySearchState.change(value="7gL") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0132 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('7gL');
      logInfo(`change(value="7gL"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="7gL") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7gL');
      logInfo(`change(value="7gL") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0133
     * @tc.name      CitySearch_CitySearchStateChange_0133
     * @tc.desc      CitySearchState.change(value="hx") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0133 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('hx');
      logInfo(`change(value="hx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="hx") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hx');
      logInfo(`change(value="hx") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0134
     * @tc.name      CitySearch_CitySearchStateChange_0134
     * @tc.desc      CitySearchState.change(value="Bp") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0134 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Bp');
      logInfo(`change(value="Bp"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Bp") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Bp');
      logInfo(`change(value="Bp") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0135
     * @tc.name      CitySearch_CitySearchStateChange_0135
     * @tc.desc      CitySearchState.change(value="hQ0iK7") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0135 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('hQ0iK7');
      logInfo(`change(value="hQ0iK7"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="hQ0iK7") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hQ0iK7');
      logInfo(`change(value="hQ0iK7") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0136
     * @tc.name      CitySearch_CitySearchStateChange_0136
     * @tc.desc      CitySearchState.change(value="AQ3iO9v") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0136 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('AQ3iO9v');
      logInfo(`change(value="AQ3iO9v"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="AQ3iO9v") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AQ3iO9v');
      logInfo(`change(value="AQ3iO9v") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0137
     * @tc.name      CitySearch_CitySearchStateChange_0137
     * @tc.desc      CitySearchState.change(value="6Y") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0137 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('6Y');
      logInfo(`change(value="6Y"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="6Y") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6Y');
      logInfo(`change(value="6Y") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0138
     * @tc.name      CitySearch_CitySearchStateChange_0138
     * @tc.desc      CitySearchState.change(value="qdpmZ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0138 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('qdpmZ');
      logInfo(`change(value="qdpmZ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="qdpmZ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('qdpmZ');
      logInfo(`change(value="qdpmZ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0139
     * @tc.name      CitySearch_CitySearchStateChange_0139
     * @tc.desc      CitySearchState.change(value="eZbrh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0139 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('eZbrh');
      logInfo(`change(value="eZbrh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="eZbrh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('eZbrh');
      logInfo(`change(value="eZbrh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0140
     * @tc.name      CitySearch_CitySearchStateChange_0140
     * @tc.desc      CitySearchState.change(value="2Taz6J") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0140 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('2Taz6J');
      logInfo(`change(value="2Taz6J"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="2Taz6J") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2Taz6J');
      logInfo(`change(value="2Taz6J") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0141
     * @tc.name      CitySearch_CitySearchStateChange_0141
     * @tc.desc      CitySearchState.change(value="pQcZ9") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0141 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('pQcZ9');
      logInfo(`change(value="pQcZ9"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="pQcZ9") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pQcZ9');
      logInfo(`change(value="pQcZ9") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0142
     * @tc.name      CitySearch_CitySearchStateChange_0142
     * @tc.desc      CitySearchState.change(value="kWISbS4") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0142 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('kWISbS4');
      logInfo(`change(value="kWISbS4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="kWISbS4") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kWISbS4');
      logInfo(`change(value="kWISbS4") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0143
     * @tc.name      CitySearch_CitySearchStateChange_0143
     * @tc.desc      CitySearchState.change(value="wFt") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0143 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('wFt');
      logInfo(`change(value="wFt"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="wFt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('wFt');
      logInfo(`change(value="wFt") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0144
     * @tc.name      CitySearch_CitySearchStateChange_0144
     * @tc.desc      CitySearchState.change(value="8") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0144 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('8');
      logInfo(`change(value="8"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="8") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8');
      logInfo(`change(value="8") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0144 end`);
    });
  });
}
