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

/** Logic checks for addToHistory (22 cases). */
export default function addToHistory3Test(): void {
  describe('AddToHistory3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0171
     * @tc.name      SearchComponent_AddToHistory_0171
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="A") returns ["A","123","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0171 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'A');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0171 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0172
     * @tc.name      SearchComponent_AddToHistory_0172
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="Sample Title 123") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0172 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'Sample Title 123');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0172 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0173
     * @tc.name      SearchComponent_AddToHistory_0173
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="??") returns ["??","123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0173 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], '\u4e2d\u6587');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0173 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0174
     * @tc.name      SearchComponent_AddToHistory_0174
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="a") returns ["a","123","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0174 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'a');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","123"," ","Hello World","abc",""]');
      logInfo(`${BUNDLE}AddToHistory_0174 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0175
     * @tc.name      SearchComponent_AddToHistory_0175
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="abc") returns ["abc","12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0175 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'abc');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","123"," ","Hello World","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0175 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0176
     * @tc.name      SearchComponent_AddToHistory_0176
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="Hello World") returns ["...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0176 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'Hello World');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","123"," ","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0176 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0177
     * @tc.name      SearchComponent_AddToHistory_0177
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="123") returns ["123"," "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0177 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], '123');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0177 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0178
     * @tc.name      SearchComponent_AddToHistory_0178
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name=" Hello ") returns [" Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0178 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], ' Hello ');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello ","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0178 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0179
     * @tc.name      SearchComponent_AddToHistory_0179
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="HelloHello") returns ["H...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0179 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'HelloHello');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0179 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0180
     * @tc.name      SearchComponent_AddToHistory_0180
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="Hello_1") returns ["Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0180 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'Hello_1');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0180 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0181
     * @tc.name      SearchComponent_AddToHistory_0181
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="xHello") returns ["xHell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0181 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'xHello');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0181 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0182
     * @tc.name      SearchComponent_AddToHistory_0182
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name=" hello world ") returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0182 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], ' hello world ');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world ","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0182 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0183
     * @tc.name      SearchComponent_AddToHistory_0183
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="hello worldhello world")...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0183 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'hello worldhello world');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0183 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0184
     * @tc.name      SearchComponent_AddToHistory_0184
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="hello world_1") returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0184 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'hello world_1');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0184 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0185
     * @tc.name      SearchComponent_AddToHistory_0185
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="xhello world") returns [...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0185 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'xhello world');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0185 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0186
     * @tc.name      SearchComponent_AddToHistory_0186
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="   ") returns ["   ","12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0186 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], '   ');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   ","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0186 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0187
     * @tc.name      SearchComponent_AddToHistory_0187
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="  ") returns ["  ","123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0187 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], '  ');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  ","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0187 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0188
     * @tc.name      SearchComponent_AddToHistory_0188
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name=" _1") returns [" _1","12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0188 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], ' _1');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0188 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0189
     * @tc.name      SearchComponent_AddToHistory_0189
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name="x ") returns ["x ","123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0189 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], 'x ');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x ","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0189 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0190
     * @tc.name      SearchComponent_AddToHistory_0190
     * @tc.desc      addToHistory(history=["123", " ", "Hello World", "abc", "a", ""], name=" A ") returns [" A ","12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0190 begin`);
      const actual: string[] = addToHistory(['123', ' ', 'Hello World', 'abc', 'a', ''], ' A ');
      logInfo(`addToHistory(history=["123", " ", "Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`addToHistory(history=["123", " ", "Hello ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A ","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0190 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0191
     * @tc.name      SearchComponent_AddToHistory_0191
     * @tc.desc      addToHistory(history=[""], name="") returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0191 begin`);
      const actual: string[] = addToHistory([''], '');
      logInfo(`addToHistory(history=[""], name=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[""], name=""): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}AddToHistory_0191 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0192
     * @tc.name      SearchComponent_AddToHistory_0192
     * @tc.desc      addToHistory(history=["", "a"], name="a") returns ["a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0192 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'a');
      logInfo(`addToHistory(history=["", "a"], name="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=["", "a"], name="a"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a",""]');
      logInfo(`${BUNDLE}AddToHistory_0192 end`);
    });
  });
}
