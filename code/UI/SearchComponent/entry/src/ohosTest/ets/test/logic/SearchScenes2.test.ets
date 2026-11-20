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
import { SceneModuleInfo } from '../../../../main/ets/bridge/SearchComponentBridge';
import { searchScenes } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for searchScenes (33 cases). */
export default function searchScenes2Test(): void {
  describe('SearchScenes2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0093
     * @tc.name      SearchComponent_SearchScenes_0093
     * @tc.desc      searchScenes(value=" ", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0093 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'xHello World');
      logInfo(`searchScenes(value=" ", category="xHello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0094
     * @tc.name      SearchComponent_SearchScenes_0094
     * @tc.desc      searchScenes(value=" ", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0094 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', '   ');
      logInfo(`searchScenes(value=" ", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0095
     * @tc.name      SearchComponent_SearchScenes_0095
     * @tc.desc      searchScenes(value=" ", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0095 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', '  ');
      logInfo(`searchScenes(value=" ", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0096
     * @tc.name      SearchComponent_SearchScenes_0096
     * @tc.desc      searchScenes(value=" ", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0096 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', ' _1');
      logInfo(`searchScenes(value=" ", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0096 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0097
     * @tc.name      SearchComponent_SearchScenes_0097
     * @tc.desc      searchScenes(value=" ", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0097 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'x ');
      logInfo(`searchScenes(value=" ", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0098
     * @tc.name      SearchComponent_SearchScenes_0098
     * @tc.desc      searchScenes(value=" ", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0098 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', ' 123 ');
      logInfo(`searchScenes(value=" ", category=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0099
     * @tc.name      SearchComponent_SearchScenes_0099
     * @tc.desc      searchScenes(value=" ", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0099 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', '123123');
      logInfo(`searchScenes(value=" ", category="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0100
     * @tc.name      SearchComponent_SearchScenes_0100
     * @tc.desc      searchScenes(value="A", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0100 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'a');
      logInfo(`searchScenes(value="A", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0101
     * @tc.name      SearchComponent_SearchScenes_0101
     * @tc.desc      searchScenes(value="A", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0101 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'abc');
      logInfo(`searchScenes(value="A", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0102
     * @tc.name      SearchComponent_SearchScenes_0102
     * @tc.desc      searchScenes(value="A", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0102 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'Hello World');
      logInfo(`searchScenes(value="A", category="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0103
     * @tc.name      SearchComponent_SearchScenes_0103
     * @tc.desc      searchScenes(value="A", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0103 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', ' ');
      logInfo(`searchScenes(value="A", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0104
     * @tc.name      SearchComponent_SearchScenes_0104
     * @tc.desc      searchScenes(value="A", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0104 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', '123');
      logInfo(`searchScenes(value="A", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0105
     * @tc.name      SearchComponent_SearchScenes_0105
     * @tc.desc      searchScenes(value="A", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0105 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', ' a ');
      logInfo(`searchScenes(value="A", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0106
     * @tc.name      SearchComponent_SearchScenes_0106
     * @tc.desc      searchScenes(value="A", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0106 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'aa');
      logInfo(`searchScenes(value="A", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0107
     * @tc.name      SearchComponent_SearchScenes_0107
     * @tc.desc      searchScenes(value="A", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0107 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'a_1');
      logInfo(`searchScenes(value="A", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0108
     * @tc.name      SearchComponent_SearchScenes_0108
     * @tc.desc      searchScenes(value="A", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0108 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'xa');
      logInfo(`searchScenes(value="A", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0109
     * @tc.name      SearchComponent_SearchScenes_0109
     * @tc.desc      searchScenes(value="A", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0109 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', ' abc ');
      logInfo(`searchScenes(value="A", category=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0110
     * @tc.name      SearchComponent_SearchScenes_0110
     * @tc.desc      searchScenes(value="A", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0110 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'abcabc');
      logInfo(`searchScenes(value="A", category="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0111
     * @tc.name      SearchComponent_SearchScenes_0111
     * @tc.desc      searchScenes(value="A", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0111 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'abc_1');
      logInfo(`searchScenes(value="A", category="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0112
     * @tc.name      SearchComponent_SearchScenes_0112
     * @tc.desc      searchScenes(value="A", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0112 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'xabc');
      logInfo(`searchScenes(value="A", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0113
     * @tc.name      SearchComponent_SearchScenes_0113
     * @tc.desc      searchScenes(value="A", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0113 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', ' Hello World ');
      logInfo(`searchScenes(value="A", category=" Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0114
     * @tc.name      SearchComponent_SearchScenes_0114
     * @tc.desc      searchScenes(value="A", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0114 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'Hello WorldHello World');
      logInfo(`searchScenes(value="A", category="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0115
     * @tc.name      SearchComponent_SearchScenes_0115
     * @tc.desc      searchScenes(value="A", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0115 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'Hello World_1');
      logInfo(`searchScenes(value="A", category="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0116
     * @tc.name      SearchComponent_SearchScenes_0116
     * @tc.desc      searchScenes(value="A", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0116 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'xHello World');
      logInfo(`searchScenes(value="A", category="xHello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0117
     * @tc.name      SearchComponent_SearchScenes_0117
     * @tc.desc      searchScenes(value="A", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0117 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', '   ');
      logInfo(`searchScenes(value="A", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0118
     * @tc.name      SearchComponent_SearchScenes_0118
     * @tc.desc      searchScenes(value="A", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0118 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', '  ');
      logInfo(`searchScenes(value="A", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0119
     * @tc.name      SearchComponent_SearchScenes_0119
     * @tc.desc      searchScenes(value="A", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0119 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', ' _1');
      logInfo(`searchScenes(value="A", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0120
     * @tc.name      SearchComponent_SearchScenes_0120
     * @tc.desc      searchScenes(value="A", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0120 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', 'x ');
      logInfo(`searchScenes(value="A", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0121
     * @tc.name      SearchComponent_SearchScenes_0121
     * @tc.desc      searchScenes(value="A", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0121 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', ' 123 ');
      logInfo(`searchScenes(value="A", category=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0122
     * @tc.name      SearchComponent_SearchScenes_0122
     * @tc.desc      searchScenes(value="A", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0122 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', '123123');
      logInfo(`searchScenes(value="A", category="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0123
     * @tc.name      SearchComponent_SearchScenes_0123
     * @tc.desc      searchScenes(value="Sample Title 123", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0123 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Sample Title 123', '');
      logInfo(`searchScenes(value="Sample Title 123", ca...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0124
     * @tc.name      SearchComponent_SearchScenes_0124
     * @tc.desc      searchScenes(value="Sample Title 123", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0124 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Sample Title 123', 'a');
      logInfo(`searchScenes(value="Sample Title 123", ca...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0125
     * @tc.name      SearchComponent_SearchScenes_0125
     * @tc.desc      searchScenes(value="Sample Title 123", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0125 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Sample Title 123', 'abc');
      logInfo(`searchScenes(value="Sample Title 123", ca...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0125 end`);
    });
  });
}
