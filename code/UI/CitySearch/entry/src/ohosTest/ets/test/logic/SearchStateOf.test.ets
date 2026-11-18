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
import { searchStateOf } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for searchStateOf (50 cases). */
export default function searchStateOfTest(): void {
  describe('SearchStateOfTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0001
     * @tc.name      CitySearch_SearchStateOf_0001
     * @tc.desc      searchStateOf(value="Hello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_SearchStateOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchStateOf_0001 begin`);
      const actual: boolean = searchStateOf('Hello');
      logInfo(`searchStateOf(value="Hello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0002
     * @tc.name      CitySearch_SearchStateOf_0002
     * @tc.desc      searchStateOf(value="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_SearchStateOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchStateOf_0002 begin`);
      const actual: boolean = searchStateOf('');
      logInfo(`searchStateOf(value=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SearchStateOf_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0003
     * @tc.name      CitySearch_SearchStateOf_0003
     * @tc.desc      searchStateOf(value="hello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0003 begin`);
      const actual: boolean = searchStateOf('hello world');
      logInfo(`searchStateOf(value="hello world"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0004
     * @tc.name      CitySearch_SearchStateOf_0004
     * @tc.desc      searchStateOf(value=" ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0004 begin`);
      const actual: boolean = searchStateOf(' ');
      logInfo(`searchStateOf(value=" "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0005
     * @tc.name      CitySearch_SearchStateOf_0005
     * @tc.desc      searchStateOf(value="A") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0005 begin`);
      const actual: boolean = searchStateOf('A');
      logInfo(`searchStateOf(value="A"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0006
     * @tc.name      CitySearch_SearchStateOf_0006
     * @tc.desc      searchStateOf(value="Sample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0006 begin`);
      const actual: boolean = searchStateOf('Sample Title 123');
      logInfo(`searchStateOf(value="Sample Title 123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0007
     * @tc.name      CitySearch_SearchStateOf_0007
     * @tc.desc      searchStateOf(value="??") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0007 begin`);
      const actual: boolean = searchStateOf('\u4e2d\u6587');
      logInfo(`searchStateOf(value="??"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0008
     * @tc.name      CitySearch_SearchStateOf_0008
     * @tc.desc      searchStateOf(value="a") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0008 begin`);
      const actual: boolean = searchStateOf('a');
      logInfo(`searchStateOf(value="a"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0009
     * @tc.name      CitySearch_SearchStateOf_0009
     * @tc.desc      searchStateOf(value="abc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0009 begin`);
      const actual: boolean = searchStateOf('abc');
      logInfo(`searchStateOf(value="abc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0010
     * @tc.name      CitySearch_SearchStateOf_0010
     * @tc.desc      searchStateOf(value="Hello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0010 begin`);
      const actual: boolean = searchStateOf('Hello World');
      logInfo(`searchStateOf(value="Hello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0011
     * @tc.name      CitySearch_SearchStateOf_0011
     * @tc.desc      searchStateOf(value="123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0011 begin`);
      const actual: boolean = searchStateOf('123');
      logInfo(`searchStateOf(value="123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0012
     * @tc.name      CitySearch_SearchStateOf_0012
     * @tc.desc      searchStateOf(value=" Hello ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0012 begin`);
      const actual: boolean = searchStateOf(' Hello ');
      logInfo(`searchStateOf(value=" Hello "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0013
     * @tc.name      CitySearch_SearchStateOf_0013
     * @tc.desc      searchStateOf(value="HelloHello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0013 begin`);
      const actual: boolean = searchStateOf('HelloHello');
      logInfo(`searchStateOf(value="HelloHello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0014
     * @tc.name      CitySearch_SearchStateOf_0014
     * @tc.desc      searchStateOf(value="Hello_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0014 begin`);
      const actual: boolean = searchStateOf('Hello_1');
      logInfo(`searchStateOf(value="Hello_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0015
     * @tc.name      CitySearch_SearchStateOf_0015
     * @tc.desc      searchStateOf(value="xHello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0015 begin`);
      const actual: boolean = searchStateOf('xHello');
      logInfo(`searchStateOf(value="xHello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0016
     * @tc.name      CitySearch_SearchStateOf_0016
     * @tc.desc      searchStateOf(value=" hello world ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0016 begin`);
      const actual: boolean = searchStateOf(' hello world ');
      logInfo(`searchStateOf(value=" hello world "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0017
     * @tc.name      CitySearch_SearchStateOf_0017
     * @tc.desc      searchStateOf(value="hello worldhello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0017 begin`);
      const actual: boolean = searchStateOf('hello worldhello world');
      logInfo(`searchStateOf(value="hello worldhello wor...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0018
     * @tc.name      CitySearch_SearchStateOf_0018
     * @tc.desc      searchStateOf(value="hello world_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0018 begin`);
      const actual: boolean = searchStateOf('hello world_1');
      logInfo(`searchStateOf(value="hello world_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0019
     * @tc.name      CitySearch_SearchStateOf_0019
     * @tc.desc      searchStateOf(value="xhello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0019 begin`);
      const actual: boolean = searchStateOf('xhello world');
      logInfo(`searchStateOf(value="xhello world"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0020
     * @tc.name      CitySearch_SearchStateOf_0020
     * @tc.desc      searchStateOf(value="   ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0020 begin`);
      const actual: boolean = searchStateOf('   ');
      logInfo(`searchStateOf(value="   "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0021
     * @tc.name      CitySearch_SearchStateOf_0021
     * @tc.desc      searchStateOf(value="  ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0021 begin`);
      const actual: boolean = searchStateOf('  ');
      logInfo(`searchStateOf(value="  "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0022
     * @tc.name      CitySearch_SearchStateOf_0022
     * @tc.desc      searchStateOf(value=" _1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0022 begin`);
      const actual: boolean = searchStateOf(' _1');
      logInfo(`searchStateOf(value=" _1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0023
     * @tc.name      CitySearch_SearchStateOf_0023
     * @tc.desc      searchStateOf(value="x ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0023 begin`);
      const actual: boolean = searchStateOf('x ');
      logInfo(`searchStateOf(value="x "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0024
     * @tc.name      CitySearch_SearchStateOf_0024
     * @tc.desc      searchStateOf(value=" A ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0024 begin`);
      const actual: boolean = searchStateOf(' A ');
      logInfo(`searchStateOf(value=" A "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0025
     * @tc.name      CitySearch_SearchStateOf_0025
     * @tc.desc      searchStateOf(value="AA") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0025 begin`);
      const actual: boolean = searchStateOf('AA');
      logInfo(`searchStateOf(value="AA"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0026
     * @tc.name      CitySearch_SearchStateOf_0026
     * @tc.desc      searchStateOf(value="A_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0026 begin`);
      const actual: boolean = searchStateOf('A_1');
      logInfo(`searchStateOf(value="A_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0027
     * @tc.name      CitySearch_SearchStateOf_0027
     * @tc.desc      searchStateOf(value="xA") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0027 begin`);
      const actual: boolean = searchStateOf('xA');
      logInfo(`searchStateOf(value="xA"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0028
     * @tc.name      CitySearch_SearchStateOf_0028
     * @tc.desc      searchStateOf(value=" Sample Title 123 ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0028 begin`);
      const actual: boolean = searchStateOf(' Sample Title 123 ');
      logInfo(`searchStateOf(value=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0029
     * @tc.name      CitySearch_SearchStateOf_0029
     * @tc.desc      searchStateOf(value="Sample Title 123Sample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0029 begin`);
      const actual: boolean = searchStateOf('Sample Title 123Sample Title 123');
      logInfo(`searchStateOf(value="Sample Title 123Samp...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0030
     * @tc.name      CitySearch_SearchStateOf_0030
     * @tc.desc      searchStateOf(value="Sample Title 123_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0030 begin`);
      const actual: boolean = searchStateOf('Sample Title 123_1');
      logInfo(`searchStateOf(value="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0031
     * @tc.name      CitySearch_SearchStateOf_0031
     * @tc.desc      searchStateOf(value="xSample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0031 begin`);
      const actual: boolean = searchStateOf('xSample Title 123');
      logInfo(`searchStateOf(value="xSample Title 123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0032
     * @tc.name      CitySearch_SearchStateOf_0032
     * @tc.desc      searchStateOf(value=" ?? ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0032 begin`);
      const actual: boolean = searchStateOf(' \u4e2d\u6587 ');
      logInfo(`searchStateOf(value=" ?? "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0033
     * @tc.name      CitySearch_SearchStateOf_0033
     * @tc.desc      searchStateOf(value="????") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0033 begin`);
      const actual: boolean = searchStateOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`searchStateOf(value="????"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0034
     * @tc.name      CitySearch_SearchStateOf_0034
     * @tc.desc      searchStateOf(value="??_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0034 begin`);
      const actual: boolean = searchStateOf('\u4e2d\u6587_1');
      logInfo(`searchStateOf(value="??_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0035
     * @tc.name      CitySearch_SearchStateOf_0035
     * @tc.desc      searchStateOf(value="x??") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0035 begin`);
      const actual: boolean = searchStateOf('x\u4e2d\u6587');
      logInfo(`searchStateOf(value="x??"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0036
     * @tc.name      CitySearch_SearchStateOf_0036
     * @tc.desc      searchStateOf(value=" a ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0036 begin`);
      const actual: boolean = searchStateOf(' a ');
      logInfo(`searchStateOf(value=" a "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0037
     * @tc.name      CitySearch_SearchStateOf_0037
     * @tc.desc      searchStateOf(value="aa") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0037 begin`);
      const actual: boolean = searchStateOf('aa');
      logInfo(`searchStateOf(value="aa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0038
     * @tc.name      CitySearch_SearchStateOf_0038
     * @tc.desc      searchStateOf(value="a_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0038 begin`);
      const actual: boolean = searchStateOf('a_1');
      logInfo(`searchStateOf(value="a_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0039
     * @tc.name      CitySearch_SearchStateOf_0039
     * @tc.desc      searchStateOf(value="xa") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0039 begin`);
      const actual: boolean = searchStateOf('xa');
      logInfo(`searchStateOf(value="xa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0040
     * @tc.name      CitySearch_SearchStateOf_0040
     * @tc.desc      searchStateOf(value=" abc ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0040 begin`);
      const actual: boolean = searchStateOf(' abc ');
      logInfo(`searchStateOf(value=" abc "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0041
     * @tc.name      CitySearch_SearchStateOf_0041
     * @tc.desc      searchStateOf(value="abcabc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0041 begin`);
      const actual: boolean = searchStateOf('abcabc');
      logInfo(`searchStateOf(value="abcabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0042
     * @tc.name      CitySearch_SearchStateOf_0042
     * @tc.desc      searchStateOf(value="abc_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0042 begin`);
      const actual: boolean = searchStateOf('abc_1');
      logInfo(`searchStateOf(value="abc_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0043
     * @tc.name      CitySearch_SearchStateOf_0043
     * @tc.desc      searchStateOf(value="xabc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0043 begin`);
      const actual: boolean = searchStateOf('xabc');
      logInfo(`searchStateOf(value="xabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0044
     * @tc.name      CitySearch_SearchStateOf_0044
     * @tc.desc      searchStateOf(value=" Hello World ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0044 begin`);
      const actual: boolean = searchStateOf(' Hello World ');
      logInfo(`searchStateOf(value=" Hello World "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0045
     * @tc.name      CitySearch_SearchStateOf_0045
     * @tc.desc      searchStateOf(value="Hello WorldHello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0045 begin`);
      const actual: boolean = searchStateOf('Hello WorldHello World');
      logInfo(`searchStateOf(value="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0046
     * @tc.name      CitySearch_SearchStateOf_0046
     * @tc.desc      searchStateOf(value="Hello World_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0046 begin`);
      const actual: boolean = searchStateOf('Hello World_1');
      logInfo(`searchStateOf(value="Hello World_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0047
     * @tc.name      CitySearch_SearchStateOf_0047
     * @tc.desc      searchStateOf(value="xHello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0047 begin`);
      const actual: boolean = searchStateOf('xHello World');
      logInfo(`searchStateOf(value="xHello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0048
     * @tc.name      CitySearch_SearchStateOf_0048
     * @tc.desc      searchStateOf(value=" 123 ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchStateOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchStateOf_0048 begin`);
      const actual: boolean = searchStateOf(' 123 ');
      logInfo(`searchStateOf(value=" 123 "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0049
     * @tc.name      CitySearch_SearchStateOf_0049
     * @tc.desc      searchStateOf(value="123123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0049 begin`);
      const actual: boolean = searchStateOf('123123');
      logInfo(`searchStateOf(value="123123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_STATE_OF_0050
     * @tc.name      CitySearch_SearchStateOf_0050
     * @tc.desc      searchStateOf(value="123_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchStateOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchStateOf_0050 begin`);
      const actual: boolean = searchStateOf('123_1');
      logInfo(`searchStateOf(value="123_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SearchStateOf_0050 end`);
    });
  });
}
