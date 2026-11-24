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

/** Logic checks for SearchPageState flow (57 cases). */
export default function searchPageStateFlow4Test(): void {
  describe('SearchPageStateFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0167
     * @tc.name      SearchComponent_SearchPageStateFlow_0167
     * @tc.desc      SearchPageState call flow input > input > tapCategory > tapCategory > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0167 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('abc_1');
      logInfo(`step1 input("abc_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('   ');
      logInfo(`step2 input("   "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(-81);
      logInfo(`step3 tapCategory(-81): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(118);
      logInfo(`step4 tapCategory(118): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.back();
      logInfo(`input>input>tapCategory>tapCategory>back ...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0168
     * @tc.name      SearchComponent_SearchPageStateFlow_0168
     * @tc.desc      SearchPageState call flow input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0168 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('sU8ACk75L45');
      logInfo(`step1 input("sU8ACk75L45"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(25);
      logInfo(`step2 tapCategory(25): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('sU8ACk75L45');
      logInfo(`input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(25);
      logInfo(`input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0169
     * @tc.name      SearchComponent_SearchPageStateFlow_0169
     * @tc.desc      SearchPageState call flow back > input > input > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0169 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('xa');
      logInfo(`step2 input("xa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('123');
      logInfo(`step3 input("123"): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.back();
      const step5: number = subject.input('77c6BOqh1wQ2');
      logInfo(`step5 input("77c6BOqh1wQ2"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`back>input>input>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('77c6BOqh1wQ2');
      logInfo(`back>input>input>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0170
     * @tc.name      SearchComponent_SearchPageStateFlow_0170
     * @tc.desc      SearchPageState call flow tapCategory > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0170 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(42.82);
      logInfo(`step1 tapCategory(42.82): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.tapCategory(60);
      logInfo(`step3 tapCategory(60): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(60);
      logInfo(`${BUNDLE}SearchPageStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0171
     * @tc.name      SearchComponent_SearchPageStateFlow_0171
     * @tc.desc      SearchPageState call flow tapCategory > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0171 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-96);
      logInfo(`step1 tapCategory(-96): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0172
     * @tc.name      SearchComponent_SearchPageStateFlow_0172
     * @tc.desc      SearchPageState call flow pick > back > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0172 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(28.63);
      logInfo(`step1 pick(28.63): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      subject.back();
      const step4: number = subject.input('Hello');
      logInfo(`step4 input("Hello"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>back>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello');
      logInfo(`pick>back>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0173
     * @tc.name      SearchComponent_SearchPageStateFlow_0173
     * @tc.desc      SearchPageState call flow tapCategory > pick > tapCategory > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0173 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(70);
      logInfo(`step1 tapCategory(70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(193);
      logInfo(`step2 pick(193): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(-29);
      logInfo(`step3 tapCategory(-29): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`tapCategory>pick>tapCategory>open>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-29);
      logInfo(`tapCategory>pick>tapCategory>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0174
     * @tc.name      SearchComponent_SearchPageStateFlow_0174
     * @tc.desc      SearchPageState call flow tapCategory > open > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0174 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(200);
      logInfo(`step1 tapCategory(200): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(-28);
      logInfo(`step3 tapCategory(-28): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(75);
      logInfo(`step4 tapCategory(75): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>open>tapCategory>tapCategory ...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(75);
      logInfo(`tapCategory>open>tapCategory>tapCategory ...: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0175
     * @tc.name      SearchComponent_SearchPageStateFlow_0175
     * @tc.desc      SearchPageState call flow open > pick > tapCategory > back > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0175 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(189);
      logInfo(`step2 pick(189): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(150);
      logInfo(`step3 tapCategory(150): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0176
     * @tc.name      SearchComponent_SearchPageStateFlow_0176
     * @tc.desc      SearchPageState call flow back > back > open > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0176 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(39);
      logInfo(`step4 pick(39): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(95);
      logInfo(`step5 pick(95): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>back>open>pick>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0177
     * @tc.name      SearchComponent_SearchPageStateFlow_0177
     * @tc.desc      SearchPageState call flow back > back > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0177 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.tapCategory(43);
      logInfo(`step3 tapCategory(43): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(5);
      logInfo(`step4 tapCategory(5): step4=${step4}`);
      expect(step4).assertEqual('\u5176\u4ed6');
      logInfo(`back>back>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(5);
      logInfo(`back>back>tapCategory>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}SearchPageStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0178
     * @tc.name      SearchComponent_SearchPageStateFlow_0178
     * @tc.desc      SearchPageState call flow open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0178 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('UVG0zTsIznC');
      logInfo(`step2 input("UVG0zTsIznC"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('UVG0zTsIznC');
      logInfo(`open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0179
     * @tc.name      SearchComponent_SearchPageStateFlow_0179
     * @tc.desc      SearchPageState call flow back > back > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0179 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.tapCategory(5);
      logInfo(`step4 tapCategory(5): step4=${step4}`);
      expect(step4).assertEqual('\u5176\u4ed6');
      logInfo(`back>back>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(5);
      logInfo(`back>back>open>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u5176\u4ed6');
      logInfo(`back>back>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0180
     * @tc.name      SearchComponent_SearchPageStateFlow_0180
     * @tc.desc      SearchPageState call flow input > open > tapCategory > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0180 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xHello');
      logInfo(`step1 input("xHello"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(140);
      logInfo(`step3 tapCategory(140): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.input('RKo7VFExRN');
      logInfo(`step5 input("RKo7VFExRN"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`input>open>tapCategory>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('RKo7VFExRN');
      logInfo(`input>open>tapCategory>open>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(140);
      logInfo(`input>open>tapCategory>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>tapCategory>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0181
     * @tc.name      SearchComponent_SearchPageStateFlow_0181
     * @tc.desc      SearchPageState call flow tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0181 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(23.53);
      logInfo(`step1 tapCategory(23.53): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('I16hQ9Eh');
      logInfo(`step2 input("I16hQ9Eh"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('I16hQ9Eh');
      logInfo(`tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(23.53, PRECISION);
      logInfo(`tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0182
     * @tc.name      SearchComponent_SearchPageStateFlow_0182
     * @tc.desc      SearchPageState call flow tapCategory > input > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0182 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-39);
      logInfo(`step1 tapCategory(-39): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('eSo');
      logInfo(`step2 input("eSo"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('f5W3');
      logInfo(`step3 input("f5W3"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapCategory>input>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('f5W3');
      logInfo(`tapCategory>input>input>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-39);
      logInfo(`tapCategory>input>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>input>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0183
     * @tc.name      SearchComponent_SearchPageStateFlow_0183
     * @tc.desc      SearchPageState call flow tapCategory > pick > tapCategory > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0183 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(60);
      logInfo(`step1 tapCategory(60): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(193);
      logInfo(`step2 pick(193): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(28);
      logInfo(`step3 tapCategory(28): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('UXfHnYK0');
      logInfo(`step4 input("UXfHnYK0"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.input('c');
      logInfo(`step5 input("c"): step5=${step5}`);
      expect(step5).assertEqual(10);
      logInfo(`tapCategory>pick>tapCategory>input>input ...: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('c');
      logInfo(`tapCategory>pick>tapCategory>input>input ...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(28);
      logInfo(`tapCategory>pick>tapCategory>input>input ...: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(10);
      logInfo(`tapCategory>pick>tapCategory>input>input ...: JSON.st...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`tapCategory>pick>tapCategory>input>input ...: subject.results[5]=${subject.results[5]}`);
      expect(subject.results[5]).assertEqual('\u6839\u636eicon\u81ea\u9002\u5e94\u80cc\u666f\u989c\u8272');
      logInfo(`tapCategory>pick>tapCategory>input>input ...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0184
     * @tc.name      SearchComponent_SearchPageStateFlow_0184
     * @tc.desc      SearchPageState call flow pick > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0184 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(115);
      logInfo(`step1 pick(115): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('AA');
      logInfo(`step2 input("AA"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('x ');
      logInfo(`step3 input("x "): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x ');
      logInfo(`pick>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0185
     * @tc.name      SearchComponent_SearchPageStateFlow_0185
     * @tc.desc      SearchPageState call flow open > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0185 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('I16hQ9Eh');
      logInfo(`step2 input("I16hQ9Eh"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('FS');
      logInfo(`step3 input("FS"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`open>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('FS');
      logInfo(`open>input>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0186
     * @tc.name      SearchComponent_SearchPageStateFlow_0186
     * @tc.desc      SearchPageState call flow input > back > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0186 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xa');
      logInfo(`step1 input("xa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.back();
      const step3: string = subject.pick(87.76);
      logInfo(`step3 pick(87.76): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('BffN5n493da');
      logInfo(`step4 input("BffN5n493da"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`input>back>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('BffN5n493da');
      logInfo(`input>back>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0187
     * @tc.name      SearchComponent_SearchPageStateFlow_0187
     * @tc.desc      SearchPageState call flow open > back > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0187 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: string = subject.tapCategory(-39);
      logInfo(`step3 tapCategory(-39): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(-66);
      logInfo(`step4 pick(-66): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>back>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-39);
      logInfo(`${BUNDLE}SearchPageStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0188
     * @tc.name      SearchComponent_SearchPageStateFlow_0188
     * @tc.desc      SearchPageState call flow tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0188 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(25);
      logInfo(`step1 tapCategory(25): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(25);
      logInfo(`tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0189
     * @tc.name      SearchComponent_SearchPageStateFlow_0189
     * @tc.desc      SearchPageState call flow back > open > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0189 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      const step4: string = subject.pick(87.76);
      logInfo(`step4 pick(87.76): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0190
     * @tc.name      SearchComponent_SearchPageStateFlow_0190
     * @tc.desc      SearchPageState call flow open > open > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0190 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(-17);
      logInfo(`step4 pick(-17): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>open>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0191
     * @tc.name      SearchComponent_SearchPageStateFlow_0191
     * @tc.desc      SearchPageState call flow back > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0191 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(7);
      logInfo(`step2 pick(7): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(91.51);
      logInfo(`step3 tapCategory(91.51): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`back>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0192
     * @tc.name      SearchComponent_SearchPageStateFlow_0192
     * @tc.desc      SearchPageState call flow open > back > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0192 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: number = subject.input('RKo7VFExRN');
      logInfo(`step3 input("RKo7VFExRN"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(28);
      logInfo(`step4 tapCategory(28): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>back>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('RKo7VFExRN');
      logInfo(`open>back>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(28);
      logInfo(`open>back>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0193
     * @tc.name      SearchComponent_SearchPageStateFlow_0193
     * @tc.desc      SearchPageState call flow input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0193 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('x123');
      logInfo(`step1 input("x123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.back();
      logInfo(`input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0194
     * @tc.name      SearchComponent_SearchPageStateFlow_0194
     * @tc.desc      SearchPageState call flow pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0194 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(30);
      logInfo(`step1 pick(30): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('C9W04RuB6r4');
      logInfo(`step2 input("C9W04RuB6r4"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('C9W04RuB6r4');
      logInfo(`pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0195
     * @tc.name      SearchComponent_SearchPageStateFlow_0195
     * @tc.desc      SearchPageState call flow back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0195 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(195);
      logInfo(`step2 pick(195): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0196
     * @tc.name      SearchComponent_SearchPageStateFlow_0196
     * @tc.desc      SearchPageState call flow open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0196 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input(' Sample Title 123 ');
      logInfo(`step2 input(" Sample Title 123 "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Sample Title 123 ');
      logInfo(`open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0197
     * @tc.name      SearchComponent_SearchPageStateFlow_0197
     * @tc.desc      SearchPageState call flow open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0197 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(61.31);
      logInfo(`step2 pick(61.31): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0198
     * @tc.name      SearchComponent_SearchPageStateFlow_0198
     * @tc.desc      SearchPageState call flow pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0198 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(5);
      logInfo(`step1 pick(5): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(64.86);
      logInfo(`step2 tapCategory(64.86): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(64.86, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0199
     * @tc.name      SearchComponent_SearchPageStateFlow_0199
     * @tc.desc      SearchPageState call flow tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0199 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(11);
      logInfo(`step1 tapCategory(11): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(11);
      logInfo(`tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0200
     * @tc.name      SearchComponent_SearchPageStateFlow_0200
     * @tc.desc      SearchPageState call flow tapCategory > back > input > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0200 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(140);
      logInfo(`step1 tapCategory(140): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('GXHQkwOd');
      logInfo(`step3 input("GXHQkwOd"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      const step5: string = subject.pick(27);
      logInfo(`step5 pick(27): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`tapCategory>back>input>back>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0201
     * @tc.name      SearchComponent_SearchPageStateFlow_0201
     * @tc.desc      SearchPageState call flow open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0201 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(191);
      logInfo(`step2 tapCategory(191): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(191);
      logInfo(`open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0202
     * @tc.name      SearchComponent_SearchPageStateFlow_0202
     * @tc.desc      SearchPageState call flow input > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0202 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input(' \u4e2d\u6587 ');
      logInfo(`step1 input(" ?? "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('pl2oJUSP20G3');
      logInfo(`step3 input("pl2oJUSP20G3"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`input>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('pl2oJUSP20G3');
      logInfo(`input>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0203
     * @tc.name      SearchComponent_SearchPageStateFlow_0203
     * @tc.desc      SearchPageState call flow pick > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0203 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(55);
      logInfo(`step1 pick(55): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('xabc');
      logInfo(`step3 input("xabc"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xabc');
      logInfo(`pick>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0204
     * @tc.name      SearchComponent_SearchPageStateFlow_0204
     * @tc.desc      SearchPageState call flow pick > input > back > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0204 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(166);
      logInfo(`step1 pick(166): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('7Jr');
      logInfo(`step2 input("7Jr"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.tapCategory(-29);
      logInfo(`step5 tapCategory(-29): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>input>back>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-29);
      logInfo(`pick>input>back>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>input>back>open>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0205
     * @tc.name      SearchComponent_SearchPageStateFlow_0205
     * @tc.desc      SearchPageState call flow back > input > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0205 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('abc_1');
      logInfo(`step2 input("abc_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(173);
      logInfo(`step3 pick(173): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`back>input>pick>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0206
     * @tc.name      SearchComponent_SearchPageStateFlow_0206
     * @tc.desc      SearchPageState call flow input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0206 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('I16hQ9Eh');
      logInfo(`step1 input("I16hQ9Eh"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('I16hQ9Eh');
      logInfo(`input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0207
     * @tc.name      SearchComponent_SearchPageStateFlow_0207
     * @tc.desc      SearchPageState call flow tapCategory > input > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0207 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-81);
      logInfo(`step1 tapCategory(-81): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('BQ17xe31a0P');
      logInfo(`step2 input("BQ17xe31a0P"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('RKo7VFExRN');
      logInfo(`step3 input("RKo7VFExRN"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(1);
      logInfo(`step4 tapCategory(1): step4=${step4}`);
      expect(step4).assertEqual('\u52a8\u6548');
      logInfo(`tapCategory>input>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('RKo7VFExRN');
      logInfo(`tapCategory>input>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(1);
      logInfo(`tapCategory>input>input>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u52a8\u6548');
      logInfo(`tapCategory>input>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0208
     * @tc.name      SearchComponent_SearchPageStateFlow_0208
     * @tc.desc      SearchPageState call flow back > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0208 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('j9');
      logInfo(`step2 input("j9"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      logInfo(`back>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0209
     * @tc.name      SearchComponent_SearchPageStateFlow_0209
     * @tc.desc      SearchPageState call flow tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0209 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-29);
      logInfo(`step1 tapCategory(-29): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('abcabc');
      logInfo(`step2 input("abcabc"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abcabc');
      logInfo(`tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-29);
      logInfo(`tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0210
     * @tc.name      SearchComponent_SearchPageStateFlow_0210
     * @tc.desc      SearchPageState call flow tapCategory > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0210 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(3);
      logInfo(`step1 tapCategory(3): step1=${step1}`);
      expect(step1).assertEqual('Native');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`tapCategory>open>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(3);
      logInfo(`tapCategory>open>open final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('Native');
      logInfo(`tapCategory>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0211
     * @tc.name      SearchComponent_SearchPageStateFlow_0211
     * @tc.desc      SearchPageState call flow input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0211 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('1lOPW');
      logInfo(`step1 input("1lOPW"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('   ');
      logInfo(`step2 input("   "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('   ');
      logInfo(`input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0212
     * @tc.name      SearchComponent_SearchPageStateFlow_0212
     * @tc.desc      SearchPageState call flow back > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0212 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('a_1');
      logInfo(`step2 input("a_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(-18);
      logInfo(`step3 tapCategory(-18): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`back>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('a_1');
      logInfo(`back>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-18);
      logInfo(`back>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0213
     * @tc.name      SearchComponent_SearchPageStateFlow_0213
     * @tc.desc      SearchPageState call flow open > pick > input > tapCategory > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0213 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(23.65);
      logInfo(`step2 pick(23.65): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('xa');
      logInfo(`step3 input("xa"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(105);
      logInfo(`step4 tapCategory(105): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.back();
      logInfo(`open>pick>input>tapCategory>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0214
     * @tc.name      SearchComponent_SearchPageStateFlow_0214
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0214 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(10);
      logInfo(`step1 tapCategory(10): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(-41);
      logInfo(`step2 tapCategory(-41): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-41);
      logInfo(`${BUNDLE}SearchPageStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0215
     * @tc.name      SearchComponent_SearchPageStateFlow_0215
     * @tc.desc      SearchPageState call flow open > pick > back > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0215 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(193);
      logInfo(`step2 pick(193): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      subject.back();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`open>pick>back>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0216
     * @tc.name      SearchComponent_SearchPageStateFlow_0216
     * @tc.desc      SearchPageState call flow open > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0216 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('1lOPW');
      logInfo(`step2 input("1lOPW"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(150);
      logInfo(`step3 tapCategory(150): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`open>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1lOPW');
      logInfo(`open>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(150);
      logInfo(`open>input>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0217
     * @tc.name      SearchComponent_SearchPageStateFlow_0217
     * @tc.desc      SearchPageState call flow back > back > back > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0217 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      subject.back();
      const step4: string = subject.pick(-62);
      logInfo(`step4 pick(-62): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.tapCategory(42.82);
      logInfo(`step5 tapCategory(42.82): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>back>back>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(42.82, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0218
     * @tc.name      SearchComponent_SearchPageStateFlow_0218
     * @tc.desc      SearchPageState call flow input > back > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0218 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('\u4e2d\u6587_1');
      logInfo(`step1 input("??_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.back();
      const step3: string = subject.pick(-66);
      logInfo(`step3 pick(-66): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`input>back>pick>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0219
     * @tc.name      SearchComponent_SearchPageStateFlow_0219
     * @tc.desc      SearchPageState call flow tapCategory > back > pick > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0219 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(115);
      logInfo(`step1 tapCategory(115): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.pick(15.87);
      logInfo(`step3 pick(15.87): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.input('u2ix3WIRffdu');
      logInfo(`step5 input("u2ix3WIRffdu"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`tapCategory>back>pick>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('u2ix3WIRffdu');
      logInfo(`tapCategory>back>pick>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>back>pick>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0220
     * @tc.name      SearchComponent_SearchPageStateFlow_0220
     * @tc.desc      SearchPageState call flow pick > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0220 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(173);
      logInfo(`step1 pick(173): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(-28);
      logInfo(`step3 tapCategory(-28): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`pick>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-28);
      logInfo(`pick>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0221
     * @tc.name      SearchComponent_SearchPageStateFlow_0221
     * @tc.desc      SearchPageState call flow open > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0221 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('RKo7VFExRN');
      logInfo(`step2 input("RKo7VFExRN"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('xSample Title 123');
      logInfo(`step3 input("xSample Title 123"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`open>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xSample Title 123');
      logInfo(`open>input>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0222
     * @tc.name      SearchComponent_SearchPageStateFlow_0222
     * @tc.desc      SearchPageState call flow pick > tapCategory > input > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0222 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(-32);
      logInfo(`step1 pick(-32): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(5);
      logInfo(`step2 tapCategory(5): step2=${step2}`);
      expect(step2).assertEqual('\u5176\u4ed6');
      const step3: number = subject.input('5lcQo7Ww');
      logInfo(`step3 input("5lcQo7Ww"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.input('77c6BOqh1wQ2');
      logInfo(`step4 input("77c6BOqh1wQ2"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.input('FS');
      logInfo(`step5 input("FS"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>tapCategory>input>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('FS');
      logInfo(`pick>tapCategory>input>input>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(5);
      logInfo(`pick>tapCategory>input>input>input final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u5176\u4ed6');
      logInfo(`pick>tapCategory>input>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}SearchPageStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0223
     * @tc.name      SearchComponent_SearchPageStateFlow_0223
     * @tc.desc      SearchPageState call flow pick > back > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0223 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(125);
      logInfo(`step1 pick(125): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      subject.back();
      const step4: number = subject.input('BQ17xe31a0P');
      logInfo(`step4 input("BQ17xe31a0P"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>back>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('BQ17xe31a0P');
      logInfo(`pick>back>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0223 end`);
    });
  });
}
