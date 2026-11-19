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
import { searchCities } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for searchCities (95 cases). */
export default function searchCitiesTest(): void {
  describe('SearchCitiesTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0001
     * @tc.name      CitySearch_SearchCities_0001
     * @tc.desc      searchCities(value="Hello") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_SearchCities_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchCities_0001 begin`);
      const actual: string[] = searchCities('Hello');
      logInfo(`searchCities(value="Hello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0002
     * @tc.name      CitySearch_SearchCities_0002
     * @tc.desc      searchCities(value="A") returns ["??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_SearchCities_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchCities_0002 begin`);
      const actual: string[] = searchCities('A');
      logInfo(`searchCities(value="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`searchCities(value="A"): JSON.stringify(actual.slice(0, 2))=${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`searchCities(value="A"): JSON.stringify(actual.slice(2, 4))=${JSON.stringify(actual.slice(2, 4))}`);
      expect(JSON.stringify(actual.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`${BUNDLE}SearchCities_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0003
     * @tc.name      CitySearch_SearchCities_0003
     * @tc.desc      searchCities(value="B") returns ["??","??","??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0003 begin`);
      const actual: string[] = searchCities('B');
      logInfo(`searchCities(value="B"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`searchCities(value="B"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u5317\u4eac","\u4eb3\u5dde","\u5305\u5934","\u5b9d\u9e21"]');
      logInfo(`${BUNDLE}SearchCities_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0004
     * @tc.name      CitySearch_SearchCities_0004
     * @tc.desc      searchCities(value="q") returns ["??","???","???"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0004 begin`);
      const actual: string[] = searchCities('q');
      logInfo(`searchCities(value="q"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`searchCities(value="q"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u9752\u5c9b","\u4e03\u53f0\u6cb3","\u79e6\u7687\u5c9b"]');
      logInfo(`${BUNDLE}SearchCities_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0005
     * @tc.name      CitySearch_SearchCities_0005
     * @tc.desc      searchCities(value="j") returns ["??","??","???"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0005 begin`);
      const actual: string[] = searchCities('j');
      logInfo(`searchCities(value="j"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`searchCities(value="j"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u6d4e\u5357","\u4e5d\u6c5f","\u4f73\u6728\u65af"]');
      logInfo(`${BUNDLE}SearchCities_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0006
     * @tc.name      CitySearch_SearchCities_0006
     * @tc.desc      searchCities(value="C") returns ["??","??","??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0006 begin`);
      const actual: string[] = searchCities('C');
      logInfo(`searchCities(value="C"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`searchCities(value="C"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u91cd\u5e86","\u957f\u6625","\u957f\u6c99","\u6210\u90fd"]');
      logInfo(`${BUNDLE}SearchCities_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0007
     * @tc.name      CitySearch_SearchCities_0007
     * @tc.desc      searchCities(value="hello world") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0007 begin`);
      const actual: string[] = searchCities('hello world');
      logInfo(`searchCities(value="hello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0008
     * @tc.name      CitySearch_SearchCities_0008
     * @tc.desc      searchCities(value="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0008 begin`);
      const actual: string[] = searchCities('');
      logInfo(`searchCities(value=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0009
     * @tc.name      CitySearch_SearchCities_0009
     * @tc.desc      searchCities(value=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0009 begin`);
      const actual: string[] = searchCities(' ');
      logInfo(`searchCities(value=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0010
     * @tc.name      CitySearch_SearchCities_0010
     * @tc.desc      searchCities(value="Sample Title 123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0010 begin`);
      const actual: string[] = searchCities('Sample Title 123');
      logInfo(`searchCities(value="Sample Title 123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0011
     * @tc.name      CitySearch_SearchCities_0011
     * @tc.desc      searchCities(value="??") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0011 begin`);
      const actual: string[] = searchCities('\u4e2d\u6587');
      logInfo(`searchCities(value="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0012
     * @tc.name      CitySearch_SearchCities_0012
     * @tc.desc      searchCities(value="a") returns ["??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0012 begin`);
      const actual: string[] = searchCities('a');
      logInfo(`searchCities(value="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`searchCities(value="a"): JSON.stringify(actual.slice(0, 2))=${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`searchCities(value="a"): JSON.stringify(actual.slice(2, 4))=${JSON.stringify(actual.slice(2, 4))}`);
      expect(JSON.stringify(actual.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`${BUNDLE}SearchCities_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0013
     * @tc.name      CitySearch_SearchCities_0013
     * @tc.desc      searchCities(value="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0013 begin`);
      const actual: string[] = searchCities('abc');
      logInfo(`searchCities(value="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0014
     * @tc.name      CitySearch_SearchCities_0014
     * @tc.desc      searchCities(value="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0014 begin`);
      const actual: string[] = searchCities('Hello World');
      logInfo(`searchCities(value="Hello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0015
     * @tc.name      CitySearch_SearchCities_0015
     * @tc.desc      searchCities(value="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0015 begin`);
      const actual: string[] = searchCities('123');
      logInfo(`searchCities(value="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0016
     * @tc.name      CitySearch_SearchCities_0016
     * @tc.desc      searchCities(value=" Hello ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0016 begin`);
      const actual: string[] = searchCities(' Hello ');
      logInfo(`searchCities(value=" Hello "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0017
     * @tc.name      CitySearch_SearchCities_0017
     * @tc.desc      searchCities(value="HelloHello") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0017 begin`);
      const actual: string[] = searchCities('HelloHello');
      logInfo(`searchCities(value="HelloHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0018
     * @tc.name      CitySearch_SearchCities_0018
     * @tc.desc      searchCities(value="Hello_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0018 begin`);
      const actual: string[] = searchCities('Hello_1');
      logInfo(`searchCities(value="Hello_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0019
     * @tc.name      CitySearch_SearchCities_0019
     * @tc.desc      searchCities(value="xHello") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0019 begin`);
      const actual: string[] = searchCities('xHello');
      logInfo(`searchCities(value="xHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0020
     * @tc.name      CitySearch_SearchCities_0020
     * @tc.desc      searchCities(value=" hello world ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0020 begin`);
      const actual: string[] = searchCities(' hello world ');
      logInfo(`searchCities(value=" hello world "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0021
     * @tc.name      CitySearch_SearchCities_0021
     * @tc.desc      searchCities(value="hello worldhello world") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0021 begin`);
      const actual: string[] = searchCities('hello worldhello world');
      logInfo(`searchCities(value="hello worldhello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0022
     * @tc.name      CitySearch_SearchCities_0022
     * @tc.desc      searchCities(value="hello world_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0022 begin`);
      const actual: string[] = searchCities('hello world_1');
      logInfo(`searchCities(value="hello world_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0023
     * @tc.name      CitySearch_SearchCities_0023
     * @tc.desc      searchCities(value="xhello world") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0023 begin`);
      const actual: string[] = searchCities('xhello world');
      logInfo(`searchCities(value="xhello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0024
     * @tc.name      CitySearch_SearchCities_0024
     * @tc.desc      searchCities(value="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0024 begin`);
      const actual: string[] = searchCities('   ');
      logInfo(`searchCities(value="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0025
     * @tc.name      CitySearch_SearchCities_0025
     * @tc.desc      searchCities(value="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0025 begin`);
      const actual: string[] = searchCities('  ');
      logInfo(`searchCities(value="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0026
     * @tc.name      CitySearch_SearchCities_0026
     * @tc.desc      searchCities(value=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0026 begin`);
      const actual: string[] = searchCities(' _1');
      logInfo(`searchCities(value=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0027
     * @tc.name      CitySearch_SearchCities_0027
     * @tc.desc      searchCities(value="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0027 begin`);
      const actual: string[] = searchCities('x ');
      logInfo(`searchCities(value="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0028
     * @tc.name      CitySearch_SearchCities_0028
     * @tc.desc      searchCities(value=" A ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0028 begin`);
      const actual: string[] = searchCities(' A ');
      logInfo(`searchCities(value=" A "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0029
     * @tc.name      CitySearch_SearchCities_0029
     * @tc.desc      searchCities(value="AA") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0029 begin`);
      const actual: string[] = searchCities('AA');
      logInfo(`searchCities(value="AA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0030
     * @tc.name      CitySearch_SearchCities_0030
     * @tc.desc      searchCities(value="A_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0030 begin`);
      const actual: string[] = searchCities('A_1');
      logInfo(`searchCities(value="A_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0031
     * @tc.name      CitySearch_SearchCities_0031
     * @tc.desc      searchCities(value="xA") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0031 begin`);
      const actual: string[] = searchCities('xA');
      logInfo(`searchCities(value="xA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0032
     * @tc.name      CitySearch_SearchCities_0032
     * @tc.desc      searchCities(value=" Sample Title 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0032 begin`);
      const actual: string[] = searchCities(' Sample Title 123 ');
      logInfo(`searchCities(value=" Sample Title 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0033
     * @tc.name      CitySearch_SearchCities_0033
     * @tc.desc      searchCities(value="Sample Title 123Sample Title 123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0033 begin`);
      const actual: string[] = searchCities('Sample Title 123Sample Title 123');
      logInfo(`searchCities(value="Sample Title 123Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0034
     * @tc.name      CitySearch_SearchCities_0034
     * @tc.desc      searchCities(value="Sample Title 123_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0034 begin`);
      const actual: string[] = searchCities('Sample Title 123_1');
      logInfo(`searchCities(value="Sample Title 123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0035
     * @tc.name      CitySearch_SearchCities_0035
     * @tc.desc      searchCities(value="xSample Title 123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0035 begin`);
      const actual: string[] = searchCities('xSample Title 123');
      logInfo(`searchCities(value="xSample Title 123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0036
     * @tc.name      CitySearch_SearchCities_0036
     * @tc.desc      searchCities(value=" ?? ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0036 begin`);
      const actual: string[] = searchCities(' \u4e2d\u6587 ');
      logInfo(`searchCities(value=" ?? "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0037
     * @tc.name      CitySearch_SearchCities_0037
     * @tc.desc      searchCities(value="????") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0037 begin`);
      const actual: string[] = searchCities('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`searchCities(value="????"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0038
     * @tc.name      CitySearch_SearchCities_0038
     * @tc.desc      searchCities(value="??_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0038 begin`);
      const actual: string[] = searchCities('\u4e2d\u6587_1');
      logInfo(`searchCities(value="??_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0039
     * @tc.name      CitySearch_SearchCities_0039
     * @tc.desc      searchCities(value="x??") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0039 begin`);
      const actual: string[] = searchCities('x\u4e2d\u6587');
      logInfo(`searchCities(value="x??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0040
     * @tc.name      CitySearch_SearchCities_0040
     * @tc.desc      searchCities(value=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0040 begin`);
      const actual: string[] = searchCities(' a ');
      logInfo(`searchCities(value=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0041
     * @tc.name      CitySearch_SearchCities_0041
     * @tc.desc      searchCities(value="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0041 begin`);
      const actual: string[] = searchCities('aa');
      logInfo(`searchCities(value="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0042
     * @tc.name      CitySearch_SearchCities_0042
     * @tc.desc      searchCities(value="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0042 begin`);
      const actual: string[] = searchCities('a_1');
      logInfo(`searchCities(value="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0043
     * @tc.name      CitySearch_SearchCities_0043
     * @tc.desc      searchCities(value="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0043 begin`);
      const actual: string[] = searchCities('xa');
      logInfo(`searchCities(value="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0044
     * @tc.name      CitySearch_SearchCities_0044
     * @tc.desc      searchCities(value=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0044 begin`);
      const actual: string[] = searchCities(' abc ');
      logInfo(`searchCities(value=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0045
     * @tc.name      CitySearch_SearchCities_0045
     * @tc.desc      searchCities(value="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0045 begin`);
      const actual: string[] = searchCities('abcabc');
      logInfo(`searchCities(value="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0046
     * @tc.name      CitySearch_SearchCities_0046
     * @tc.desc      searchCities(value="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0046 begin`);
      const actual: string[] = searchCities('abc_1');
      logInfo(`searchCities(value="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0047
     * @tc.name      CitySearch_SearchCities_0047
     * @tc.desc      searchCities(value="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0047 begin`);
      const actual: string[] = searchCities('xabc');
      logInfo(`searchCities(value="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0048
     * @tc.name      CitySearch_SearchCities_0048
     * @tc.desc      searchCities(value=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0048 begin`);
      const actual: string[] = searchCities(' Hello World ');
      logInfo(`searchCities(value=" Hello World "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0049
     * @tc.name      CitySearch_SearchCities_0049
     * @tc.desc      searchCities(value="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0049 begin`);
      const actual: string[] = searchCities('Hello WorldHello World');
      logInfo(`searchCities(value="Hello WorldHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0050
     * @tc.name      CitySearch_SearchCities_0050
     * @tc.desc      searchCities(value="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0050 begin`);
      const actual: string[] = searchCities('Hello World_1');
      logInfo(`searchCities(value="Hello World_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0051
     * @tc.name      CitySearch_SearchCities_0051
     * @tc.desc      searchCities(value="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0051 begin`);
      const actual: string[] = searchCities('xHello World');
      logInfo(`searchCities(value="xHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0052
     * @tc.name      CitySearch_SearchCities_0052
     * @tc.desc      searchCities(value=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0052 begin`);
      const actual: string[] = searchCities(' 123 ');
      logInfo(`searchCities(value=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0053
     * @tc.name      CitySearch_SearchCities_0053
     * @tc.desc      searchCities(value="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0053 begin`);
      const actual: string[] = searchCities('123123');
      logInfo(`searchCities(value="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0054
     * @tc.name      CitySearch_SearchCities_0054
     * @tc.desc      searchCities(value="123_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0054 begin`);
      const actual: string[] = searchCities('123_1');
      logInfo(`searchCities(value="123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0055
     * @tc.name      CitySearch_SearchCities_0055
     * @tc.desc      searchCities(value="x123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SearchCities_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchCities_0055 begin`);
      const actual: string[] = searchCities('x123');
      logInfo(`searchCities(value="x123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0056
     * @tc.name      CitySearch_SearchCities_0056
     * @tc.desc      searchCities(value="aG2g9") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0056 begin`);
      const actual: string[] = searchCities('aG2g9');
      logInfo(`searchCities(value="aG2g9"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0057
     * @tc.name      CitySearch_SearchCities_0057
     * @tc.desc      searchCities(value="iGqT2") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0057 begin`);
      const actual: string[] = searchCities('iGqT2');
      logInfo(`searchCities(value="iGqT2"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0058
     * @tc.name      CitySearch_SearchCities_0058
     * @tc.desc      searchCities(value="KthYGB") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0058 begin`);
      const actual: string[] = searchCities('KthYGB');
      logInfo(`searchCities(value="KthYGB"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0059
     * @tc.name      CitySearch_SearchCities_0059
     * @tc.desc      searchCities(value="gJSZSDayJs") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0059 begin`);
      const actual: string[] = searchCities('gJSZSDayJs');
      logInfo(`searchCities(value="gJSZSDayJs"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0060
     * @tc.name      CitySearch_SearchCities_0060
     * @tc.desc      searchCities(value="2lct0s") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0060 begin`);
      const actual: string[] = searchCities('2lct0s');
      logInfo(`searchCities(value="2lct0s"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0061
     * @tc.name      CitySearch_SearchCities_0061
     * @tc.desc      searchCities(value="WysUlfksYS5") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0061 begin`);
      const actual: string[] = searchCities('WysUlfksYS5');
      logInfo(`searchCities(value="WysUlfksYS5"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0062
     * @tc.name      CitySearch_SearchCities_0062
     * @tc.desc      searchCities(value="cuuBQ5x") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0062 begin`);
      const actual: string[] = searchCities('cuuBQ5x');
      logInfo(`searchCities(value="cuuBQ5x"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0063
     * @tc.name      CitySearch_SearchCities_0063
     * @tc.desc      searchCities(value="WRwvnynL") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0063 begin`);
      const actual: string[] = searchCities('WRwvnynL');
      logInfo(`searchCities(value="WRwvnynL"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0064
     * @tc.name      CitySearch_SearchCities_0064
     * @tc.desc      searchCities(value="TVqwpISPxB") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0064 begin`);
      const actual: string[] = searchCities('TVqwpISPxB');
      logInfo(`searchCities(value="TVqwpISPxB"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0065
     * @tc.name      CitySearch_SearchCities_0065
     * @tc.desc      searchCities(value="VkBiVjSR4dr") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0065 begin`);
      const actual: string[] = searchCities('VkBiVjSR4dr');
      logInfo(`searchCities(value="VkBiVjSR4dr"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0066
     * @tc.name      CitySearch_SearchCities_0066
     * @tc.desc      searchCities(value="HN") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0066 begin`);
      const actual: string[] = searchCities('HN');
      logInfo(`searchCities(value="HN"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0067
     * @tc.name      CitySearch_SearchCities_0067
     * @tc.desc      searchCities(value="ryAL7") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0067 begin`);
      const actual: string[] = searchCities('ryAL7');
      logInfo(`searchCities(value="ryAL7"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0068
     * @tc.name      CitySearch_SearchCities_0068
     * @tc.desc      searchCities(value="ZmYpU") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0068 begin`);
      const actual: string[] = searchCities('ZmYpU');
      logInfo(`searchCities(value="ZmYpU"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0069
     * @tc.name      CitySearch_SearchCities_0069
     * @tc.desc      searchCities(value="TN4ryXo") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0069 begin`);
      const actual: string[] = searchCities('TN4ryXo');
      logInfo(`searchCities(value="TN4ryXo"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0070
     * @tc.name      CitySearch_SearchCities_0070
     * @tc.desc      searchCities(value="bl1lXRHJ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0070 begin`);
      const actual: string[] = searchCities('bl1lXRHJ');
      logInfo(`searchCities(value="bl1lXRHJ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0071
     * @tc.name      CitySearch_SearchCities_0071
     * @tc.desc      searchCities(value="GY1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0071 begin`);
      const actual: string[] = searchCities('GY1');
      logInfo(`searchCities(value="GY1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0072
     * @tc.name      CitySearch_SearchCities_0072
     * @tc.desc      searchCities(value="9gpBz7") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0072 begin`);
      const actual: string[] = searchCities('9gpBz7');
      logInfo(`searchCities(value="9gpBz7"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0073
     * @tc.name      CitySearch_SearchCities_0073
     * @tc.desc      searchCities(value="6Fke2AS") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0073 begin`);
      const actual: string[] = searchCities('6Fke2AS');
      logInfo(`searchCities(value="6Fke2AS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0074
     * @tc.name      CitySearch_SearchCities_0074
     * @tc.desc      searchCities(value="hIKJLjPeMW") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0074 begin`);
      const actual: string[] = searchCities('hIKJLjPeMW');
      logInfo(`searchCities(value="hIKJLjPeMW"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0075
     * @tc.name      CitySearch_SearchCities_0075
     * @tc.desc      searchCities(value="jG") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0075 begin`);
      const actual: string[] = searchCities('jG');
      logInfo(`searchCities(value="jG"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0076
     * @tc.name      CitySearch_SearchCities_0076
     * @tc.desc      searchCities(value="N2QX332E") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0076 begin`);
      const actual: string[] = searchCities('N2QX332E');
      logInfo(`searchCities(value="N2QX332E"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0077
     * @tc.name      CitySearch_SearchCities_0077
     * @tc.desc      searchCities(value="gj8FQrbM") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0077 begin`);
      const actual: string[] = searchCities('gj8FQrbM');
      logInfo(`searchCities(value="gj8FQrbM"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0078
     * @tc.name      CitySearch_SearchCities_0078
     * @tc.desc      searchCities(value="k") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0078 begin`);
      const actual: string[] = searchCities('k');
      logInfo(`searchCities(value="k"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0079
     * @tc.name      CitySearch_SearchCities_0079
     * @tc.desc      searchCities(value="jrs29jARD") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0079 begin`);
      const actual: string[] = searchCities('jrs29jARD');
      logInfo(`searchCities(value="jrs29jARD"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0080
     * @tc.name      CitySearch_SearchCities_0080
     * @tc.desc      searchCities(value="c0Jnfq") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0080 begin`);
      const actual: string[] = searchCities('c0Jnfq');
      logInfo(`searchCities(value="c0Jnfq"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0081
     * @tc.name      CitySearch_SearchCities_0081
     * @tc.desc      searchCities(value="4BzC3v") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0081 begin`);
      const actual: string[] = searchCities('4BzC3v');
      logInfo(`searchCities(value="4BzC3v"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0082
     * @tc.name      CitySearch_SearchCities_0082
     * @tc.desc      searchCities(value="lbD5vv") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0082 begin`);
      const actual: string[] = searchCities('lbD5vv');
      logInfo(`searchCities(value="lbD5vv"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0083
     * @tc.name      CitySearch_SearchCities_0083
     * @tc.desc      searchCities(value="fhgd") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0083 begin`);
      const actual: string[] = searchCities('fhgd');
      logInfo(`searchCities(value="fhgd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0084
     * @tc.name      CitySearch_SearchCities_0084
     * @tc.desc      searchCities(value="FdeqC") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0084 begin`);
      const actual: string[] = searchCities('FdeqC');
      logInfo(`searchCities(value="FdeqC"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0085
     * @tc.name      CitySearch_SearchCities_0085
     * @tc.desc      searchCities(value="Ckh") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0085 begin`);
      const actual: string[] = searchCities('Ckh');
      logInfo(`searchCities(value="Ckh"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0086
     * @tc.name      CitySearch_SearchCities_0086
     * @tc.desc      searchCities(value="B5pz8r") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0086 begin`);
      const actual: string[] = searchCities('B5pz8r');
      logInfo(`searchCities(value="B5pz8r"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0087
     * @tc.name      CitySearch_SearchCities_0087
     * @tc.desc      searchCities(value="KdpaK5bOMZy") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0087 begin`);
      const actual: string[] = searchCities('KdpaK5bOMZy');
      logInfo(`searchCities(value="KdpaK5bOMZy"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0088
     * @tc.name      CitySearch_SearchCities_0088
     * @tc.desc      searchCities(value="oL") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0088 begin`);
      const actual: string[] = searchCities('oL');
      logInfo(`searchCities(value="oL"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0089
     * @tc.name      CitySearch_SearchCities_0089
     * @tc.desc      searchCities(value="HMdZ34W") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0089 begin`);
      const actual: string[] = searchCities('HMdZ34W');
      logInfo(`searchCities(value="HMdZ34W"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0090
     * @tc.name      CitySearch_SearchCities_0090
     * @tc.desc      searchCities(value="o6ud") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0090 begin`);
      const actual: string[] = searchCities('o6ud');
      logInfo(`searchCities(value="o6ud"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0091
     * @tc.name      CitySearch_SearchCities_0091
     * @tc.desc      searchCities(value="WuP") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0091 begin`);
      const actual: string[] = searchCities('WuP');
      logInfo(`searchCities(value="WuP"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0092
     * @tc.name      CitySearch_SearchCities_0092
     * @tc.desc      searchCities(value="sTC2i") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0092 begin`);
      const actual: string[] = searchCities('sTC2i');
      logInfo(`searchCities(value="sTC2i"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0093
     * @tc.name      CitySearch_SearchCities_0093
     * @tc.desc      searchCities(value="bLpSRW3") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0093 begin`);
      const actual: string[] = searchCities('bLpSRW3');
      logInfo(`searchCities(value="bLpSRW3"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0094
     * @tc.name      CitySearch_SearchCities_0094
     * @tc.desc      searchCities(value="xsldUqU7vq9") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0094 begin`);
      const actual: string[] = searchCities('xsldUqU7vq9');
      logInfo(`searchCities(value="xsldUqU7vq9"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0095
     * @tc.name      CitySearch_SearchCities_0095
     * @tc.desc      searchCities(value="QZqLt2Y") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0095 begin`);
      const actual: string[] = searchCities('QZqLt2Y');
      logInfo(`searchCities(value="QZqLt2Y"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0095 end`);
    });
  });
}
