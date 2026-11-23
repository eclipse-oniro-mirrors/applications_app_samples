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
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SearchPageState } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SearchPageState.input (19 cases). */
export default function searchPageStateInput2Test(): void {
  describe('SearchPageStateInput2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0072
     * @tc.name      SearchComponent_SearchPageStateInput_0072
     * @tc.desc      SearchPageState.input(value="5lcQo7Ww") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0072 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('5lcQo7Ww');
      logInfo(`input(value="5lcQo7Ww"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="5lcQo7Ww") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('5lcQo7Ww');
      logInfo(`input(value="5lcQo7Ww") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0073
     * @tc.name      SearchComponent_SearchPageStateInput_0073
     * @tc.desc      SearchPageState.input(value="IgL0yFvo8fR") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0073 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('IgL0yFvo8fR');
      logInfo(`input(value="IgL0yFvo8fR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="IgL0yFvo8fR") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('IgL0yFvo8fR');
      logInfo(`input(value="IgL0yFvo8fR") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0074
     * @tc.name      SearchComponent_SearchPageStateInput_0074
     * @tc.desc      SearchPageState.input(value="j9") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0074 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('j9');
      logInfo(`input(value="j9"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="j9") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('j9');
      logInfo(`input(value="j9") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0075
     * @tc.name      SearchComponent_SearchPageStateInput_0075
     * @tc.desc      SearchPageState.input(value="pl2oJUSP20G3") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0075 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('pl2oJUSP20G3');
      logInfo(`input(value="pl2oJUSP20G3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="pl2oJUSP20G3") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('pl2oJUSP20G3');
      logInfo(`input(value="pl2oJUSP20G3") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0076
     * @tc.name      SearchComponent_SearchPageStateInput_0076
     * @tc.desc      SearchPageState.input(value="R") yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0076 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('R');
      logInfo(`input(value="R"): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`input(value="R") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('R');
      logInfo(`input(value="R") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(20);
      logInfo(`input(value="R") state: JSON.stringify(subject.result...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`input(value="R") state: subject.results[10].length=${subject.results[10].length}`);
      expect(subject.results[10].length).assertEqual(17);
      logInfo(`input(value="R") state: subject.results[10].substring(0, 13)=${subject.results[10].substring(0, 13)}`);
      expect(subject.results[10].substring(0, 13)).assertEqual('\u81ea\u5b9a\u4e49Swiper\u5361\u7247\u9884\u89c8');
      logInfo(`input(value="R") state: subject.results[10].substring(11)=${subject.results[10].substring(11)}`);
      expect(subject.results[10].substring(11)).assertEqual('\u9884\u89c8\u6548\u679c\u5b9e\u73b0');
      logInfo(`${BUNDLE}SearchPageStateInput_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0077
     * @tc.name      SearchComponent_SearchPageStateInput_0077
     * @tc.desc      SearchPageState.input(value="DDC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0077 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('DDC');
      logInfo(`input(value="DDC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="DDC") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('DDC');
      logInfo(`input(value="DDC") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0078
     * @tc.name      SearchComponent_SearchPageStateInput_0078
     * @tc.desc      SearchPageState.input(value="u2ix3WIRffdu") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0078 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('u2ix3WIRffdu');
      logInfo(`input(value="u2ix3WIRffdu"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="u2ix3WIRffdu") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('u2ix3WIRffdu');
      logInfo(`input(value="u2ix3WIRffdu") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0079
     * @tc.name      SearchComponent_SearchPageStateInput_0079
     * @tc.desc      SearchPageState.input(value="BQ17xe31a0P") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0079 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('BQ17xe31a0P');
      logInfo(`input(value="BQ17xe31a0P"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="BQ17xe31a0P") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('BQ17xe31a0P');
      logInfo(`input(value="BQ17xe31a0P") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0080
     * @tc.name      SearchComponent_SearchPageStateInput_0080
     * @tc.desc      SearchPageState.input(value="GK1bMc0P") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0080 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('GK1bMc0P');
      logInfo(`input(value="GK1bMc0P"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="GK1bMc0P") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('GK1bMc0P');
      logInfo(`input(value="GK1bMc0P") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0081
     * @tc.name      SearchComponent_SearchPageStateInput_0081
     * @tc.desc      SearchPageState.input(value="jmWrg") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0081 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('jmWrg');
      logInfo(`input(value="jmWrg"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="jmWrg") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('jmWrg');
      logInfo(`input(value="jmWrg") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0082
     * @tc.name      SearchComponent_SearchPageStateInput_0082
     * @tc.desc      SearchPageState.input(value="C9W04RuB6r4") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0082 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('C9W04RuB6r4');
      logInfo(`input(value="C9W04RuB6r4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="C9W04RuB6r4") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('C9W04RuB6r4');
      logInfo(`input(value="C9W04RuB6r4") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0083
     * @tc.name      SearchComponent_SearchPageStateInput_0083
     * @tc.desc      SearchPageState.input(value="1lOPW") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0083 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('1lOPW');
      logInfo(`input(value="1lOPW"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="1lOPW") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1lOPW');
      logInfo(`input(value="1lOPW") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0084
     * @tc.name      SearchComponent_SearchPageStateInput_0084
     * @tc.desc      SearchPageState.input(value="RKo7VFExRN") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0084 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('RKo7VFExRN');
      logInfo(`input(value="RKo7VFExRN"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="RKo7VFExRN") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('RKo7VFExRN');
      logInfo(`input(value="RKo7VFExRN") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0085
     * @tc.name      SearchComponent_SearchPageStateInput_0085
     * @tc.desc      SearchPageState.input(value="FS") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0085 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('FS');
      logInfo(`input(value="FS"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="FS") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('FS');
      logInfo(`input(value="FS") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0086
     * @tc.name      SearchComponent_SearchPageStateInput_0086
     * @tc.desc      SearchPageState.input(value="77c6BOqh1wQ2") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0086 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('77c6BOqh1wQ2');
      logInfo(`input(value="77c6BOqh1wQ2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="77c6BOqh1wQ2") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('77c6BOqh1wQ2');
      logInfo(`input(value="77c6BOqh1wQ2") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0087
     * @tc.name      SearchComponent_SearchPageStateInput_0087
     * @tc.desc      SearchPageState.input(value="fc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0087 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('fc');
      logInfo(`input(value="fc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="fc") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('fc');
      logInfo(`input(value="fc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0088
     * @tc.name      SearchComponent_SearchPageStateInput_0088
     * @tc.desc      SearchPageState.input(value="UVG0zTsIznC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0088 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('UVG0zTsIznC');
      logInfo(`input(value="UVG0zTsIznC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="UVG0zTsIznC") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('UVG0zTsIznC');
      logInfo(`input(value="UVG0zTsIznC") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0089
     * @tc.name      SearchComponent_SearchPageStateInput_0089
     * @tc.desc      SearchPageState.input(value="im") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0089 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('im');
      logInfo(`input(value="im"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`input(value="im") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('im');
      logInfo(`input(value="im") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`input(value="im") state: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(22);
      logInfo(`input(value="im") state: subject.results[0].substring(0, 16)=${subject.results[0].substring(0, 16)}`);
      expect(subject.results[0].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`input(value="im") state: subject.results[0].substring(16)=${subject.results[0].substring(16)}`);
      expect(subject.results[0].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateInput_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0090
     * @tc.name      SearchComponent_SearchPageStateInput_0090
     * @tc.desc      SearchPageState.input(value="7Jr") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0090 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('7Jr');
      logInfo(`input(value="7Jr"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="7Jr") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('7Jr');
      logInfo(`input(value="7Jr") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0090 end`);
    });
  });
}
