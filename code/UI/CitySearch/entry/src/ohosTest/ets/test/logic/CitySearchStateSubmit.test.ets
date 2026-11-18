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

/** Logic checks for CitySearchState.submit (66 cases). */
export default function citySearchStateSubmitTest(): void {
  describe('CitySearchStateSubmitTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0001
     * @tc.name      CitySearch_CitySearchStateSubmit_0001
     * @tc.desc      CitySearchState.submit(value="Hello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStateSubmit_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0001 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Hello');
      logInfo(`submit(value="Hello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Hello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`submit(value="Hello") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Hello") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0002
     * @tc.name      CitySearch_CitySearchStateSubmit_0002
     * @tc.desc      CitySearchState.submit(value="hello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStateSubmit_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0002 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('hello world');
      logInfo(`submit(value="hello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="hello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello world');
      logInfo(`submit(value="hello world") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="hello world") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0003
     * @tc.name      CitySearch_CitySearchStateSubmit_0003
     * @tc.desc      CitySearchState.submit(value="") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0003 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('');
      logInfo(`submit(value=""): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`submit(value="") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u957f\u6c99');
      logInfo(`submit(value="") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(1);
      logInfo(`submit(value="") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u957f\u6c99"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0004
     * @tc.name      CitySearch_CitySearchStateSubmit_0004
     * @tc.desc      CitySearchState.submit(value=" ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0004 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' ');
      logInfo(`submit(value=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' ');
      logInfo(`submit(value=" ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0005
     * @tc.name      CitySearch_CitySearchStateSubmit_0005
     * @tc.desc      CitySearchState.submit(value="A") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0005 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('A');
      logInfo(`submit(value="A"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`submit(value="A") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A');
      logInfo(`submit(value="A") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="A") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`submit(value="A") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`submit(value="A") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0006
     * @tc.name      CitySearch_CitySearchStateSubmit_0006
     * @tc.desc      CitySearchState.submit(value="Sample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0006 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Sample Title 123');
      logInfo(`submit(value="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Sample Title 123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123');
      logInfo(`submit(value="Sample Title 123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Sample Title 123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0007
     * @tc.name      CitySearch_CitySearchStateSubmit_0007
     * @tc.desc      CitySearchState.submit(value="??") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0007 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('\u4e2d\u6587');
      logInfo(`submit(value="??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="??") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587');
      logInfo(`submit(value="??") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="??") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0008
     * @tc.name      CitySearch_CitySearchStateSubmit_0008
     * @tc.desc      CitySearchState.submit(value="a") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0008 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('a');
      logInfo(`submit(value="a"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`submit(value="a") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a');
      logInfo(`submit(value="a") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="a") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`submit(value="a") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`submit(value="a") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0009
     * @tc.name      CitySearch_CitySearchStateSubmit_0009
     * @tc.desc      CitySearchState.submit(value="abc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0009 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('abc');
      logInfo(`submit(value="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="abc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc');
      logInfo(`submit(value="abc") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="abc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0010
     * @tc.name      CitySearch_CitySearchStateSubmit_0010
     * @tc.desc      CitySearchState.submit(value="Hello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0010 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Hello World');
      logInfo(`submit(value="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Hello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello World');
      logInfo(`submit(value="Hello World") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Hello World") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0011
     * @tc.name      CitySearch_CitySearchStateSubmit_0011
     * @tc.desc      CitySearchState.submit(value="123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0011 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('123');
      logInfo(`submit(value="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123');
      logInfo(`submit(value="123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0012
     * @tc.name      CitySearch_CitySearchStateSubmit_0012
     * @tc.desc      CitySearchState.submit(value=" Hello ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0012 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' Hello ');
      logInfo(`submit(value=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" Hello ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello ');
      logInfo(`submit(value=" Hello ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" Hello ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0013
     * @tc.name      CitySearch_CitySearchStateSubmit_0013
     * @tc.desc      CitySearchState.submit(value="HelloHello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0013 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('HelloHello');
      logInfo(`submit(value="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="HelloHello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HelloHello');
      logInfo(`submit(value="HelloHello") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="HelloHello") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0014
     * @tc.name      CitySearch_CitySearchStateSubmit_0014
     * @tc.desc      CitySearchState.submit(value="Hello_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0014 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Hello_1');
      logInfo(`submit(value="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Hello_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello_1');
      logInfo(`submit(value="Hello_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Hello_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0015
     * @tc.name      CitySearch_CitySearchStateSubmit_0015
     * @tc.desc      CitySearchState.submit(value="xHello") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0015 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xHello');
      logInfo(`submit(value="xHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xHello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xHello');
      logInfo(`submit(value="xHello") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xHello") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0016
     * @tc.name      CitySearch_CitySearchStateSubmit_0016
     * @tc.desc      CitySearchState.submit(value=" hello world ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0016 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' hello world ');
      logInfo(`submit(value=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" hello world ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' hello world ');
      logInfo(`submit(value=" hello world ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" hello world ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0017
     * @tc.name      CitySearch_CitySearchStateSubmit_0017
     * @tc.desc      CitySearchState.submit(value="hello worldhello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0017 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('hello worldhello world');
      logInfo(`submit(value="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="hello worldhello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello worldhello world');
      logInfo(`submit(value="hello worldhello world") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="hello worldhello world") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0018
     * @tc.name      CitySearch_CitySearchStateSubmit_0018
     * @tc.desc      CitySearchState.submit(value="hello world_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0018 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('hello world_1');
      logInfo(`submit(value="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="hello world_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello world_1');
      logInfo(`submit(value="hello world_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="hello world_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0019
     * @tc.name      CitySearch_CitySearchStateSubmit_0019
     * @tc.desc      CitySearchState.submit(value="xhello world") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0019 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xhello world');
      logInfo(`submit(value="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xhello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xhello world');
      logInfo(`submit(value="xhello world") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xhello world") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0020
     * @tc.name      CitySearch_CitySearchStateSubmit_0020
     * @tc.desc      CitySearchState.submit(value="   ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0020 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('   ');
      logInfo(`submit(value="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="   ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('   ');
      logInfo(`submit(value="   ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="   ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0021
     * @tc.name      CitySearch_CitySearchStateSubmit_0021
     * @tc.desc      CitySearchState.submit(value="  ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0021 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('  ');
      logInfo(`submit(value="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="  ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('  ');
      logInfo(`submit(value="  ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="  ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0022
     * @tc.name      CitySearch_CitySearchStateSubmit_0022
     * @tc.desc      CitySearchState.submit(value=" _1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0022 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' _1');
      logInfo(`submit(value=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" _1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' _1');
      logInfo(`submit(value=" _1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" _1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0023
     * @tc.name      CitySearch_CitySearchStateSubmit_0023
     * @tc.desc      CitySearchState.submit(value="x ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0023 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('x ');
      logInfo(`submit(value="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="x ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x ');
      logInfo(`submit(value="x ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="x ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0024
     * @tc.name      CitySearch_CitySearchStateSubmit_0024
     * @tc.desc      CitySearchState.submit(value=" A ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0024 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' A ');
      logInfo(`submit(value=" A "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" A ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' A ');
      logInfo(`submit(value=" A ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" A ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0025
     * @tc.name      CitySearch_CitySearchStateSubmit_0025
     * @tc.desc      CitySearchState.submit(value="AA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0025 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('AA');
      logInfo(`submit(value="AA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="AA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AA');
      logInfo(`submit(value="AA") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="AA") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0026
     * @tc.name      CitySearch_CitySearchStateSubmit_0026
     * @tc.desc      CitySearchState.submit(value="A_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0026 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('A_1');
      logInfo(`submit(value="A_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="A_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A_1');
      logInfo(`submit(value="A_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="A_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0027
     * @tc.name      CitySearch_CitySearchStateSubmit_0027
     * @tc.desc      CitySearchState.submit(value="xA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0027 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xA');
      logInfo(`submit(value="xA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xA');
      logInfo(`submit(value="xA") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xA") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0028
     * @tc.name      CitySearch_CitySearchStateSubmit_0028
     * @tc.desc      CitySearchState.submit(value=" Sample Title 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0028 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' Sample Title 123 ');
      logInfo(`submit(value=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" Sample Title 123 ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Sample Title 123 ');
      logInfo(`submit(value=" Sample Title 123 ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" Sample Title 123 ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0029
     * @tc.name      CitySearch_CitySearchStateSubmit_0029
     * @tc.desc      CitySearchState.submit(value="Sample Title 123Sample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0029 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Sample Title 123Sample Title 123');
      logInfo(`submit(value="Sample Title 123Sample Titl...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Sample Title 123Sample Titl...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`submit(value="Sample Title 123Sample Titl...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Sample Title 123Sample Titl...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0030
     * @tc.name      CitySearch_CitySearchStateSubmit_0030
     * @tc.desc      CitySearchState.submit(value="Sample Title 123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0030 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Sample Title 123_1');
      logInfo(`submit(value="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Sample Title 123_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123_1');
      logInfo(`submit(value="Sample Title 123_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Sample Title 123_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0031
     * @tc.name      CitySearch_CitySearchStateSubmit_0031
     * @tc.desc      CitySearchState.submit(value="xSample Title 123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0031 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xSample Title 123');
      logInfo(`submit(value="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xSample Title 123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xSample Title 123');
      logInfo(`submit(value="xSample Title 123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xSample Title 123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0032
     * @tc.name      CitySearch_CitySearchStateSubmit_0032
     * @tc.desc      CitySearchState.submit(value=" ?? ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0032 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' \u4e2d\u6587 ');
      logInfo(`submit(value=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" ?? ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' \u4e2d\u6587 ');
      logInfo(`submit(value=" ?? ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" ?? ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0033
     * @tc.name      CitySearch_CitySearchStateSubmit_0033
     * @tc.desc      CitySearchState.submit(value="????") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0033 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`submit(value="????"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="????") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`submit(value="????") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="????") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0034
     * @tc.name      CitySearch_CitySearchStateSubmit_0034
     * @tc.desc      CitySearchState.submit(value="??_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0034 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('\u4e2d\u6587_1');
      logInfo(`submit(value="??_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="??_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`submit(value="??_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="??_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0035
     * @tc.name      CitySearch_CitySearchStateSubmit_0035
     * @tc.desc      CitySearchState.submit(value="x??") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0035 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('x\u4e2d\u6587');
      logInfo(`submit(value="x??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="x??") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x\u4e2d\u6587');
      logInfo(`submit(value="x??") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="x??") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0036
     * @tc.name      CitySearch_CitySearchStateSubmit_0036
     * @tc.desc      CitySearchState.submit(value=" a ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0036 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' a ');
      logInfo(`submit(value=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" a ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' a ');
      logInfo(`submit(value=" a ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" a ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0037
     * @tc.name      CitySearch_CitySearchStateSubmit_0037
     * @tc.desc      CitySearchState.submit(value="aa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0037 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('aa');
      logInfo(`submit(value="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="aa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('aa');
      logInfo(`submit(value="aa") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="aa") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0038
     * @tc.name      CitySearch_CitySearchStateSubmit_0038
     * @tc.desc      CitySearchState.submit(value="a_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0038 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('a_1');
      logInfo(`submit(value="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="a_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a_1');
      logInfo(`submit(value="a_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="a_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0039
     * @tc.name      CitySearch_CitySearchStateSubmit_0039
     * @tc.desc      CitySearchState.submit(value="xa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0039 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xa');
      logInfo(`submit(value="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xa');
      logInfo(`submit(value="xa") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xa") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0040
     * @tc.name      CitySearch_CitySearchStateSubmit_0040
     * @tc.desc      CitySearchState.submit(value=" abc ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0040 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' abc ');
      logInfo(`submit(value=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" abc ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' abc ');
      logInfo(`submit(value=" abc ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" abc ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0041
     * @tc.name      CitySearch_CitySearchStateSubmit_0041
     * @tc.desc      CitySearchState.submit(value="abcabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0041 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('abcabc');
      logInfo(`submit(value="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="abcabc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abcabc');
      logInfo(`submit(value="abcabc") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="abcabc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0042
     * @tc.name      CitySearch_CitySearchStateSubmit_0042
     * @tc.desc      CitySearchState.submit(value="abc_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0042 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('abc_1');
      logInfo(`submit(value="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="abc_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc_1');
      logInfo(`submit(value="abc_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="abc_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0043
     * @tc.name      CitySearch_CitySearchStateSubmit_0043
     * @tc.desc      CitySearchState.submit(value="xabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0043 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xabc');
      logInfo(`submit(value="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xabc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xabc');
      logInfo(`submit(value="xabc") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xabc") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0044
     * @tc.name      CitySearch_CitySearchStateSubmit_0044
     * @tc.desc      CitySearchState.submit(value=" Hello World ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0044 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' Hello World ');
      logInfo(`submit(value=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" Hello World ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello World ');
      logInfo(`submit(value=" Hello World ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" Hello World ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0045
     * @tc.name      CitySearch_CitySearchStateSubmit_0045
     * @tc.desc      CitySearchState.submit(value="Hello WorldHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0045 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Hello WorldHello World');
      logInfo(`submit(value="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Hello WorldHello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello WorldHello World');
      logInfo(`submit(value="Hello WorldHello World") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Hello WorldHello World") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0046
     * @tc.name      CitySearch_CitySearchStateSubmit_0046
     * @tc.desc      CitySearchState.submit(value="Hello World_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0046 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Hello World_1');
      logInfo(`submit(value="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Hello World_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello World_1');
      logInfo(`submit(value="Hello World_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Hello World_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0047
     * @tc.name      CitySearch_CitySearchStateSubmit_0047
     * @tc.desc      CitySearchState.submit(value="xHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0047 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xHello World');
      logInfo(`submit(value="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xHello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xHello World');
      logInfo(`submit(value="xHello World") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xHello World") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0048
     * @tc.name      CitySearch_CitySearchStateSubmit_0048
     * @tc.desc      CitySearchState.submit(value=" 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0048 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit(' 123 ');
      logInfo(`submit(value=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value=" 123 ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' 123 ');
      logInfo(`submit(value=" 123 ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value=" 123 ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0049
     * @tc.name      CitySearch_CitySearchStateSubmit_0049
     * @tc.desc      CitySearchState.submit(value="123123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0049 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('123123');
      logInfo(`submit(value="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="123123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123123');
      logInfo(`submit(value="123123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="123123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0050
     * @tc.name      CitySearch_CitySearchStateSubmit_0050
     * @tc.desc      CitySearchState.submit(value="123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0050 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('123_1');
      logInfo(`submit(value="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="123_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123_1');
      logInfo(`submit(value="123_1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="123_1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0051
     * @tc.name      CitySearch_CitySearchStateSubmit_0051
     * @tc.desc      CitySearchState.submit(value="x123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStateSubmit_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0051 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('x123');
      logInfo(`submit(value="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="x123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x123');
      logInfo(`submit(value="x123") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="x123") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0052
     * @tc.name      CitySearch_CitySearchStateSubmit_0052
     * @tc.desc      CitySearchState.submit(value="DwO7Z2qNbt") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0052 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('DwO7Z2qNbt');
      logInfo(`submit(value="DwO7Z2qNbt"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="DwO7Z2qNbt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DwO7Z2qNbt');
      logInfo(`submit(value="DwO7Z2qNbt") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="DwO7Z2qNbt") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0053
     * @tc.name      CitySearch_CitySearchStateSubmit_0053
     * @tc.desc      CitySearchState.submit(value="xDJ2487JC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0053 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xDJ2487JC');
      logInfo(`submit(value="xDJ2487JC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xDJ2487JC") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xDJ2487JC');
      logInfo(`submit(value="xDJ2487JC") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xDJ2487JC") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0054
     * @tc.name      CitySearch_CitySearchStateSubmit_0054
     * @tc.desc      CitySearchState.submit(value="iQPRvYLttb2") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0054 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('iQPRvYLttb2');
      logInfo(`submit(value="iQPRvYLttb2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="iQPRvYLttb2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iQPRvYLttb2');
      logInfo(`submit(value="iQPRvYLttb2") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="iQPRvYLttb2") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0055
     * @tc.name      CitySearch_CitySearchStateSubmit_0055
     * @tc.desc      CitySearchState.submit(value="9fB9Fi74OgV") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0055 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('9fB9Fi74OgV');
      logInfo(`submit(value="9fB9Fi74OgV"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="9fB9Fi74OgV") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('9fB9Fi74OgV');
      logInfo(`submit(value="9fB9Fi74OgV") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="9fB9Fi74OgV") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0056
     * @tc.name      CitySearch_CitySearchStateSubmit_0056
     * @tc.desc      CitySearchState.submit(value="v") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0056 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('v');
      logInfo(`submit(value="v"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="v") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('v');
      logInfo(`submit(value="v") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="v") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0057
     * @tc.name      CitySearch_CitySearchStateSubmit_0057
     * @tc.desc      CitySearchState.submit(value="iSQqJBzTC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0057 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('iSQqJBzTC');
      logInfo(`submit(value="iSQqJBzTC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="iSQqJBzTC") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iSQqJBzTC');
      logInfo(`submit(value="iSQqJBzTC") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="iSQqJBzTC") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0058
     * @tc.name      CitySearch_CitySearchStateSubmit_0058
     * @tc.desc      CitySearchState.submit(value="Qwc2FloCPthG") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0058 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Qwc2FloCPthG');
      logInfo(`submit(value="Qwc2FloCPthG"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Qwc2FloCPthG") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Qwc2FloCPthG');
      logInfo(`submit(value="Qwc2FloCPthG") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Qwc2FloCPthG") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0059
     * @tc.name      CitySearch_CitySearchStateSubmit_0059
     * @tc.desc      CitySearchState.submit(value="6PML") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0059 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('6PML');
      logInfo(`submit(value="6PML"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="6PML") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6PML');
      logInfo(`submit(value="6PML") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="6PML") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0060
     * @tc.name      CitySearch_CitySearchStateSubmit_0060
     * @tc.desc      CitySearchState.submit(value="yFinC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0060 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('yFinC');
      logInfo(`submit(value="yFinC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="yFinC") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yFinC');
      logInfo(`submit(value="yFinC") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="yFinC") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0061
     * @tc.name      CitySearch_CitySearchStateSubmit_0061
     * @tc.desc      CitySearchState.submit(value="iOq9fuyuVO") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0061 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('iOq9fuyuVO');
      logInfo(`submit(value="iOq9fuyuVO"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="iOq9fuyuVO") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iOq9fuyuVO');
      logInfo(`submit(value="iOq9fuyuVO") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="iOq9fuyuVO") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0062
     * @tc.name      CitySearch_CitySearchStateSubmit_0062
     * @tc.desc      CitySearchState.submit(value="yuv9k6VnT") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0062 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('yuv9k6VnT');
      logInfo(`submit(value="yuv9k6VnT"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="yuv9k6VnT") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yuv9k6VnT');
      logInfo(`submit(value="yuv9k6VnT") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="yuv9k6VnT") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0063
     * @tc.name      CitySearch_CitySearchStateSubmit_0063
     * @tc.desc      CitySearchState.submit(value="XHQn6") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0063 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('XHQn6');
      logInfo(`submit(value="XHQn6"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="XHQn6") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XHQn6');
      logInfo(`submit(value="XHQn6") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="XHQn6") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0064
     * @tc.name      CitySearch_CitySearchStateSubmit_0064
     * @tc.desc      CitySearchState.submit(value="ROYbF9iL") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0064 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('ROYbF9iL');
      logInfo(`submit(value="ROYbF9iL"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="ROYbF9iL") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ROYbF9iL');
      logInfo(`submit(value="ROYbF9iL") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="ROYbF9iL") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0065
     * @tc.name      CitySearch_CitySearchStateSubmit_0065
     * @tc.desc      CitySearchState.submit(value="sr7pIiZXyh") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0065 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('sr7pIiZXyh');
      logInfo(`submit(value="sr7pIiZXyh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="sr7pIiZXyh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sr7pIiZXyh');
      logInfo(`submit(value="sr7pIiZXyh") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="sr7pIiZXyh") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0066
     * @tc.name      CitySearch_CitySearchStateSubmit_0066
     * @tc.desc      CitySearchState.submit(value="BPE") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0066 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('BPE');
      logInfo(`submit(value="BPE"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="BPE") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('BPE');
      logInfo(`submit(value="BPE") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="BPE") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0066 end`);
    });
  });
}
