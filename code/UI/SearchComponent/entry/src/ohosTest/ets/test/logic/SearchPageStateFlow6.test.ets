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

/** Logic checks for SearchPageState flow (53 cases). */
export default function searchPageStateFlow6Test(): void {
  describe('SearchPageStateFlow6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0278
     * @tc.name      SearchComponent_SearchPageStateFlow_0278
     * @tc.desc      SearchPageState call flow pick > pick > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0278 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(140);
      logInfo(`step1 pick(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(40);
      logInfo(`step2 pick(40): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      const step4: number = subject.input('\u4e2d\u6587');
      logInfo(`step4 input("??"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>pick>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('\u4e2d\u6587');
      logInfo(`pick>pick>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0278 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0279
     * @tc.name      SearchComponent_SearchPageStateFlow_0279
     * @tc.desc      SearchPageState call flow tapCategory > open > back > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0279 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(50.46);
      logInfo(`step1 tapCategory(50.46): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      subject.back();
      const step5: string = subject.pick(63.9);
      logInfo(`step5 pick(63.9): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0280
     * @tc.name      SearchComponent_SearchPageStateFlow_0280
     * @tc.desc      SearchPageState call flow input > tapCategory > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0280 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('f5W3');
      logInfo(`step1 input("f5W3"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(38);
      logInfo(`step2 tapCategory(38): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(40);
      logInfo(`step4 pick(40): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`input>tapCategory>open>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('f5W3');
      logInfo(`input>tapCategory>open>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(38);
      logInfo(`input>tapCategory>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>tapCategory>open>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0281
     * @tc.name      SearchComponent_SearchPageStateFlow_0281
     * @tc.desc      SearchPageState call flow back > pick > back > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0281 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(-62);
      logInfo(`step2 pick(-62): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.input('123');
      logInfo(`step5 input("123"): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`back>pick>back>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123');
      logInfo(`back>pick>back>open>input final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`back>pick>back>open>input final: JSON.stringify(subject.results)=${JSON.stringify(subject.results)}`);
      expect(JSON.stringify(subject.results)).assertEqual('["NavDestination\u5f39\u7a97"]');
      logInfo(`back>pick>back>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0282
     * @tc.name      SearchComponent_SearchPageStateFlow_0282
     * @tc.desc      SearchPageState call flow input > pick > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0282 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('im');
      logInfo(`step1 input("im"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.pick(-13);
      logInfo(`step2 pick(-13): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(50.46);
      logInfo(`step3 tapCategory(50.46): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(77.42);
      logInfo(`step4 tapCategory(77.42): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`input>pick>tapCategory>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('im');
      logInfo(`input>pick>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(77.42, PRECISION);
      logInfo(`input>pick>tapCategory>tapCategory final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`input>pick>tapCategory>tapCategory final: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(22);
      logInfo(`input>pick>tapCategory>tapCategory final: subject.results[0]....${subject.results[0].substring(0, 16)}`);
      expect(subject.results[0].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`input>pick>tapCategory>tapCategory final: subject.results[0].sub...${subject.results[0].substring(16)}`);
      expect(subject.results[0].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0283
     * @tc.name      SearchComponent_SearchPageStateFlow_0283
     * @tc.desc      SearchPageState call flow pick > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0283 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(168);
      logInfo(`step1 pick(168): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('grqbR');
      logInfo(`step3 input("grqbR"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('grqbR');
      logInfo(`pick>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0284
     * @tc.name      SearchComponent_SearchPageStateFlow_0284
     * @tc.desc      SearchPageState call flow input > open > pick > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0284 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('c');
      logInfo(`step1 input("c"): step1=${step1}`);
      expect(step1).assertEqual(10);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(125);
      logInfo(`step3 pick(125): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(160);
      logInfo(`step4 pick(160): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input(' hello world ');
      logInfo(`step5 input(" hello world "): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`input>open>pick>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' hello world ');
      logInfo(`input>open>pick>pick>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>pick>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0285
     * @tc.name      SearchComponent_SearchPageStateFlow_0285
     * @tc.desc      SearchPageState call flow back > tapCategory > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0285 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(-12);
      logInfo(`step2 tapCategory(-12): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(177);
      logInfo(`step3 tapCategory(177): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(-25);
      logInfo(`step4 pick(-25): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>tapCategory>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(177);
      logInfo(`${BUNDLE}SearchPageStateFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0286
     * @tc.name      SearchComponent_SearchPageStateFlow_0286
     * @tc.desc      SearchPageState call flow back > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0286 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(105);
      logInfo(`step3 tapCategory(105): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`back>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(105);
      logInfo(`back>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0287
     * @tc.name      SearchComponent_SearchPageStateFlow_0287
     * @tc.desc      SearchPageState call flow pick > open > pick > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0287 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(61.88);
      logInfo(`step1 pick(61.88): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(-46);
      logInfo(`step3 pick(-46): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(140);
      logInfo(`step4 pick(140): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(-46);
      logInfo(`step5 pick(-46): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>open>pick>pick>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0288
     * @tc.name      SearchComponent_SearchPageStateFlow_0288
     * @tc.desc      SearchPageState call flow tapCategory > input > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0288 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-79);
      logInfo(`step1 tapCategory(-79): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input(' A ');
      logInfo(`step2 input(" A "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapCategory>input>open>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' A ');
      logInfo(`tapCategory>input>open>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-79);
      logInfo(`tapCategory>input>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>input>open>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0289
     * @tc.name      SearchComponent_SearchPageStateFlow_0289
     * @tc.desc      SearchPageState call flow input > input > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0289 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('abcabc');
      logInfo(`step1 input("abcabc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('abc');
      logInfo(`step2 input("abc"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.input('Hello_1');
      logInfo(`step3 input("Hello_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      logInfo(`input>input>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0290
     * @tc.name      SearchComponent_SearchPageStateFlow_0290
     * @tc.desc      SearchPageState call flow tapCategory > open > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0290 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(111);
      logInfo(`step1 tapCategory(111): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      const step4: string = subject.tapCategory(73);
      logInfo(`step4 tapCategory(73): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>open>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(73);
      logInfo(`${BUNDLE}SearchPageStateFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0291
     * @tc.name      SearchComponent_SearchPageStateFlow_0291
     * @tc.desc      SearchPageState call flow tapCategory > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0291 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(86.6);
      logInfo(`step1 tapCategory(86.6): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.tapCategory(200);
      logInfo(`step3 tapCategory(200): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(200);
      logInfo(`${BUNDLE}SearchPageStateFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0292
     * @tc.name      SearchComponent_SearchPageStateFlow_0292
     * @tc.desc      SearchPageState call flow back > back > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0292 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.input(' abc ');
      logInfo(`step4 input(" abc "): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`back>back>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' abc ');
      logInfo(`back>back>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>back>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0293
     * @tc.name      SearchComponent_SearchPageStateFlow_0293
     * @tc.desc      SearchPageState call flow input > pick > tapCategory > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0293 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('5lcQo7Ww');
      logInfo(`step1 input("5lcQo7Ww"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(79.23);
      logInfo(`step2 pick(79.23): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(147);
      logInfo(`step3 tapCategory(147): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(88);
      logInfo(`step4 pick(88): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(87);
      logInfo(`step5 pick(87): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`input>pick>tapCategory>pick>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('5lcQo7Ww');
      logInfo(`input>pick>tapCategory>pick>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(147);
      logInfo(`input>pick>tapCategory>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0294
     * @tc.name      SearchComponent_SearchPageStateFlow_0294
     * @tc.desc      SearchPageState call flow tapCategory > back > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0294 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(47);
      logInfo(`step1 tapCategory(47): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0295
     * @tc.name      SearchComponent_SearchPageStateFlow_0295
     * @tc.desc      SearchPageState call flow input > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0295 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('BQ17xe31a0P');
      logInfo(`step1 input("BQ17xe31a0P"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('pl2oJUSP20G3');
      logInfo(`step2 input("pl2oJUSP20G3"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(-1);
      logInfo(`step3 tapCategory(-1): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`input>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('pl2oJUSP20G3');
      logInfo(`input>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0296
     * @tc.name      SearchComponent_SearchPageStateFlow_0296
     * @tc.desc      SearchPageState call flow back > back > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0296 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.pick(11.63);
      logInfo(`step3 pick(11.63): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(175);
      logInfo(`step4 tapCategory(175): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>back>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(175);
      logInfo(`${BUNDLE}SearchPageStateFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0297
     * @tc.name      SearchComponent_SearchPageStateFlow_0297
     * @tc.desc      SearchPageState call flow input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0297 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xHello World');
      logInfo(`step1 input("xHello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(-39);
      logInfo(`step2 tapCategory(-39): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xHello World');
      logInfo(`input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-39);
      logInfo(`input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0298
     * @tc.name      SearchComponent_SearchPageStateFlow_0298
     * @tc.desc      SearchPageState call flow pick > pick > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0298 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(72.88);
      logInfo(`step1 pick(72.88): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(90);
      logInfo(`step2 pick(90): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('pl2oJUSP20G3');
      logInfo(`step3 input("pl2oJUSP20G3"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(5);
      logInfo(`step4 tapCategory(5): step4=${step4}`);
      expect(step4).assertEqual('\u5176\u4ed6');
      logInfo(`pick>pick>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('pl2oJUSP20G3');
      logInfo(`pick>pick>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(5);
      logInfo(`pick>pick>input>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u5176\u4ed6');
      logInfo(`pick>pick>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0299
     * @tc.name      SearchComponent_SearchPageStateFlow_0299
     * @tc.desc      SearchPageState call flow back > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0299 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('GK1bMc0P');
      logInfo(`step2 input("GK1bMc0P"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(140);
      logInfo(`step3 pick(140): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`back>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('GK1bMc0P');
      logInfo(`back>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0300
     * @tc.name      SearchComponent_SearchPageStateFlow_0300
     * @tc.desc      SearchPageState call flow input > open > open > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0300 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('FS');
      logInfo(`step1 input("FS"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(87.76);
      logInfo(`step4 pick(87.76): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('abcabc');
      logInfo(`step5 input("abcabc"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`input>open>open>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abcabc');
      logInfo(`input>open>open>pick>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>open>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0301
     * @tc.name      SearchComponent_SearchPageStateFlow_0301
     * @tc.desc      SearchPageState call flow input > pick > open > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0301 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('BQ17xe31a0P');
      logInfo(`step1 input("BQ17xe31a0P"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(50);
      logInfo(`step2 pick(50): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.input(' abc ');
      logInfo(`step4 input(" abc "): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.tapCategory(48.07);
      logInfo(`step5 tapCategory(48.07): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`input>pick>open>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' abc ');
      logInfo(`input>pick>open>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(48.07, PRECISION);
      logInfo(`input>pick>open>input>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>pick>open>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0302
     * @tc.name      SearchComponent_SearchPageStateFlow_0302
     * @tc.desc      SearchPageState call flow open > open > back > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0302 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`open>open>back>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0303
     * @tc.name      SearchComponent_SearchPageStateFlow_0303
     * @tc.desc      SearchPageState call flow back > tapCategory > input > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0303 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(75);
      logInfo(`step2 tapCategory(75): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input(' _1');
      logInfo(`step3 input(" _1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      const step5: string = subject.pick(61.88);
      logInfo(`step5 pick(61.88): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>tapCategory>input>back>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0304
     * @tc.name      SearchComponent_SearchPageStateFlow_0304
     * @tc.desc      SearchPageState call flow input > pick > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0304 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('jmWrg');
      logInfo(`step1 input("jmWrg"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(25);
      logInfo(`step2 pick(25): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(-95);
      logInfo(`step3 tapCategory(-95): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('xa');
      logInfo(`step4 input("xa"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`input>pick>tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xa');
      logInfo(`input>pick>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-95);
      logInfo(`input>pick>tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0305
     * @tc.name      SearchComponent_SearchPageStateFlow_0305
     * @tc.desc      SearchPageState call flow pick > open > back > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0305 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(-16);
      logInfo(`step1 pick(-16): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pick>open>back>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0306
     * @tc.name      SearchComponent_SearchPageStateFlow_0306
     * @tc.desc      SearchPageState call flow back > open > tapCategory > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0306 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(-1);
      logInfo(`step3 tapCategory(-1): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(193);
      logInfo(`step4 tapCategory(193): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('123123');
      logInfo(`step5 input("123123"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`back>open>tapCategory>tapCategory>input f...: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123123');
      logInfo(`back>open>tapCategory>tapCategory>input f...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(193);
      logInfo(`back>open>tapCategory>tapCategory>input f...: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>open>tapCategory>tapCategory>input f...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0307
     * @tc.name      SearchComponent_SearchPageStateFlow_0307
     * @tc.desc      SearchPageState call flow pick > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0307 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(88.94);
      logInfo(`step1 pick(88.94): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('A');
      logInfo(`step2 input("A"): step2=${step2}`);
      expect(step2).assertEqual(26);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pick>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('A');
      logInfo(`pick>input>open final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(26);
      logInfo(`pick>input>open final: JSON.stringify(subject.results...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`pick>input>open final: subject.results[13].length=${subject.results[13].length}`);
      expect(subject.results[13].length).assertEqual(22);
      logInfo(`pick>input>open final: subject.results[13].substring(0, 16)=${subject.results[13].substring(0, 16)}`);
      expect(subject.results[13].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`pick>input>open final: subject.results[13].substring(16)=${subject.results[13].substring(16)}`);
      expect(subject.results[13].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0308
     * @tc.name      SearchComponent_SearchPageStateFlow_0308
     * @tc.desc      SearchPageState call flow open > input > input > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0308 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('1up2OEC2Tjx');
      logInfo(`step2 input("1up2OEC2Tjx"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('hello world');
      logInfo(`step3 input("hello world"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(193);
      logInfo(`step4 pick(193): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.back();
      logInfo(`open>input>input>pick>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0309
     * @tc.name      SearchComponent_SearchPageStateFlow_0309
     * @tc.desc      SearchPageState call flow back > tapCategory > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0309 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(10.09);
      logInfo(`step2 tapCategory(10.09): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('l9tQItoQ');
      logInfo(`step3 input("l9tQItoQ"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.input('x123');
      logInfo(`step4 input("x123"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`back>tapCategory>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x123');
      logInfo(`back>tapCategory>input>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(10.09, PRECISION);
      logInfo(`back>tapCategory>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0310
     * @tc.name      SearchComponent_SearchPageStateFlow_0310
     * @tc.desc      SearchPageState call flow back > back > back > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0310 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      subject.back();
      const step4: string = subject.tapCategory(100);
      logInfo(`step4 tapCategory(100): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.tapCategory(200);
      logInfo(`step5 tapCategory(200): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>back>back>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(200);
      logInfo(`${BUNDLE}SearchPageStateFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0311
     * @tc.name      SearchComponent_SearchPageStateFlow_0311
     * @tc.desc      SearchPageState call flow tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0311 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(170);
      logInfo(`step1 tapCategory(170): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(175);
      logInfo(`step2 pick(175): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(170);
      logInfo(`${BUNDLE}SearchPageStateFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0312
     * @tc.name      SearchComponent_SearchPageStateFlow_0312
     * @tc.desc      SearchPageState call flow input > pick > pick > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0312 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('fc');
      logInfo(`step1 input("fc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(140);
      logInfo(`step2 pick(140): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(-66);
      logInfo(`step3 pick(-66): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`input>pick>pick>open>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('fc');
      logInfo(`input>pick>pick>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>pick>pick>open>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0313
     * @tc.name      SearchComponent_SearchPageStateFlow_0313
     * @tc.desc      SearchPageState call flow input > back > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0313 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('u');
      logInfo(`step1 input("u"): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.back();
      subject.back();
      const step4: number = subject.input(' A ');
      logInfo(`step4 input(" A "): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`input>back>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' A ');
      logInfo(`input>back>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0314
     * @tc.name      SearchComponent_SearchPageStateFlow_0314
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0314 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(55);
      logInfo(`step1 tapCategory(55): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(26);
      logInfo(`step2 tapCategory(26): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('xSample Title 123');
      logInfo(`step3 input("xSample Title 123"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`tapCategory>tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xSample Title 123');
      logInfo(`tapCategory>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(26);
      logInfo(`tapCategory>tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0315
     * @tc.name      SearchComponent_SearchPageStateFlow_0315
     * @tc.desc      SearchPageState call flow tapCategory > back > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0315 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(97);
      logInfo(`step1 tapCategory(97): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapCategory>back>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0316
     * @tc.name      SearchComponent_SearchPageStateFlow_0316
     * @tc.desc      SearchPageState call flow back > back > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0316 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      subject.back();
      const step4: string = subject.pick(70);
      logInfo(`step4 pick(70): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0317
     * @tc.name      SearchComponent_SearchPageStateFlow_0317
     * @tc.desc      SearchPageState call flow open > input > pick > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0317 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('xA');
      logInfo(`step2 input("xA"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(178);
      logInfo(`step3 pick(178): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(100);
      logInfo(`step4 pick(100): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('GXHQkwOd');
      logInfo(`step5 input("GXHQkwOd"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`open>input>pick>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('GXHQkwOd');
      logInfo(`open>input>pick>pick>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input>pick>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0318
     * @tc.name      SearchComponent_SearchPageStateFlow_0318
     * @tc.desc      SearchPageState call flow open > open > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0318 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(177);
      logInfo(`step3 tapCategory(177): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`open>open>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(177);
      logInfo(`open>open>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0319
     * @tc.name      SearchComponent_SearchPageStateFlow_0319
     * @tc.desc      SearchPageState call flow open > open > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0319 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      const step4: string = subject.pick(-15);
      logInfo(`step4 pick(-15): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0319 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0320
     * @tc.name      SearchComponent_SearchPageStateFlow_0320
     * @tc.desc      SearchPageState call flow input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0320 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xA');
      logInfo(`step1 input("xA"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(105);
      logInfo(`step2 tapCategory(105): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xA');
      logInfo(`input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(105);
      logInfo(`input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0321
     * @tc.name      SearchComponent_SearchPageStateFlow_0321
     * @tc.desc      SearchPageState call flow input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0321 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input(' _1');
      logInfo(`step1 input(" _1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('u');
      logInfo(`step2 input("u"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('u');
      logInfo(`input>input final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`input>input final: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(28);
      logInfo(`input>input final: subject.results[0].substring(0, 19)=${subject.results[0].substring(0, 19)}`);
      expect(subject.results[0].substring(0, 19)).assertEqual('\u4f7f\u7528ArkUI\u7684FrameNode\u6269\u5c55');
      logInfo(`input>input final: subject.results[0].substring(22)=${subject.results[0].substring(22)}`);
      expect(subject.results[0].substring(22)).assertEqual('\u6001\u5e03\u5c40\u7c7b\u6846\u67b6');
      logInfo(`input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0322
     * @tc.name      SearchComponent_SearchPageStateFlow_0322
     * @tc.desc      SearchPageState call flow input > back > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0322 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('IgL0yFvo8fR');
      logInfo(`step1 input("IgL0yFvo8fR"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.back();
      const step3: number = subject.input('Hello WorldHello World');
      logInfo(`step3 input("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      logInfo(`input>back>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0323
     * @tc.name      SearchComponent_SearchPageStateFlow_0323
     * @tc.desc      SearchPageState call flow input > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0323 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('UVG0zTsIznC');
      logInfo(`step1 input("UVG0zTsIznC"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('aa');
      logInfo(`step2 input("aa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(144);
      logInfo(`step3 pick(144): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`input>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('aa');
      logInfo(`input>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0323 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0324
     * @tc.name      SearchComponent_SearchPageStateFlow_0324
     * @tc.desc      SearchPageState call flow tapCategory > pick > open > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0324 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(91.51);
      logInfo(`step1 tapCategory(91.51): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(89.95);
      logInfo(`step2 pick(89.95): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.input(' A ');
      logInfo(`step5 input(" A "): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`tapCategory>pick>open>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' A ');
      logInfo(`tapCategory>pick>open>open>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`tapCategory>pick>open>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>pick>open>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0324 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0325
     * @tc.name      SearchComponent_SearchPageStateFlow_0325
     * @tc.desc      SearchPageState call flow pick > tapCategory > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0325 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(24);
      logInfo(`step1 pick(24): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(5);
      logInfo(`step2 tapCategory(5): step2=${step2}`);
      expect(step2).assertEqual('\u5176\u4ed6');
      const step3: string = subject.pick(165);
      logInfo(`step3 pick(165): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pick>tapCategory>pick>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(5);
      logInfo(`pick>tapCategory>pick>open final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u5176\u4ed6');
      logInfo(`pick>tapCategory>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0325 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0326
     * @tc.name      SearchComponent_SearchPageStateFlow_0326
     * @tc.desc      SearchPageState call flow back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0326 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('u');
      logInfo(`step2 input("u"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('u');
      logInfo(`back>input final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`back>input final: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(28);
      logInfo(`back>input final: subject.results[0].substring(0, 19)=${subject.results[0].substring(0, 19)}`);
      expect(subject.results[0].substring(0, 19)).assertEqual('\u4f7f\u7528ArkUI\u7684FrameNode\u6269\u5c55');
      logInfo(`back>input final: subject.results[0].substring(22)=${subject.results[0].substring(22)}`);
      expect(subject.results[0].substring(22)).assertEqual('\u6001\u5e03\u5c40\u7c7b\u6846\u67b6');
      logInfo(`${BUNDLE}SearchPageStateFlow_0326 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0327
     * @tc.name      SearchComponent_SearchPageStateFlow_0327
     * @tc.desc      SearchPageState call flow back > back > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0327 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.tapCategory(80);
      logInfo(`step3 tapCategory(80): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('');
      logInfo(`step4 input(""): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`back>back>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(80);
      logInfo(`${BUNDLE}SearchPageStateFlow_0327 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0328
     * @tc.name      SearchComponent_SearchPageStateFlow_0328
     * @tc.desc      SearchPageState call flow open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0328 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(3);
      logInfo(`step2 tapCategory(3): step2=${step2}`);
      expect(step2).assertEqual('Native');
      logInfo(`open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(3);
      logInfo(`open>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('Native');
      logInfo(`open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0328 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0329
     * @tc.name      SearchComponent_SearchPageStateFlow_0329
     * @tc.desc      SearchPageState call flow back > open > input > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0329 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('xHello World');
      logInfo(`step3 input("xHello World"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(39);
      logInfo(`step4 pick(39): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`back>open>input>pick>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xHello World');
      logInfo(`back>open>input>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>open>input>pick>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0329 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0330
     * @tc.name      SearchComponent_SearchPageStateFlow_0330
     * @tc.desc      SearchPageState call flow open > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0330 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(3);
      logInfo(`step3 tapCategory(3): step3=${step3}`);
      expect(step3).assertEqual('Native');
      logInfo(`open>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(3);
      logInfo(`open>open>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('Native');
      logInfo(`open>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0330 end`);
    });
  });
}
