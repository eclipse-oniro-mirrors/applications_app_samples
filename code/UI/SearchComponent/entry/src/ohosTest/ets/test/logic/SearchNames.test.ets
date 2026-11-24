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
import { searchNames } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for searchNames (94 cases). */
export default function searchNamesTest(): void {
  describe('SearchNamesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0001
     * @tc.name      SearchComponent_SearchNames_0001
     * @tc.desc      searchNames(value="Hello", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchNames_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchNames_0001 begin`);
      const actual: string[] = searchNames('Hello', '');
      logInfo(`searchNames(value="Hello", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0002
     * @tc.name      SearchComponent_SearchNames_0002
     * @tc.desc      searchNames(value=" ", category="") returns ["XComponent + Vsync ???????"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchNames_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchNames_0002 begin`);
      const actual: string[] = searchNames(' ', '');
      logInfo(`searchNames(value=" ", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`searchNames(value=" ", category=""): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["XComponent + Vsync \u5b9e\u73b0\u81ea\u5b9a\u4e49\u52a8\u753b"]');
      logInfo(`${BUNDLE}SearchNames_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0003
     * @tc.name      SearchComponent_SearchNames_0003
     * @tc.desc      searchNames(value="A", category="") returns "?TabBar????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0003 begin`);
      const actual: string[] = searchNames('A', '');
      logInfo(`searchNames(value="A", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(26);
      logInfo(`searchNames(value="A", category=""): JSON.stringify(actual.sli...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b"]');
      logInfo(`searchNames(value="A", category=""): actual[13].length=${actual[13].length}`);
      expect(actual[13].length).assertEqual(22);
      logInfo(`searchNames(value="A", category=""): actual[13].substring(0, 16)=${actual[13].substring(0, 16)}`);
      expect(actual[13].substring(0, 16)).assertEqual('\u914d\u7f6eImageKnife\u8bf7\u6c42\u5934\u5b9e');
      logInfo(`searchNames(value="A", category=""): actual[13].substring(16)=${actual[13].substring(16)}`);
      expect(actual[13].substring(16)).assertEqual('\u73b0\u9632\u76d7\u94fe\u529f\u80fd');
      logInfo(`searchNames(value="A", category=""): actual[25].length=${actual[25].length}`);
      expect(actual[25].length).assertEqual(20);
      logInfo(`searchNames(value="A", category=""): actual[25].substring(0, 8)=${actual[25].substring(0, 8)}`);
      expect(actual[25].substring(0, 8)).assertEqual('\u80cc\u666f\u6a21\u7cca\u6548\u679c\u7684\u81ea');
      logInfo(`searchNames(value="A", category=""): actual[25].substring(9)=${actual[25].substring(9)}`);
      expect(actual[25].substring(9)).assertEqual('\u4e49TabBar\u5b9e\u73b0\u6848\u4f8b');
      logInfo(`${BUNDLE}SearchNames_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0004
     * @tc.name      SearchComponent_SearchNames_0004
     * @tc.desc      searchNames(value="abc", category="") returns "??????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0004 begin`);
      const actual: string[] = searchNames('abc', '');
      logInfo(`searchNames(value="abc", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`searchNames(value="abc", category=""): actual[0].length=${actual[0].length}`);
      expect(actual[0].length).assertEqual(33);
      logInfo(`searchNames(value="abc", category=""): actual[0].substring(0, 21)=${actual[0].substring(0, 21)}`);
      expect(actual[0].substring(0, 21)).assertEqual('tabContent\u5185\u5bb9\u53ef\u4ee5\u5728tabBar');
      logInfo(`searchNames(value="abc", category=""): actual[0].substring(27)=${actual[0].substring(27)}`);
      expect(actual[0].substring(27)).assertEqual('\u6ed1\u52a8\u4e8b\u4ef6\u6848\u4f8b');
      logInfo(`${BUNDLE}SearchNames_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0005
     * @tc.name      SearchComponent_SearchNames_0005
     * @tc.desc      searchNames(value="123", category="") returns ["NavDestination??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0005 begin`);
      const actual: string[] = searchNames('123', '');
      logInfo(`searchNames(value="123", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`searchNames(value="123", category=""): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["NavDestination\u5f39\u7a97"]');
      logInfo(`${BUNDLE}SearchNames_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0006
     * @tc.name      SearchComponent_SearchNames_0006
     * @tc.desc      searchNames(value="Hello", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0006 begin`);
      const actual: string[] = searchNames('Hello', 'a');
      logInfo(`searchNames(value="Hello", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0007
     * @tc.name      SearchComponent_SearchNames_0007
     * @tc.desc      searchNames(value="Hello", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0007 begin`);
      const actual: string[] = searchNames('Hello', 'abc');
      logInfo(`searchNames(value="Hello", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0008
     * @tc.name      SearchComponent_SearchNames_0008
     * @tc.desc      searchNames(value="Hello", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0008 begin`);
      const actual: string[] = searchNames('Hello', 'Hello World');
      logInfo(`searchNames(value="Hello", category="Hell...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0009
     * @tc.name      SearchComponent_SearchNames_0009
     * @tc.desc      searchNames(value="Hello", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0009 begin`);
      const actual: string[] = searchNames('Hello', ' ');
      logInfo(`searchNames(value="Hello", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0010
     * @tc.name      SearchComponent_SearchNames_0010
     * @tc.desc      searchNames(value="Hello", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0010 begin`);
      const actual: string[] = searchNames('Hello', '123');
      logInfo(`searchNames(value="Hello", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0011
     * @tc.name      SearchComponent_SearchNames_0011
     * @tc.desc      searchNames(value="Hello", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0011 begin`);
      const actual: string[] = searchNames('Hello', ' a ');
      logInfo(`searchNames(value="Hello", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0012
     * @tc.name      SearchComponent_SearchNames_0012
     * @tc.desc      searchNames(value="Hello", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0012 begin`);
      const actual: string[] = searchNames('Hello', 'aa');
      logInfo(`searchNames(value="Hello", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0013
     * @tc.name      SearchComponent_SearchNames_0013
     * @tc.desc      searchNames(value="Hello", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0013 begin`);
      const actual: string[] = searchNames('Hello', 'a_1');
      logInfo(`searchNames(value="Hello", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0014
     * @tc.name      SearchComponent_SearchNames_0014
     * @tc.desc      searchNames(value="Hello", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0014 begin`);
      const actual: string[] = searchNames('Hello', 'xa');
      logInfo(`searchNames(value="Hello", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0015
     * @tc.name      SearchComponent_SearchNames_0015
     * @tc.desc      searchNames(value="Hello", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0015 begin`);
      const actual: string[] = searchNames('Hello', ' abc ');
      logInfo(`searchNames(value="Hello", category=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0016
     * @tc.name      SearchComponent_SearchNames_0016
     * @tc.desc      searchNames(value="Hello", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0016 begin`);
      const actual: string[] = searchNames('Hello', 'abcabc');
      logInfo(`searchNames(value="Hello", category="abca...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0017
     * @tc.name      SearchComponent_SearchNames_0017
     * @tc.desc      searchNames(value="Hello", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0017 begin`);
      const actual: string[] = searchNames('Hello', 'abc_1');
      logInfo(`searchNames(value="Hello", category="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0018
     * @tc.name      SearchComponent_SearchNames_0018
     * @tc.desc      searchNames(value="Hello", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0018 begin`);
      const actual: string[] = searchNames('Hello', 'xabc');
      logInfo(`searchNames(value="Hello", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0019
     * @tc.name      SearchComponent_SearchNames_0019
     * @tc.desc      searchNames(value="Hello", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0019 begin`);
      const actual: string[] = searchNames('Hello', ' Hello World ');
      logInfo(`searchNames(value="Hello", category=" Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0020
     * @tc.name      SearchComponent_SearchNames_0020
     * @tc.desc      searchNames(value="Hello", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0020 begin`);
      const actual: string[] = searchNames('Hello', 'Hello WorldHello World');
      logInfo(`searchNames(value="Hello", category="Hell...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0021
     * @tc.name      SearchComponent_SearchNames_0021
     * @tc.desc      searchNames(value="Hello", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0021 begin`);
      const actual: string[] = searchNames('Hello', 'Hello World_1');
      logInfo(`searchNames(value="Hello", category="Hell...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0022
     * @tc.name      SearchComponent_SearchNames_0022
     * @tc.desc      searchNames(value="Hello", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0022 begin`);
      const actual: string[] = searchNames('Hello', 'xHello World');
      logInfo(`searchNames(value="Hello", category="xHel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0023
     * @tc.name      SearchComponent_SearchNames_0023
     * @tc.desc      searchNames(value="Hello", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0023 begin`);
      const actual: string[] = searchNames('Hello', '   ');
      logInfo(`searchNames(value="Hello", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0024
     * @tc.name      SearchComponent_SearchNames_0024
     * @tc.desc      searchNames(value="Hello", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0024 begin`);
      const actual: string[] = searchNames('Hello', '  ');
      logInfo(`searchNames(value="Hello", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0025
     * @tc.name      SearchComponent_SearchNames_0025
     * @tc.desc      searchNames(value="Hello", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0025 begin`);
      const actual: string[] = searchNames('Hello', ' _1');
      logInfo(`searchNames(value="Hello", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0026
     * @tc.name      SearchComponent_SearchNames_0026
     * @tc.desc      searchNames(value="Hello", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0026 begin`);
      const actual: string[] = searchNames('Hello', 'x ');
      logInfo(`searchNames(value="Hello", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0027
     * @tc.name      SearchComponent_SearchNames_0027
     * @tc.desc      searchNames(value="Hello", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0027 begin`);
      const actual: string[] = searchNames('Hello', ' 123 ');
      logInfo(`searchNames(value="Hello", category=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0028
     * @tc.name      SearchComponent_SearchNames_0028
     * @tc.desc      searchNames(value="Hello", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0028 begin`);
      const actual: string[] = searchNames('Hello', '123123');
      logInfo(`searchNames(value="Hello", category="1231...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0029
     * @tc.name      SearchComponent_SearchNames_0029
     * @tc.desc      searchNames(value="hello world", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0029 begin`);
      const actual: string[] = searchNames('hello world', '');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0030
     * @tc.name      SearchComponent_SearchNames_0030
     * @tc.desc      searchNames(value="hello world", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0030 begin`);
      const actual: string[] = searchNames('hello world', 'a');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0031
     * @tc.name      SearchComponent_SearchNames_0031
     * @tc.desc      searchNames(value="hello world", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0031 begin`);
      const actual: string[] = searchNames('hello world', 'abc');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0032
     * @tc.name      SearchComponent_SearchNames_0032
     * @tc.desc      searchNames(value="hello world", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0032 begin`);
      const actual: string[] = searchNames('hello world', 'Hello World');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0033
     * @tc.name      SearchComponent_SearchNames_0033
     * @tc.desc      searchNames(value="hello world", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0033 begin`);
      const actual: string[] = searchNames('hello world', ' ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0034
     * @tc.name      SearchComponent_SearchNames_0034
     * @tc.desc      searchNames(value="hello world", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0034 begin`);
      const actual: string[] = searchNames('hello world', '123');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0035
     * @tc.name      SearchComponent_SearchNames_0035
     * @tc.desc      searchNames(value="hello world", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0035 begin`);
      const actual: string[] = searchNames('hello world', ' a ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0036
     * @tc.name      SearchComponent_SearchNames_0036
     * @tc.desc      searchNames(value="hello world", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0036 begin`);
      const actual: string[] = searchNames('hello world', 'aa');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0037
     * @tc.name      SearchComponent_SearchNames_0037
     * @tc.desc      searchNames(value="hello world", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0037 begin`);
      const actual: string[] = searchNames('hello world', 'a_1');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0038
     * @tc.name      SearchComponent_SearchNames_0038
     * @tc.desc      searchNames(value="hello world", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0038 begin`);
      const actual: string[] = searchNames('hello world', 'xa');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0039
     * @tc.name      SearchComponent_SearchNames_0039
     * @tc.desc      searchNames(value="hello world", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0039 begin`);
      const actual: string[] = searchNames('hello world', ' abc ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0040
     * @tc.name      SearchComponent_SearchNames_0040
     * @tc.desc      searchNames(value="hello world", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0040 begin`);
      const actual: string[] = searchNames('hello world', 'abcabc');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0041
     * @tc.name      SearchComponent_SearchNames_0041
     * @tc.desc      searchNames(value="hello world", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0041 begin`);
      const actual: string[] = searchNames('hello world', 'abc_1');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0042
     * @tc.name      SearchComponent_SearchNames_0042
     * @tc.desc      searchNames(value="hello world", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0042 begin`);
      const actual: string[] = searchNames('hello world', 'xabc');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0043
     * @tc.name      SearchComponent_SearchNames_0043
     * @tc.desc      searchNames(value="hello world", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0043 begin`);
      const actual: string[] = searchNames('hello world', ' Hello World ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0044
     * @tc.name      SearchComponent_SearchNames_0044
     * @tc.desc      searchNames(value="hello world", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0044 begin`);
      const actual: string[] = searchNames('hello world', 'Hello WorldHello World');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0045
     * @tc.name      SearchComponent_SearchNames_0045
     * @tc.desc      searchNames(value="hello world", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0045 begin`);
      const actual: string[] = searchNames('hello world', 'Hello World_1');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0046
     * @tc.name      SearchComponent_SearchNames_0046
     * @tc.desc      searchNames(value="hello world", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0046 begin`);
      const actual: string[] = searchNames('hello world', 'xHello World');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0047
     * @tc.name      SearchComponent_SearchNames_0047
     * @tc.desc      searchNames(value="hello world", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0047 begin`);
      const actual: string[] = searchNames('hello world', '   ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0048
     * @tc.name      SearchComponent_SearchNames_0048
     * @tc.desc      searchNames(value="hello world", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0048 begin`);
      const actual: string[] = searchNames('hello world', '  ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0049
     * @tc.name      SearchComponent_SearchNames_0049
     * @tc.desc      searchNames(value="hello world", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0049 begin`);
      const actual: string[] = searchNames('hello world', ' _1');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0050
     * @tc.name      SearchComponent_SearchNames_0050
     * @tc.desc      searchNames(value="hello world", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0050 begin`);
      const actual: string[] = searchNames('hello world', 'x ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0051
     * @tc.name      SearchComponent_SearchNames_0051
     * @tc.desc      searchNames(value="hello world", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0051 begin`);
      const actual: string[] = searchNames('hello world', ' 123 ');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0052
     * @tc.name      SearchComponent_SearchNames_0052
     * @tc.desc      searchNames(value="hello world", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0052 begin`);
      const actual: string[] = searchNames('hello world', '123123');
      logInfo(`searchNames(value="hello world", category...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0053
     * @tc.name      SearchComponent_SearchNames_0053
     * @tc.desc      searchNames(value="", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0053 begin`);
      const actual: string[] = searchNames('', '');
      logInfo(`searchNames(value="", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0054
     * @tc.name      SearchComponent_SearchNames_0054
     * @tc.desc      searchNames(value="", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0054 begin`);
      const actual: string[] = searchNames('', 'a');
      logInfo(`searchNames(value="", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0055
     * @tc.name      SearchComponent_SearchNames_0055
     * @tc.desc      searchNames(value="", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0055 begin`);
      const actual: string[] = searchNames('', 'abc');
      logInfo(`searchNames(value="", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0056
     * @tc.name      SearchComponent_SearchNames_0056
     * @tc.desc      searchNames(value="", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0056 begin`);
      const actual: string[] = searchNames('', 'Hello World');
      logInfo(`searchNames(value="", category="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0057
     * @tc.name      SearchComponent_SearchNames_0057
     * @tc.desc      searchNames(value="", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0057 begin`);
      const actual: string[] = searchNames('', ' ');
      logInfo(`searchNames(value="", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0058
     * @tc.name      SearchComponent_SearchNames_0058
     * @tc.desc      searchNames(value="", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0058 begin`);
      const actual: string[] = searchNames('', '123');
      logInfo(`searchNames(value="", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0059
     * @tc.name      SearchComponent_SearchNames_0059
     * @tc.desc      searchNames(value="", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0059 begin`);
      const actual: string[] = searchNames('', ' a ');
      logInfo(`searchNames(value="", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0060
     * @tc.name      SearchComponent_SearchNames_0060
     * @tc.desc      searchNames(value="", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0060 begin`);
      const actual: string[] = searchNames('', 'aa');
      logInfo(`searchNames(value="", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0061
     * @tc.name      SearchComponent_SearchNames_0061
     * @tc.desc      searchNames(value="", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0061 begin`);
      const actual: string[] = searchNames('', 'a_1');
      logInfo(`searchNames(value="", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0062
     * @tc.name      SearchComponent_SearchNames_0062
     * @tc.desc      searchNames(value="", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0062 begin`);
      const actual: string[] = searchNames('', 'xa');
      logInfo(`searchNames(value="", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0063
     * @tc.name      SearchComponent_SearchNames_0063
     * @tc.desc      searchNames(value="", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0063 begin`);
      const actual: string[] = searchNames('', ' abc ');
      logInfo(`searchNames(value="", category=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0064
     * @tc.name      SearchComponent_SearchNames_0064
     * @tc.desc      searchNames(value="", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0064 begin`);
      const actual: string[] = searchNames('', 'abcabc');
      logInfo(`searchNames(value="", category="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0065
     * @tc.name      SearchComponent_SearchNames_0065
     * @tc.desc      searchNames(value="", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0065 begin`);
      const actual: string[] = searchNames('', 'abc_1');
      logInfo(`searchNames(value="", category="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0066
     * @tc.name      SearchComponent_SearchNames_0066
     * @tc.desc      searchNames(value="", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0066 begin`);
      const actual: string[] = searchNames('', 'xabc');
      logInfo(`searchNames(value="", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0067
     * @tc.name      SearchComponent_SearchNames_0067
     * @tc.desc      searchNames(value="", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0067 begin`);
      const actual: string[] = searchNames('', ' Hello World ');
      logInfo(`searchNames(value="", category=" Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0068
     * @tc.name      SearchComponent_SearchNames_0068
     * @tc.desc      searchNames(value="", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0068 begin`);
      const actual: string[] = searchNames('', 'Hello WorldHello World');
      logInfo(`searchNames(value="", category="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0069
     * @tc.name      SearchComponent_SearchNames_0069
     * @tc.desc      searchNames(value="", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0069 begin`);
      const actual: string[] = searchNames('', 'Hello World_1');
      logInfo(`searchNames(value="", category="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0070
     * @tc.name      SearchComponent_SearchNames_0070
     * @tc.desc      searchNames(value="", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0070 begin`);
      const actual: string[] = searchNames('', 'xHello World');
      logInfo(`searchNames(value="", category="xHello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0071
     * @tc.name      SearchComponent_SearchNames_0071
     * @tc.desc      searchNames(value="", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0071 begin`);
      const actual: string[] = searchNames('', '   ');
      logInfo(`searchNames(value="", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0072
     * @tc.name      SearchComponent_SearchNames_0072
     * @tc.desc      searchNames(value="", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0072 begin`);
      const actual: string[] = searchNames('', '  ');
      logInfo(`searchNames(value="", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0073
     * @tc.name      SearchComponent_SearchNames_0073
     * @tc.desc      searchNames(value="", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0073 begin`);
      const actual: string[] = searchNames('', ' _1');
      logInfo(`searchNames(value="", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0074
     * @tc.name      SearchComponent_SearchNames_0074
     * @tc.desc      searchNames(value="", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0074 begin`);
      const actual: string[] = searchNames('', 'x ');
      logInfo(`searchNames(value="", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0075
     * @tc.name      SearchComponent_SearchNames_0075
     * @tc.desc      searchNames(value="", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0075 begin`);
      const actual: string[] = searchNames('', ' 123 ');
      logInfo(`searchNames(value="", category=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0076
     * @tc.name      SearchComponent_SearchNames_0076
     * @tc.desc      searchNames(value="", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0076 begin`);
      const actual: string[] = searchNames('', '123123');
      logInfo(`searchNames(value="", category="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0077
     * @tc.name      SearchComponent_SearchNames_0077
     * @tc.desc      searchNames(value=" ", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0077 begin`);
      const actual: string[] = searchNames(' ', 'a');
      logInfo(`searchNames(value=" ", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0078
     * @tc.name      SearchComponent_SearchNames_0078
     * @tc.desc      searchNames(value=" ", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0078 begin`);
      const actual: string[] = searchNames(' ', 'abc');
      logInfo(`searchNames(value=" ", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0079
     * @tc.name      SearchComponent_SearchNames_0079
     * @tc.desc      searchNames(value=" ", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0079 begin`);
      const actual: string[] = searchNames(' ', 'Hello World');
      logInfo(`searchNames(value=" ", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0080
     * @tc.name      SearchComponent_SearchNames_0080
     * @tc.desc      searchNames(value=" ", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0080 begin`);
      const actual: string[] = searchNames(' ', ' ');
      logInfo(`searchNames(value=" ", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0081
     * @tc.name      SearchComponent_SearchNames_0081
     * @tc.desc      searchNames(value=" ", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0081 begin`);
      const actual: string[] = searchNames(' ', '123');
      logInfo(`searchNames(value=" ", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0082
     * @tc.name      SearchComponent_SearchNames_0082
     * @tc.desc      searchNames(value=" ", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0082 begin`);
      const actual: string[] = searchNames(' ', ' a ');
      logInfo(`searchNames(value=" ", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0083
     * @tc.name      SearchComponent_SearchNames_0083
     * @tc.desc      searchNames(value=" ", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0083 begin`);
      const actual: string[] = searchNames(' ', 'aa');
      logInfo(`searchNames(value=" ", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0084
     * @tc.name      SearchComponent_SearchNames_0084
     * @tc.desc      searchNames(value=" ", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0084 begin`);
      const actual: string[] = searchNames(' ', 'a_1');
      logInfo(`searchNames(value=" ", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0085
     * @tc.name      SearchComponent_SearchNames_0085
     * @tc.desc      searchNames(value=" ", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0085 begin`);
      const actual: string[] = searchNames(' ', 'xa');
      logInfo(`searchNames(value=" ", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0086
     * @tc.name      SearchComponent_SearchNames_0086
     * @tc.desc      searchNames(value=" ", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0086 begin`);
      const actual: string[] = searchNames(' ', ' abc ');
      logInfo(`searchNames(value=" ", category=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0087
     * @tc.name      SearchComponent_SearchNames_0087
     * @tc.desc      searchNames(value=" ", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0087 begin`);
      const actual: string[] = searchNames(' ', 'abcabc');
      logInfo(`searchNames(value=" ", category="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0088
     * @tc.name      SearchComponent_SearchNames_0088
     * @tc.desc      searchNames(value=" ", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0088 begin`);
      const actual: string[] = searchNames(' ', 'abc_1');
      logInfo(`searchNames(value=" ", category="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0089
     * @tc.name      SearchComponent_SearchNames_0089
     * @tc.desc      searchNames(value=" ", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0089 begin`);
      const actual: string[] = searchNames(' ', 'xabc');
      logInfo(`searchNames(value=" ", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0090
     * @tc.name      SearchComponent_SearchNames_0090
     * @tc.desc      searchNames(value=" ", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0090 begin`);
      const actual: string[] = searchNames(' ', ' Hello World ');
      logInfo(`searchNames(value=" ", category=" Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0091
     * @tc.name      SearchComponent_SearchNames_0091
     * @tc.desc      searchNames(value=" ", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0091 begin`);
      const actual: string[] = searchNames(' ', 'Hello WorldHello World');
      logInfo(`searchNames(value=" ", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0092
     * @tc.name      SearchComponent_SearchNames_0092
     * @tc.desc      searchNames(value=" ", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0092 begin`);
      const actual: string[] = searchNames(' ', 'Hello World_1');
      logInfo(`searchNames(value=" ", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0093
     * @tc.name      SearchComponent_SearchNames_0093
     * @tc.desc      searchNames(value=" ", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0093 begin`);
      const actual: string[] = searchNames(' ', 'xHello World');
      logInfo(`searchNames(value=" ", category="xHello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0094
     * @tc.name      SearchComponent_SearchNames_0094
     * @tc.desc      searchNames(value=" ", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0094 begin`);
      const actual: string[] = searchNames(' ', '   ');
      logInfo(`searchNames(value=" ", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0094 end`);
    });
  });
}
