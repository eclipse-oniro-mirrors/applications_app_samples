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

/** Logic checks for searchNames (31 cases). */
export default function searchNames2Test(): void {
  describe('SearchNames2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0095
     * @tc.name      SearchComponent_SearchNames_0095
     * @tc.desc      searchNames(value=" ", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0095 begin`);
      const actual: string[] = searchNames(' ', '  ');
      logInfo(`searchNames(value=" ", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0096
     * @tc.name      SearchComponent_SearchNames_0096
     * @tc.desc      searchNames(value=" ", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0096 begin`);
      const actual: string[] = searchNames(' ', ' _1');
      logInfo(`searchNames(value=" ", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0096 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0097
     * @tc.name      SearchComponent_SearchNames_0097
     * @tc.desc      searchNames(value=" ", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0097 begin`);
      const actual: string[] = searchNames(' ', 'x ');
      logInfo(`searchNames(value=" ", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0098
     * @tc.name      SearchComponent_SearchNames_0098
     * @tc.desc      searchNames(value=" ", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0098 begin`);
      const actual: string[] = searchNames(' ', ' 123 ');
      logInfo(`searchNames(value=" ", category=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0099
     * @tc.name      SearchComponent_SearchNames_0099
     * @tc.desc      searchNames(value=" ", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0099 begin`);
      const actual: string[] = searchNames(' ', '123123');
      logInfo(`searchNames(value=" ", category="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0100
     * @tc.name      SearchComponent_SearchNames_0100
     * @tc.desc      searchNames(value="A", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0100 begin`);
      const actual: string[] = searchNames('A', 'a');
      logInfo(`searchNames(value="A", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0101
     * @tc.name      SearchComponent_SearchNames_0101
     * @tc.desc      searchNames(value="A", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0101 begin`);
      const actual: string[] = searchNames('A', 'abc');
      logInfo(`searchNames(value="A", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0102
     * @tc.name      SearchComponent_SearchNames_0102
     * @tc.desc      searchNames(value="A", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0102 begin`);
      const actual: string[] = searchNames('A', 'Hello World');
      logInfo(`searchNames(value="A", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0103
     * @tc.name      SearchComponent_SearchNames_0103
     * @tc.desc      searchNames(value="A", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0103 begin`);
      const actual: string[] = searchNames('A', ' ');
      logInfo(`searchNames(value="A", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0104
     * @tc.name      SearchComponent_SearchNames_0104
     * @tc.desc      searchNames(value="A", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0104 begin`);
      const actual: string[] = searchNames('A', '123');
      logInfo(`searchNames(value="A", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0105
     * @tc.name      SearchComponent_SearchNames_0105
     * @tc.desc      searchNames(value="A", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0105 begin`);
      const actual: string[] = searchNames('A', ' a ');
      logInfo(`searchNames(value="A", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0106
     * @tc.name      SearchComponent_SearchNames_0106
     * @tc.desc      searchNames(value="A", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0106 begin`);
      const actual: string[] = searchNames('A', 'aa');
      logInfo(`searchNames(value="A", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0107
     * @tc.name      SearchComponent_SearchNames_0107
     * @tc.desc      searchNames(value="A", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0107 begin`);
      const actual: string[] = searchNames('A', 'a_1');
      logInfo(`searchNames(value="A", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0108
     * @tc.name      SearchComponent_SearchNames_0108
     * @tc.desc      searchNames(value="A", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0108 begin`);
      const actual: string[] = searchNames('A', 'xa');
      logInfo(`searchNames(value="A", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0109
     * @tc.name      SearchComponent_SearchNames_0109
     * @tc.desc      searchNames(value="A", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0109 begin`);
      const actual: string[] = searchNames('A', ' abc ');
      logInfo(`searchNames(value="A", category=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0110
     * @tc.name      SearchComponent_SearchNames_0110
     * @tc.desc      searchNames(value="A", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0110 begin`);
      const actual: string[] = searchNames('A', 'abcabc');
      logInfo(`searchNames(value="A", category="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0111
     * @tc.name      SearchComponent_SearchNames_0111
     * @tc.desc      searchNames(value="A", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0111 begin`);
      const actual: string[] = searchNames('A', 'abc_1');
      logInfo(`searchNames(value="A", category="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0112
     * @tc.name      SearchComponent_SearchNames_0112
     * @tc.desc      searchNames(value="A", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0112 begin`);
      const actual: string[] = searchNames('A', 'xabc');
      logInfo(`searchNames(value="A", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0113
     * @tc.name      SearchComponent_SearchNames_0113
     * @tc.desc      searchNames(value="A", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0113 begin`);
      const actual: string[] = searchNames('A', ' Hello World ');
      logInfo(`searchNames(value="A", category=" Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0114
     * @tc.name      SearchComponent_SearchNames_0114
     * @tc.desc      searchNames(value="A", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0114 begin`);
      const actual: string[] = searchNames('A', 'Hello WorldHello World');
      logInfo(`searchNames(value="A", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0115
     * @tc.name      SearchComponent_SearchNames_0115
     * @tc.desc      searchNames(value="A", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0115 begin`);
      const actual: string[] = searchNames('A', 'Hello World_1');
      logInfo(`searchNames(value="A", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0116
     * @tc.name      SearchComponent_SearchNames_0116
     * @tc.desc      searchNames(value="A", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0116 begin`);
      const actual: string[] = searchNames('A', 'xHello World');
      logInfo(`searchNames(value="A", category="xHello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0117
     * @tc.name      SearchComponent_SearchNames_0117
     * @tc.desc      searchNames(value="A", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0117 begin`);
      const actual: string[] = searchNames('A', '   ');
      logInfo(`searchNames(value="A", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0118
     * @tc.name      SearchComponent_SearchNames_0118
     * @tc.desc      searchNames(value="A", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0118 begin`);
      const actual: string[] = searchNames('A', '  ');
      logInfo(`searchNames(value="A", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0119
     * @tc.name      SearchComponent_SearchNames_0119
     * @tc.desc      searchNames(value="A", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0119 begin`);
      const actual: string[] = searchNames('A', ' _1');
      logInfo(`searchNames(value="A", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0120
     * @tc.name      SearchComponent_SearchNames_0120
     * @tc.desc      searchNames(value="A", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0120 begin`);
      const actual: string[] = searchNames('A', 'x ');
      logInfo(`searchNames(value="A", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0121
     * @tc.name      SearchComponent_SearchNames_0121
     * @tc.desc      searchNames(value="A", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0121 begin`);
      const actual: string[] = searchNames('A', ' 123 ');
      logInfo(`searchNames(value="A", category=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0122
     * @tc.name      SearchComponent_SearchNames_0122
     * @tc.desc      searchNames(value="A", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0122 begin`);
      const actual: string[] = searchNames('A', '123123');
      logInfo(`searchNames(value="A", category="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0123
     * @tc.name      SearchComponent_SearchNames_0123
     * @tc.desc      searchNames(value="Sample Title 123", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchNames_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchNames_0123 begin`);
      const actual: string[] = searchNames('Sample Title 123', '');
      logInfo(`searchNames(value="Sample Title 123", cat...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0124
     * @tc.name      SearchComponent_SearchNames_0124
     * @tc.desc      searchNames(value="Sample Title 123", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0124 begin`);
      const actual: string[] = searchNames('Sample Title 123', 'a');
      logInfo(`searchNames(value="Sample Title 123", cat...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_NAMES_0125
     * @tc.name      SearchComponent_SearchNames_0125
     * @tc.desc      searchNames(value="Sample Title 123", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchNames_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchNames_0125 begin`);
      const actual: string[] = searchNames('Sample Title 123', 'abc');
      logInfo(`searchNames(value="Sample Title 123", cat...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchNames_0125 end`);
    });
  });
}
