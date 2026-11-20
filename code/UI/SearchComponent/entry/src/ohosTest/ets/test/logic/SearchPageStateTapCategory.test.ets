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

/** Logic checks for SearchPageState.tapCategory (80 cases). */
export default function searchPageStateTapCategoryTest(): void {
  describe('SearchPageStateTapCategoryTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0001
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0001
     * @tc.desc      SearchPageState.tapCategory(index=0) yields "UI??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStateTapCategory_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0001 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(0);
      logInfo(`tapCategory(index=0): actual=${actual}`);
      expect(actual).assertEqual('UI\u5e03\u5c40');
      logInfo(`tapCategory(index=0) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(0);
      logInfo(`tapCategory(index=0) state: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('UI\u5e03\u5c40');
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0002
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0002
     * @tc.desc      SearchPageState.tapCategory(index=1) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStateTapCategory_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0002 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(1);
      logInfo(`tapCategory(index=1): actual=${actual}`);
      expect(actual).assertEqual('\u52a8\u6548');
      logInfo(`tapCategory(index=1) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(1);
      logInfo(`tapCategory(index=1) state: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u52a8\u6548');
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0003
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0003
     * @tc.desc      SearchPageState.tapCategory(index=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchPageStateTapCategory_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0003 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-1);
      logInfo(`tapCategory(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0004
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0004
     * @tc.desc      SearchPageState.tapCategory(index=-2) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchPageStateTapCategory_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0004 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-2);
      logInfo(`tapCategory(index=-2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-2) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-2);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0005
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0005
     * @tc.desc      SearchPageState.tapCategory(index=2) yields "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0005 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(2);
      logInfo(`tapCategory(index=2): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`tapCategory(index=2) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(2);
      logInfo(`tapCategory(index=2) state: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0006
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0006
     * @tc.desc      SearchPageState.tapCategory(index=5) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0006 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(5);
      logInfo(`tapCategory(index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5176\u4ed6');
      logInfo(`tapCategory(index=5) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(5);
      logInfo(`tapCategory(index=5) state: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0007
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0007
     * @tc.desc      SearchPageState.tapCategory(index=10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0007 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(10);
      logInfo(`tapCategory(index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=10) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(10);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0008
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0008
     * @tc.desc      SearchPageState.tapCategory(index=3) yields "Native"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0008 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(3);
      logInfo(`tapCategory(index=3): actual=${actual}`);
      expect(actual).assertEqual('Native');
      logInfo(`tapCategory(index=3) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(3);
      logInfo(`tapCategory(index=3) state: subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('Native');
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0009
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0009
     * @tc.desc      SearchPageState.tapCategory(index=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0009 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(100);
      logInfo(`tapCategory(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=100) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(100);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0010
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0010
     * @tc.desc      SearchPageState.tapCategory(index=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0010 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(15);
      logInfo(`tapCategory(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=15) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(15);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0011
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0011
     * @tc.desc      SearchPageState.tapCategory(index=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0011 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(20);
      logInfo(`tapCategory(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=20) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(20);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0012
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0012
     * @tc.desc      SearchPageState.tapCategory(index=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0012 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(25);
      logInfo(`tapCategory(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=25) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(25);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0013
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0013
     * @tc.desc      SearchPageState.tapCategory(index=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0013 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(30);
      logInfo(`tapCategory(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=30) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(30);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0014
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0014
     * @tc.desc      SearchPageState.tapCategory(index=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0014 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(35);
      logInfo(`tapCategory(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=35) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(35);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0015
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0015
     * @tc.desc      SearchPageState.tapCategory(index=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0015 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(40);
      logInfo(`tapCategory(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=40) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(40);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0016
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0016
     * @tc.desc      SearchPageState.tapCategory(index=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0016 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(45);
      logInfo(`tapCategory(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=45) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(45);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0017
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0017
     * @tc.desc      SearchPageState.tapCategory(index=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0017 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(50);
      logInfo(`tapCategory(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=50) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(50);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0018
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0018
     * @tc.desc      SearchPageState.tapCategory(index=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0018 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(55);
      logInfo(`tapCategory(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=55) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(55);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0019
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0019
     * @tc.desc      SearchPageState.tapCategory(index=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0019 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(60);
      logInfo(`tapCategory(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=60) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(60);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0020
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0020
     * @tc.desc      SearchPageState.tapCategory(index=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0020 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(65);
      logInfo(`tapCategory(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=65) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(65);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0021
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0021
     * @tc.desc      SearchPageState.tapCategory(index=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0021 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(70);
      logInfo(`tapCategory(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=70) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(70);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0022
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0022
     * @tc.desc      SearchPageState.tapCategory(index=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0022 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(75);
      logInfo(`tapCategory(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=75) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(75);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0023
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0023
     * @tc.desc      SearchPageState.tapCategory(index=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0023 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(80);
      logInfo(`tapCategory(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=80) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(80);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0024
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0024
     * @tc.desc      SearchPageState.tapCategory(index=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0024 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(85);
      logInfo(`tapCategory(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=85) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(85);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0025
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0025
     * @tc.desc      SearchPageState.tapCategory(index=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0025 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(90);
      logInfo(`tapCategory(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=90) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(90);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0026
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0026
     * @tc.desc      SearchPageState.tapCategory(index=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0026 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(95);
      logInfo(`tapCategory(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=95) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(95);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0027
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0027
     * @tc.desc      SearchPageState.tapCategory(index=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0027 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(105);
      logInfo(`tapCategory(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=105) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(105);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0028
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0028
     * @tc.desc      SearchPageState.tapCategory(index=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0028 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(110);
      logInfo(`tapCategory(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=110) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(110);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0029
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0029
     * @tc.desc      SearchPageState.tapCategory(index=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0029 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(115);
      logInfo(`tapCategory(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=115) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(115);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0030
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0030
     * @tc.desc      SearchPageState.tapCategory(index=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0030 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(120);
      logInfo(`tapCategory(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=120) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(120);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0031
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0031
     * @tc.desc      SearchPageState.tapCategory(index=125) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0031 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(125);
      logInfo(`tapCategory(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=125) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(125);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0032
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0032
     * @tc.desc      SearchPageState.tapCategory(index=130) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0032 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(130);
      logInfo(`tapCategory(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=130) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(130);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0033
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0033
     * @tc.desc      SearchPageState.tapCategory(index=135) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0033 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(135);
      logInfo(`tapCategory(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=135) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(135);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0034
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0034
     * @tc.desc      SearchPageState.tapCategory(index=140) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0034 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(140);
      logInfo(`tapCategory(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=140) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(140);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0035
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0035
     * @tc.desc      SearchPageState.tapCategory(index=145) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0035 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(145);
      logInfo(`tapCategory(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=145) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(145);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0036
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0036
     * @tc.desc      SearchPageState.tapCategory(index=150) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0036 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(150);
      logInfo(`tapCategory(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=150) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(150);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0037
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0037
     * @tc.desc      SearchPageState.tapCategory(index=155) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0037 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(155);
      logInfo(`tapCategory(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=155) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(155);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0038
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0038
     * @tc.desc      SearchPageState.tapCategory(index=160) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0038 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(160);
      logInfo(`tapCategory(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=160) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(160);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0039
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0039
     * @tc.desc      SearchPageState.tapCategory(index=165) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0039 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(165);
      logInfo(`tapCategory(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=165) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(165);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0040
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0040
     * @tc.desc      SearchPageState.tapCategory(index=170) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0040 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(170);
      logInfo(`tapCategory(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=170) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(170);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0041
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0041
     * @tc.desc      SearchPageState.tapCategory(index=175) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0041 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(175);
      logInfo(`tapCategory(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=175) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(175);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0042
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0042
     * @tc.desc      SearchPageState.tapCategory(index=180) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0042 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(180);
      logInfo(`tapCategory(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=180) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(180);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0043
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0043
     * @tc.desc      SearchPageState.tapCategory(index=185) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0043 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(185);
      logInfo(`tapCategory(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=185) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(185);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0044
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0044
     * @tc.desc      SearchPageState.tapCategory(index=190) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0044 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(190);
      logInfo(`tapCategory(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=190) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(190);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0045
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0045
     * @tc.desc      SearchPageState.tapCategory(index=195) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0045 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(195);
      logInfo(`tapCategory(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=195) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(195);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0046
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0046
     * @tc.desc      SearchPageState.tapCategory(index=200) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0046 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(200);
      logInfo(`tapCategory(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=200) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(200);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0047
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0047
     * @tc.desc      SearchPageState.tapCategory(index=-19) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0047 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-19);
      logInfo(`tapCategory(index=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-19) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-19);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0048
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0048
     * @tc.desc      SearchPageState.tapCategory(index=44) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0048 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(44);
      logInfo(`tapCategory(index=44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=44) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(44);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0049
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0049
     * @tc.desc      SearchPageState.tapCategory(index=16.11) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0049 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(16.11);
      logInfo(`tapCategory(index=16.11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=16.11) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(16.11, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0050
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0050
     * @tc.desc      SearchPageState.tapCategory(index=-28) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0050 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-28);
      logInfo(`tapCategory(index=-28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-28) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-28);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0051
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0051
     * @tc.desc      SearchPageState.tapCategory(index=32.33) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0051 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(32.33);
      logInfo(`tapCategory(index=32.33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=32.33) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(32.33, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0052
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0052
     * @tc.desc      SearchPageState.tapCategory(index=38) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0052 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(38);
      logInfo(`tapCategory(index=38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=38) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(38);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0053
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0053
     * @tc.desc      SearchPageState.tapCategory(index=-15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0053 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-15);
      logInfo(`tapCategory(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-15) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-15);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0054
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0054
     * @tc.desc      SearchPageState.tapCategory(index=-39) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0054 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-39);
      logInfo(`tapCategory(index=-39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-39) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-39);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0055
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0055
     * @tc.desc      SearchPageState.tapCategory(index=-95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0055 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-95);
      logInfo(`tapCategory(index=-95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-95) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-95);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0056
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0056
     * @tc.desc      SearchPageState.tapCategory(index=-17) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0056 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-17);
      logInfo(`tapCategory(index=-17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-17) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-17);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0057
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0057
     * @tc.desc      SearchPageState.tapCategory(index=81) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0057 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(81);
      logInfo(`tapCategory(index=81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=81) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(81);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0058
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0058
     * @tc.desc      SearchPageState.tapCategory(index=50.46) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0058 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(50.46);
      logInfo(`tapCategory(index=50.46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=50.46) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(50.46, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0059
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0059
     * @tc.desc      SearchPageState.tapCategory(index=27.49) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0059 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(27.49);
      logInfo(`tapCategory(index=27.49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=27.49) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(27.49, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0060
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0060
     * @tc.desc      SearchPageState.tapCategory(index=11) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0060 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(11);
      logInfo(`tapCategory(index=11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=11) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(11);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0061
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0061
     * @tc.desc      SearchPageState.tapCategory(index=48.07) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0061 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(48.07);
      logInfo(`tapCategory(index=48.07): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=48.07) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(48.07, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0062
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0062
     * @tc.desc      SearchPageState.tapCategory(index=33.43) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0062 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(33.43);
      logInfo(`tapCategory(index=33.43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=33.43) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(33.43, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0063
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0063
     * @tc.desc      SearchPageState.tapCategory(index=11.48) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0063 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(11.48);
      logInfo(`tapCategory(index=11.48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=11.48) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(11.48, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0064
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0064
     * @tc.desc      SearchPageState.tapCategory(index=69.82) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0064 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(69.82);
      logInfo(`tapCategory(index=69.82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=69.82) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(69.82, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0065
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0065
     * @tc.desc      SearchPageState.tapCategory(index=-77) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0065 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-77);
      logInfo(`tapCategory(index=-77): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-77) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-77);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0066
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0066
     * @tc.desc      SearchPageState.tapCategory(index=10.09) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0066 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(10.09);
      logInfo(`tapCategory(index=10.09): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=10.09) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(10.09, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0067
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0067
     * @tc.desc      SearchPageState.tapCategory(index=-98) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0067 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-98);
      logInfo(`tapCategory(index=-98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-98) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-98);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0068
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0068
     * @tc.desc      SearchPageState.tapCategory(index=79.43) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0068 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(79.43);
      logInfo(`tapCategory(index=79.43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=79.43) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(79.43, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0069
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0069
     * @tc.desc      SearchPageState.tapCategory(index=-79) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0069 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-79);
      logInfo(`tapCategory(index=-79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-79) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-79);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0070
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0070
     * @tc.desc      SearchPageState.tapCategory(index=1.4) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0070 begin`);
      const subject: SearchPageState = new SearchPageState();
      let thrown: boolean = false;
      try {
        subject.tapCategory(1.4);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tapCategory(index=1.4): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0071
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0071
     * @tc.desc      SearchPageState.tapCategory(index=86.6) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0071 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(86.6);
      logInfo(`tapCategory(index=86.6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=86.6) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(86.6, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0072
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0072
     * @tc.desc      SearchPageState.tapCategory(index=193) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0072 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(193);
      logInfo(`tapCategory(index=193): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=193) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(193);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0073
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0073
     * @tc.desc      SearchPageState.tapCategory(index=35.57) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0073 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(35.57);
      logInfo(`tapCategory(index=35.57): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=35.57) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(35.57, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0074
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0074
     * @tc.desc      SearchPageState.tapCategory(index=84) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0074 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(84);
      logInfo(`tapCategory(index=84): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=84) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(84);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0075
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0075
     * @tc.desc      SearchPageState.tapCategory(index=28.01) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0075 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(28.01);
      logInfo(`tapCategory(index=28.01): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=28.01) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertClose(28.01, PRECISION);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0076
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0076
     * @tc.desc      SearchPageState.tapCategory(index=-12) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0076 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-12);
      logInfo(`tapCategory(index=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-12) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-12);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0077
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0077
     * @tc.desc      SearchPageState.tapCategory(index=14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0077 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(14);
      logInfo(`tapCategory(index=14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=14) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(14);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0078
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0078
     * @tc.desc      SearchPageState.tapCategory(index=-7) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0078 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-7);
      logInfo(`tapCategory(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-7) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-7);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0079
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0079
     * @tc.desc      SearchPageState.tapCategory(index=-81) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateTapCategory_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0079 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(-81);
      logInfo(`tapCategory(index=-81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=-81) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-81);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_TAP_CATEGORY_0080
     * @tc.name      SearchComponent_SearchPageStateTapCategory_0080
     * @tc.desc      SearchPageState.tapCategory(index=28) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateTapCategory_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0080 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.tapCategory(28);
      logInfo(`tapCategory(index=28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`tapCategory(index=28) state: subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(28);
      logInfo(`${BUNDLE}SearchPageStateTapCategory_0080 end`);
    });
  });
}
