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
export default function searchPageStateFlow2Test(): void {
  describe('SearchPageStateFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0057
     * @tc.name      SearchComponent_SearchPageStateFlow_0057
     * @tc.desc      SearchPageState call flow tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0057 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(64.86);
      logInfo(`step1 tapCategory(64.86): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('eSo');
      logInfo(`step2 input("eSo"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('eSo');
      logInfo(`tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(64.86, PRECISION);
      logInfo(`tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0058
     * @tc.name      SearchComponent_SearchPageStateFlow_0058
     * @tc.desc      SearchPageState call flow open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0058 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(60);
      logInfo(`step2 tapCategory(60): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(60);
      logInfo(`open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0059
     * @tc.name      SearchComponent_SearchPageStateFlow_0059
     * @tc.desc      SearchPageState call flow pick > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0059 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(-51);
      logInfo(`step1 pick(-51): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(6.65);
      logInfo(`step2 pick(6.65): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pick>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0060
     * @tc.name      SearchComponent_SearchPageStateFlow_0060
     * @tc.desc      SearchPageState call flow tapCategory > pick > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0060 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(35);
      logInfo(`step1 tapCategory(35): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(20);
      logInfo(`step2 pick(20): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(-15);
      logInfo(`step3 pick(-15): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(5);
      logInfo(`step4 pick(5): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>pick>pick>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(35);
      logInfo(`${BUNDLE}SearchPageStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0061
     * @tc.name      SearchComponent_SearchPageStateFlow_0061
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0061 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-18);
      logInfo(`step1 tapCategory(-18): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(120);
      logInfo(`step2 tapCategory(120): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(125);
      logInfo(`step3 pick(125): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(120);
      logInfo(`${BUNDLE}SearchPageStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0062
     * @tc.name      SearchComponent_SearchPageStateFlow_0062
     * @tc.desc      SearchPageState call flow back > input > tapCategory > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0062 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input(' ');
      logInfo(`step2 input(" "): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.tapCategory(-12);
      logInfo(`step3 tapCategory(-12): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`back>input>tapCategory>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0063
     * @tc.name      SearchComponent_SearchPageStateFlow_0063
     * @tc.desc      SearchPageState call flow open > back > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0063 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: number = subject.input('Hello World');
      logInfo(`step3 input("Hello World"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.input('123123');
      logInfo(`step4 input("123123"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`open>back>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123123');
      logInfo(`open>back>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0064
     * @tc.name      SearchComponent_SearchPageStateFlow_0064
     * @tc.desc      SearchPageState call flow back > open > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0064 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(91.51);
      logInfo(`step3 tapCategory(91.51): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(-23);
      logInfo(`step4 pick(-23): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>open>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`back>open>tapCategory>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0065
     * @tc.name      SearchComponent_SearchPageStateFlow_0065
     * @tc.desc      SearchPageState call flow input > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0065 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('Hello World_1');
      logInfo(`step1 input("Hello World_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(75);
      logInfo(`step3 pick(75): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`input>open>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello World_1');
      logInfo(`input>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0066
     * @tc.name      SearchComponent_SearchPageStateFlow_0066
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > tapCategory > tapCategory keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0066 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(15);
      logInfo(`step1 tapCategory(15): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(190);
      logInfo(`step2 tapCategory(190): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(40);
      logInfo(`step3 tapCategory(40): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(-96);
      logInfo(`step4 tapCategory(-96): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>tapCategory>tapCategory>tapCa...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-96);
      logInfo(`${BUNDLE}SearchPageStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0067
     * @tc.name      SearchComponent_SearchPageStateFlow_0067
     * @tc.desc      SearchPageState call flow tapCategory > pick > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0067 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-7);
      logInfo(`step1 tapCategory(-7): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(130);
      logInfo(`step2 pick(130): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapCategory>pick>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0068
     * @tc.name      SearchComponent_SearchPageStateFlow_0068
     * @tc.desc      SearchPageState call flow input > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0068 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('C9W04RuB6r4');
      logInfo(`step1 input("C9W04RuB6r4"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(168);
      logInfo(`step2 pick(168): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`input>pick>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('C9W04RuB6r4');
      logInfo(`input>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>pick>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0069
     * @tc.name      SearchComponent_SearchPageStateFlow_0069
     * @tc.desc      SearchPageState call flow open > tapCategory > open > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0069 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(80);
      logInfo(`step2 tapCategory(80): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.input('Td7712KkU4');
      logInfo(`step4 input("Td7712KkU4"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`open>tapCategory>open>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Td7712KkU4');
      logInfo(`open>tapCategory>open>input>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(80);
      logInfo(`open>tapCategory>open>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>tapCategory>open>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0070
     * @tc.name      SearchComponent_SearchPageStateFlow_0070
     * @tc.desc      SearchPageState call flow back > tapCategory > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0070 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(23.53);
      logInfo(`step2 tapCategory(23.53): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(51);
      logInfo(`step3 tapCategory(51): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(80);
      logInfo(`step4 pick(80): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>tapCategory>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(51);
      logInfo(`${BUNDLE}SearchPageStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0071
     * @tc.name      SearchComponent_SearchPageStateFlow_0071
     * @tc.desc      SearchPageState call flow input > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0071 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input(' _1');
      logInfo(`step1 input(" _1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('FS');
      logInfo(`step2 input("FS"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`input>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('FS');
      logInfo(`input>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0072
     * @tc.name      SearchComponent_SearchPageStateFlow_0072
     * @tc.desc      SearchPageState call flow pick > back > open > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0072 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(63.9);
      logInfo(`step1 pick(63.9): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.input('FS');
      logInfo(`step4 input("FS"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pick>back>open>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('FS');
      logInfo(`pick>back>open>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>back>open>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0073
     * @tc.name      SearchComponent_SearchPageStateFlow_0073
     * @tc.desc      SearchPageState call flow back > pick > pick > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0073 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(39.18);
      logInfo(`step2 pick(39.18): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(44);
      logInfo(`step3 pick(44): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      const step5: string = subject.pick(193);
      logInfo(`step5 pick(193): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0074
     * @tc.name      SearchComponent_SearchPageStateFlow_0074
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0074 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-95);
      logInfo(`step1 tapCategory(-95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(35);
      logInfo(`step2 tapCategory(35): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(35);
      logInfo(`${BUNDLE}SearchPageStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0075
     * @tc.name      SearchComponent_SearchPageStateFlow_0075
     * @tc.desc      SearchPageState call flow pick > open > back > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0075 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(115);
      logInfo(`step1 pick(115): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      const step4: string = subject.pick(6.65);
      logInfo(`step4 pick(6.65): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(88.94);
      logInfo(`step5 pick(88.94): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0076
     * @tc.name      SearchComponent_SearchPageStateFlow_0076
     * @tc.desc      SearchPageState call flow pick > pick > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0076 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(110);
      logInfo(`step1 pick(110): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(106);
      logInfo(`step2 pick(106): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('7Jr');
      logInfo(`step3 input("7Jr"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(-86);
      logInfo(`step4 tapCategory(-86): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>pick>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('7Jr');
      logInfo(`pick>pick>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-86);
      logInfo(`pick>pick>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0077
     * @tc.name      SearchComponent_SearchPageStateFlow_0077
     * @tc.desc      SearchPageState call flow input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0077 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('pl2oJUSP20G3');
      logInfo(`step1 input("pl2oJUSP20G3"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(84);
      logInfo(`step2 tapCategory(84): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('pl2oJUSP20G3');
      logInfo(`input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(84);
      logInfo(`input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0078
     * @tc.name      SearchComponent_SearchPageStateFlow_0078
     * @tc.desc      SearchPageState call flow back > back > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0078 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.tapCategory(-15);
      logInfo(`step3 tapCategory(-15): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(11);
      logInfo(`step4 pick(11): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>back>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-15);
      logInfo(`${BUNDLE}SearchPageStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0079
     * @tc.name      SearchComponent_SearchPageStateFlow_0079
     * @tc.desc      SearchPageState call flow open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0079 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0080
     * @tc.name      SearchComponent_SearchPageStateFlow_0080
     * @tc.desc      SearchPageState call flow input > tapCategory > open > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0080 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step1 input("????"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(69.82);
      logInfo(`step2 tapCategory(69.82): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(-16);
      logInfo(`step4 pick(-16): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.tapCategory(14);
      logInfo(`step5 tapCategory(14): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`input>tapCategory>open>pick>tapCategory f...: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`input>tapCategory>open>pick>tapCategory f...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(14);
      logInfo(`input>tapCategory>open>pick>tapCategory f...: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>tapCategory>open>pick>tapCategory f...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0081
     * @tc.name      SearchComponent_SearchPageStateFlow_0081
     * @tc.desc      SearchPageState call flow pick > back > input > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0081 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(87);
      logInfo(`step1 pick(87): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('I16hQ9Eh');
      logInfo(`step3 input("I16hQ9Eh"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.tapCategory(81);
      logInfo(`step4 tapCategory(81): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('  ');
      logInfo(`step5 input("  "): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>back>input>tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('  ');
      logInfo(`pick>back>input>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(81);
      logInfo(`pick>back>input>tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0082
     * @tc.name      SearchComponent_SearchPageStateFlow_0082
     * @tc.desc      SearchPageState call flow back > open > tapCategory > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0082 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(85.61);
      logInfo(`step3 tapCategory(85.61): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(-13);
      logInfo(`step4 pick(-13): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.tapCategory(77.42);
      logInfo(`step5 tapCategory(77.42): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>open>tapCategory>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(77.42, PRECISION);
      logInfo(`back>open>tapCategory>pick>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0083
     * @tc.name      SearchComponent_SearchPageStateFlow_0083
     * @tc.desc      SearchPageState call flow pick > back > input > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0083 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(173);
      logInfo(`step1 pick(173): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('j');
      logInfo(`step3 input("j"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.input('Sample Title 123Sample Title 123');
      logInfo(`step4 input("Sample Title 123Sample Title...: step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pick>back>input>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`pick>back>input>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>back>input>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0084
     * @tc.name      SearchComponent_SearchPageStateFlow_0084
     * @tc.desc      SearchPageState call flow tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0084 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(160);
      logInfo(`step1 tapCategory(160): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(160);
      logInfo(`tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0085
     * @tc.name      SearchComponent_SearchPageStateFlow_0085
     * @tc.desc      SearchPageState call flow tapCategory > pick > input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0085 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(155);
      logInfo(`step1 tapCategory(155): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(95);
      logInfo(`step2 pick(95): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('j9');
      logInfo(`step3 input("j9"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(55);
      logInfo(`step4 pick(55): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>pick>input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('j9');
      logInfo(`tapCategory>pick>input>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(155);
      logInfo(`tapCategory>pick>input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0086
     * @tc.name      SearchComponent_SearchPageStateFlow_0086
     * @tc.desc      SearchPageState call flow input > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0086 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('qHEE5');
      logInfo(`step1 input("qHEE5"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('xHello');
      logInfo(`step2 input("xHello"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input(' 123 ');
      logInfo(`step3 input(" 123 "): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`input>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' 123 ');
      logInfo(`input>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}SearchPageStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0087
     * @tc.name      SearchComponent_SearchPageStateFlow_0087
     * @tc.desc      SearchPageState call flow input > pick > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0087 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('Dhe3VyS');
      logInfo(`step1 input("Dhe3VyS"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(-1);
      logInfo(`step2 pick(-1): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick(39);
      logInfo(`step3 pick(39): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`input>pick>pick>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Dhe3VyS');
      logInfo(`input>pick>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>pick>pick>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0088
     * @tc.name      SearchComponent_SearchPageStateFlow_0088
     * @tc.desc      SearchPageState call flow back > input > pick > back > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0088 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('Hello_1');
      logInfo(`step2 input("Hello_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick(3);
      logInfo(`step3 pick(3): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      const step5: string = subject.pick(-1);
      logInfo(`step5 pick(-1): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>input>pick>back>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0089
     * @tc.name      SearchComponent_SearchPageStateFlow_0089
     * @tc.desc      SearchPageState call flow back > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0089 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.tapCategory(30);
      logInfo(`step3 tapCategory(30): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`back>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(30);
      logInfo(`${BUNDLE}SearchPageStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0090
     * @tc.name      SearchComponent_SearchPageStateFlow_0090
     * @tc.desc      SearchPageState call flow input > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0090 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('im');
      logInfo(`step1 input("im"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(30);
      logInfo(`step3 pick(30): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`input>open>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('im');
      logInfo(`input>open>pick final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`input>open>pick final: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(22);
      logInfo(`input>open>pick final: subject.results[0].substring(0, 16)=${subject.results[0].substring(0, 16)}`);
      expect(subject.results[0].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`input>open>pick final: subject.results[0].substring(16)=${subject.results[0].substring(16)}`);
      expect(subject.results[0].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`input>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0091
     * @tc.name      SearchComponent_SearchPageStateFlow_0091
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0091 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(85);
      logInfo(`step1 tapCategory(85): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(130);
      logInfo(`step2 tapCategory(130): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(130);
      logInfo(`${BUNDLE}SearchPageStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0092
     * @tc.name      SearchComponent_SearchPageStateFlow_0092
     * @tc.desc      SearchPageState call flow tapCategory > input > open > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0092 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(11);
      logInfo(`step1 tapCategory(11): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('5lcQo7Ww');
      logInfo(`step2 input("5lcQo7Ww"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(39.18);
      logInfo(`step4 pick(39.18): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('xA');
      logInfo(`step5 input("xA"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`tapCategory>input>open>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xA');
      logInfo(`tapCategory>input>open>pick>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(11);
      logInfo(`tapCategory>input>open>pick>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>input>open>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0093
     * @tc.name      SearchComponent_SearchPageStateFlow_0093
     * @tc.desc      SearchPageState call flow input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0093 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('abcabc');
      logInfo(`step1 input("abcabc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input(' hello world ');
      logInfo(`step2 input(" hello world "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' hello world ');
      logInfo(`input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0094
     * @tc.name      SearchComponent_SearchPageStateFlow_0094
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0094 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(125);
      logInfo(`step1 tapCategory(125): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(15);
      logInfo(`step2 tapCategory(15): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(-15);
      logInfo(`step3 tapCategory(-15): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-15);
      logInfo(`${BUNDLE}SearchPageStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0095
     * @tc.name      SearchComponent_SearchPageStateFlow_0095
     * @tc.desc      SearchPageState call flow open > back > back > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0095 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      subject.back();
      subject.back();
      const step5: number = subject.input('UVG0zTsIznC');
      logInfo(`step5 input("UVG0zTsIznC"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`open>back>back>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('UVG0zTsIznC');
      logInfo(`open>back>back>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0096
     * @tc.name      SearchComponent_SearchPageStateFlow_0096
     * @tc.desc      SearchPageState call flow open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0096 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(86.6);
      logInfo(`step2 tapCategory(86.6): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(86.6, PRECISION);
      logInfo(`open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0097
     * @tc.name      SearchComponent_SearchPageStateFlow_0097
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0097 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(52.62);
      logInfo(`step1 tapCategory(52.62): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(10.09);
      logInfo(`step2 tapCategory(10.09): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(28.01);
      logInfo(`step3 tapCategory(28.01): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(28.01, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0098
     * @tc.name      SearchComponent_SearchPageStateFlow_0098
     * @tc.desc      SearchPageState call flow tapCategory > pick > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0098 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-7);
      logInfo(`step1 tapCategory(-7): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(143);
      logInfo(`step2 pick(143): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.tapCategory(118);
      logInfo(`step4 tapCategory(118): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`tapCategory>pick>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(118);
      logInfo(`tapCategory>pick>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0099
     * @tc.name      SearchComponent_SearchPageStateFlow_0099
     * @tc.desc      SearchPageState call flow tapCategory > pick > input > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0099 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(26);
      logInfo(`step1 tapCategory(26): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(145);
      logInfo(`step2 pick(145): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('pl2oJUSP20G3');
      logInfo(`step3 input("pl2oJUSP20G3"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.back();
      logInfo(`tapCategory>pick>input>open>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0100
     * @tc.name      SearchComponent_SearchPageStateFlow_0100
     * @tc.desc      SearchPageState call flow pick > tapCategory > tapCategory > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0100 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(126);
      logInfo(`step1 pick(126): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(-86);
      logInfo(`step2 tapCategory(-86): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(161);
      logInfo(`step3 tapCategory(161): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('abcabc');
      logInfo(`step4 input("abcabc"): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.back();
      logInfo(`pick>tapCategory>tapCategory>input>back f...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0101
     * @tc.name      SearchComponent_SearchPageStateFlow_0101
     * @tc.desc      SearchPageState call flow open > back > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0101 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: string = subject.pick(88);
      logInfo(`step3 pick(88): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(91.51);
      logInfo(`step4 tapCategory(91.51): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>back>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0102
     * @tc.name      SearchComponent_SearchPageStateFlow_0102
     * @tc.desc      SearchPageState call flow input > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0102 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('77c6BOqh1wQ2');
      logInfo(`step1 input("77c6BOqh1wQ2"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(30);
      logInfo(`step2 pick(30): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`input>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('77c6BOqh1wQ2');
      logInfo(`input>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0103
     * @tc.name      SearchComponent_SearchPageStateFlow_0103
     * @tc.desc      SearchPageState call flow tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0103 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(42.82);
      logInfo(`step1 tapCategory(42.82): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(42.82, PRECISION);
      logInfo(`tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0104
     * @tc.name      SearchComponent_SearchPageStateFlow_0104
     * @tc.desc      SearchPageState call flow tapCategory > back > input > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0104 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-98);
      logInfo(`step1 tapCategory(-98): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('x\u4e2d\u6587');
      logInfo(`step3 input("x??"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.input(' A ');
      logInfo(`step4 input(" A "): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.tapCategory(-19);
      logInfo(`step5 tapCategory(-19): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`tapCategory>back>input>input>tapCategory ...: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' A ');
      logInfo(`tapCategory>back>input>input>tapCategory ...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-19);
      logInfo(`tapCategory>back>input>input>tapCategory ...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0105
     * @tc.name      SearchComponent_SearchPageStateFlow_0105
     * @tc.desc      SearchPageState call flow tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0105 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(200);
      logInfo(`step1 tapCategory(200): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(200);
      logInfo(`tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0106
     * @tc.name      SearchComponent_SearchPageStateFlow_0106
     * @tc.desc      SearchPageState call flow tapCategory > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0106 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(68);
      logInfo(`step1 tapCategory(68): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(23.22);
      logInfo(`step2 pick(23.22): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(-17);
      logInfo(`step3 tapCategory(-17): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-17);
      logInfo(`${BUNDLE}SearchPageStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0107
     * @tc.name      SearchComponent_SearchPageStateFlow_0107
     * @tc.desc      SearchPageState call flow back > input > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0107 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: number = subject.input('C9W04RuB6r4');
      logInfo(`step2 input("C9W04RuB6r4"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(-81);
      logInfo(`step3 tapCategory(-81): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(-41);
      logInfo(`step4 tapCategory(-41): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>input>tapCategory>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('C9W04RuB6r4');
      logInfo(`back>input>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-41);
      logInfo(`back>input>tapCategory>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0108
     * @tc.name      SearchComponent_SearchPageStateFlow_0108
     * @tc.desc      SearchPageState call flow open > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0108 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: string = subject.tapCategory(180);
      logInfo(`step3 tapCategory(180): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`open>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(180);
      logInfo(`${BUNDLE}SearchPageStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0109
     * @tc.name      SearchComponent_SearchPageStateFlow_0109
     * @tc.desc      SearchPageState call flow input > input > open > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0109 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('DDC');
      logInfo(`step1 input("DDC"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.input('eSo');
      logInfo(`step2 input("eSo"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.back();
      const step5: string = subject.tapCategory(45);
      logInfo(`step5 tapCategory(45): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`input>input>open>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(45);
      logInfo(`input>input>open>back>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0110
     * @tc.name      SearchComponent_SearchPageStateFlow_0110
     * @tc.desc      SearchPageState call flow back > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0110 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`back>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0111
     * @tc.name      SearchComponent_SearchPageStateFlow_0111
     * @tc.desc      SearchPageState call flow input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0111 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('GXHQkwOd');
      logInfo(`step1 input("GXHQkwOd"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('GXHQkwOd');
      logInfo(`input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0111 end`);
    });
  });
}
