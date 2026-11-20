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

/** Logic checks for SearchPageState.input (71 cases). */
export default function searchPageStateInputTest(): void {
  describe('SearchPageStateInputTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0001
     * @tc.name      SearchComponent_SearchPageStateInput_0001
     * @tc.desc      SearchPageState.input(value="") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStateInput_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0001 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('');
      logInfo(`input(value=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SearchPageStateInput_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0002
     * @tc.name      SearchComponent_SearchPageStateInput_0002
     * @tc.desc      SearchPageState.input(value="x") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStateInput_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0002 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('x');
      logInfo(`input(value="x"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`input(value="x") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x');
      logInfo(`input(value="x") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(4);
      logInfo(`input(value="x") state: subject.results[0]=${subject.results[0]}`);
      expect(subject.results[0]).assertEqual('XComponent + Vsync \u5b9e\u73b0\u81ea\u5b9a\u4e49\u52a8\u753b');
      logInfo(`input(value="x") state: subject.results[2].length=${subject.results[2].length}`);
      expect(subject.results[2].length).assertEqual(18);
      logInfo(`input(value="x") state: subject.results[2].substring(0, 11)=${subject.results[2].substring(0, 11)}`);
      expect(subject.results[2].substring(0, 11)).assertEqual('Text\u5b9e\u73b0\u90e8\u5206\u6587\u672c\u9ad8');
      logInfo(`input(value="x") state: subject.results[2].substring(12)=${subject.results[2].substring(12)}`);
      expect(subject.results[2].substring(12)).assertEqual('\u548c\u8d85\u94fe\u63a5\u6837\u5f0f');
      logInfo(`${BUNDLE}SearchPageStateInput_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0003
     * @tc.name      SearchComponent_SearchPageStateInput_0003
     * @tc.desc      SearchPageState.input(value="Hello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0003 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Hello');
      logInfo(`input(value="Hello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Hello") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello');
      logInfo(`input(value="Hello") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0004
     * @tc.name      SearchComponent_SearchPageStateInput_0004
     * @tc.desc      SearchPageState.input(value="hello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0004 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('hello world');
      logInfo(`input(value="hello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="hello world") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('hello world');
      logInfo(`input(value="hello world") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0005
     * @tc.name      SearchComponent_SearchPageStateInput_0005
     * @tc.desc      SearchPageState.input(value=" ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0005 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' ');
      logInfo(`input(value=" "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`input(value=" ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' ');
      logInfo(`input(value=" ") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`input(value=" ") state: JSON.stringify(subject.results)=${JSON.stringify(subject.results)}`);
      expect(JSON.stringify(subject.results))
        .assertEqual('["XComponent + Vsync \u5b9e\u73b0\u81ea\u5b9a\u4e49\u52a8\u753b"]');
      logInfo(`${BUNDLE}SearchPageStateInput_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0006
     * @tc.name      SearchComponent_SearchPageStateInput_0006
     * @tc.desc      SearchPageState.input(value="A") yields 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0006 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('A');
      logInfo(`input(value="A"): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`input(value="A") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('A');
      logInfo(`input(value="A") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(26);
      logInfo(`input(value="A") state: JSON.stringify(subject.result...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`input(value="A") state: subject.results[13].length=${subject.results[13].length}`);
      expect(subject.results[13].length).assertEqual(22);
      logInfo(`input(value="A") state: subject.results[13].substring(0, 16)=${subject.results[13].substring(0, 16)}`);
      expect(subject.results[13].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`input(value="A") state: subject.results[13].substring(16)=${subject.results[13].substring(16)}`);
      expect(subject.results[13].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateInput_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0007
     * @tc.name      SearchComponent_SearchPageStateInput_0007
     * @tc.desc      SearchPageState.input(value="Sample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0007 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Sample Title 123');
      logInfo(`input(value="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Sample Title 123") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123');
      logInfo(`input(value="Sample Title 123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0008
     * @tc.name      SearchComponent_SearchPageStateInput_0008
     * @tc.desc      SearchPageState.input(value="??") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0008 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('\u4e2d\u6587');
      logInfo(`input(value="??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="??") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('\u4e2d\u6587');
      logInfo(`input(value="??") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0009
     * @tc.name      SearchComponent_SearchPageStateInput_0009
     * @tc.desc      SearchPageState.input(value="a") yields 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0009 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('a');
      logInfo(`input(value="a"): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`input(value="a") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('a');
      logInfo(`input(value="a") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(26);
      logInfo(`input(value="a") state: JSON.stringify(subject.result...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`input(value="a") state: subject.results[13].length=${subject.results[13].length}`);
      expect(subject.results[13].length).assertEqual(22);
      logInfo(`input(value="a") state: subject.results[13].substring(0, 16)=${subject.results[13].substring(0, 16)}`);
      expect(subject.results[13].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`input(value="a") state: subject.results[13].substring(16)=${subject.results[13].substring(16)}`);
      expect(subject.results[13].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateInput_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0010
     * @tc.name      SearchComponent_SearchPageStateInput_0010
     * @tc.desc      SearchPageState.input(value="abc") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0010 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('abc');
      logInfo(`input(value="abc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`input(value="abc") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abc');
      logInfo(`input(value="abc") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`input(value="abc") state: subject.results[0].length=${subject.results[0].length}`);
      expect(subject.results[0].length).assertEqual(33);
      logInfo(`input(value="abc") state: subject.results[0].substring(0, 21)=${subject.results[0].substring(0, 21)}`);
      expect(subject.results[0].substring(0, 21)).assertEqual('tabContent\u5185\u5bb9\u53ef\u4ee5\u5728tabBar');
      logInfo(`input(value="abc") state: subject.results[0].substring(27)=${subject.results[0].substring(27)}`);
      expect(subject.results[0].substring(27)).assertEqual('\u6ed1\u52a8\u4e8b\u4ef6\u6848\u4f8b');
      logInfo(`${BUNDLE}SearchPageStateInput_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0011
     * @tc.name      SearchComponent_SearchPageStateInput_0011
     * @tc.desc      SearchPageState.input(value="Hello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0011 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Hello World');
      logInfo(`input(value="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Hello World") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello World');
      logInfo(`input(value="Hello World") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0012
     * @tc.name      SearchComponent_SearchPageStateInput_0012
     * @tc.desc      SearchPageState.input(value="123") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0012 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('123');
      logInfo(`input(value="123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`input(value="123") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123');
      logInfo(`input(value="123") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(1);
      logInfo(`input(value="123") state: JSON.stringify(subject.results)=${JSON.stringify(subject.results)}`);
      expect(JSON.stringify(subject.results)).assertEqual('["NavDestination\u5f39\u7a97"]');
      logInfo(`${BUNDLE}SearchPageStateInput_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0013
     * @tc.name      SearchComponent_SearchPageStateInput_0013
     * @tc.desc      SearchPageState.input(value=" x ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0013 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' x ');
      logInfo(`input(value=" x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" x ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' x ');
      logInfo(`input(value=" x ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0014
     * @tc.name      SearchComponent_SearchPageStateInput_0014
     * @tc.desc      SearchPageState.input(value="xx") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0014 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xx');
      logInfo(`input(value="xx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xx") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xx');
      logInfo(`input(value="xx") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0015
     * @tc.name      SearchComponent_SearchPageStateInput_0015
     * @tc.desc      SearchPageState.input(value="x_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0015 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('x_1');
      logInfo(`input(value="x_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="x_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x_1');
      logInfo(`input(value="x_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0016
     * @tc.name      SearchComponent_SearchPageStateInput_0016
     * @tc.desc      SearchPageState.input(value=" Hello ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0016 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' Hello ');
      logInfo(`input(value=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" Hello ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Hello ');
      logInfo(`input(value=" Hello ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0017
     * @tc.name      SearchComponent_SearchPageStateInput_0017
     * @tc.desc      SearchPageState.input(value="HelloHello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0017 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('HelloHello');
      logInfo(`input(value="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="HelloHello") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('HelloHello');
      logInfo(`input(value="HelloHello") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0018
     * @tc.name      SearchComponent_SearchPageStateInput_0018
     * @tc.desc      SearchPageState.input(value="Hello_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0018 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Hello_1');
      logInfo(`input(value="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Hello_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello_1');
      logInfo(`input(value="Hello_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0019
     * @tc.name      SearchComponent_SearchPageStateInput_0019
     * @tc.desc      SearchPageState.input(value="xHello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0019 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xHello');
      logInfo(`input(value="xHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xHello") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xHello');
      logInfo(`input(value="xHello") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0020
     * @tc.name      SearchComponent_SearchPageStateInput_0020
     * @tc.desc      SearchPageState.input(value=" hello world ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0020 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' hello world ');
      logInfo(`input(value=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" hello world ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' hello world ');
      logInfo(`input(value=" hello world ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0021
     * @tc.name      SearchComponent_SearchPageStateInput_0021
     * @tc.desc      SearchPageState.input(value="hello worldhello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0021 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('hello worldhello world');
      logInfo(`input(value="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="hello worldhello world") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('hello worldhello world');
      logInfo(`input(value="hello worldhello world") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0022
     * @tc.name      SearchComponent_SearchPageStateInput_0022
     * @tc.desc      SearchPageState.input(value="hello world_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0022 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('hello world_1');
      logInfo(`input(value="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="hello world_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('hello world_1');
      logInfo(`input(value="hello world_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0023
     * @tc.name      SearchComponent_SearchPageStateInput_0023
     * @tc.desc      SearchPageState.input(value="xhello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0023 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xhello world');
      logInfo(`input(value="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xhello world") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xhello world');
      logInfo(`input(value="xhello world") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0024
     * @tc.name      SearchComponent_SearchPageStateInput_0024
     * @tc.desc      SearchPageState.input(value="   ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0024 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('   ');
      logInfo(`input(value="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="   ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('   ');
      logInfo(`input(value="   ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0025
     * @tc.name      SearchComponent_SearchPageStateInput_0025
     * @tc.desc      SearchPageState.input(value="  ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0025 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('  ');
      logInfo(`input(value="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="  ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('  ');
      logInfo(`input(value="  ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0026
     * @tc.name      SearchComponent_SearchPageStateInput_0026
     * @tc.desc      SearchPageState.input(value=" _1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0026 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' _1');
      logInfo(`input(value=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" _1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' _1');
      logInfo(`input(value=" _1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0027
     * @tc.name      SearchComponent_SearchPageStateInput_0027
     * @tc.desc      SearchPageState.input(value="x ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0027 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('x ');
      logInfo(`input(value="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="x ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x ');
      logInfo(`input(value="x ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0028
     * @tc.name      SearchComponent_SearchPageStateInput_0028
     * @tc.desc      SearchPageState.input(value=" A ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0028 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' A ');
      logInfo(`input(value=" A "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" A ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' A ');
      logInfo(`input(value=" A ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0029
     * @tc.name      SearchComponent_SearchPageStateInput_0029
     * @tc.desc      SearchPageState.input(value="AA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0029 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('AA');
      logInfo(`input(value="AA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="AA") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('AA');
      logInfo(`input(value="AA") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0030
     * @tc.name      SearchComponent_SearchPageStateInput_0030
     * @tc.desc      SearchPageState.input(value="A_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0030 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('A_1');
      logInfo(`input(value="A_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="A_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('A_1');
      logInfo(`input(value="A_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0031
     * @tc.name      SearchComponent_SearchPageStateInput_0031
     * @tc.desc      SearchPageState.input(value="xA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0031 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xA');
      logInfo(`input(value="xA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xA") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xA');
      logInfo(`input(value="xA") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0032
     * @tc.name      SearchComponent_SearchPageStateInput_0032
     * @tc.desc      SearchPageState.input(value=" Sample Title 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0032 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' Sample Title 123 ');
      logInfo(`input(value=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" Sample Title 123 ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Sample Title 123 ');
      logInfo(`input(value=" Sample Title 123 ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0033
     * @tc.name      SearchComponent_SearchPageStateInput_0033
     * @tc.desc      SearchPageState.input(value="Sample Title 123Sample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0033 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Sample Title 123Sample Title 123');
      logInfo(`input(value="Sample Title 123Sample Title...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Sample Title 123Sample Title...: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`input(value="Sample Title 123Sample Title...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0034
     * @tc.name      SearchComponent_SearchPageStateInput_0034
     * @tc.desc      SearchPageState.input(value="Sample Title 123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0034 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Sample Title 123_1');
      logInfo(`input(value="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Sample Title 123_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Sample Title 123_1');
      logInfo(`input(value="Sample Title 123_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0035
     * @tc.name      SearchComponent_SearchPageStateInput_0035
     * @tc.desc      SearchPageState.input(value="xSample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0035 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xSample Title 123');
      logInfo(`input(value="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xSample Title 123") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xSample Title 123');
      logInfo(`input(value="xSample Title 123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0036
     * @tc.name      SearchComponent_SearchPageStateInput_0036
     * @tc.desc      SearchPageState.input(value=" ?? ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0036 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' \u4e2d\u6587 ');
      logInfo(`input(value=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" ?? ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' \u4e2d\u6587 ');
      logInfo(`input(value=" ?? ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0037
     * @tc.name      SearchComponent_SearchPageStateInput_0037
     * @tc.desc      SearchPageState.input(value="????") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0037 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`input(value="????"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="????") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`input(value="????") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0038
     * @tc.name      SearchComponent_SearchPageStateInput_0038
     * @tc.desc      SearchPageState.input(value="??_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0038 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('\u4e2d\u6587_1');
      logInfo(`input(value="??_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="??_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('\u4e2d\u6587_1');
      logInfo(`input(value="??_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0039
     * @tc.name      SearchComponent_SearchPageStateInput_0039
     * @tc.desc      SearchPageState.input(value="x??") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0039 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('x\u4e2d\u6587');
      logInfo(`input(value="x??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="x??") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x\u4e2d\u6587');
      logInfo(`input(value="x??") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0040
     * @tc.name      SearchComponent_SearchPageStateInput_0040
     * @tc.desc      SearchPageState.input(value=" a ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0040 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' a ');
      logInfo(`input(value=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" a ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' a ');
      logInfo(`input(value=" a ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0041
     * @tc.name      SearchComponent_SearchPageStateInput_0041
     * @tc.desc      SearchPageState.input(value="aa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0041 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('aa');
      logInfo(`input(value="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="aa") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('aa');
      logInfo(`input(value="aa") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0042
     * @tc.name      SearchComponent_SearchPageStateInput_0042
     * @tc.desc      SearchPageState.input(value="a_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0042 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('a_1');
      logInfo(`input(value="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="a_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('a_1');
      logInfo(`input(value="a_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0043
     * @tc.name      SearchComponent_SearchPageStateInput_0043
     * @tc.desc      SearchPageState.input(value="xa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0043 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xa');
      logInfo(`input(value="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xa") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xa');
      logInfo(`input(value="xa") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0044
     * @tc.name      SearchComponent_SearchPageStateInput_0044
     * @tc.desc      SearchPageState.input(value=" abc ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0044 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' abc ');
      logInfo(`input(value=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" abc ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' abc ');
      logInfo(`input(value=" abc ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0045
     * @tc.name      SearchComponent_SearchPageStateInput_0045
     * @tc.desc      SearchPageState.input(value="abcabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0045 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('abcabc');
      logInfo(`input(value="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="abcabc") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abcabc');
      logInfo(`input(value="abcabc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0046
     * @tc.name      SearchComponent_SearchPageStateInput_0046
     * @tc.desc      SearchPageState.input(value="abc_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0046 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('abc_1');
      logInfo(`input(value="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="abc_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('abc_1');
      logInfo(`input(value="abc_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0047
     * @tc.name      SearchComponent_SearchPageStateInput_0047
     * @tc.desc      SearchPageState.input(value="xabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0047 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xabc');
      logInfo(`input(value="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xabc") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xabc');
      logInfo(`input(value="xabc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0048
     * @tc.name      SearchComponent_SearchPageStateInput_0048
     * @tc.desc      SearchPageState.input(value=" Hello World ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0048 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' Hello World ');
      logInfo(`input(value=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" Hello World ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' Hello World ');
      logInfo(`input(value=" Hello World ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0049
     * @tc.name      SearchComponent_SearchPageStateInput_0049
     * @tc.desc      SearchPageState.input(value="Hello WorldHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0049 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Hello WorldHello World');
      logInfo(`input(value="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Hello WorldHello World") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello WorldHello World');
      logInfo(`input(value="Hello WorldHello World") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0050
     * @tc.name      SearchComponent_SearchPageStateInput_0050
     * @tc.desc      SearchPageState.input(value="Hello World_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0050 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Hello World_1');
      logInfo(`input(value="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Hello World_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Hello World_1');
      logInfo(`input(value="Hello World_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0051
     * @tc.name      SearchComponent_SearchPageStateInput_0051
     * @tc.desc      SearchPageState.input(value="xHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0051 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('xHello World');
      logInfo(`input(value="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="xHello World") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('xHello World');
      logInfo(`input(value="xHello World") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0052
     * @tc.name      SearchComponent_SearchPageStateInput_0052
     * @tc.desc      SearchPageState.input(value=" 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0052 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input(' 123 ');
      logInfo(`input(value=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value=" 123 ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual(' 123 ');
      logInfo(`input(value=" 123 ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0053
     * @tc.name      SearchComponent_SearchPageStateInput_0053
     * @tc.desc      SearchPageState.input(value="123123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0053 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('123123');
      logInfo(`input(value="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="123123") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123123');
      logInfo(`input(value="123123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0054
     * @tc.name      SearchComponent_SearchPageStateInput_0054
     * @tc.desc      SearchPageState.input(value="123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0054 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('123_1');
      logInfo(`input(value="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="123_1") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('123_1');
      logInfo(`input(value="123_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0055
     * @tc.name      SearchComponent_SearchPageStateInput_0055
     * @tc.desc      SearchPageState.input(value="x123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchPageStateInput_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0055 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('x123');
      logInfo(`input(value="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="x123") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('x123');
      logInfo(`input(value="x123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0056
     * @tc.name      SearchComponent_SearchPageStateInput_0056
     * @tc.desc      SearchPageState.input(value="DLE3yRnc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0056 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('DLE3yRnc');
      logInfo(`input(value="DLE3yRnc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="DLE3yRnc") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('DLE3yRnc');
      logInfo(`input(value="DLE3yRnc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0057
     * @tc.name      SearchComponent_SearchPageStateInput_0057
     * @tc.desc      SearchPageState.input(value="eSo") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0057 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('eSo');
      logInfo(`input(value="eSo"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="eSo") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('eSo');
      logInfo(`input(value="eSo") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0058
     * @tc.name      SearchComponent_SearchPageStateInput_0058
     * @tc.desc      SearchPageState.input(value="j") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0058 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('j');
      logInfo(`input(value="j"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="j") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('j');
      logInfo(`input(value="j") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0059
     * @tc.name      SearchComponent_SearchPageStateInput_0059
     * @tc.desc      SearchPageState.input(value="4Ij0") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0059 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('4Ij0');
      logInfo(`input(value="4Ij0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="4Ij0") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('4Ij0');
      logInfo(`input(value="4Ij0") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0060
     * @tc.name      SearchComponent_SearchPageStateInput_0060
     * @tc.desc      SearchPageState.input(value="qHEE5") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0060 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('qHEE5');
      logInfo(`input(value="qHEE5"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="qHEE5") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('qHEE5');
      logInfo(`input(value="qHEE5") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0061
     * @tc.name      SearchComponent_SearchPageStateInput_0061
     * @tc.desc      SearchPageState.input(value="sU8ACk75L45") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0061 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('sU8ACk75L45');
      logInfo(`input(value="sU8ACk75L45"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="sU8ACk75L45") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('sU8ACk75L45');
      logInfo(`input(value="sU8ACk75L45") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0062
     * @tc.name      SearchComponent_SearchPageStateInput_0062
     * @tc.desc      SearchPageState.input(value="c") yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0062 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('c');
      logInfo(`input(value="c"): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`input(value="c") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('c');
      logInfo(`input(value="c") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(10);
      logInfo(`input(value="c") state: JSON.stringify(subject.result...${JSON.stringify(subject.results.slice(0, 1))}`);
      expect(JSON.stringify(subject.results.slice(0, 1)))
        .assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`input(value="c") state: subject.results[5]=${subject.results[5]}`);
      expect(subject.results[5]).assertEqual('\u6839\u636eicon\u81ea\u9002\u5e94\u80cc\u666f\u989c\u8272');
      logInfo(`${BUNDLE}SearchPageStateInput_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0063
     * @tc.name      SearchComponent_SearchPageStateInput_0063
     * @tc.desc      SearchPageState.input(value="trvc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0063 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('trvc');
      logInfo(`input(value="trvc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="trvc") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('trvc');
      logInfo(`input(value="trvc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0064
     * @tc.name      SearchComponent_SearchPageStateInput_0064
     * @tc.desc      SearchPageState.input(value="Td7712KkU4") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0064 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('Td7712KkU4');
      logInfo(`input(value="Td7712KkU4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="Td7712KkU4") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('Td7712KkU4');
      logInfo(`input(value="Td7712KkU4") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0065
     * @tc.name      SearchComponent_SearchPageStateInput_0065
     * @tc.desc      SearchPageState.input(value="I16hQ9Eh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0065 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('I16hQ9Eh');
      logInfo(`input(value="I16hQ9Eh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="I16hQ9Eh") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('I16hQ9Eh');
      logInfo(`input(value="I16hQ9Eh") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0066
     * @tc.name      SearchComponent_SearchPageStateInput_0066
     * @tc.desc      SearchPageState.input(value="grqbR") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0066 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('grqbR');
      logInfo(`input(value="grqbR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="grqbR") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('grqbR');
      logInfo(`input(value="grqbR") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0067
     * @tc.name      SearchComponent_SearchPageStateInput_0067
     * @tc.desc      SearchPageState.input(value="UXfHnYK0") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0067 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('UXfHnYK0');
      logInfo(`input(value="UXfHnYK0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="UXfHnYK0") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('UXfHnYK0');
      logInfo(`input(value="UXfHnYK0") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0068
     * @tc.name      SearchComponent_SearchPageStateInput_0068
     * @tc.desc      SearchPageState.input(value="E") yields 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0068 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('E');
      logInfo(`input(value="E"): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`input(value="E") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('E');
      logInfo(`input(value="E") state: subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(24);
      logInfo(`input(value="E") state: subject.results[0]=${subject.results[0]}`);
      expect(subject.results[0]).assertEqual('\u9884\u52a0\u8f7dso\u5e76\u8bfb\u53d6RawFile\u6587\u4ef6');
      logInfo(`input(value="E") state: subject.results[12].length=${subject.results[12].length}`);
      expect(subject.results[12].length).assertEqual(22);
      logInfo(`input(value="E") state: subject.results[12].substring(0, 16)=${subject.results[12].substring(0, 16)}`);
      expect(subject.results[12].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`input(value="E") state: subject.results[12].substring(16)=${subject.results[12].substring(16)}`);
      expect(subject.results[12].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`${BUNDLE}SearchPageStateInput_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0069
     * @tc.name      SearchComponent_SearchPageStateInput_0069
     * @tc.desc      SearchPageState.input(value="l9tQItoQ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0069 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('l9tQItoQ');
      logInfo(`input(value="l9tQItoQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="l9tQItoQ") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('l9tQItoQ');
      logInfo(`input(value="l9tQItoQ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0070
     * @tc.name      SearchComponent_SearchPageStateInput_0070
     * @tc.desc      SearchPageState.input(value="1up2OEC2Tjx") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0070 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('1up2OEC2Tjx');
      logInfo(`input(value="1up2OEC2Tjx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="1up2OEC2Tjx") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('1up2OEC2Tjx');
      logInfo(`input(value="1up2OEC2Tjx") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_INPUT_0071
     * @tc.name      SearchComponent_SearchPageStateInput_0071
     * @tc.desc      SearchPageState.input(value="BffN5n493da") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStateInput_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStateInput_0071 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: number = subject.input('BffN5n493da');
      logInfo(`input(value="BffN5n493da"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`input(value="BffN5n493da") state: subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('BffN5n493da');
      logInfo(`input(value="BffN5n493da") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}SearchPageStateInput_0071 end`);
    });
  });
}
