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

/** Logic checks for SearchPageState flow (55 cases). */
export default function searchPageStateFlow3Test(): void {
  describe('SearchPageStateFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0112
     * @tc.name      SearchComponent_SearchPageStateFlow_0112
     * @tc.desc      SearchPageState call flow pick > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0112 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(166);
      logInfo(`step1 pick(166): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('Hello World_1');
      logInfo(`step3 input("Hello World_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello World_1');
      logInfo(`pick>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0113
     * @tc.name      SearchComponent_SearchPageStateFlow_0113
     * @tc.desc      SearchPageState call flow back > open > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0113 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('IgL0yFvo8fR');
      logInfo(`step3 input("IgL0yFvo8fR"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(80);
      logInfo(`step4 tapCategory(80): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>open>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('IgL0yFvo8fR');
      logInfo(`back>open>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(80);
      logInfo(`back>open>input>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>open>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0114
     * @tc.name      SearchComponent_SearchPageStateFlow_0114
     * @tc.desc      SearchPageState call flow open > tapCategory > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0114 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(-86);
      logInfo(`step2 tapCategory(-86): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input(' A ');
      logInfo(`step3 input(" A "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`open>tapCategory>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' A ');
      logInfo(`open>tapCategory>input>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-86);
      logInfo(`open>tapCategory>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>tapCategory>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0115
     * @tc.name      SearchComponent_SearchPageStateFlow_0115
     * @tc.desc      SearchPageState call flow tapCategory > back > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0115 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(193);
      logInfo(`step1 tapCategory(193): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('GXHQkwOd');
      logInfo(`step3 input("GXHQkwOd"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapCategory>back>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('GXHQkwOd');
      logInfo(`tapCategory>back>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>back>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0116
     * @tc.name      SearchComponent_SearchPageStateFlow_0116
     * @tc.desc      SearchPageState call flow pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0116 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(180);
      logInfo(`step1 pick(180): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(85.61);
      logInfo(`step2 tapCategory(85.61): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(85.61, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0117
     * @tc.name      SearchComponent_SearchPageStateFlow_0117
     * @tc.desc      SearchPageState call flow tapCategory > back > tapCategory > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0117 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(80);
      logInfo(`step1 tapCategory(80): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.tapCategory(80);
      logInfo(`step3 tapCategory(80): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(160);
      logInfo(`step4 pick(160): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`tapCategory>back>tapCategory>pick>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(80);
      logInfo(`tapCategory>back>tapCategory>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0118
     * @tc.name      SearchComponent_SearchPageStateFlow_0118
     * @tc.desc      SearchPageState call flow tapCategory > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0118 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(155);
      logInfo(`step1 tapCategory(155): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(-27);
      logInfo(`step3 tapCategory(-27): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-27);
      logInfo(`tapCategory>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0119
     * @tc.name      SearchComponent_SearchPageStateFlow_0119
     * @tc.desc      SearchPageState call flow open > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0119 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(48.9);
      logInfo(`step2 pick(48.9): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`open>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0120
     * @tc.name      SearchComponent_SearchPageStateFlow_0120
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > pick > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0120 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(142);
      logInfo(`step1 tapCategory(142): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(185);
      logInfo(`step2 tapCategory(185): step2=${step2}`);
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
      logInfo(`tapCategory>tapCategory>pick>open>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(185);
      logInfo(`tapCategory>tapCategory>pick>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0121
     * @tc.name      SearchComponent_SearchPageStateFlow_0121
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0121 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(75);
      logInfo(`step1 tapCategory(75): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(79.43);
      logInfo(`step2 tapCategory(79.43): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(79.43, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0122
     * @tc.name      SearchComponent_SearchPageStateFlow_0122
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0122 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(3);
      logInfo(`step1 tapCategory(3): step1=${step1}`);
      expect(step1).assertEqual('Native');
      const step2: string = subject.tapCategory(86.6);
      logInfo(`step2 tapCategory(86.6): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(86.6, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0123
     * @tc.name      SearchComponent_SearchPageStateFlow_0123
     * @tc.desc      SearchPageState call flow pick > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0123 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(195);
      logInfo(`step1 pick(195): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(95);
      logInfo(`step3 pick(95): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`pick>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0124
     * @tc.name      SearchComponent_SearchPageStateFlow_0124
     * @tc.desc      SearchPageState call flow back > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0124 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('j9');
      logInfo(`step3 input("j9"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`back>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('j9');
      logInfo(`back>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0125
     * @tc.name      SearchComponent_SearchPageStateFlow_0125
     * @tc.desc      SearchPageState call flow input > back > input > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0125 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('R');
      logInfo(`step1 input("R"): step1=${step1}`);
      expect(step1).assertEqual(20);
      subject.back();
      const step3: number = subject.input('E');
      logInfo(`step3 input("E"): step3=${step3}`);
      expect(step3).assertEqual(24);
      subject.back();
      const step5: string = subject.tapCategory(120);
      logInfo(`step5 tapCategory(120): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`input>back>input>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(120);
      logInfo(`${BUNDLE}SearchPageStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0126
     * @tc.name      SearchComponent_SearchPageStateFlow_0126
     * @tc.desc      SearchPageState call flow open > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0126 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(80);
      logInfo(`step3 pick(80): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`open>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0127
     * @tc.name      SearchComponent_SearchPageStateFlow_0127
     * @tc.desc      SearchPageState call flow tapCategory > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0127 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(193);
      logInfo(`step1 tapCategory(193): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(47);
      logInfo(`step3 tapCategory(47): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(47);
      logInfo(`tapCategory>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0128
     * @tc.name      SearchComponent_SearchPageStateFlow_0128
     * @tc.desc      SearchPageState call flow pick > back > back > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0128 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(123);
      logInfo(`step1 pick(123): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      subject.back();
      const step4: string = subject.pick(78);
      logInfo(`step4 pick(78): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.tapCategory(-34);
      logInfo(`step5 tapCategory(-34): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>back>back>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-34);
      logInfo(`${BUNDLE}SearchPageStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0129
     * @tc.name      SearchComponent_SearchPageStateFlow_0129
     * @tc.desc      SearchPageState call flow back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0129 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(52.62);
      logInfo(`step2 tapCategory(52.62): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(52.62, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0130
     * @tc.name      SearchComponent_SearchPageStateFlow_0130
     * @tc.desc      SearchPageState call flow input > back > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0130 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('grqbR');
      logInfo(`step1 input("grqbR"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.back();
      const step3: number = subject.input('   ');
      logInfo(`step3 input("   "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`input>back>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('   ');
      logInfo(`input>back>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>back>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0131
     * @tc.name      SearchComponent_SearchPageStateFlow_0131
     * @tc.desc      SearchPageState call flow tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0131 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-98);
      logInfo(`step1 tapCategory(-98): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('FS');
      logInfo(`step2 input("FS"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('FS');
      logInfo(`tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-98);
      logInfo(`tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0132
     * @tc.name      SearchComponent_SearchPageStateFlow_0132
     * @tc.desc      SearchPageState call flow input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0132 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('1up2OEC2Tjx');
      logInfo(`step1 input("1up2OEC2Tjx"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(170);
      logInfo(`step2 pick(170): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1up2OEC2Tjx');
      logInfo(`input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0133
     * @tc.name      SearchComponent_SearchPageStateFlow_0133
     * @tc.desc      SearchPageState call flow open > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0133 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(193);
      logInfo(`step2 tapCategory(193): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(-29);
      logInfo(`step3 tapCategory(-29): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`open>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-29);
      logInfo(`open>tapCategory>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0134
     * @tc.name      SearchComponent_SearchPageStateFlow_0134
     * @tc.desc      SearchPageState call flow open > open > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0134 begin`);
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
      const step4: number = subject.input('  ');
      logInfo(`step4 input("  "): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`open>open>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('  ');
      logInfo(`open>open>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>open>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0135
     * @tc.name      SearchComponent_SearchPageStateFlow_0135
     * @tc.desc      SearchPageState call flow pick > back > input > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0135 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(193);
      logInfo(`step1 pick(193): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('hello world');
      logInfo(`step3 input("hello world"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      const step5: number = subject.input('Td7712KkU4');
      logInfo(`step5 input("Td7712KkU4"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>back>input>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Td7712KkU4');
      logInfo(`pick>back>input>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0136
     * @tc.name      SearchComponent_SearchPageStateFlow_0136
     * @tc.desc      SearchPageState call flow input > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0136 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('a_1');
      logInfo(`step1 input("a_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('a_1');
      logInfo(`step2 input("a_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      logInfo(`input>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0137
     * @tc.name      SearchComponent_SearchPageStateFlow_0137
     * @tc.desc      SearchPageState call flow back > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0137 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0138
     * @tc.name      SearchComponent_SearchPageStateFlow_0138
     * @tc.desc      SearchPageState call flow back > pick > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0138 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(11.63);
      logInfo(`step2 pick(11.63): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(60);
      logInfo(`step3 pick(60): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0139
     * @tc.name      SearchComponent_SearchPageStateFlow_0139
     * @tc.desc      SearchPageState call flow tapCategory > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0139 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(70);
      logInfo(`step1 tapCategory(70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('xHello World');
      logInfo(`step2 input("xHello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('hello world_1');
      logInfo(`step3 input("hello world_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`tapCategory>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('hello world_1');
      logInfo(`tapCategory>input>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(70);
      logInfo(`tapCategory>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0140
     * @tc.name      SearchComponent_SearchPageStateFlow_0140
     * @tc.desc      SearchPageState call flow input > open > tapCategory > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0140 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('FS');
      logInfo(`step1 input("FS"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(-7);
      logInfo(`step3 tapCategory(-7): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(88);
      logInfo(`step4 pick(88): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(11);
      logInfo(`step5 pick(11): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`input>open>tapCategory>pick>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('FS');
      logInfo(`input>open>tapCategory>pick>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-7);
      logInfo(`input>open>tapCategory>pick>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>tapCategory>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0141
     * @tc.name      SearchComponent_SearchPageStateFlow_0141
     * @tc.desc      SearchPageState call flow input > tapCategory > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0141 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('xa');
      logInfo(`step1 input("xa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(-95);
      logInfo(`step2 tapCategory(-95): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`input>tapCategory>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>tapCategory>back>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0142
     * @tc.name      SearchComponent_SearchPageStateFlow_0142
     * @tc.desc      SearchPageState call flow back > back > pick > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0142 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.pick(7);
      logInfo(`step3 pick(7): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(0);
      logInfo(`step4 tapCategory(0): step4=${step4}`);
      expect(step4).assertEqual('UI\u5e03\u5c40');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`back>back>pick>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(0);
      logInfo(`back>back>pick>tapCategory>open final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('UI\u5e03\u5c40');
      logInfo(`back>back>pick>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0143
     * @tc.name      SearchComponent_SearchPageStateFlow_0143
     * @tc.desc      SearchPageState call flow input > open > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0143 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('l9tQItoQ');
      logInfo(`step1 input("l9tQItoQ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('eSo');
      logInfo(`step3 input("eSo"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      logInfo(`input>open>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0144
     * @tc.name      SearchComponent_SearchPageStateFlow_0144
     * @tc.desc      SearchPageState call flow open > pick > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0144 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(40);
      logInfo(`step2 pick(40): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('1up2OEC2Tjx');
      logInfo(`step3 input("1up2OEC2Tjx"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(-89);
      logInfo(`step4 tapCategory(-89): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>pick>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1up2OEC2Tjx');
      logInfo(`open>pick>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-89);
      logInfo(`open>pick>input>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>pick>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0145
     * @tc.name      SearchComponent_SearchPageStateFlow_0145
     * @tc.desc      SearchPageState call flow tapCategory > pick > tapCategory > tapCategory > back keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0145 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-58);
      logInfo(`step1 tapCategory(-58): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(175);
      logInfo(`step2 pick(175): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(28.01);
      logInfo(`step3 tapCategory(28.01): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(81);
      logInfo(`step4 tapCategory(81): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0146
     * @tc.name      SearchComponent_SearchPageStateFlow_0146
     * @tc.desc      SearchPageState call flow input > input > open > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0146 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('I16hQ9Eh');
      logInfo(`step1 input("I16hQ9Eh"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('pl2oJUSP20G3');
      logInfo(`step2 input("pl2oJUSP20G3"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(-51);
      logInfo(`step4 pick(-51): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(13);
      logInfo(`step5 pick(13): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`input>input>open>pick>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('pl2oJUSP20G3');
      logInfo(`input>input>open>pick>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>input>open>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0147
     * @tc.name      SearchComponent_SearchPageStateFlow_0147
     * @tc.desc      SearchPageState call flow pick > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0147 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(77);
      logInfo(`step1 pick(77): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('BffN5n493da');
      logInfo(`step2 input("BffN5n493da"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input(' \u4e2d\u6587 ');
      logInfo(`step3 input(" ?? "): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' \u4e2d\u6587 ');
      logInfo(`pick>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0148
     * @tc.name      SearchComponent_SearchPageStateFlow_0148
     * @tc.desc      SearchPageState call flow tapCategory > input > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0148 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(149);
      logInfo(`step1 tapCategory(149): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('IgL0yFvo8fR');
      logInfo(`step2 input("IgL0yFvo8fR"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(23.65);
      logInfo(`step3 pick(23.65): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapCategory>input>pick>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('IgL0yFvo8fR');
      logInfo(`tapCategory>input>pick>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(149);
      logInfo(`tapCategory>input>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>input>pick>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0149
     * @tc.name      SearchComponent_SearchPageStateFlow_0149
     * @tc.desc      SearchPageState call flow input > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0149 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('x123');
      logInfo(`step1 input("x123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(55);
      logInfo(`step2 pick(55): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(2);
      logInfo(`step3 tapCategory(2): step3=${step3}`);
      expect(step3).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`input>pick>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x123');
      logInfo(`input>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(2);
      logInfo(`input>pick>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`input>pick>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0150
     * @tc.name      SearchComponent_SearchPageStateFlow_0150
     * @tc.desc      SearchPageState call flow back > input > open > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0150 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('GK1bMc0P');
      logInfo(`step2 input("GK1bMc0P"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.tapCategory(33.43);
      logInfo(`step4 tapCategory(33.43): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`back>input>open>tapCategory>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('GK1bMc0P');
      logInfo(`back>input>open>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(33.43, PRECISION);
      logInfo(`back>input>open>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>input>open>tapCategory>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0151
     * @tc.name      SearchComponent_SearchPageStateFlow_0151
     * @tc.desc      SearchPageState call flow pick > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0151 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(61.88);
      logInfo(`step1 pick(61.88): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('UVG0zTsIznC');
      logInfo(`step2 input("UVG0zTsIznC"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pick>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('UVG0zTsIznC');
      logInfo(`pick>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0152
     * @tc.name      SearchComponent_SearchPageStateFlow_0152
     * @tc.desc      SearchPageState call flow input > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0152 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('Sample Title 123');
      logInfo(`step1 input("Sample Title 123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(125);
      logInfo(`step2 pick(125): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(79.23);
      logInfo(`step3 pick(79.23): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`input>pick>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123');
      logInfo(`input>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0153
     * @tc.name      SearchComponent_SearchPageStateFlow_0153
     * @tc.desc      SearchPageState call flow pick > pick > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0153 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(100);
      logInfo(`step1 pick(100): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(52);
      logInfo(`step2 pick(52): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(75);
      logInfo(`step3 pick(75): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(91.51);
      logInfo(`step4 tapCategory(91.51): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>pick>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0154
     * @tc.name      SearchComponent_SearchPageStateFlow_0154
     * @tc.desc      SearchPageState call flow tapCategory > back > pick > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0154 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(115);
      logInfo(`step1 tapCategory(115): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.pick(20);
      logInfo(`step3 pick(20): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('123123');
      logInfo(`step4 input("123123"): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.back();
      logInfo(`tapCategory>back>pick>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0155
     * @tc.name      SearchComponent_SearchPageStateFlow_0155
     * @tc.desc      SearchPageState call flow input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0155 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('4Ij0');
      logInfo(`step1 input("4Ij0"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(15.65);
      logInfo(`step2 pick(15.65): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('4Ij0');
      logInfo(`input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0156
     * @tc.name      SearchComponent_SearchPageStateFlow_0156
     * @tc.desc      SearchPageState call flow tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0156 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(142);
      logInfo(`step1 tapCategory(142): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(-1);
      logInfo(`step2 pick(-1): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(142);
      logInfo(`${BUNDLE}SearchPageStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0157
     * @tc.name      SearchComponent_SearchPageStateFlow_0157
     * @tc.desc      SearchPageState call flow pick > back > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0157 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(60);
      logInfo(`step1 pick(60): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.tapCategory(-89);
      logInfo(`step4 tapCategory(-89): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>back>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-89);
      logInfo(`pick>back>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0158
     * @tc.name      SearchComponent_SearchPageStateFlow_0158
     * @tc.desc      SearchPageState call flow back > back > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0158 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0159
     * @tc.name      SearchComponent_SearchPageStateFlow_0159
     * @tc.desc      SearchPageState call flow open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0159 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(25);
      logInfo(`step2 tapCategory(25): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(25);
      logInfo(`open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0160
     * @tc.name      SearchComponent_SearchPageStateFlow_0160
     * @tc.desc      SearchPageState call flow back > pick > open > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0160 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(138);
      logInfo(`step2 pick(138): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.tapCategory(33.43);
      logInfo(`step5 tapCategory(33.43): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>pick>open>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(33.43, PRECISION);
      logInfo(`back>pick>open>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0161
     * @tc.name      SearchComponent_SearchPageStateFlow_0161
     * @tc.desc      SearchPageState call flow tapCategory > input > pick > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0161 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(60);
      logInfo(`step1 tapCategory(60): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('trvc');
      logInfo(`step2 input("trvc"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(160);
      logInfo(`step3 pick(160): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(185);
      logInfo(`step4 pick(185): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.back();
      logInfo(`tapCategory>input>pick>pick>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0162
     * @tc.name      SearchComponent_SearchPageStateFlow_0162
     * @tc.desc      SearchPageState call flow tapCategory > pick > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0162 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(56.48);
      logInfo(`step1 tapCategory(56.48): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(160);
      logInfo(`step2 pick(160): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('RKo7VFExRN');
      logInfo(`step3 input("RKo7VFExRN"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(-17);
      logInfo(`step4 pick(-17): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>pick>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('RKo7VFExRN');
      logInfo(`tapCategory>pick>input>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(56.48, PRECISION);
      logInfo(`tapCategory>pick>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0163
     * @tc.name      SearchComponent_SearchPageStateFlow_0163
     * @tc.desc      SearchPageState call flow back > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0163 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(51.4);
      logInfo(`step3 tapCategory(51.4): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`back>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(51.4, PRECISION);
      logInfo(`back>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0164
     * @tc.name      SearchComponent_SearchPageStateFlow_0164
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0164 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-79);
      logInfo(`step1 tapCategory(-79): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(120);
      logInfo(`step2 tapCategory(120): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('Hello_1');
      logInfo(`step3 input("Hello_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`tapCategory>tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello_1');
      logInfo(`tapCategory>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(120);
      logInfo(`tapCategory>tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0165
     * @tc.name      SearchComponent_SearchPageStateFlow_0165
     * @tc.desc      SearchPageState call flow back > input > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0165 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('x123');
      logInfo(`step2 input("x123"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`back>input>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`back>input>back>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0166
     * @tc.name      SearchComponent_SearchPageStateFlow_0166
     * @tc.desc      SearchPageState call flow pick > back > pick > tapCategory > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0166 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(155);
      logInfo(`step1 pick(155): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.pick(70);
      logInfo(`step3 pick(70): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(170);
      logInfo(`step4 tapCategory(170): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0166 end`);
    });
  });
}
