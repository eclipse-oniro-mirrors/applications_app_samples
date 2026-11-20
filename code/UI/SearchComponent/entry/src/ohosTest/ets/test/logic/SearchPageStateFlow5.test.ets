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

/** Logic checks for SearchPageState flow (54 cases). */
export default function searchPageStateFlow5Test(): void {
  describe('SearchPageStateFlow5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0224
     * @tc.name      SearchComponent_SearchPageStateFlow_0224
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0224 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-19);
      logInfo(`step1 tapCategory(-19): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(90);
      logInfo(`step2 tapCategory(90): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(-46);
      logInfo(`step3 pick(-46): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('7Jr');
      logInfo(`step4 input("7Jr"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`tapCategory>tapCategory>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('7Jr');
      logInfo(`tapCategory>tapCategory>pick>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(90);
      logInfo(`tapCategory>tapCategory>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0225
     * @tc.name      SearchComponent_SearchPageStateFlow_0225
     * @tc.desc      SearchPageState call flow input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0225 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('BQ17xe31a0P');
      logInfo(`step1 input("BQ17xe31a0P"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(-51);
      logInfo(`step2 pick(-51): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('BQ17xe31a0P');
      logInfo(`input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0226
     * @tc.name      SearchComponent_SearchPageStateFlow_0226
     * @tc.desc      SearchPageState call flow input > pick > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0226 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xA');
      logInfo(`step1 input("xA"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(145);
      logInfo(`step2 pick(145): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(0);
      logInfo(`step3 tapCategory(0): step3=${step3}`);
      expect(step3).assertEqual('UI\u5e03\u5c40');
      const step4: string = subject.pick(39);
      logInfo(`step4 pick(39): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`input>pick>tapCategory>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xA');
      logInfo(`input>pick>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(0);
      logInfo(`input>pick>tapCategory>pick final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('UI\u5e03\u5c40');
      logInfo(`input>pick>tapCategory>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0227
     * @tc.name      SearchComponent_SearchPageStateFlow_0227
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0227 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(97);
      logInfo(`step1 tapCategory(97): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(99.21);
      logInfo(`step2 tapCategory(99.21): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(-32);
      logInfo(`step4 pick(-32): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>tapCategory>open>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(99.21, PRECISION);
      logInfo(`tapCategory>tapCategory>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0228
     * @tc.name      SearchComponent_SearchPageStateFlow_0228
     * @tc.desc      SearchPageState call flow pick > pick > back > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0228 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(120);
      logInfo(`step1 pick(120): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(87.76);
      logInfo(`step2 pick(87.76): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      subject.back();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pick>pick>back>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0229
     * @tc.name      SearchComponent_SearchPageStateFlow_0229
     * @tc.desc      SearchPageState call flow tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0229 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(1);
      logInfo(`step1 tapCategory(1): step1=${step1}`);
      expect(step1).assertEqual('\u52a8\u6548');
      const step2: number = subject.input('xa');
      logInfo(`step2 input("xa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xa');
      logInfo(`tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(1);
      logInfo(`tapCategory>input final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u52a8\u6548');
      logInfo(`tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0230
     * @tc.name      SearchComponent_SearchPageStateFlow_0230
     * @tc.desc      SearchPageState call flow input > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0230 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input(' A ');
      logInfo(`step1 input(" A "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('abcabc');
      logInfo(`step2 input("abcabc"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(65);
      logInfo(`step3 tapCategory(65): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`input>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abcabc');
      logInfo(`input>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(65);
      logInfo(`input>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0231
     * @tc.name      SearchComponent_SearchPageStateFlow_0231
     * @tc.desc      SearchPageState call flow tapCategory > pick > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0231 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(70);
      logInfo(`step1 tapCategory(70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(170);
      logInfo(`step2 pick(170): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('im');
      logInfo(`step3 input("im"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.tapCategory(43);
      logInfo(`step4 tapCategory(43): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>pick>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('im');
      logInfo(`tapCategory>pick>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(43);
      logInfo(`tapCategory>pick>input>tapCategory final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`tapCategory>pick>input>tapCategory final: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(22);
      logInfo(`tapCategory>pick>input>tapCategory final: subject.results[0]....${subject.results[0].substring(0, 16)}`);
      expect(subject.results[0].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`tapCategory>pick>input>tapCategory final: subject.results[0].sub...${subject.results[0].substring(16)}`);
      expect(subject.results[0].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0232
     * @tc.name      SearchComponent_SearchPageStateFlow_0232
     * @tc.desc      SearchPageState call flow open > tapCategory > pick > tapCategory > tapCategory keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0232 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(130);
      logInfo(`step2 tapCategory(130): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(173);
      logInfo(`step3 pick(173): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(65);
      logInfo(`step4 tapCategory(65): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.tapCategory(28.01);
      logInfo(`step5 tapCategory(28.01): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`open>tapCategory>pick>tapCategory>tapCate...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(28.01, PRECISION);
      logInfo(`open>tapCategory>pick>tapCategory>tapCate...: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0233
     * @tc.name      SearchComponent_SearchPageStateFlow_0233
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0233 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(103);
      logInfo(`step1 tapCategory(103): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(28.01);
      logInfo(`step2 tapCategory(28.01): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(3);
      logInfo(`step3 tapCategory(3): step3=${step3}`);
      expect(step3).assertEqual('Native');
      const step4: number = subject.input('7Jr');
      logInfo(`step4 input("7Jr"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`tapCategory>tapCategory>tapCategory>input...: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('7Jr');
      logInfo(`tapCategory>tapCategory>tapCategory>input...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(3);
      logInfo(`tapCategory>tapCategory>tapCategory>input...: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('Native');
      logInfo(`tapCategory>tapCategory>tapCategory>input...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0234
     * @tc.name      SearchComponent_SearchPageStateFlow_0234
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > tapCategory > back > open keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0234 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(3);
      logInfo(`step1 tapCategory(3): step1=${step1}`);
      expect(step1).assertEqual('Native');
      const step2: string = subject.tapCategory(118);
      logInfo(`step2 tapCategory(118): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(10.09);
      logInfo(`step3 tapCategory(10.09): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`tapCategory>tapCategory>tapCategory>back>...: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0235
     * @tc.name      SearchComponent_SearchPageStateFlow_0235
     * @tc.desc      SearchPageState call flow open > open > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0235 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(-28);
      logInfo(`step3 pick(-28): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0236
     * @tc.name      SearchComponent_SearchPageStateFlow_0236
     * @tc.desc      SearchPageState call flow tapCategory > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0236 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(86.6);
      logInfo(`step1 tapCategory(86.6): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('R');
      logInfo(`step2 input("R"): step2=${step2}`);
      expect(step2).assertEqual(20);
      const step3: string = subject.tapCategory(80);
      logInfo(`step3 tapCategory(80): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('R');
      logInfo(`tapCategory>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(80);
      logInfo(`tapCategory>input>tapCategory final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(20);
      logInfo(`tapCategory>input>tapCategory final: JSON.stringify(s...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`tapCategory>input>tapCategory final: subject.results[10].length=${subject.results[10].length}`);
      expect(subject.results[10].length).assertEqual(17);
      logInfo(`tapCategory>input>tapCategory final: subject.results[10].sub...${subject.results[10].substring(0, 13)}`);
      expect(subject.results[10].substring(0, 13)).assertEqual('\u81ea\u5b9a\u4e49Swiper\u5361\u7247\u9884\u89c8');
      logInfo(`tapCategory>input>tapCategory final: subject.results[10].substr...${subject.results[10].substring(11)}`);
      expect(subject.results[10].substring(11)).assertEqual('\u9884\u89c8\u6548\u679c\u5b9e\u73b0');
      logInfo(`${BUNDLE}SearchPageStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0237
     * @tc.name      SearchComponent_SearchPageStateFlow_0237
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0237 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(50);
      logInfo(`step1 tapCategory(50): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(125);
      logInfo(`step2 tapCategory(125): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(125);
      logInfo(`${BUNDLE}SearchPageStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0238
     * @tc.name      SearchComponent_SearchPageStateFlow_0238
     * @tc.desc      SearchPageState call flow back > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0238 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.tapCategory(77.42);
      logInfo(`step3 tapCategory(77.42): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`back>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(77.42, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0239
     * @tc.name      SearchComponent_SearchPageStateFlow_0239
     * @tc.desc      SearchPageState call flow open > input > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0239 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('GXHQkwOd');
      logInfo(`step2 input("GXHQkwOd"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(-25);
      logInfo(`step3 pick(-25): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(7);
      logInfo(`step4 pick(7): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>input>pick>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('GXHQkwOd');
      logInfo(`open>input>pick>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0240
     * @tc.name      SearchComponent_SearchPageStateFlow_0240
     * @tc.desc      SearchPageState call flow open > open > pick > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0240 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(70);
      logInfo(`step3 pick(70): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      const step5: number = subject.input('1lOPW');
      logInfo(`step5 input("1lOPW"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`open>open>pick>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1lOPW');
      logInfo(`open>open>pick>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0241
     * @tc.name      SearchComponent_SearchPageStateFlow_0241
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0241 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(160);
      logInfo(`step1 tapCategory(160): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(48.07);
      logInfo(`step2 tapCategory(48.07): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`tapCategory>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(48.07, PRECISION);
      logInfo(`tapCategory>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0242
     * @tc.name      SearchComponent_SearchPageStateFlow_0242
     * @tc.desc      SearchPageState call flow input > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0242 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('Td7712KkU4');
      logInfo(`step1 input("Td7712KkU4"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(37);
      logInfo(`step2 pick(37): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      logInfo(`input>pick>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0243
     * @tc.name      SearchComponent_SearchPageStateFlow_0243
     * @tc.desc      SearchPageState call flow tapCategory > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0243 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-59);
      logInfo(`step1 tapCategory(-59): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(157);
      logInfo(`step3 pick(157): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>open>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-59);
      logInfo(`tapCategory>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0244
     * @tc.name      SearchComponent_SearchPageStateFlow_0244
     * @tc.desc      SearchPageState call flow open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0244 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('abc_1');
      logInfo(`step2 input("abc_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abc_1');
      logInfo(`open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0245
     * @tc.name      SearchComponent_SearchPageStateFlow_0245
     * @tc.desc      SearchPageState call flow open > back > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0245 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: number = subject.input('C9W04RuB6r4');
      logInfo(`step3 input("C9W04RuB6r4"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`open>back>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('C9W04RuB6r4');
      logInfo(`open>back>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>back>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0246
     * @tc.name      SearchComponent_SearchPageStateFlow_0246
     * @tc.desc      SearchPageState call flow input > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0246 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('eSo');
      logInfo(`step1 input("eSo"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(69.82);
      logInfo(`step2 tapCategory(69.82): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(48.07);
      logInfo(`step3 tapCategory(48.07): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`input>tapCategory>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('eSo');
      logInfo(`input>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(48.07, PRECISION);
      logInfo(`input>tapCategory>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0247
     * @tc.name      SearchComponent_SearchPageStateFlow_0247
     * @tc.desc      SearchPageState call flow tapCategory > open > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0247 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(60);
      logInfo(`step1 tapCategory(60): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0248
     * @tc.name      SearchComponent_SearchPageStateFlow_0248
     * @tc.desc      SearchPageState call flow back > open > tapCategory > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0248 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(43);
      logInfo(`step3 tapCategory(43): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(125);
      logInfo(`step4 pick(125): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`back>open>tapCategory>pick>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(43);
      logInfo(`back>open>tapCategory>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0249
     * @tc.name      SearchComponent_SearchPageStateFlow_0249
     * @tc.desc      SearchPageState call flow tapCategory > open > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0249 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(30);
      logInfo(`step1 tapCategory(30): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input(' ');
      logInfo(`step3 input(" "): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.tapCategory(-28);
      logInfo(`step4 tapCategory(-28): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>open>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' ');
      logInfo(`tapCategory>open>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-28);
      logInfo(`tapCategory>open>input>tapCategory final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`tapCategory>open>input>tapCategory final: JSON.stringify(subject....${JSON.stringify(subject.results)}`);
      expect(JSON.stringify(subject.results))
        .assertEqual('["XComponent + Vsync \u5b9e\u73b0\u81ea\u5b9a\u4e49\u52a8\u753b"]');
      logInfo(`tapCategory>open>input>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0250
     * @tc.name      SearchComponent_SearchPageStateFlow_0250
     * @tc.desc      SearchPageState call flow back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0250 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input(' a ');
      logInfo(`step2 input(" a "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' a ');
      logInfo(`back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0251
     * @tc.name      SearchComponent_SearchPageStateFlow_0251
     * @tc.desc      SearchPageState call flow pick > tapCategory > pick > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0251 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(145);
      logInfo(`step1 pick(145): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(11.48);
      logInfo(`step2 tapCategory(11.48): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(-11);
      logInfo(`step3 pick(-11): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input(' Sample Title 123 ');
      logInfo(`step4 input(" Sample Title 123 "): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick(178);
      logInfo(`step5 pick(178): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>tapCategory>pick>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Sample Title 123 ');
      logInfo(`pick>tapCategory>pick>input>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(11.48, PRECISION);
      logInfo(`pick>tapCategory>pick>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0252
     * @tc.name      SearchComponent_SearchPageStateFlow_0252
     * @tc.desc      SearchPageState call flow pick > open > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0252 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(40);
      logInfo(`step1 pick(40): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(-95);
      logInfo(`step3 tapCategory(-95): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pick>open>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-95);
      logInfo(`pick>open>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0253
     * @tc.name      SearchComponent_SearchPageStateFlow_0253
     * @tc.desc      SearchPageState call flow open > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0253 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(-96);
      logInfo(`step2 tapCategory(-96): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(63.9);
      logInfo(`step3 pick(63.9): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`open>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-96);
      logInfo(`open>tapCategory>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0254
     * @tc.name      SearchComponent_SearchPageStateFlow_0254
     * @tc.desc      SearchPageState call flow open > input > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0254 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('x ');
      logInfo(`step2 input("x "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(7);
      logInfo(`step3 pick(7): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`open>input>pick>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0255
     * @tc.name      SearchComponent_SearchPageStateFlow_0255
     * @tc.desc      SearchPageState call flow input > back > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0255 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('im');
      logInfo(`step1 input("im"): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.back();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0256
     * @tc.name      SearchComponent_SearchPageStateFlow_0256
     * @tc.desc      SearchPageState call flow open > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0256 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('');
      logInfo(`step2 input(""): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0257
     * @tc.name      SearchComponent_SearchPageStateFlow_0257
     * @tc.desc      SearchPageState call flow open > pick > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0257 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(191);
      logInfo(`step2 pick(191): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(14);
      logInfo(`step3 tapCategory(14): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('Hello_1');
      logInfo(`step4 input("Hello_1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`open>pick>tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello_1');
      logInfo(`open>pick>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(14);
      logInfo(`open>pick>tapCategory>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>pick>tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0258
     * @tc.name      SearchComponent_SearchPageStateFlow_0258
     * @tc.desc      SearchPageState call flow back > pick > tapCategory > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0258 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(6.65);
      logInfo(`step2 pick(6.65): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(25);
      logInfo(`step3 tapCategory(25): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(195);
      logInfo(`step4 pick(195): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`back>pick>tapCategory>pick>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(25);
      logInfo(`back>pick>tapCategory>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0259
     * @tc.name      SearchComponent_SearchPageStateFlow_0259
     * @tc.desc      SearchPageState call flow input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0259 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xa');
      logInfo(`step1 input("xa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xa');
      logInfo(`input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0260
     * @tc.name      SearchComponent_SearchPageStateFlow_0260
     * @tc.desc      SearchPageState call flow back > input > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0260 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('123123');
      logInfo(`step2 input("123123"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(-58);
      logInfo(`step3 tapCategory(-58): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(61.88);
      logInfo(`step4 pick(61.88): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>input>tapCategory>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123123');
      logInfo(`back>input>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-58);
      logInfo(`back>input>tapCategory>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0261
     * @tc.name      SearchComponent_SearchPageStateFlow_0261
     * @tc.desc      SearchPageState call flow back > pick > open > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0261 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(40);
      logInfo(`step2 pick(40): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.back();
      const step5: string = subject.pick(-46);
      logInfo(`step5 pick(-46): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0262
     * @tc.name      SearchComponent_SearchPageStateFlow_0262
     * @tc.desc      SearchPageState call flow tapCategory > open > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0262 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(147);
      logInfo(`step1 tapCategory(147): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      const step4: number = subject.input('1lOPW');
      logInfo(`step4 input("1lOPW"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`tapCategory>open>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1lOPW');
      logInfo(`tapCategory>open>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0263
     * @tc.name      SearchComponent_SearchPageStateFlow_0263
     * @tc.desc      SearchPageState call flow pick > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0263 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(93.49);
      logInfo(`step1 pick(93.49): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(43);
      logInfo(`step2 tapCategory(43): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(145);
      logInfo(`step3 tapCategory(145): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`pick>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(145);
      logInfo(`${BUNDLE}SearchPageStateFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0264
     * @tc.name      SearchComponent_SearchPageStateFlow_0264
     * @tc.desc      SearchPageState call flow pick > open > pick > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0264 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(173);
      logInfo(`step1 pick(173): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(145);
      logInfo(`step3 pick(145): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0265
     * @tc.name      SearchComponent_SearchPageStateFlow_0265
     * @tc.desc      SearchPageState call flow pick > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0265 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(110);
      logInfo(`step1 pick(110): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(10);
      logInfo(`step3 tapCategory(10): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`pick>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(10);
      logInfo(`pick>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0266
     * @tc.name      SearchComponent_SearchPageStateFlow_0266
     * @tc.desc      SearchPageState call flow input > open > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0266 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('Hello');
      logInfo(`step1 input("Hello"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('hello world');
      logInfo(`step3 input("hello world"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(136);
      logInfo(`step4 pick(136): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`input>open>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('hello world');
      logInfo(`input>open>input>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0266 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0267
     * @tc.name      SearchComponent_SearchPageStateFlow_0267
     * @tc.desc      SearchPageState call flow back > back > input > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0267 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: number = subject.input('Sample Title 123');
      logInfo(`step3 input("Sample Title 123"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(45);
      logInfo(`step4 tapCategory(45): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`back>back>input>tapCategory>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123');
      logInfo(`back>back>input>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(45);
      logInfo(`back>back>input>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>back>input>tapCategory>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0267 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0268
     * @tc.name      SearchComponent_SearchPageStateFlow_0268
     * @tc.desc      SearchPageState call flow open > back > tapCategory > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0268 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: string = subject.tapCategory(56.48);
      logInfo(`step3 tapCategory(56.48): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0268 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0269
     * @tc.name      SearchComponent_SearchPageStateFlow_0269
     * @tc.desc      SearchPageState call flow pick > tapCategory > tapCategory > tapCategory > pick keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0269 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(-21);
      logInfo(`step1 pick(-21): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(99);
      logInfo(`step2 tapCategory(99): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(-95);
      logInfo(`step3 tapCategory(-95): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(149);
      logInfo(`step4 tapCategory(149): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(87.76);
      logInfo(`step5 pick(87.76): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>tapCategory>tapCategory>tapCategory>...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(149);
      logInfo(`${BUNDLE}SearchPageStateFlow_0269 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0270
     * @tc.name      SearchComponent_SearchPageStateFlow_0270
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0270 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(50.46);
      logInfo(`step1 tapCategory(50.46): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(155);
      logInfo(`step2 tapCategory(155): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(64.86);
      logInfo(`step3 tapCategory(64.86): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(64.86, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0270 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0271
     * @tc.name      SearchComponent_SearchPageStateFlow_0271
     * @tc.desc      SearchPageState call flow pick > input > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0271 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(170);
      logInfo(`step1 pick(170): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('Sample Title 123Sample Title 123');
      logInfo(`step2 input("Sample Title 123Sample Title...: step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('u2ix3WIRffdu');
      logInfo(`step3 input("u2ix3WIRffdu"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(150);
      logInfo(`step4 tapCategory(150): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>input>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('u2ix3WIRffdu');
      logInfo(`pick>input>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(150);
      logInfo(`pick>input>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0271 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0272
     * @tc.name      SearchComponent_SearchPageStateFlow_0272
     * @tc.desc      SearchPageState call flow tapCategory > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0272 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(2);
      logInfo(`step1 tapCategory(2): step1=${step1}`);
      expect(step1).assertEqual('\u4e09\u65b9\u5e93');
      const step2: string = subject.pick(157);
      logInfo(`step2 pick(157): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(21.49);
      logInfo(`step3 pick(21.49): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>pick>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(2);
      logInfo(`tapCategory>pick>pick final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}SearchPageStateFlow_0272 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0273
     * @tc.name      SearchComponent_SearchPageStateFlow_0273
     * @tc.desc      SearchPageState call flow pick > input > input > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0273 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(27);
      logInfo(`step1 pick(27): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input(' Hello World ');
      logInfo(`step2 input(" Hello World "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input(' ');
      logInfo(`step3 input(" "): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.input(' _1');
      logInfo(`step4 input(" _1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.back();
      logInfo(`pick>input>input>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0273 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0274
     * @tc.name      SearchComponent_SearchPageStateFlow_0274
     * @tc.desc      SearchPageState call flow pick > pick > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0274 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(75);
      logInfo(`step1 pick(75): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(88.94);
      logInfo(`step2 pick(88.94): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('Hello WorldHello World');
      logInfo(`step3 input("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.input('trvc');
      logInfo(`step4 input("trvc"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>pick>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('trvc');
      logInfo(`pick>pick>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0274 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0275
     * @tc.name      SearchComponent_SearchPageStateFlow_0275
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0275 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-27);
      logInfo(`step1 tapCategory(-27): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(52.62);
      logInfo(`step2 tapCategory(52.62): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(52.62, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0275 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0276
     * @tc.name      SearchComponent_SearchPageStateFlow_0276
     * @tc.desc      SearchPageState call flow open > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0276 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('a');
      logInfo(`step2 input("a"): step2=${step2}`);
      expect(step2).assertEqual(26);
      const step3: string = subject.pick(-46);
      logInfo(`step3 pick(-46): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`open>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('a');
      logInfo(`open>input>pick final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(26);
      logInfo(`open>input>pick final: JSON.stringify(subject.results...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`open>input>pick final: subject.results[13].length=${subject.results[13].length}`);
      expect(subject.results[13].length).assertEqual(22);
      logInfo(`open>input>pick final: subject.results[13].substring(0, 16)=${subject.results[13].substring(0, 16)}`);
      expect(subject.results[13].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`open>input>pick final: subject.results[13].substring(16)=${subject.results[13].substring(16)}`);
      expect(subject.results[13].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateFlow_0276 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0277
     * @tc.name      SearchComponent_SearchPageStateFlow_0277
     * @tc.desc      SearchPageState call flow open > input > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0277 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('FS');
      logInfo(`step2 input("FS"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`open>input>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input>back>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0277 end`);
    });
  });
}
