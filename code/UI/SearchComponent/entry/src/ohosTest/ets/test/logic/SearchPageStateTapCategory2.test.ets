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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SearchPageState.tapCategory (40 cases). */
export default function searchPageStateTapCategory2Test(): void {
  describe('SearchPageStateTapCategory2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0081
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0081
     * @tc.desc      SearchPageState.tapCategory(index=73) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0081 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(73);
      logInfo(`tapCategory(index=73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=73) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(73);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0082
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0082
     * @tc.desc      SearchPageState.tapCategory(index=-29) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0082 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-29);
      logInfo(`tapCategory(index=-29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-29) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-29);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0083
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0083
     * @tc.desc      SearchPageState.tapCategory(index=52.62) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0083 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(52.62);
      logInfo(`tapCategory(index=52.62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=52.62) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(52.62, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0084
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0084
     * @tc.desc      SearchPageState.tapCategory(index=68) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0084 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(68);
      logInfo(`tapCategory(index=68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=68) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(68);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0085
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0085
     * @tc.desc      SearchPageState.tapCategory(index=43) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0085 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(43);
      logInfo(`tapCategory(index=43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=43) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(43);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0086
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0086
     * @tc.desc      SearchPageState.tapCategory(index=91.51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0086 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(91.51);
      logInfo(`tapCategory(index=91.51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=91.51) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0087
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0087
     * @tc.desc      SearchPageState.tapCategory(index=-89) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0087 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-89);
      logInfo(`tapCategory(index=-89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-89) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-89);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0088
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0088
     * @tc.desc      SearchPageState.tapCategory(index=177) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0088 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(177);
      logInfo(`tapCategory(index=177): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=177) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(177);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0089
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0089
     * @tc.desc      SearchPageState.tapCategory(index=-41) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0089 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-41);
      logInfo(`tapCategory(index=-41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-41) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-41);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0090
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0090
     * @tc.desc      SearchPageState.tapCategory(index=149) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0090 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(149);
      logInfo(`tapCategory(index=149): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=149) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(149);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0091
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0091
     * @tc.desc      SearchPageState.tapCategory(index=-34) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0091 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-34);
      logInfo(`tapCategory(index=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-34) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-34);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0092
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0092
     * @tc.desc      SearchPageState.tapCategory(index=-27) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0092 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-27);
      logInfo(`tapCategory(index=-27): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-27) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-27);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0093
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0093
     * @tc.desc      SearchPageState.tapCategory(index=-96) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0093 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-96);
      logInfo(`tapCategory(index=-96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-96) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-96);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0094
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0094
     * @tc.desc      SearchPageState.tapCategory(index=99.21) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0094 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(99.21);
      logInfo(`tapCategory(index=99.21): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=99.21) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(99.21, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0095
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0095
     * @tc.desc      SearchPageState.tapCategory(index=99) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0095 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(99);
      logInfo(`tapCategory(index=99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=99) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(99);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0096
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0096
     * @tc.desc      SearchPageState.tapCategory(index=191) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0096 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(191);
      logInfo(`tapCategory(index=191): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=191) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(191);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0096 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0097
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0097
     * @tc.desc      SearchPageState.tapCategory(index=51.4) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0097 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(51.4);
      logInfo(`tapCategory(index=51.4): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=51.4) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(51.4, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0098
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0098
     * @tc.desc      SearchPageState.tapCategory(index=93) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0098 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(93);
      logInfo(`tapCategory(index=93): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=93) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(93);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0099
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0099
     * @tc.desc      SearchPageState.tapCategory(index=42.82) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0099 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(42.82);
      logInfo(`tapCategory(index=42.82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=42.82) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(42.82, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0100
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0100
     * @tc.desc      SearchPageState.tapCategory(index=64.86) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0100 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(64.86);
      logInfo(`tapCategory(index=64.86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=64.86) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(64.86, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0101
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0101
     * @tc.desc      SearchPageState.tapCategory(index=142) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0101 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(142);
      logInfo(`tapCategory(index=142): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=142) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(142);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0102
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0102
     * @tc.desc      SearchPageState.tapCategory(index=111) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0102 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(111);
      logInfo(`tapCategory(index=111): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=111) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(111);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0103
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0103
     * @tc.desc      SearchPageState.tapCategory(index=77.42) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0103 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(77.42);
      logInfo(`tapCategory(index=77.42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=77.42) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(77.42, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0104
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0104
     * @tc.desc      SearchPageState.tapCategory(index=23.53) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0104 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(23.53);
      logInfo(`tapCategory(index=23.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=23.53) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(23.53, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0105
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0105
     * @tc.desc      SearchPageState.tapCategory(index=-59) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0105 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-59);
      logInfo(`tapCategory(index=-59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-59) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-59);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0106
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0106
     * @tc.desc      SearchPageState.tapCategory(index=-58) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0106 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-58);
      logInfo(`tapCategory(index=-58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-58) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-58);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0107
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0107
     * @tc.desc      SearchPageState.tapCategory(index=97) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0107 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(97);
      logInfo(`tapCategory(index=97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=97) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(97);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0108
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0108
     * @tc.desc      SearchPageState.tapCategory(index=77) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0108 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(77);
      logInfo(`tapCategory(index=77): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=77) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(77);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0109
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0109
     * @tc.desc      SearchPageState.tapCategory(index=-86) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0109 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-86);
      logInfo(`tapCategory(index=-86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-86) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-86);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0110
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0110
     * @tc.desc      SearchPageState.tapCategory(index=56.48) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0110 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(56.48);
      logInfo(`tapCategory(index=56.48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=56.48) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(56.48, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0111
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0111
     * @tc.desc      SearchPageState.tapCategory(index=147) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0111 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(147);
      logInfo(`tapCategory(index=147): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=147) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(147);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0112
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0112
     * @tc.desc      SearchPageState.tapCategory(index=85.61) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0112 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(85.61);
      logInfo(`tapCategory(index=85.61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=85.61) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(85.61, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0113
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0113
     * @tc.desc      SearchPageState.tapCategory(index=-18) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0113 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-18);
      logInfo(`tapCategory(index=-18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-18) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-18);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0114
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0114
     * @tc.desc      SearchPageState.tapCategory(index=103) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0114 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(103);
      logInfo(`tapCategory(index=103): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=103) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(103);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0115
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0115
     * @tc.desc      SearchPageState.tapCategory(index=118) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0115 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(118);
      logInfo(`tapCategory(index=118): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=118) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(118);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0116
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0116
     * @tc.desc      SearchPageState.tapCategory(index=26) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0116 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(26);
      logInfo(`tapCategory(index=26): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=26) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(26);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0117
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0117
     * @tc.desc      SearchPageState.tapCategory(index=161) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0117 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(161);
      logInfo(`tapCategory(index=161): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=161) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(161);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0118
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0118
     * @tc.desc      SearchPageState.tapCategory(index=47) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0118 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(47);
      logInfo(`tapCategory(index=47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=47) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(47);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0119
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0119
     * @tc.desc      SearchPageState.tapCategory(index=51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0119 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(51);
      logInfo(`tapCategory(index=51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=51) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(51);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0120
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0120
     * @tc.desc      SearchPageState.tapCategory(index=4.27) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0120 begin`);
      const subject: SearchPageState = new SearchPageState();
      let thrown: boolean = false;
      try {
        subject.tapCategory(4.27);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tapCategory(index=4.27): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0120 end`);
    });
  });
}
