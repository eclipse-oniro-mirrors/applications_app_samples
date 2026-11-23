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

/** Logic checks for SearchPageState flow (19 cases). */
export default function searchPageStateFlow7Test(): void {
  describe('SearchPageStateFlow7Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0331
     * @tc.name      SearchComponent_SearchPageStateFlow_0331
     * @tc.desc      SearchPageState call flow open > back > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0331 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: string = subject.tapCategory(191);
      logInfo(`step3 tapCategory(191): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(-28);
      logInfo(`step4 tapCategory(-28): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>back>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-28);
      logInfo(`${BUNDLE}SearchPageStateFlow_0331 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0332
     * @tc.name      SearchComponent_SearchPageStateFlow_0332
     * @tc.desc      SearchPageState call flow input > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0332 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('Sample Title 123');
      logInfo(`step1 input("Sample Title 123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('123_1');
      logInfo(`step2 input("123_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`input>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123_1');
      logInfo(`input>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0332 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0333
     * @tc.name      SearchComponent_SearchPageStateFlow_0333
     * @tc.desc      SearchPageState call flow pick > pick > open > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0333 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(48.9);
      logInfo(`step1 pick(48.9): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(115);
      logInfo(`step2 pick(115): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.back();
      const step5: string = subject.tapCategory(26);
      logInfo(`step5 tapCategory(26): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>pick>open>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(26);
      logInfo(`${BUNDLE}SearchPageStateFlow_0333 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0334
     * @tc.name      SearchComponent_SearchPageStateFlow_0334
     * @tc.desc      SearchPageState call flow pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0334 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(50);
      logInfo(`step1 pick(50): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('Sample Title 123');
      logInfo(`step2 input("Sample Title 123"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123');
      logInfo(`pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0334 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0335
     * @tc.name      SearchComponent_SearchPageStateFlow_0335
     * @tc.desc      SearchPageState call flow tapCategory > open > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0335 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(177);
      logInfo(`step1 tapCategory(177): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapCategory>open>open>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(177);
      logInfo(`tapCategory>open>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0335 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0336
     * @tc.name      SearchComponent_SearchPageStateFlow_0336
     * @tc.desc      SearchPageState call flow input > input > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0336 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xSample Title 123');
      logInfo(`step1 input("xSample Title 123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('xHello World');
      logInfo(`step2 input("xHello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(69.82);
      logInfo(`step3 tapCategory(69.82): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`input>input>tapCategory>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xHello World');
      logInfo(`input>input>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(69.82, PRECISION);
      logInfo(`input>input>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>input>tapCategory>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0336 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0337
     * @tc.name      SearchComponent_SearchPageStateFlow_0337
     * @tc.desc      SearchPageState call flow back > tapCategory > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0337 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(51);
      logInfo(`step2 tapCategory(51): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input(' Hello World ');
      logInfo(`step3 input(" Hello World "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`back>tapCategory>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Hello World ');
      logInfo(`back>tapCategory>input>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(51);
      logInfo(`back>tapCategory>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>tapCategory>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0337 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0338
     * @tc.name      SearchComponent_SearchPageStateFlow_0338
     * @tc.desc      SearchPageState call flow pick > pick > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0338 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(30);
      logInfo(`step1 pick(30): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(25);
      logInfo(`step2 pick(25): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(19.18);
      logInfo(`step3 pick(19.18): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(28.01);
      logInfo(`step4 tapCategory(28.01): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>pick>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(28.01, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0338 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0339
     * @tc.name      SearchComponent_SearchPageStateFlow_0339
     * @tc.desc      SearchPageState call flow open > pick > pick > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0339 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(88.94);
      logInfo(`step2 pick(88.94): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(59);
      logInfo(`step3 pick(59): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`open>pick>pick>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0339 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0340
     * @tc.name      SearchComponent_SearchPageStateFlow_0340
     * @tc.desc      SearchPageState call flow pick > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0340 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(143);
      logInfo(`step1 pick(143): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('xa');
      logInfo(`step2 input("xa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input(' Sample Title 123 ');
      logInfo(`step3 input(" Sample Title 123 "): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Sample Title 123 ');
      logInfo(`pick>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0340 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0341
     * @tc.name      SearchComponent_SearchPageStateFlow_0341
     * @tc.desc      SearchPageState call flow input > back > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0341 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('BffN5n493da');
      logInfo(`step1 input("BffN5n493da"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.back();
      subject.back();
      const step4: number = subject.input('UVG0zTsIznC');
      logInfo(`step4 input("UVG0zTsIznC"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`input>back>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('UVG0zTsIznC');
      logInfo(`input>back>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0341 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0342
     * @tc.name      SearchComponent_SearchPageStateFlow_0342
     * @tc.desc      SearchPageState call flow pick > input > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0342 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(59);
      logInfo(`step1 pick(59): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('x\u4e2d\u6587');
      logInfo(`step2 input("x??"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(191);
      logInfo(`step3 tapCategory(191): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pick>input>tapCategory>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x\u4e2d\u6587');
      logInfo(`pick>input>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(191);
      logInfo(`pick>input>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>input>tapCategory>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0342 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0343
     * @tc.name      SearchComponent_SearchPageStateFlow_0343
     * @tc.desc      SearchPageState call flow tapCategory > open > input > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0343 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-59);
      logInfo(`step1 tapCategory(-59): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('I16hQ9Eh');
      logInfo(`step3 input("I16hQ9Eh"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.input('Hello_1');
      logInfo(`step4 input("Hello_1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick(77);
      logInfo(`step5 pick(77): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`tapCategory>open>input>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello_1');
      logInfo(`tapCategory>open>input>input>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-59);
      logInfo(`tapCategory>open>input>input>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>open>input>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0343 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0344
     * @tc.name      SearchComponent_SearchPageStateFlow_0344
     * @tc.desc      SearchPageState call flow tapCategory > open > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0344 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-1);
      logInfo(`step1 tapCategory(-1): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('\u4e2d\u6587');
      logInfo(`step3 input("??"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(62.05);
      logInfo(`step4 pick(62.05): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>open>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('\u4e2d\u6587');
      logInfo(`tapCategory>open>input>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>open>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0344 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0345
     * @tc.name      SearchComponent_SearchPageStateFlow_0345
     * @tc.desc      SearchPageState call flow input > open > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0345 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xSample Title 123');
      logInfo(`step1 input("xSample Title 123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(2);
      logInfo(`step3 pick(2): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`input>open>pick>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xSample Title 123');
      logInfo(`input>open>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>pick>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0345 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0346
     * @tc.name      SearchComponent_SearchPageStateFlow_0346
     * @tc.desc      SearchPageState call flow pick > input > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0346 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(135);
      logInfo(`step1 pick(135): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input(' Hello ');
      logInfo(`step2 input(" Hello "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(28);
      logInfo(`step3 tapCategory(28): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(81);
      logInfo(`step4 tapCategory(81): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>input>tapCategory>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Hello ');
      logInfo(`pick>input>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(81);
      logInfo(`pick>input>tapCategory>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0346 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0347
     * @tc.name      SearchComponent_SearchPageStateFlow_0347
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0347 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-28);
      logInfo(`step1 tapCategory(-28): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(51.4);
      logInfo(`step2 tapCategory(51.4): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(51.4, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0347 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0348
     * @tc.name      SearchComponent_SearchPageStateFlow_0348
     * @tc.desc      SearchPageState call flow open > pick > open > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0348 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(3);
      logInfo(`step2 pick(3): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.tapCategory(86.6);
      logInfo(`step4 tapCategory(86.6): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.tapCategory(91.51);
      logInfo(`step5 tapCategory(91.51): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`open>pick>open>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`open>pick>open>tapCategory>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0348 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0349
     * @tc.name      SearchComponent_SearchPageStateFlow_0349
     * @tc.desc      SearchPageState call flow pick > open > pick > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0349 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(-14);
      logInfo(`step1 pick(-14): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(190);
      logInfo(`step3 pick(190): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(93);
      logInfo(`step4 tapCategory(93): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pick>open>pick>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(93);
      logInfo(`pick>open>pick>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0349 end`);
    });
  });
}
