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

/** Logic checks for SearchPageState flow (56 cases). */
export default function searchPageStateFlowTest(): void {
  describe('SearchPageStateFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0001
     * @tc.name      SearchComponent_SearchPageStateFlow_0001
     * @tc.desc      SearchPageState call flow tapCategory > input > input > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0001 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(155);
      logInfo(`step1 tapCategory(155): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input(' _1');
      logInfo(`step2 input(" _1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('sU8ACk75L45');
      logInfo(`step3 input("sU8ACk75L45"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.input('jmWrg');
      logInfo(`step5 input("jmWrg"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`tapCategory>input>input>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('jmWrg');
      logInfo(`tapCategory>input>input>open>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(155);
      logInfo(`tapCategory>input>input>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>input>input>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}SearchPageStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0002
     * @tc.name      SearchComponent_SearchPageStateFlow_0002
     * @tc.desc      SearchPageState call flow open > back > back > tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0002 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      subject.back();
      const step4: string = subject.tapCategory(-98);
      logInfo(`step4 tapCategory(-98): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(75);
      logInfo(`step5 pick(75): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`open>back>back>tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-98);
      logInfo(`${BUNDLE}SearchPageStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0003
     * @tc.name      SearchComponent_SearchPageStateFlow_0003
     * @tc.desc      SearchPageState call flow pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0003 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(180);
      logInfo(`step1 pick(180): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(-62);
      logInfo(`step2 pick(-62): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0004
     * @tc.name      SearchComponent_SearchPageStateFlow_0004
     * @tc.desc      SearchPageState call flow open > open > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0004 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.tapCategory(90);
      logInfo(`step3 tapCategory(90): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.input('5lcQo7Ww');
      logInfo(`step4 input("5lcQo7Ww"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`open>open>tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('5lcQo7Ww');
      logInfo(`open>open>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(90);
      logInfo(`open>open>tapCategory>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>open>tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0005
     * @tc.name      SearchComponent_SearchPageStateFlow_0005
     * @tc.desc      SearchPageState call flow input > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0005 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('Dhe3VyS');
      logInfo(`step1 input("Dhe3VyS"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(95);
      logInfo(`step2 pick(95): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('UXfHnYK0');
      logInfo(`step3 input("UXfHnYK0"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`input>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('UXfHnYK0');
      logInfo(`input>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0006
     * @tc.name      SearchComponent_SearchPageStateFlow_0006
     * @tc.desc      SearchPageState call flow back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0006 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0007
     * @tc.name      SearchComponent_SearchPageStateFlow_0007
     * @tc.desc      SearchPageState call flow open > input > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0007 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('a_1');
      logInfo(`step2 input("a_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`open>input>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('a_1');
      logInfo(`open>input>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>input>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0008
     * @tc.name      SearchComponent_SearchPageStateFlow_0008
     * @tc.desc      SearchPageState call flow tapCategory > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0008 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(50.46);
      logInfo(`step1 tapCategory(50.46): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('a_1');
      logInfo(`step2 input("a_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step3 input("????"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`tapCategory>input>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`tapCategory>input>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(50.46, PRECISION);
      logInfo(`tapCategory>input>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0009
     * @tc.name      SearchComponent_SearchPageStateFlow_0009
     * @tc.desc      SearchPageState call flow pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0009 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(13);
      logInfo(`step1 pick(13): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(81);
      logInfo(`step2 tapCategory(81): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(81);
      logInfo(`${BUNDLE}SearchPageStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0010
     * @tc.name      SearchComponent_SearchPageStateFlow_0010
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0010 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(193);
      logInfo(`step1 tapCategory(193): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(-7);
      logInfo(`step2 tapCategory(-7): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-7);
      logInfo(`${BUNDLE}SearchPageStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0011
     * @tc.name      SearchComponent_SearchPageStateFlow_0011
     * @tc.desc      SearchPageState call flow pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0011 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(123);
      logInfo(`step1 pick(123): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('im');
      logInfo(`step2 input("im"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('im');
      logInfo(`pick>input final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`pick>input final: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(22);
      logInfo(`pick>input final: subject.results[0].substring(0, 16)=${subject.results[0].substring(0, 16)}`);
      expect(subject.results[0].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`pick>input final: subject.results[0].substring(16)=${subject.results[0].substring(16)}`);
      expect(subject.results[0].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0012
     * @tc.name      SearchComponent_SearchPageStateFlow_0012
     * @tc.desc      SearchPageState call flow tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0012 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(100);
      logInfo(`step1 tapCategory(100): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('RKo7VFExRN');
      logInfo(`step2 input("RKo7VFExRN"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('RKo7VFExRN');
      logInfo(`tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(100);
      logInfo(`tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0013
     * @tc.name      SearchComponent_SearchPageStateFlow_0013
     * @tc.desc      SearchPageState call flow open > pick > input > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0013 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(185);
      logInfo(`step2 pick(185): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('qHEE5');
      logInfo(`step3 input("qHEE5"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      const step5: string = subject.tapCategory(43);
      logInfo(`step5 tapCategory(43): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`open>pick>input>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(43);
      logInfo(`open>pick>input>back>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0014
     * @tc.name      SearchComponent_SearchPageStateFlow_0014
     * @tc.desc      SearchPageState call flow open > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0014 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('123_1');
      logInfo(`step2 input("123_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      logInfo(`open>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0015
     * @tc.name      SearchComponent_SearchPageStateFlow_0015
     * @tc.desc      SearchPageState call flow pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0015 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(155);
      logInfo(`step1 pick(155): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('7Jr');
      logInfo(`step2 input("7Jr"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('7Jr');
      logInfo(`pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0016
     * @tc.name      SearchComponent_SearchPageStateFlow_0016
     * @tc.desc      SearchPageState call flow pick > tapCategory > tapCategory > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0016 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(107);
      logInfo(`step1 pick(107): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(85);
      logInfo(`step2 tapCategory(85): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(30);
      logInfo(`step3 tapCategory(30): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0017
     * @tc.name      SearchComponent_SearchPageStateFlow_0017
     * @tc.desc      SearchPageState call flow open > tapCategory > open > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0017 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(177);
      logInfo(`step2 tapCategory(177): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(150);
      logInfo(`step4 pick(150): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('xSample Title 123');
      logInfo(`step5 input("xSample Title 123"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`open>tapCategory>open>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xSample Title 123');
      logInfo(`open>tapCategory>open>pick>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(177);
      logInfo(`open>tapCategory>open>pick>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`open>tapCategory>open>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0018
     * @tc.name      SearchComponent_SearchPageStateFlow_0018
     * @tc.desc      SearchPageState call flow open > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0018 begin`);
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
      logInfo(`open>open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0019
     * @tc.name      SearchComponent_SearchPageStateFlow_0019
     * @tc.desc      SearchPageState call flow open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0019 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.input('123');
      logInfo(`step2 input("123"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123');
      logInfo(`open>input final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`open>input final: JSON.stringify(subject.results)=${JSON.stringify(subject.results)}`);
      expect(JSON.stringify(subject.results)).assertEqual('["NavDestination\u5f39\u7a97"]');
      logInfo(`open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0020
     * @tc.name      SearchComponent_SearchPageStateFlow_0020
     * @tc.desc      SearchPageState call flow back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0020 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(5);
      logInfo(`step2 tapCategory(5): step2=${step2}`);
      expect(step2).assertEqual('\u5176\u4ed6');
      logInfo(`back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(5);
      logInfo(`back>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}SearchPageStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0021
     * @tc.name      SearchComponent_SearchPageStateFlow_0021
     * @tc.desc      SearchPageState call flow tapCategory > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0021 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(155);
      logInfo(`step1 tapCategory(155): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(-9);
      logInfo(`step2 pick(-9): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`tapCategory>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(155);
      logInfo(`${BUNDLE}SearchPageStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0022
     * @tc.name      SearchComponent_SearchPageStateFlow_0022
     * @tc.desc      SearchPageState call flow input > tapCategory > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0022 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('RKo7VFExRN');
      logInfo(`step1 input("RKo7VFExRN"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(91.51);
      logInfo(`step2 tapCategory(91.51): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('l9tQItoQ');
      logInfo(`step3 input("l9tQItoQ"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`input>tapCategory>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('l9tQItoQ');
      logInfo(`input>tapCategory>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(91.51, PRECISION);
      logInfo(`input>tapCategory>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0023
     * @tc.name      SearchComponent_SearchPageStateFlow_0023
     * @tc.desc      SearchPageState call flow pick > input > input > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0023 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(62.05);
      logInfo(`step1 pick(62.05): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('1lOPW');
      logInfo(`step2 input("1lOPW"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.input('xSample Title 123');
      logInfo(`step3 input("xSample Title 123"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.tapCategory(56.48);
      logInfo(`step5 tapCategory(56.48): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>input>input>open>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xSample Title 123');
      logInfo(`pick>input>input>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(56.48, PRECISION);
      logInfo(`pick>input>input>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>input>input>open>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0024
     * @tc.name      SearchComponent_SearchPageStateFlow_0024
     * @tc.desc      SearchPageState call flow input > back > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0024 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('l9tQItoQ');
      logInfo(`step1 input("l9tQItoQ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.back();
      const step3: string = subject.pick(48.9);
      logInfo(`step3 pick(48.9): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`input>back>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>back>pick>open final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0025
     * @tc.name      SearchComponent_SearchPageStateFlow_0025
     * @tc.desc      SearchPageState call flow tapCategory > input > open > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0025 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(80);
      logInfo(`step1 tapCategory(80): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('abc');
      logInfo(`step2 input("abc"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`tapCategory>input>open>open>open final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abc');
      logInfo(`tapCategory>input>open>open>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(80);
      logInfo(`tapCategory>input>open>open>open final: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`tapCategory>input>open>open>open final: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(33);
      logInfo(`tapCategory>input>open>open>open final: subject.results[0].su...${subject.results[0].substring(0, 21)}`);
      expect(subject.results[0].substring(0, 21)).assertEqual('tabContent\u5185\u5bb9\u53ef\u4ee5\u5728tabBar');
      logInfo(`tapCategory>input>open>open>open final: subject.results[0].subst...${subject.results[0].substring(27)}`);
      expect(subject.results[0].substring(27)).assertEqual('\u6ed1\u52a8\u4e8b\u4ef6\u6848\u4f8b');
      logInfo(`${BUNDLE}SearchPageStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0026
     * @tc.name      SearchComponent_SearchPageStateFlow_0026
     * @tc.desc      SearchPageState call flow open > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0026 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(90);
      logInfo(`step2 pick(90): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0027
     * @tc.name      SearchComponent_SearchPageStateFlow_0027
     * @tc.desc      SearchPageState call flow open > back > input > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0027 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: number = subject.input('eSo');
      logInfo(`step3 input("eSo"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      const step5: number = subject.input('xHello');
      logInfo(`step5 input("xHello"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`open>back>input>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xHello');
      logInfo(`open>back>input>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0028
     * @tc.name      SearchComponent_SearchPageStateFlow_0028
     * @tc.desc      SearchPageState call flow tapCategory > pick > back > pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0028 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(160);
      logInfo(`step1 tapCategory(160): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(166);
      logInfo(`step2 pick(166): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      const step4: string = subject.pick(135);
      logInfo(`step4 pick(135): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`tapCategory>pick>back>pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0029
     * @tc.name      SearchComponent_SearchPageStateFlow_0029
     * @tc.desc      SearchPageState call flow open > tapCategory > open > open > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0029 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.tapCategory(95);
      logInfo(`step2 tapCategory(95): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.tapCategory(68);
      logInfo(`step5 tapCategory(68): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`open>tapCategory>open>open>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(68);
      logInfo(`open>tapCategory>open>open>tapCategory final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0030
     * @tc.name      SearchComponent_SearchPageStateFlow_0030
     * @tc.desc      SearchPageState call flow tapCategory > input > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0030 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(23.53);
      logInfo(`step1 tapCategory(23.53): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('aa');
      logInfo(`step2 input("aa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.tapCategory(-17);
      logInfo(`step3 tapCategory(-17): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>input>tapCategory final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('aa');
      logInfo(`tapCategory>input>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-17);
      logInfo(`tapCategory>input>tapCategory final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0031
     * @tc.name      SearchComponent_SearchPageStateFlow_0031
     * @tc.desc      SearchPageState call flow back > back > back > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0031 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      subject.back();
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`back>back>back>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0032
     * @tc.name      SearchComponent_SearchPageStateFlow_0032
     * @tc.desc      SearchPageState call flow input > tapCategory > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0032 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input(' Sample Title 123 ');
      logInfo(`step1 input(" Sample Title 123 "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tapCategory(73);
      logInfo(`step2 tapCategory(73): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.pick(93.49);
      logInfo(`step4 pick(93.49): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`input>tapCategory>open>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Sample Title 123 ');
      logInfo(`input>tapCategory>open>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(73);
      logInfo(`input>tapCategory>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`input>tapCategory>open>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0033
     * @tc.name      SearchComponent_SearchPageStateFlow_0033
     * @tc.desc      SearchPageState call flow back > tapCategory > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0033 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(103);
      logInfo(`step2 tapCategory(103): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      const step4: string = subject.tapCategory(23.53);
      logInfo(`step4 tapCategory(23.53): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`back>tapCategory>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(23.53, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0034
     * @tc.name      SearchComponent_SearchPageStateFlow_0034
     * @tc.desc      SearchPageState call flow tapCategory > open > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0034 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(142);
      logInfo(`step1 tapCategory(142): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.input('Sample Title 123Sample Title 123');
      logInfo(`step3 input("Sample Title 123Sample Title...: step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`tapCategory>open>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`tapCategory>open>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(142);
      logInfo(`tapCategory>open>input final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`tapCategory>open>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0035
     * @tc.name      SearchComponent_SearchPageStateFlow_0035
     * @tc.desc      SearchPageState call flow pick > back > pick > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0035 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(-14);
      logInfo(`step1 pick(-14): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.pick(-25);
      logInfo(`step3 pick(-25): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(11.48);
      logInfo(`step4 tapCategory(11.48): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>back>pick>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(11.48, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0036
     * @tc.name      SearchComponent_SearchPageStateFlow_0036
     * @tc.desc      SearchPageState call flow pick > back > tapCategory > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0036 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(195);
      logInfo(`step1 pick(195): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.tapCategory(-1);
      logInfo(`step3 tapCategory(-1): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(40);
      logInfo(`step4 tapCategory(40): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`pick>back>tapCategory>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(40);
      logInfo(`${BUNDLE}SearchPageStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0037
     * @tc.name      SearchComponent_SearchPageStateFlow_0037
     * @tc.desc      SearchPageState call flow open > open > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0037 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0038
     * @tc.name      SearchComponent_SearchPageStateFlow_0038
     * @tc.desc      SearchPageState call flow input > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0038 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('j9');
      logInfo(`step1 input("j9"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(40);
      logInfo(`step2 pick(40): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('xabc');
      logInfo(`step3 input("xabc"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`input>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xabc');
      logInfo(`input>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0039
     * @tc.name      SearchComponent_SearchPageStateFlow_0039
     * @tc.desc      SearchPageState call flow back > tapCategory > tapCategory > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0039 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.tapCategory(11.48);
      logInfo(`step2 tapCategory(11.48): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.tapCategory(90);
      logInfo(`step3 tapCategory(90): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.pick(155);
      logInfo(`step5 pick(155): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>tapCategory>tapCategory>open>pick final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(90);
      logInfo(`back>tapCategory>tapCategory>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0040
     * @tc.name      SearchComponent_SearchPageStateFlow_0040
     * @tc.desc      SearchPageState call flow open > pick > back > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0040 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.pick(77);
      logInfo(`step2 pick(77): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.back();
      const step4: string = subject.pick(35);
      logInfo(`step4 pick(35): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('123123');
      logInfo(`step5 input("123123"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`open>pick>back>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123123');
      logInfo(`open>pick>back>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0041
     * @tc.name      SearchComponent_SearchPageStateFlow_0041
     * @tc.desc      SearchPageState call flow pick > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0041 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(59);
      logInfo(`step1 pick(59): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(50.46);
      logInfo(`step2 tapCategory(50.46): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pick>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(50.46, PRECISION);
      logInfo(`pick>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0042
     * @tc.name      SearchComponent_SearchPageStateFlow_0042
     * @tc.desc      SearchPageState call flow back > back > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0042 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      subject.back();
      const step3: string = subject.pick(45);
      logInfo(`step3 pick(45): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.pick(123);
      logInfo(`step4 pick(123): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0043
     * @tc.name      SearchComponent_SearchPageStateFlow_0043
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > open > tapCategory > pick keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0043 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(86.6);
      logInfo(`step1 tapCategory(86.6): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(-81);
      logInfo(`step2 tapCategory(-81): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.open();
      logInfo(`step3 open(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.tapCategory(11);
      logInfo(`step4 tapCategory(11): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(23.22);
      logInfo(`step5 pick(23.22): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`tapCategory>tapCategory>open>tapCategory>...: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(11);
      logInfo(`tapCategory>tapCategory>open>tapCategory>...: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0044
     * @tc.name      SearchComponent_SearchPageStateFlow_0044
     * @tc.desc      SearchPageState call flow pick > tapCategory > input > pick > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0044 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(2);
      logInfo(`step1 pick(2): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(15);
      logInfo(`step2 tapCategory(15): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('aa');
      logInfo(`step3 input("aa"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(45.95);
      logInfo(`step4 pick(45.95): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.input('4Ij0');
      logInfo(`step5 input("4Ij0"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>tapCategory>input>pick>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('4Ij0');
      logInfo(`pick>tapCategory>input>pick>input final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(15);
      logInfo(`pick>tapCategory>input>pick>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}SearchPageStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0045
     * @tc.name      SearchComponent_SearchPageStateFlow_0045
     * @tc.desc      SearchPageState call flow pick > open > pick > tapCategory > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0045 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(6.65);
      logInfo(`step1 pick(6.65): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(52);
      logInfo(`step3 pick(52): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.tapCategory(85);
      logInfo(`step4 tapCategory(85): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.open();
      logInfo(`step5 open(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pick>open>pick>tapCategory>open final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(85);
      logInfo(`pick>open>pick>tapCategory>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0046
     * @tc.name      SearchComponent_SearchPageStateFlow_0046
     * @tc.desc      SearchPageState call flow pick > back > input > open > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0046 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(3);
      logInfo(`step1 pick(3): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: number = subject.input('u2ix3WIRffdu');
      logInfo(`step3 input("u2ix3WIRffdu"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.open();
      logInfo(`step4 open(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.pick(-46);
      logInfo(`step5 pick(-46): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`pick>back>input>open>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('u2ix3WIRffdu');
      logInfo(`pick>back>input>open>pick final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`pick>back>input>open>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0047
     * @tc.name      SearchComponent_SearchPageStateFlow_0047
     * @tc.desc      SearchPageState call flow pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0047 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(87);
      logInfo(`step1 pick(87): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      logInfo(`${BUNDLE}SearchPageStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0048
     * @tc.name      SearchComponent_SearchPageStateFlow_0048
     * @tc.desc      SearchPageState call flow pick > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0048 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(20);
      logInfo(`step1 pick(20): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.input('xHello');
      logInfo(`step2 input("xHello"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.back();
      logInfo(`pick>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0049
     * @tc.name      SearchComponent_SearchPageStateFlow_0049
     * @tc.desc      SearchPageState call flow open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0049 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`open>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0050
     * @tc.name      SearchComponent_SearchPageStateFlow_0050
     * @tc.desc      SearchPageState call flow back > pick > input > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0050 begin`);
      const subject: SearchPageState = new SearchPageState();
      subject.back();
      const step2: string = subject.pick(185);
      logInfo(`step2 pick(185): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('1lOPW');
      logInfo(`step3 input("1lOPW"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick(15.87);
      logInfo(`step4 pick(15.87): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.pick(45);
      logInfo(`step5 pick(45): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`back>pick>input>pick>pick final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1lOPW');
      logInfo(`back>pick>input>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0051
     * @tc.name      SearchComponent_SearchPageStateFlow_0051
     * @tc.desc      SearchPageState call flow tapCategory > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0051 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(99.21);
      logInfo(`step1 tapCategory(99.21): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.tapCategory(3);
      logInfo(`step3 tapCategory(3): step3=${step3}`);
      expect(step3).assertEqual('Native');
      logInfo(`tapCategory>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(3);
      logInfo(`tapCategory>back>tapCategory final: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('Native');
      logInfo(`${BUNDLE}SearchPageStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0052
     * @tc.name      SearchComponent_SearchPageStateFlow_0052
     * @tc.desc      SearchPageState call flow pick > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0052 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.pick(-51);
      logInfo(`step1 pick(-51): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`pick>open final: subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0053
     * @tc.name      SearchComponent_SearchPageStateFlow_0053
     * @tc.desc      SearchPageState call flow input > open > pick > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0053 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: number = subject.input('HelloHello');
      logInfo(`step1 input("HelloHello"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.open();
      logInfo(`step2 open(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.pick(150);
      logInfo(`step3 pick(150): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.back();
      logInfo(`input>open>pick>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0054
     * @tc.name      SearchComponent_SearchPageStateFlow_0054
     * @tc.desc      SearchPageState call flow open > back > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0054 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: boolean = subject.open();
      logInfo(`step1 open(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.back();
      const step3: number = subject.input('4Ij0');
      logInfo(`step3 input("4Ij0"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`open>back>input final: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('4Ij0');
      logInfo(`open>back>input final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0055
     * @tc.name      SearchComponent_SearchPageStateFlow_0055
     * @tc.desc      SearchPageState call flow tapCategory > back > tapCategory keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0055 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(32.33);
      logInfo(`step1 tapCategory(32.33): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.back();
      const step3: string = subject.tapCategory(43);
      logInfo(`step3 tapCategory(43): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`tapCategory>back>tapCategory final: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(43);
      logInfo(`${BUNDLE}SearchPageStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_FLOW_0056
     * @tc.name      SearchComponent_SearchPageStateFlow_0056
     * @tc.desc      SearchPageState call flow tapCategory > tapCategory > input > back keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateFlow_0056 begin`);
      const subject: SearchPageState = new SearchPageState();
      const step1: string = subject.tapCategory(-95);
      logInfo(`step1 tapCategory(-95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.tapCategory(50);
      logInfo(`step2 tapCategory(50): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.input('x\u4e2d\u6587');
      logInfo(`step3 input("x??"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.back();
      logInfo(`tapCategory>tapCategory>input>back final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateFlow_0056 end`);
    });
  });
}
