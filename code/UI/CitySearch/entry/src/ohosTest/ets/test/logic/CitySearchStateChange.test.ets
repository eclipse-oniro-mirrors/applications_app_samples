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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CitySearchState } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CitySearchState.change (72 cases). */
export default function citySearchStateChangeTest(): void {
  describe('CitySearchStateChangeTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0001
     * @tc.name      CitySearch_CitySearchStateChange_0001
     * @tc.desc      CitySearchState.change(value="Hello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStateChange_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0001 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Hello');
      logInfo(`change(value="Hello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Hello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`change(value="Hello") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0002
     * @tc.name      CitySearch_CitySearchStateChange_0002
     * @tc.desc      CitySearchState.change(value="hello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStateChange_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0002 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('hello world');
      logInfo(`change(value="hello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="hello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello world');
      logInfo(`change(value="hello world") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0003
     * @tc.name      CitySearch_CitySearchStateChange_0003
     * @tc.desc      CitySearchState.change(value="") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0003 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('');
      logInfo(`change(value=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CitySearchStateChange_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0004
     * @tc.name      CitySearch_CitySearchStateChange_0004
     * @tc.desc      CitySearchState.change(value=" ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0004 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' ');
      logInfo(`change(value=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' ');
      logInfo(`change(value=" ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0005
     * @tc.name      CitySearch_CitySearchStateChange_0005
     * @tc.desc      CitySearchState.change(value="A") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0005 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('A');
      logInfo(`change(value="A"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`change(value="A") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A');
      logInfo(`change(value="A") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change(value="A") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`change(value="A") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`change(value="A") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`${BUNDLE}CitySearchStateChange_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0006
     * @tc.name      CitySearch_CitySearchStateChange_0006
     * @tc.desc      CitySearchState.change(value="Sample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0006 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Sample Title 123');
      logInfo(`change(value="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Sample Title 123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123');
      logInfo(`change(value="Sample Title 123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0007
     * @tc.name      CitySearch_CitySearchStateChange_0007
     * @tc.desc      CitySearchState.change(value="??") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0007 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('\u4e2d\u6587');
      logInfo(`change(value="??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="??") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587');
      logInfo(`change(value="??") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0008
     * @tc.name      CitySearch_CitySearchStateChange_0008
     * @tc.desc      CitySearchState.change(value="a") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0008 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('a');
      logInfo(`change(value="a"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`change(value="a") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a');
      logInfo(`change(value="a") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change(value="a") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`change(value="a") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`change(value="a") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`${BUNDLE}CitySearchStateChange_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0009
     * @tc.name      CitySearch_CitySearchStateChange_0009
     * @tc.desc      CitySearchState.change(value="abc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0009 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('abc');
      logInfo(`change(value="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="abc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc');
      logInfo(`change(value="abc") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0010
     * @tc.name      CitySearch_CitySearchStateChange_0010
     * @tc.desc      CitySearchState.change(value="Hello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0010 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Hello World');
      logInfo(`change(value="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Hello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello World');
      logInfo(`change(value="Hello World") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0011
     * @tc.name      CitySearch_CitySearchStateChange_0011
     * @tc.desc      CitySearchState.change(value="123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0011 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('123');
      logInfo(`change(value="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123');
      logInfo(`change(value="123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0012
     * @tc.name      CitySearch_CitySearchStateChange_0012
     * @tc.desc      CitySearchState.change(value=" Hello ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0012 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' Hello ');
      logInfo(`change(value=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" Hello ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello ');
      logInfo(`change(value=" Hello ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0013
     * @tc.name      CitySearch_CitySearchStateChange_0013
     * @tc.desc      CitySearchState.change(value="HelloHello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0013 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('HelloHello');
      logInfo(`change(value="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="HelloHello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HelloHello');
      logInfo(`change(value="HelloHello") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0014
     * @tc.name      CitySearch_CitySearchStateChange_0014
     * @tc.desc      CitySearchState.change(value="Hello_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0014 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Hello_1');
      logInfo(`change(value="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Hello_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello_1');
      logInfo(`change(value="Hello_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0015
     * @tc.name      CitySearch_CitySearchStateChange_0015
     * @tc.desc      CitySearchState.change(value="xHello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0015 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('xHello');
      logInfo(`change(value="xHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="xHello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xHello');
      logInfo(`change(value="xHello") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0016
     * @tc.name      CitySearch_CitySearchStateChange_0016
     * @tc.desc      CitySearchState.change(value=" hello world ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0016 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' hello world ');
      logInfo(`change(value=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" hello world ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' hello world ');
      logInfo(`change(value=" hello world ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0017
     * @tc.name      CitySearch_CitySearchStateChange_0017
     * @tc.desc      CitySearchState.change(value="hello worldhello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0017 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('hello worldhello world');
      logInfo(`change(value="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="hello worldhello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello worldhello world');
      logInfo(`change(value="hello worldhello world") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0018
     * @tc.name      CitySearch_CitySearchStateChange_0018
     * @tc.desc      CitySearchState.change(value="hello world_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0018 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('hello world_1');
      logInfo(`change(value="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="hello world_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello world_1');
      logInfo(`change(value="hello world_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0019
     * @tc.name      CitySearch_CitySearchStateChange_0019
     * @tc.desc      CitySearchState.change(value="xhello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0019 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('xhello world');
      logInfo(`change(value="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="xhello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xhello world');
      logInfo(`change(value="xhello world") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0020
     * @tc.name      CitySearch_CitySearchStateChange_0020
     * @tc.desc      CitySearchState.change(value="   ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0020 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('   ');
      logInfo(`change(value="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="   ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('   ');
      logInfo(`change(value="   ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0021
     * @tc.name      CitySearch_CitySearchStateChange_0021
     * @tc.desc      CitySearchState.change(value="  ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0021 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('  ');
      logInfo(`change(value="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="  ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('  ');
      logInfo(`change(value="  ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0022
     * @tc.name      CitySearch_CitySearchStateChange_0022
     * @tc.desc      CitySearchState.change(value=" _1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0022 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' _1');
      logInfo(`change(value=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" _1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' _1');
      logInfo(`change(value=" _1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0023
     * @tc.name      CitySearch_CitySearchStateChange_0023
     * @tc.desc      CitySearchState.change(value="x ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0023 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('x ');
      logInfo(`change(value="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="x ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x ');
      logInfo(`change(value="x ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0024
     * @tc.name      CitySearch_CitySearchStateChange_0024
     * @tc.desc      CitySearchState.change(value=" A ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0024 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' A ');
      logInfo(`change(value=" A "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" A ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' A ');
      logInfo(`change(value=" A ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0025
     * @tc.name      CitySearch_CitySearchStateChange_0025
     * @tc.desc      CitySearchState.change(value="AA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0025 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('AA');
      logInfo(`change(value="AA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="AA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AA');
      logInfo(`change(value="AA") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0026
     * @tc.name      CitySearch_CitySearchStateChange_0026
     * @tc.desc      CitySearchState.change(value="A_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0026 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('A_1');
      logInfo(`change(value="A_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="A_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A_1');
      logInfo(`change(value="A_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0027
     * @tc.name      CitySearch_CitySearchStateChange_0027
     * @tc.desc      CitySearchState.change(value="xA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0027 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('xA');
      logInfo(`change(value="xA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="xA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xA');
      logInfo(`change(value="xA") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0028
     * @tc.name      CitySearch_CitySearchStateChange_0028
     * @tc.desc      CitySearchState.change(value=" Sample Title 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0028 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' Sample Title 123 ');
      logInfo(`change(value=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" Sample Title 123 ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Sample Title 123 ');
      logInfo(`change(value=" Sample Title 123 ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0029
     * @tc.name      CitySearch_CitySearchStateChange_0029
     * @tc.desc      CitySearchState.change(value="Sample Title 123Sample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0029 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Sample Title 123Sample Title 123');
      logInfo(`change(value="Sample Title 123Sample Titl...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Sample Title 123Sample Titl...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`change(value="Sample Title 123Sample Titl...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0030
     * @tc.name      CitySearch_CitySearchStateChange_0030
     * @tc.desc      CitySearchState.change(value="Sample Title 123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0030 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Sample Title 123_1');
      logInfo(`change(value="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Sample Title 123_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123_1');
      logInfo(`change(value="Sample Title 123_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0031
     * @tc.name      CitySearch_CitySearchStateChange_0031
     * @tc.desc      CitySearchState.change(value="xSample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0031 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('xSample Title 123');
      logInfo(`change(value="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="xSample Title 123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xSample Title 123');
      logInfo(`change(value="xSample Title 123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0032
     * @tc.name      CitySearch_CitySearchStateChange_0032
     * @tc.desc      CitySearchState.change(value=" ?? ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0032 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' \u4e2d\u6587 ');
      logInfo(`change(value=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" ?? ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' \u4e2d\u6587 ');
      logInfo(`change(value=" ?? ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0033
     * @tc.name      CitySearch_CitySearchStateChange_0033
     * @tc.desc      CitySearchState.change(value="????") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0033 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`change(value="????"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="????") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`change(value="????") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0034
     * @tc.name      CitySearch_CitySearchStateChange_0034
     * @tc.desc      CitySearchState.change(value="??_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0034 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('\u4e2d\u6587_1');
      logInfo(`change(value="??_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="??_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`change(value="??_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0035
     * @tc.name      CitySearch_CitySearchStateChange_0035
     * @tc.desc      CitySearchState.change(value="x??") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0035 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('x\u4e2d\u6587');
      logInfo(`change(value="x??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="x??") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x\u4e2d\u6587');
      logInfo(`change(value="x??") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0036
     * @tc.name      CitySearch_CitySearchStateChange_0036
     * @tc.desc      CitySearchState.change(value=" a ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0036 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' a ');
      logInfo(`change(value=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" a ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' a ');
      logInfo(`change(value=" a ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0037
     * @tc.name      CitySearch_CitySearchStateChange_0037
     * @tc.desc      CitySearchState.change(value="aa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0037 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('aa');
      logInfo(`change(value="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="aa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('aa');
      logInfo(`change(value="aa") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0038
     * @tc.name      CitySearch_CitySearchStateChange_0038
     * @tc.desc      CitySearchState.change(value="a_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0038 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('a_1');
      logInfo(`change(value="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="a_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a_1');
      logInfo(`change(value="a_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0039
     * @tc.name      CitySearch_CitySearchStateChange_0039
     * @tc.desc      CitySearchState.change(value="xa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0039 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('xa');
      logInfo(`change(value="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="xa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xa');
      logInfo(`change(value="xa") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0040
     * @tc.name      CitySearch_CitySearchStateChange_0040
     * @tc.desc      CitySearchState.change(value=" abc ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0040 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' abc ');
      logInfo(`change(value=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" abc ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' abc ');
      logInfo(`change(value=" abc ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0041
     * @tc.name      CitySearch_CitySearchStateChange_0041
     * @tc.desc      CitySearchState.change(value="abcabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0041 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('abcabc');
      logInfo(`change(value="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="abcabc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abcabc');
      logInfo(`change(value="abcabc") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0042
     * @tc.name      CitySearch_CitySearchStateChange_0042
     * @tc.desc      CitySearchState.change(value="abc_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0042 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('abc_1');
      logInfo(`change(value="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="abc_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc_1');
      logInfo(`change(value="abc_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0043
     * @tc.name      CitySearch_CitySearchStateChange_0043
     * @tc.desc      CitySearchState.change(value="xabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0043 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('xabc');
      logInfo(`change(value="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="xabc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xabc');
      logInfo(`change(value="xabc") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0044
     * @tc.name      CitySearch_CitySearchStateChange_0044
     * @tc.desc      CitySearchState.change(value=" Hello World ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0044 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' Hello World ');
      logInfo(`change(value=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" Hello World ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello World ');
      logInfo(`change(value=" Hello World ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0045
     * @tc.name      CitySearch_CitySearchStateChange_0045
     * @tc.desc      CitySearchState.change(value="Hello WorldHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0045 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Hello WorldHello World');
      logInfo(`change(value="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Hello WorldHello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello WorldHello World');
      logInfo(`change(value="Hello WorldHello World") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0046
     * @tc.name      CitySearch_CitySearchStateChange_0046
     * @tc.desc      CitySearchState.change(value="Hello World_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0046 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Hello World_1');
      logInfo(`change(value="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Hello World_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello World_1');
      logInfo(`change(value="Hello World_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0047
     * @tc.name      CitySearch_CitySearchStateChange_0047
     * @tc.desc      CitySearchState.change(value="xHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0047 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('xHello World');
      logInfo(`change(value="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="xHello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xHello World');
      logInfo(`change(value="xHello World") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0048
     * @tc.name      CitySearch_CitySearchStateChange_0048
     * @tc.desc      CitySearchState.change(value=" 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0048 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change(' 123 ');
      logInfo(`change(value=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value=" 123 ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' 123 ');
      logInfo(`change(value=" 123 ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0049
     * @tc.name      CitySearch_CitySearchStateChange_0049
     * @tc.desc      CitySearchState.change(value="123123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0049 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('123123');
      logInfo(`change(value="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="123123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123123');
      logInfo(`change(value="123123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0050
     * @tc.name      CitySearch_CitySearchStateChange_0050
     * @tc.desc      CitySearchState.change(value="123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0050 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('123_1');
      logInfo(`change(value="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="123_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123_1');
      logInfo(`change(value="123_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0051
     * @tc.name      CitySearch_CitySearchStateChange_0051
     * @tc.desc      CitySearchState.change(value="x123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateChange_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0051 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('x123');
      logInfo(`change(value="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="x123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x123');
      logInfo(`change(value="x123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0052
     * @tc.name      CitySearch_CitySearchStateChange_0052
     * @tc.desc      CitySearchState.change(value="G") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0052 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('G');
      logInfo(`change(value="G"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`change(value="G") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('G');
      logInfo(`change(value="G") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change(value="G") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`change(value="G") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList))
        .assertEqual('["\u5e7f\u5dde","\u6842\u6797","\u8d63\u5dde","\u9ad8\u96c4"]');
      logInfo(`${BUNDLE}CitySearchStateChange_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0053
     * @tc.name      CitySearch_CitySearchStateChange_0053
     * @tc.desc      CitySearchState.change(value="PInSF7WAE") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0053 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('PInSF7WAE');
      logInfo(`change(value="PInSF7WAE"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="PInSF7WAE") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('PInSF7WAE');
      logInfo(`change(value="PInSF7WAE") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0054
     * @tc.name      CitySearch_CitySearchStateChange_0054
     * @tc.desc      CitySearchState.change(value="sZDQ3oPmUSP") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0054 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('sZDQ3oPmUSP');
      logInfo(`change(value="sZDQ3oPmUSP"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="sZDQ3oPmUSP") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sZDQ3oPmUSP');
      logInfo(`change(value="sZDQ3oPmUSP") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0055
     * @tc.name      CitySearch_CitySearchStateChange_0055
     * @tc.desc      CitySearchState.change(value="vlDmP39Eoi") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0055 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('vlDmP39Eoi');
      logInfo(`change(value="vlDmP39Eoi"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="vlDmP39Eoi") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vlDmP39Eoi');
      logInfo(`change(value="vlDmP39Eoi") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0056
     * @tc.name      CitySearch_CitySearchStateChange_0056
     * @tc.desc      CitySearchState.change(value="NNBSt") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0056 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('NNBSt');
      logInfo(`change(value="NNBSt"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="NNBSt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('NNBSt');
      logInfo(`change(value="NNBSt") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0057
     * @tc.name      CitySearch_CitySearchStateChange_0057
     * @tc.desc      CitySearchState.change(value="VeN") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0057 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('VeN');
      logInfo(`change(value="VeN"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="VeN") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VeN');
      logInfo(`change(value="VeN") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0058
     * @tc.name      CitySearch_CitySearchStateChange_0058
     * @tc.desc      CitySearchState.change(value="TlfMSPr") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0058 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('TlfMSPr');
      logInfo(`change(value="TlfMSPr"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="TlfMSPr") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('TlfMSPr');
      logInfo(`change(value="TlfMSPr") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0059
     * @tc.name      CitySearch_CitySearchStateChange_0059
     * @tc.desc      CitySearchState.change(value="jVg8") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0059 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('jVg8');
      logInfo(`change(value="jVg8"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="jVg8") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('jVg8');
      logInfo(`change(value="jVg8") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0060
     * @tc.name      CitySearch_CitySearchStateChange_0060
     * @tc.desc      CitySearchState.change(value="d9") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0060 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('d9');
      logInfo(`change(value="d9"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="d9") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('d9');
      logInfo(`change(value="d9") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0061
     * @tc.name      CitySearch_CitySearchStateChange_0061
     * @tc.desc      CitySearchState.change(value="2hhe1S") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0061 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('2hhe1S');
      logInfo(`change(value="2hhe1S"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="2hhe1S") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2hhe1S');
      logInfo(`change(value="2hhe1S") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0062
     * @tc.name      CitySearch_CitySearchStateChange_0062
     * @tc.desc      CitySearchState.change(value="0yFrHybA5Ymu") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0062 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('0yFrHybA5Ymu');
      logInfo(`change(value="0yFrHybA5Ymu"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="0yFrHybA5Ymu") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0yFrHybA5Ymu');
      logInfo(`change(value="0yFrHybA5Ymu") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0063
     * @tc.name      CitySearch_CitySearchStateChange_0063
     * @tc.desc      CitySearchState.change(value="gqokTMQMHTxs") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0063 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('gqokTMQMHTxs');
      logInfo(`change(value="gqokTMQMHTxs"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="gqokTMQMHTxs") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('gqokTMQMHTxs');
      logInfo(`change(value="gqokTMQMHTxs") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0064
     * @tc.name      CitySearch_CitySearchStateChange_0064
     * @tc.desc      CitySearchState.change(value="ZubFQc2") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0064 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('ZubFQc2');
      logInfo(`change(value="ZubFQc2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="ZubFQc2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZubFQc2');
      logInfo(`change(value="ZubFQc2") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0065
     * @tc.name      CitySearch_CitySearchStateChange_0065
     * @tc.desc      CitySearchState.change(value="Jieh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0065 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Jieh');
      logInfo(`change(value="Jieh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Jieh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Jieh');
      logInfo(`change(value="Jieh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0066
     * @tc.name      CitySearch_CitySearchStateChange_0066
     * @tc.desc      CitySearchState.change(value="P6X64He") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0066 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('P6X64He');
      logInfo(`change(value="P6X64He"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="P6X64He") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('P6X64He');
      logInfo(`change(value="P6X64He") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0067
     * @tc.name      CitySearch_CitySearchStateChange_0067
     * @tc.desc      CitySearchState.change(value="jTRk3aHm5xK") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0067 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('jTRk3aHm5xK');
      logInfo(`change(value="jTRk3aHm5xK"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="jTRk3aHm5xK") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('jTRk3aHm5xK');
      logInfo(`change(value="jTRk3aHm5xK") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0068
     * @tc.name      CitySearch_CitySearchStateChange_0068
     * @tc.desc      CitySearchState.change(value="NIl") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0068 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('NIl');
      logInfo(`change(value="NIl"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="NIl") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('NIl');
      logInfo(`change(value="NIl") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0069
     * @tc.name      CitySearch_CitySearchStateChange_0069
     * @tc.desc      CitySearchState.change(value="MUZJYhM") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0069 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('MUZJYhM');
      logInfo(`change(value="MUZJYhM"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="MUZJYhM") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('MUZJYhM');
      logInfo(`change(value="MUZJYhM") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0070
     * @tc.name      CitySearch_CitySearchStateChange_0070
     * @tc.desc      CitySearchState.change(value="lpVfjzGAh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0070 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('lpVfjzGAh');
      logInfo(`change(value="lpVfjzGAh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="lpVfjzGAh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lpVfjzGAh');
      logInfo(`change(value="lpVfjzGAh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0071
     * @tc.name      CitySearch_CitySearchStateChange_0071
     * @tc.desc      CitySearchState.change(value="ixY4q2U") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0071 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('ixY4q2U');
      logInfo(`change(value="ixY4q2U"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="ixY4q2U") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ixY4q2U');
      logInfo(`change(value="ixY4q2U") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0072
     * @tc.name      CitySearch_CitySearchStateChange_0072
     * @tc.desc      CitySearchState.change(value="Wjb") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0072 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Wjb');
      logInfo(`change(value="Wjb"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Wjb") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Wjb');
      logInfo(`change(value="Wjb") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0072 end`);
    });
  });
}
