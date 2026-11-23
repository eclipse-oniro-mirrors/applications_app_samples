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
import { addToHistory } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for addToHistory (85 cases). */
export default function addToHistory2Test(): void {
  describe('AddToHistory2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0086
     * @tc.name      SearchComponent_AddToHistory_0086
     * @tc.desc      addToHistory(history=["a", "", "abc"], name=" hello world ") returns [" hello world ","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0086 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], ' hello world ');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world ","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0087
     * @tc.name      SearchComponent_AddToHistory_0087
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="hello worldhello world") returns ["hello worldhello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0087 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'hello worldhello world');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0088
     * @tc.name      SearchComponent_AddToHistory_0088
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="hello world_1") returns ["hello world_1","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0088 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'hello world_1');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0089
     * @tc.name      SearchComponent_AddToHistory_0089
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="xhello world") returns ["xhello world","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0089 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'xhello world');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0090
     * @tc.name      SearchComponent_AddToHistory_0090
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="   ") returns ["   ","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0090 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], '   ');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   ","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0091
     * @tc.name      SearchComponent_AddToHistory_0091
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="  ") returns ["  ","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0091 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], '  ');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  ","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0092
     * @tc.name      SearchComponent_AddToHistory_0092
     * @tc.desc      addToHistory(history=["a", "", "abc"], name=" _1") returns [" _1","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0092 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], ' _1');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0093
     * @tc.name      SearchComponent_AddToHistory_0093
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="x ") returns ["x ","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0093 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'x ');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x ","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0094
     * @tc.name      SearchComponent_AddToHistory_0094
     * @tc.desc      addToHistory(history=["a", "", "abc"], name=" A ") returns [" A ","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0094 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], ' A ');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A ","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0095
     * @tc.name      SearchComponent_AddToHistory_0095
     * @tc.desc      addToHistory(history=["abc", "abc"], name="Hello") returns ["Hello","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0095 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'Hello');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0096
     * @tc.name      SearchComponent_AddToHistory_0096
     * @tc.desc      addToHistory(history=["abc", "abc"], name="hello world") returns ["hello world","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0096 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'hello world');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0096 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0097
     * @tc.name      SearchComponent_AddToHistory_0097
     * @tc.desc      addToHistory(history=["abc", "abc"], name="") returns ["","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0097 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], '');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0098
     * @tc.name      SearchComponent_AddToHistory_0098
     * @tc.desc      addToHistory(history=["abc", "abc"], name=" ") returns [" ","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0098 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], ' ');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0099
     * @tc.name      SearchComponent_AddToHistory_0099
     * @tc.desc      addToHistory(history=["abc", "abc"], name="A") returns ["A","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0099 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'A');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0100
     * @tc.name      SearchComponent_AddToHistory_0100
     * @tc.desc      addToHistory(history=["abc", "abc"], name="Sample Title 123") returns ["Sample Title 123","abc",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0100 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'Sample Title 123');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0101
     * @tc.name      SearchComponent_AddToHistory_0101
     * @tc.desc      addToHistory(history=["abc", "abc"], name="??") returns ["??","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0101 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], '\u4e2d\u6587');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0102
     * @tc.name      SearchComponent_AddToHistory_0102
     * @tc.desc      addToHistory(history=["abc", "abc"], name="a") returns ["a","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0102 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'a');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0103
     * @tc.name      SearchComponent_AddToHistory_0103
     * @tc.desc      addToHistory(history=["abc", "abc"], name="abc") returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0103 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'abc');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0104
     * @tc.name      SearchComponent_AddToHistory_0104
     * @tc.desc      addToHistory(history=["abc", "abc"], name="Hello World") returns ["Hello World","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0104 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'Hello World');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0105
     * @tc.name      SearchComponent_AddToHistory_0105
     * @tc.desc      addToHistory(history=["abc", "abc"], name="123") returns ["123","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0105 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], '123');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0106
     * @tc.name      SearchComponent_AddToHistory_0106
     * @tc.desc      addToHistory(history=["abc", "abc"], name=" Hello ") returns [" Hello ","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0106 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], ' Hello ');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello ","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0107
     * @tc.name      SearchComponent_AddToHistory_0107
     * @tc.desc      addToHistory(history=["abc", "abc"], name="HelloHello") returns ["HelloHello","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0107 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'HelloHello');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0108
     * @tc.name      SearchComponent_AddToHistory_0108
     * @tc.desc      addToHistory(history=["abc", "abc"], name="Hello_1") returns ["Hello_1","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0108 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'Hello_1');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0109
     * @tc.name      SearchComponent_AddToHistory_0109
     * @tc.desc      addToHistory(history=["abc", "abc"], name="xHello") returns ["xHello","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0109 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'xHello');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0110
     * @tc.name      SearchComponent_AddToHistory_0110
     * @tc.desc      addToHistory(history=["abc", "abc"], name=" hello world ") returns [" hello world ","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0110 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], ' hello world ');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world ","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0111
     * @tc.name      SearchComponent_AddToHistory_0111
     * @tc.desc      addToHistory(history=["abc", "abc"], name="hello worldhello world") returns ["hello worldhello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0111 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'hello worldhello world');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0112
     * @tc.name      SearchComponent_AddToHistory_0112
     * @tc.desc      addToHistory(history=["abc", "abc"], name="hello world_1") returns ["hello world_1","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0112 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'hello world_1');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0113
     * @tc.name      SearchComponent_AddToHistory_0113
     * @tc.desc      addToHistory(history=["abc", "abc"], name="xhello world") returns ["xhello world","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0113 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'xhello world');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0114
     * @tc.name      SearchComponent_AddToHistory_0114
     * @tc.desc      addToHistory(history=["abc", "abc"], name="   ") returns ["   ","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0114 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], '   ');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   ","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0115
     * @tc.name      SearchComponent_AddToHistory_0115
     * @tc.desc      addToHistory(history=["abc", "abc"], name="  ") returns ["  ","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0115 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], '  ');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  ","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0116
     * @tc.name      SearchComponent_AddToHistory_0116
     * @tc.desc      addToHistory(history=["abc", "abc"], name=" _1") returns [" _1","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0116 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], ' _1');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0117
     * @tc.name      SearchComponent_AddToHistory_0117
     * @tc.desc      addToHistory(history=["abc", "abc"], name="x ") returns ["x ","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0117 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], 'x ');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x ","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0118
     * @tc.name      SearchComponent_AddToHistory_0118
     * @tc.desc      addToHistory(history=["abc", "abc"], name=" A ") returns [" A ","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0118 begin`);
      const actual: string[] = addToHistory(['abc', 'abc'], ' A ');
      logInfo(`addToHistory(history=["abc", "abc"], name...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["abc", "abc"], name...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A ","abc","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0119
     * @tc.name      SearchComponent_AddToHistory_0119
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="Hello") returns ["Hello","","a"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0119 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'Hello');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0120
     * @tc.name      SearchComponent_AddToHistory_0120
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="hello world") returns ["hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0120 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'hello world');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0121
     * @tc.name      SearchComponent_AddToHistory_0121
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="") returns ["","a","abc","Hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0121 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], '');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0122
     * @tc.name      SearchComponent_AddToHistory_0122
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name=" ") returns [" ","","a","abc","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0122 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], ' ');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","","a","abc","Hello World"]');
      logInfo(`${BUNDLE}AddToHistory_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0123
     * @tc.name      SearchComponent_AddToHistory_0123
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="A") returns ["A","","a","abc","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0123 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'A');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0124
     * @tc.name      SearchComponent_AddToHistory_0124
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="Sample Title 123") returns ["Sa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0124 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'Sample Title 123');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0125
     * @tc.name      SearchComponent_AddToHistory_0125
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="??") returns ["??","","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0125 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], '\u4e2d\u6587');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0125 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0126
     * @tc.name      SearchComponent_AddToHistory_0126
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="a") returns ["a","","abc","Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0126 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'a');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0126 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0127
     * @tc.name      SearchComponent_AddToHistory_0127
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="abc") returns ["abc","","a","He...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0127 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'abc');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","","a","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0127 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0128
     * @tc.name      SearchComponent_AddToHistory_0128
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="Hello World") returns ["Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0128 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'Hello World');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","","a","abc"," "]');
      logInfo(`${BUNDLE}AddToHistory_0128 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0129
     * @tc.name      SearchComponent_AddToHistory_0129
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="123") returns ["123","","a","ab...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0129 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], '123');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0129 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0130
     * @tc.name      SearchComponent_AddToHistory_0130
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name=" Hello ") returns [" Hello ",""...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0130 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], ' Hello ');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello ","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0130 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0131
     * @tc.name      SearchComponent_AddToHistory_0131
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="HelloHello") returns ["HelloHel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0131 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'HelloHello');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0131 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0132
     * @tc.name      SearchComponent_AddToHistory_0132
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="Hello_1") returns ["Hello_1",""...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0132 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'Hello_1');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0132 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0133
     * @tc.name      SearchComponent_AddToHistory_0133
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="xHello") returns ["xHello","","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0133 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'xHello');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0133 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0134
     * @tc.name      SearchComponent_AddToHistory_0134
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name=" hello world ") returns [" hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0134 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], ' hello world ');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world ","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0134 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0135
     * @tc.name      SearchComponent_AddToHistory_0135
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="hello worldhello world") return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0135 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'hello worldhello world');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0135 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0136
     * @tc.name      SearchComponent_AddToHistory_0136
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="hello world_1") returns ["hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0136 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'hello world_1');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0136 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0137
     * @tc.name      SearchComponent_AddToHistory_0137
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="xhello world") returns ["xhello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0137 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'xhello world');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0137 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0138
     * @tc.name      SearchComponent_AddToHistory_0138
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="   ") returns ["   ","","a","ab...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0138 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], '   ');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   ","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0138 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0139
     * @tc.name      SearchComponent_AddToHistory_0139
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="  ") returns ["  ","","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0139 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], '  ');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  ","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0139 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0140
     * @tc.name      SearchComponent_AddToHistory_0140
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name=" _1") returns [" _1","","a","ab...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0140 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], ' _1');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0140 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0141
     * @tc.name      SearchComponent_AddToHistory_0141
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name="x ") returns ["x ","","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0141 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], 'x ');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x ","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0141 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0142
     * @tc.name      SearchComponent_AddToHistory_0142
     * @tc.desc      addToHistory(history=["", "a", "abc", "Hello World", " "], name=" A ") returns [" A ","","a","ab...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0142 begin`);
      const actual: string[] = addToHistory(['', 'a', 'abc', 'Hello World', ' '], ' A ');
      logInfo(`addToHistory(history=["", "a", "abc", "He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["", "a", "abc", "He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A ","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AddToHistory_0142 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0143
     * @tc.name      SearchComponent_AddToHistory_0143
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="Hello") returns ["Hello","Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0143 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'Hello');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0143 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0144
     * @tc.name      SearchComponent_AddToHistory_0144
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="hello world") returns ["hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0144 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'hello world');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0144 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0145
     * @tc.name      SearchComponent_AddToHistory_0145
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="") returns ["","Hello World","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0145 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], '');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0145 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0146
     * @tc.name      SearchComponent_AddToHistory_0146
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name=" ") returns [" ","Hello World"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0146 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], ' ');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","Hello World","a","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0146 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0147
     * @tc.name      SearchComponent_AddToHistory_0147
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="A") returns ["A","Hello World"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0147 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'A');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0147 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0148
     * @tc.name      SearchComponent_AddToHistory_0148
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="Sample Title 123") returns ["S...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0148 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'Sample Title 123');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0148 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0149
     * @tc.name      SearchComponent_AddToHistory_0149
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="??") returns ["??","Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0149 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], '\u4e2d\u6587');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0149 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0150
     * @tc.name      SearchComponent_AddToHistory_0150
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="a") returns ["a","Hello World"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0150 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'a');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","Hello World"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0150 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0151
     * @tc.name      SearchComponent_AddToHistory_0151
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="abc") returns ["abc","Hello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0151 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'abc');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0151 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0152
     * @tc.name      SearchComponent_AddToHistory_0152
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="Hello World") returns ["Hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0152 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'Hello World');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0152 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0153
     * @tc.name      SearchComponent_AddToHistory_0153
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="123") returns ["123","Hello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0153 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], '123');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123","Hello World","a"," ","a"]');
      logInfo(`${BUNDLE}AddToHistory_0153 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0154
     * @tc.name      SearchComponent_AddToHistory_0154
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name=" Hello ") returns [" Hello ","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0154 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], ' Hello ');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello ","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0154 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0155
     * @tc.name      SearchComponent_AddToHistory_0155
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="HelloHello") returns ["HelloHe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0155 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'HelloHello');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0155 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0156
     * @tc.name      SearchComponent_AddToHistory_0156
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="Hello_1") returns ["Hello_1","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0156 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'Hello_1');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0156 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0157
     * @tc.name      SearchComponent_AddToHistory_0157
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="xHello") returns ["xHello","He...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0157 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'xHello');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0157 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0158
     * @tc.name      SearchComponent_AddToHistory_0158
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name=" hello world ") returns [" hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0158 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], ' hello world ');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world ","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0158 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0159
     * @tc.name      SearchComponent_AddToHistory_0159
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="hello worldhello world") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0159 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'hello worldhello world');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0159 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0160
     * @tc.name      SearchComponent_AddToHistory_0160
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="hello world_1") returns ["hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0160 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'hello world_1');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0160 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0161
     * @tc.name      SearchComponent_AddToHistory_0161
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="xhello world") returns ["xhell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0161 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'xhello world');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0161 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0162
     * @tc.name      SearchComponent_AddToHistory_0162
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="   ") returns ["   ","Hello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0162 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], '   ');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   ","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0162 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0163
     * @tc.name      SearchComponent_AddToHistory_0163
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="  ") returns ["  ","Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0163 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], '  ');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  ","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0163 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0164
     * @tc.name      SearchComponent_AddToHistory_0164
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name=" _1") returns [" _1","Hello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0164 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], ' _1');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0164 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0165
     * @tc.name      SearchComponent_AddToHistory_0165
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name="x ") returns ["x ","Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0165 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], 'x ');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x ","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0165 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0166
     * @tc.name      SearchComponent_AddToHistory_0166
     * @tc.desc      addToHistory(history=["Hello World", "a", " ", "a", "123"], name=" A ") returns [" A ","Hello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0166 begin`);
      const actual: string[] = addToHistory(['Hello World', 'a', ' ', 'a', '123'], ' A ');
      logInfo(`addToHistory(history=["Hello World", "a",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["Hello World", "a",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A ","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AddToHistory_0166 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0167
     * @tc.name      SearchComponent_AddToHistory_0167
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="Hello") returns ["Hello"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0167 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'Hello');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0167 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0168
     * @tc.name      SearchComponent_AddToHistory_0168
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="hello world") returns ["...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0168 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'hello world');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0168 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0169
     * @tc.name      SearchComponent_AddToHistory_0169
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="") returns ["","123"," "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0169 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], '');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","123"," ","Hello World","abc","a"]');
      logInfo(`${BUNDLE}AddToHistory_0169 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0170
     * @tc.name      SearchComponent_AddToHistory_0170
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name=" ") returns [" ","123","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0170 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], ' ');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","123","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0170 end`);
    });
  });
}
