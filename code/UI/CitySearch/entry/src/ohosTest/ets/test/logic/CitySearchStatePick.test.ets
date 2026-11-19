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

/** Logic checks for CitySearchState.pick (81 cases). */
export default function citySearchStatePickTest(): void {
  describe('CitySearchStatePickTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0001
     * @tc.name      CitySearch_CitySearchStatePick_0001
     * @tc.desc      CitySearchState.pick(name="Hello") yields "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStatePick_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0001 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Hello');
      logInfo(`pick(name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`pick(name="Hello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`${BUNDLE}CitySearchStatePick_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0002
     * @tc.name      CitySearch_CitySearchStatePick_0002
     * @tc.desc      CitySearchState.pick(name="hello world") yields "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStatePick_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0002 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('hello world');
      logInfo(`pick(name="hello world"): actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`pick(name="hello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello world');
      logInfo(`${BUNDLE}CitySearchStatePick_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0003
     * @tc.name      CitySearch_CitySearchStatePick_0003
     * @tc.desc      CitySearchState.pick(name="") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0003 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('');
      logInfo(`pick(name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePick_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0004
     * @tc.name      CitySearch_CitySearchStatePick_0004
     * @tc.desc      CitySearchState.pick(name=" ") yields " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0004 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' ');
      logInfo(`pick(name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`pick(name=" ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' ');
      logInfo(`${BUNDLE}CitySearchStatePick_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0005
     * @tc.name      CitySearch_CitySearchStatePick_0005
     * @tc.desc      CitySearchState.pick(name="A") yields "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0005 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('A');
      logInfo(`pick(name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`pick(name="A") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A');
      logInfo(`${BUNDLE}CitySearchStatePick_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0006
     * @tc.name      CitySearch_CitySearchStatePick_0006
     * @tc.desc      CitySearchState.pick(name="Sample Title 123") yields "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0006 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Sample Title 123');
      logInfo(`pick(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`pick(name="Sample Title 123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}CitySearchStatePick_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0007
     * @tc.name      CitySearch_CitySearchStatePick_0007
     * @tc.desc      CitySearchState.pick(name="??") yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0007 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('\u4e2d\u6587');
      logInfo(`pick(name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`pick(name="??") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}CitySearchStatePick_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0008
     * @tc.name      CitySearch_CitySearchStatePick_0008
     * @tc.desc      CitySearchState.pick(name="a") yields "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0008 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('a');
      logInfo(`pick(name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`pick(name="a") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a');
      logInfo(`${BUNDLE}CitySearchStatePick_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0009
     * @tc.name      CitySearch_CitySearchStatePick_0009
     * @tc.desc      CitySearchState.pick(name="abc") yields "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0009 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('abc');
      logInfo(`pick(name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`pick(name="abc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc');
      logInfo(`${BUNDLE}CitySearchStatePick_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0010
     * @tc.name      CitySearch_CitySearchStatePick_0010
     * @tc.desc      CitySearchState.pick(name="Hello World") yields "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0010 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Hello World');
      logInfo(`pick(name="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`pick(name="Hello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello World');
      logInfo(`${BUNDLE}CitySearchStatePick_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0011
     * @tc.name      CitySearch_CitySearchStatePick_0011
     * @tc.desc      CitySearchState.pick(name="123") yields "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0011 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('123');
      logInfo(`pick(name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`pick(name="123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123');
      logInfo(`${BUNDLE}CitySearchStatePick_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0012
     * @tc.name      CitySearch_CitySearchStatePick_0012
     * @tc.desc      CitySearchState.pick(name=" Hello ") yields " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0012 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' Hello ');
      logInfo(`pick(name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`pick(name=" Hello ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello ');
      logInfo(`${BUNDLE}CitySearchStatePick_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0013
     * @tc.name      CitySearch_CitySearchStatePick_0013
     * @tc.desc      CitySearchState.pick(name="HelloHello") yields "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0013 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('HelloHello');
      logInfo(`pick(name="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`pick(name="HelloHello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HelloHello');
      logInfo(`${BUNDLE}CitySearchStatePick_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0014
     * @tc.name      CitySearch_CitySearchStatePick_0014
     * @tc.desc      CitySearchState.pick(name="Hello_1") yields "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0014 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Hello_1');
      logInfo(`pick(name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`pick(name="Hello_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0015
     * @tc.name      CitySearch_CitySearchStatePick_0015
     * @tc.desc      CitySearchState.pick(name="xHello") yields "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0015 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('xHello');
      logInfo(`pick(name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`pick(name="xHello") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xHello');
      logInfo(`${BUNDLE}CitySearchStatePick_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0016
     * @tc.name      CitySearch_CitySearchStatePick_0016
     * @tc.desc      CitySearchState.pick(name=" hello world ") yields " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0016 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' hello world ');
      logInfo(`pick(name=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`pick(name=" hello world ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' hello world ');
      logInfo(`${BUNDLE}CitySearchStatePick_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0017
     * @tc.name      CitySearch_CitySearchStatePick_0017
     * @tc.desc      CitySearchState.pick(name="hello worldhello world") yields "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0017 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('hello worldhello world');
      logInfo(`pick(name="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`pick(name="hello worldhello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}CitySearchStatePick_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0018
     * @tc.name      CitySearch_CitySearchStatePick_0018
     * @tc.desc      CitySearchState.pick(name="hello world_1") yields "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0018 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('hello world_1');
      logInfo(`pick(name="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`pick(name="hello world_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello world_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0019
     * @tc.name      CitySearch_CitySearchStatePick_0019
     * @tc.desc      CitySearchState.pick(name="xhello world") yields "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0019 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('xhello world');
      logInfo(`pick(name="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`pick(name="xhello world") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xhello world');
      logInfo(`${BUNDLE}CitySearchStatePick_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0020
     * @tc.name      CitySearch_CitySearchStatePick_0020
     * @tc.desc      CitySearchState.pick(name="   ") yields "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0020 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('   ');
      logInfo(`pick(name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`pick(name="   ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('   ');
      logInfo(`${BUNDLE}CitySearchStatePick_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0021
     * @tc.name      CitySearch_CitySearchStatePick_0021
     * @tc.desc      CitySearchState.pick(name="  ") yields "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0021 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('  ');
      logInfo(`pick(name="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`pick(name="  ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('  ');
      logInfo(`${BUNDLE}CitySearchStatePick_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0022
     * @tc.name      CitySearch_CitySearchStatePick_0022
     * @tc.desc      CitySearchState.pick(name=" _1") yields " _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0022 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' _1');
      logInfo(`pick(name=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _1');
      logInfo(`pick(name=" _1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' _1');
      logInfo(`${BUNDLE}CitySearchStatePick_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0023
     * @tc.name      CitySearch_CitySearchStatePick_0023
     * @tc.desc      CitySearchState.pick(name="x ") yields "x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0023 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('x ');
      logInfo(`pick(name="x "): actual=${actual}`);
      expect(actual).assertEqual('x ');
      logInfo(`pick(name="x ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x ');
      logInfo(`${BUNDLE}CitySearchStatePick_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0024
     * @tc.name      CitySearch_CitySearchStatePick_0024
     * @tc.desc      CitySearchState.pick(name=" A ") yields " A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0024 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' A ');
      logInfo(`pick(name=" A "): actual=${actual}`);
      expect(actual).assertEqual(' A ');
      logInfo(`pick(name=" A ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' A ');
      logInfo(`${BUNDLE}CitySearchStatePick_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0025
     * @tc.name      CitySearch_CitySearchStatePick_0025
     * @tc.desc      CitySearchState.pick(name="AA") yields "AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0025 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('AA');
      logInfo(`pick(name="AA"): actual=${actual}`);
      expect(actual).assertEqual('AA');
      logInfo(`pick(name="AA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AA');
      logInfo(`${BUNDLE}CitySearchStatePick_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0026
     * @tc.name      CitySearch_CitySearchStatePick_0026
     * @tc.desc      CitySearchState.pick(name="A_1") yields "A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0026 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('A_1');
      logInfo(`pick(name="A_1"): actual=${actual}`);
      expect(actual).assertEqual('A_1');
      logInfo(`pick(name="A_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0027
     * @tc.name      CitySearch_CitySearchStatePick_0027
     * @tc.desc      CitySearchState.pick(name="xA") yields "xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0027 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('xA');
      logInfo(`pick(name="xA"): actual=${actual}`);
      expect(actual).assertEqual('xA');
      logInfo(`pick(name="xA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xA');
      logInfo(`${BUNDLE}CitySearchStatePick_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0028
     * @tc.name      CitySearch_CitySearchStatePick_0028
     * @tc.desc      CitySearchState.pick(name=" Sample Title 123 ") yields " Sample Title 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0028 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' Sample Title 123 ');
      logInfo(`pick(name=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual(' Sample Title 123 ');
      logInfo(`pick(name=" Sample Title 123 ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Sample Title 123 ');
      logInfo(`${BUNDLE}CitySearchStatePick_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0029
     * @tc.name      CitySearch_CitySearchStatePick_0029
     * @tc.desc      CitySearchState.pick(name="Sample Title 123Sample Title 123") yields "Sample Title 123Sample Tit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0029 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Sample Title 123Sample Title 123');
      logInfo(`pick(name="Sample Title 123Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`pick(name="Sample Title 123Sample Title 1...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}CitySearchStatePick_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0030
     * @tc.name      CitySearch_CitySearchStatePick_0030
     * @tc.desc      CitySearchState.pick(name="Sample Title 123_1") yields "Sample Title 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0030 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Sample Title 123_1');
      logInfo(`pick(name="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123_1');
      logInfo(`pick(name="Sample Title 123_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0031
     * @tc.name      CitySearch_CitySearchStatePick_0031
     * @tc.desc      CitySearchState.pick(name="xSample Title 123") yields "xSample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0031 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('xSample Title 123');
      logInfo(`pick(name="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('xSample Title 123');
      logInfo(`pick(name="xSample Title 123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xSample Title 123');
      logInfo(`${BUNDLE}CitySearchStatePick_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0032
     * @tc.name      CitySearch_CitySearchStatePick_0032
     * @tc.desc      CitySearchState.pick(name=" ?? ") yields " ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0032 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' \u4e2d\u6587 ');
      logInfo(`pick(name=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(' \u4e2d\u6587 ');
      logInfo(`pick(name=" ?? ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}CitySearchStatePick_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0033
     * @tc.name      CitySearch_CitySearchStatePick_0033
     * @tc.desc      CitySearchState.pick(name="????") yields "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0033 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`pick(name="????"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`pick(name="????") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}CitySearchStatePick_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0034
     * @tc.name      CitySearch_CitySearchStatePick_0034
     * @tc.desc      CitySearchState.pick(name="??_1") yields "??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0034 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('\u4e2d\u6587_1');
      logInfo(`pick(name="??_1"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587_1');
      logInfo(`pick(name="??_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0035
     * @tc.name      CitySearch_CitySearchStatePick_0035
     * @tc.desc      CitySearchState.pick(name="x??") yields "x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0035 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('x\u4e2d\u6587');
      logInfo(`pick(name="x??"): actual=${actual}`);
      expect(actual).assertEqual('x\u4e2d\u6587');
      logInfo(`pick(name="x??") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x\u4e2d\u6587');
      logInfo(`${BUNDLE}CitySearchStatePick_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0036
     * @tc.name      CitySearch_CitySearchStatePick_0036
     * @tc.desc      CitySearchState.pick(name=" a ") yields " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0036 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' a ');
      logInfo(`pick(name=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`pick(name=" a ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' a ');
      logInfo(`${BUNDLE}CitySearchStatePick_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0037
     * @tc.name      CitySearch_CitySearchStatePick_0037
     * @tc.desc      CitySearchState.pick(name="aa") yields "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0037 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('aa');
      logInfo(`pick(name="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`pick(name="aa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('aa');
      logInfo(`${BUNDLE}CitySearchStatePick_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0038
     * @tc.name      CitySearch_CitySearchStatePick_0038
     * @tc.desc      CitySearchState.pick(name="a_1") yields "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0038 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('a_1');
      logInfo(`pick(name="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`pick(name="a_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0039
     * @tc.name      CitySearch_CitySearchStatePick_0039
     * @tc.desc      CitySearchState.pick(name="xa") yields "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0039 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('xa');
      logInfo(`pick(name="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`pick(name="xa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xa');
      logInfo(`${BUNDLE}CitySearchStatePick_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0040
     * @tc.name      CitySearch_CitySearchStatePick_0040
     * @tc.desc      CitySearchState.pick(name=" abc ") yields " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0040 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' abc ');
      logInfo(`pick(name=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`pick(name=" abc ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' abc ');
      logInfo(`${BUNDLE}CitySearchStatePick_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0041
     * @tc.name      CitySearch_CitySearchStatePick_0041
     * @tc.desc      CitySearchState.pick(name="abcabc") yields "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0041 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('abcabc');
      logInfo(`pick(name="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`pick(name="abcabc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abcabc');
      logInfo(`${BUNDLE}CitySearchStatePick_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0042
     * @tc.name      CitySearch_CitySearchStatePick_0042
     * @tc.desc      CitySearchState.pick(name="abc_1") yields "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0042 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('abc_1');
      logInfo(`pick(name="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`pick(name="abc_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0043
     * @tc.name      CitySearch_CitySearchStatePick_0043
     * @tc.desc      CitySearchState.pick(name="xabc") yields "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0043 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('xabc');
      logInfo(`pick(name="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`pick(name="xabc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xabc');
      logInfo(`${BUNDLE}CitySearchStatePick_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0044
     * @tc.name      CitySearch_CitySearchStatePick_0044
     * @tc.desc      CitySearchState.pick(name=" Hello World ") yields " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0044 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' Hello World ');
      logInfo(`pick(name=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`pick(name=" Hello World ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}CitySearchStatePick_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0045
     * @tc.name      CitySearch_CitySearchStatePick_0045
     * @tc.desc      CitySearchState.pick(name="Hello WorldHello World") yields "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0045 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Hello WorldHello World');
      logInfo(`pick(name="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`pick(name="Hello WorldHello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}CitySearchStatePick_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0046
     * @tc.name      CitySearch_CitySearchStatePick_0046
     * @tc.desc      CitySearchState.pick(name="Hello World_1") yields "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0046 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Hello World_1');
      logInfo(`pick(name="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`pick(name="Hello World_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0047
     * @tc.name      CitySearch_CitySearchStatePick_0047
     * @tc.desc      CitySearchState.pick(name="xHello World") yields "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0047 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('xHello World');
      logInfo(`pick(name="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`pick(name="xHello World") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xHello World');
      logInfo(`${BUNDLE}CitySearchStatePick_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0048
     * @tc.name      CitySearch_CitySearchStatePick_0048
     * @tc.desc      CitySearchState.pick(name=" 123 ") yields " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0048 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick(' 123 ');
      logInfo(`pick(name=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123 ');
      logInfo(`pick(name=" 123 ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' 123 ');
      logInfo(`${BUNDLE}CitySearchStatePick_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0049
     * @tc.name      CitySearch_CitySearchStatePick_0049
     * @tc.desc      CitySearchState.pick(name="123123") yields "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0049 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('123123');
      logInfo(`pick(name="123123"): actual=${actual}`);
      expect(actual).assertEqual('123123');
      logInfo(`pick(name="123123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123123');
      logInfo(`${BUNDLE}CitySearchStatePick_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0050
     * @tc.name      CitySearch_CitySearchStatePick_0050
     * @tc.desc      CitySearchState.pick(name="123_1") yields "123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0050 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('123_1');
      logInfo(`pick(name="123_1"): actual=${actual}`);
      expect(actual).assertEqual('123_1');
      logInfo(`pick(name="123_1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123_1');
      logInfo(`${BUNDLE}CitySearchStatePick_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0051
     * @tc.name      CitySearch_CitySearchStatePick_0051
     * @tc.desc      CitySearchState.pick(name="x123") yields "x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_CitySearchStatePick_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0051 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('x123');
      logInfo(`pick(name="x123"): actual=${actual}`);
      expect(actual).assertEqual('x123');
      logInfo(`pick(name="x123") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x123');
      logInfo(`${BUNDLE}CitySearchStatePick_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0052
     * @tc.name      CitySearch_CitySearchStatePick_0052
     * @tc.desc      CitySearchState.pick(name="YvJlMPfHeo4H") yields "YvJlMPfHeo4H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0052 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('YvJlMPfHeo4H');
      logInfo(`pick(name="YvJlMPfHeo4H"): actual=${actual}`);
      expect(actual).assertEqual('YvJlMPfHeo4H');
      logInfo(`pick(name="YvJlMPfHeo4H") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('YvJlMPfHeo4H');
      logInfo(`${BUNDLE}CitySearchStatePick_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0053
     * @tc.name      CitySearch_CitySearchStatePick_0053
     * @tc.desc      CitySearchState.pick(name="CuJm") yields "CuJm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0053 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('CuJm');
      logInfo(`pick(name="CuJm"): actual=${actual}`);
      expect(actual).assertEqual('CuJm');
      logInfo(`pick(name="CuJm") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('CuJm');
      logInfo(`${BUNDLE}CitySearchStatePick_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0054
     * @tc.name      CitySearch_CitySearchStatePick_0054
     * @tc.desc      CitySearchState.pick(name="qWzK") yields "qWzK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0054 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('qWzK');
      logInfo(`pick(name="qWzK"): actual=${actual}`);
      expect(actual).assertEqual('qWzK');
      logInfo(`pick(name="qWzK") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('qWzK');
      logInfo(`${BUNDLE}CitySearchStatePick_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0055
     * @tc.name      CitySearch_CitySearchStatePick_0055
     * @tc.desc      CitySearchState.pick(name="EIKtEkNV1gi3") yields "EIKtEkNV1gi3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0055 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('EIKtEkNV1gi3');
      logInfo(`pick(name="EIKtEkNV1gi3"): actual=${actual}`);
      expect(actual).assertEqual('EIKtEkNV1gi3');
      logInfo(`pick(name="EIKtEkNV1gi3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('EIKtEkNV1gi3');
      logInfo(`${BUNDLE}CitySearchStatePick_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0056
     * @tc.name      CitySearch_CitySearchStatePick_0056
     * @tc.desc      CitySearchState.pick(name="dNA1z4cCq3") yields "dNA1z4cCq3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0056 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('dNA1z4cCq3');
      logInfo(`pick(name="dNA1z4cCq3"): actual=${actual}`);
      expect(actual).assertEqual('dNA1z4cCq3');
      logInfo(`pick(name="dNA1z4cCq3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dNA1z4cCq3');
      logInfo(`${BUNDLE}CitySearchStatePick_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0057
     * @tc.name      CitySearch_CitySearchStatePick_0057
     * @tc.desc      CitySearchState.pick(name="ULke") yields "ULke"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0057 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('ULke');
      logInfo(`pick(name="ULke"): actual=${actual}`);
      expect(actual).assertEqual('ULke');
      logInfo(`pick(name="ULke") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ULke');
      logInfo(`${BUNDLE}CitySearchStatePick_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0058
     * @tc.name      CitySearch_CitySearchStatePick_0058
     * @tc.desc      CitySearchState.pick(name="tKT4Xd") yields "tKT4Xd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0058 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('tKT4Xd');
      logInfo(`pick(name="tKT4Xd"): actual=${actual}`);
      expect(actual).assertEqual('tKT4Xd');
      logInfo(`pick(name="tKT4Xd") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('tKT4Xd');
      logInfo(`${BUNDLE}CitySearchStatePick_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0059
     * @tc.name      CitySearch_CitySearchStatePick_0059
     * @tc.desc      CitySearchState.pick(name="6iH") yields "6iH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0059 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('6iH');
      logInfo(`pick(name="6iH"): actual=${actual}`);
      expect(actual).assertEqual('6iH');
      logInfo(`pick(name="6iH") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6iH');
      logInfo(`${BUNDLE}CitySearchStatePick_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0060
     * @tc.name      CitySearch_CitySearchStatePick_0060
     * @tc.desc      CitySearchState.pick(name="v8W") yields "v8W"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0060 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('v8W');
      logInfo(`pick(name="v8W"): actual=${actual}`);
      expect(actual).assertEqual('v8W');
      logInfo(`pick(name="v8W") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('v8W');
      logInfo(`${BUNDLE}CitySearchStatePick_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0061
     * @tc.name      CitySearch_CitySearchStatePick_0061
     * @tc.desc      CitySearchState.pick(name="c") yields "c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0061 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('c');
      logInfo(`pick(name="c"): actual=${actual}`);
      expect(actual).assertEqual('c');
      logInfo(`pick(name="c") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('c');
      logInfo(`${BUNDLE}CitySearchStatePick_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0062
     * @tc.name      CitySearch_CitySearchStatePick_0062
     * @tc.desc      CitySearchState.pick(name="R") yields "R"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0062 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('R');
      logInfo(`pick(name="R"): actual=${actual}`);
      expect(actual).assertEqual('R');
      logInfo(`pick(name="R") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('R');
      logInfo(`${BUNDLE}CitySearchStatePick_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0063
     * @tc.name      CitySearch_CitySearchStatePick_0063
     * @tc.desc      CitySearchState.pick(name="dJf") yields "dJf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0063 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('dJf');
      logInfo(`pick(name="dJf"): actual=${actual}`);
      expect(actual).assertEqual('dJf');
      logInfo(`pick(name="dJf") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dJf');
      logInfo(`${BUNDLE}CitySearchStatePick_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0064
     * @tc.name      CitySearch_CitySearchStatePick_0064
     * @tc.desc      CitySearchState.pick(name="lKUz3lQTg") yields "lKUz3lQTg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0064 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('lKUz3lQTg');
      logInfo(`pick(name="lKUz3lQTg"): actual=${actual}`);
      expect(actual).assertEqual('lKUz3lQTg');
      logInfo(`pick(name="lKUz3lQTg") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lKUz3lQTg');
      logInfo(`${BUNDLE}CitySearchStatePick_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0065
     * @tc.name      CitySearch_CitySearchStatePick_0065
     * @tc.desc      CitySearchState.pick(name="g4uU8n8") yields "g4uU8n8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0065 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('g4uU8n8');
      logInfo(`pick(name="g4uU8n8"): actual=${actual}`);
      expect(actual).assertEqual('g4uU8n8');
      logInfo(`pick(name="g4uU8n8") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('g4uU8n8');
      logInfo(`${BUNDLE}CitySearchStatePick_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0066
     * @tc.name      CitySearch_CitySearchStatePick_0066
     * @tc.desc      CitySearchState.pick(name="qWp3ybD") yields "qWp3ybD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0066 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('qWp3ybD');
      logInfo(`pick(name="qWp3ybD"): actual=${actual}`);
      expect(actual).assertEqual('qWp3ybD');
      logInfo(`pick(name="qWp3ybD") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('qWp3ybD');
      logInfo(`${BUNDLE}CitySearchStatePick_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0067
     * @tc.name      CitySearch_CitySearchStatePick_0067
     * @tc.desc      CitySearchState.pick(name="hSTrhjY94") yields "hSTrhjY94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0067 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('hSTrhjY94');
      logInfo(`pick(name="hSTrhjY94"): actual=${actual}`);
      expect(actual).assertEqual('hSTrhjY94');
      logInfo(`pick(name="hSTrhjY94") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hSTrhjY94');
      logInfo(`${BUNDLE}CitySearchStatePick_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0068
     * @tc.name      CitySearch_CitySearchStatePick_0068
     * @tc.desc      CitySearchState.pick(name="q") yields "q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0068 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('q');
      logInfo(`pick(name="q"): actual=${actual}`);
      expect(actual).assertEqual('q');
      logInfo(`pick(name="q") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('q');
      logInfo(`${BUNDLE}CitySearchStatePick_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0069
     * @tc.name      CitySearch_CitySearchStatePick_0069
     * @tc.desc      CitySearchState.pick(name="4nqZpEQ28cn") yields "4nqZpEQ28cn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0069 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('4nqZpEQ28cn');
      logInfo(`pick(name="4nqZpEQ28cn"): actual=${actual}`);
      expect(actual).assertEqual('4nqZpEQ28cn');
      logInfo(`pick(name="4nqZpEQ28cn") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('4nqZpEQ28cn');
      logInfo(`${BUNDLE}CitySearchStatePick_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0070
     * @tc.name      CitySearch_CitySearchStatePick_0070
     * @tc.desc      CitySearchState.pick(name="BbFS1") yields "BbFS1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0070 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('BbFS1');
      logInfo(`pick(name="BbFS1"): actual=${actual}`);
      expect(actual).assertEqual('BbFS1');
      logInfo(`pick(name="BbFS1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('BbFS1');
      logInfo(`${BUNDLE}CitySearchStatePick_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0071
     * @tc.name      CitySearch_CitySearchStatePick_0071
     * @tc.desc      CitySearchState.pick(name="7") yields "7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0071 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('7');
      logInfo(`pick(name="7"): actual=${actual}`);
      expect(actual).assertEqual('7');
      logInfo(`pick(name="7") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7');
      logInfo(`${BUNDLE}CitySearchStatePick_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0072
     * @tc.name      CitySearch_CitySearchStatePick_0072
     * @tc.desc      CitySearchState.pick(name="GWc") yields "GWc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0072 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('GWc');
      logInfo(`pick(name="GWc"): actual=${actual}`);
      expect(actual).assertEqual('GWc');
      logInfo(`pick(name="GWc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('GWc');
      logInfo(`${BUNDLE}CitySearchStatePick_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0073
     * @tc.name      CitySearch_CitySearchStatePick_0073
     * @tc.desc      CitySearchState.pick(name="cjnWGS") yields "cjnWGS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0073 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('cjnWGS');
      logInfo(`pick(name="cjnWGS"): actual=${actual}`);
      expect(actual).assertEqual('cjnWGS');
      logInfo(`pick(name="cjnWGS") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('cjnWGS');
      logInfo(`${BUNDLE}CitySearchStatePick_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0074
     * @tc.name      CitySearch_CitySearchStatePick_0074
     * @tc.desc      CitySearchState.pick(name="SXue6auidE") yields "SXue6auidE"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0074 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('SXue6auidE');
      logInfo(`pick(name="SXue6auidE"): actual=${actual}`);
      expect(actual).assertEqual('SXue6auidE');
      logInfo(`pick(name="SXue6auidE") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SXue6auidE');
      logInfo(`${BUNDLE}CitySearchStatePick_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0075
     * @tc.name      CitySearch_CitySearchStatePick_0075
     * @tc.desc      CitySearchState.pick(name="K26j") yields "K26j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0075 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('K26j');
      logInfo(`pick(name="K26j"): actual=${actual}`);
      expect(actual).assertEqual('K26j');
      logInfo(`pick(name="K26j") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('K26j');
      logInfo(`${BUNDLE}CitySearchStatePick_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0076
     * @tc.name      CitySearch_CitySearchStatePick_0076
     * @tc.desc      CitySearchState.pick(name="P") yields "P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0076 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('P');
      logInfo(`pick(name="P"): actual=${actual}`);
      expect(actual).assertEqual('P');
      logInfo(`pick(name="P") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('P');
      logInfo(`${BUNDLE}CitySearchStatePick_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0077
     * @tc.name      CitySearch_CitySearchStatePick_0077
     * @tc.desc      CitySearchState.pick(name="DEaMTHk") yields "DEaMTHk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0077 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('DEaMTHk');
      logInfo(`pick(name="DEaMTHk"): actual=${actual}`);
      expect(actual).assertEqual('DEaMTHk');
      logInfo(`pick(name="DEaMTHk") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DEaMTHk');
      logInfo(`${BUNDLE}CitySearchStatePick_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0078
     * @tc.name      CitySearch_CitySearchStatePick_0078
     * @tc.desc      CitySearchState.pick(name="V8cKtNr") yields "V8cKtNr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0078 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('V8cKtNr');
      logInfo(`pick(name="V8cKtNr"): actual=${actual}`);
      expect(actual).assertEqual('V8cKtNr');
      logInfo(`pick(name="V8cKtNr") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('V8cKtNr');
      logInfo(`${BUNDLE}CitySearchStatePick_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0079
     * @tc.name      CitySearch_CitySearchStatePick_0079
     * @tc.desc      CitySearchState.pick(name="uLdn04BOQ") yields "uLdn04BOQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0079 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('uLdn04BOQ');
      logInfo(`pick(name="uLdn04BOQ"): actual=${actual}`);
      expect(actual).assertEqual('uLdn04BOQ');
      logInfo(`pick(name="uLdn04BOQ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('uLdn04BOQ');
      logInfo(`${BUNDLE}CitySearchStatePick_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0080
     * @tc.name      CitySearch_CitySearchStatePick_0080
     * @tc.desc      CitySearchState.pick(name="IYLTSP2O8q") yields "IYLTSP2O8q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0080 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('IYLTSP2O8q');
      logInfo(`pick(name="IYLTSP2O8q"): actual=${actual}`);
      expect(actual).assertEqual('IYLTSP2O8q');
      logInfo(`pick(name="IYLTSP2O8q") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IYLTSP2O8q');
      logInfo(`${BUNDLE}CitySearchStatePick_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0081
     * @tc.name      CitySearch_CitySearchStatePick_0081
     * @tc.desc      CitySearchState.pick(name="4TjK41xiebme") yields "4TjK41xiebme"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0081 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('4TjK41xiebme');
      logInfo(`pick(name="4TjK41xiebme"): actual=${actual}`);
      expect(actual).assertEqual('4TjK41xiebme');
      logInfo(`pick(name="4TjK41xiebme") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('4TjK41xiebme');
      logInfo(`${BUNDLE}CitySearchStatePick_0081 end`);
    });
  });
}
