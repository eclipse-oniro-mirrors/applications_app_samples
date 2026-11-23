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
export default function addToHistoryTest(): void {
  describe('AddToHistoryTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0001
     * @tc.name      SearchComponent_AddToHistory_0001
     * @tc.desc      addToHistory(history=[], name="Hello") returns ["Hello"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_AddToHistory_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AddToHistory_0001 begin`);
      const actual: string[] = addToHistory([], 'Hello');
      logInfo(`addToHistory(history=[], name="Hello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="Hello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello"]');
      logInfo(`${BUNDLE}AddToHistory_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0002
     * @tc.name      SearchComponent_AddToHistory_0002
     * @tc.desc      addToHistory(history=[], name="hello world") returns ["hello world"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_AddToHistory_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AddToHistory_0002 begin`);
      const actual: string[] = addToHistory([], 'hello world');
      logInfo(`addToHistory(history=[], name="hello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="hello world"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world"]');
      logInfo(`${BUNDLE}AddToHistory_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0003
     * @tc.name      SearchComponent_AddToHistory_0003
     * @tc.desc      addToHistory(history=[], name="") returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0003 begin`);
      const actual: string[] = addToHistory([], '');
      logInfo(`addToHistory(history=[], name=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name=""): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}AddToHistory_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0004
     * @tc.name      SearchComponent_AddToHistory_0004
     * @tc.desc      addToHistory(history=[], name=" ") returns [" "]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0004 begin`);
      const actual: string[] = addToHistory([], ' ');
      logInfo(`addToHistory(history=[], name=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name=" "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" "]');
      logInfo(`${BUNDLE}AddToHistory_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0005
     * @tc.name      SearchComponent_AddToHistory_0005
     * @tc.desc      addToHistory(history=[], name="A") returns ["A"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0005 begin`);
      const actual: string[] = addToHistory([], 'A');
      logInfo(`addToHistory(history=[], name="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="A"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A"]');
      logInfo(`${BUNDLE}AddToHistory_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0006
     * @tc.name      SearchComponent_AddToHistory_0006
     * @tc.desc      addToHistory(history=[], name="Sample Title 123") returns ["Sample Title 123"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0006 begin`);
      const actual: string[] = addToHistory([], 'Sample Title 123');
      logInfo(`addToHistory(history=[], name="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="Sample Tit...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123"]');
      logInfo(`${BUNDLE}AddToHistory_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0007
     * @tc.name      SearchComponent_AddToHistory_0007
     * @tc.desc      addToHistory(history=[], name="??") returns ["??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0007 begin`);
      const actual: string[] = addToHistory([], '\u4e2d\u6587');
      logInfo(`addToHistory(history=[], name="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="??"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`${BUNDLE}AddToHistory_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0008
     * @tc.name      SearchComponent_AddToHistory_0008
     * @tc.desc      addToHistory(history=[], name="a") returns ["a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0008 begin`);
      const actual: string[] = addToHistory([], 'a');
      logInfo(`addToHistory(history=[], name="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="a"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a"]');
      logInfo(`${BUNDLE}AddToHistory_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0009
     * @tc.name      SearchComponent_AddToHistory_0009
     * @tc.desc      addToHistory(history=[], name="abc") returns ["abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0009 begin`);
      const actual: string[] = addToHistory([], 'abc');
      logInfo(`addToHistory(history=[], name="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="abc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc"]');
      logInfo(`${BUNDLE}AddToHistory_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0010
     * @tc.name      SearchComponent_AddToHistory_0010
     * @tc.desc      addToHistory(history=[], name="Hello World") returns ["Hello World"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0010 begin`);
      const actual: string[] = addToHistory([], 'Hello World');
      logInfo(`addToHistory(history=[], name="Hello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="Hello World"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World"]');
      logInfo(`${BUNDLE}AddToHistory_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0011
     * @tc.name      SearchComponent_AddToHistory_0011
     * @tc.desc      addToHistory(history=[], name="123") returns ["123"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0011 begin`);
      const actual: string[] = addToHistory([], '123');
      logInfo(`addToHistory(history=[], name="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"]');
      logInfo(`${BUNDLE}AddToHistory_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0012
     * @tc.name      SearchComponent_AddToHistory_0012
     * @tc.desc      addToHistory(history=[], name=" Hello ") returns [" Hello "]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0012 begin`);
      const actual: string[] = addToHistory([], ' Hello ');
      logInfo(`addToHistory(history=[], name=" Hello "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name=" Hello "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello "]');
      logInfo(`${BUNDLE}AddToHistory_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0013
     * @tc.name      SearchComponent_AddToHistory_0013
     * @tc.desc      addToHistory(history=[], name="HelloHello") returns ["HelloHello"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0013 begin`);
      const actual: string[] = addToHistory([], 'HelloHello');
      logInfo(`addToHistory(history=[], name="HelloHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="HelloHello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello"]');
      logInfo(`${BUNDLE}AddToHistory_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0014
     * @tc.name      SearchComponent_AddToHistory_0014
     * @tc.desc      addToHistory(history=[], name="Hello_1") returns ["Hello_1"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0014 begin`);
      const actual: string[] = addToHistory([], 'Hello_1');
      logInfo(`addToHistory(history=[], name="Hello_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="Hello_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1"]');
      logInfo(`${BUNDLE}AddToHistory_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0015
     * @tc.name      SearchComponent_AddToHistory_0015
     * @tc.desc      addToHistory(history=[], name="xHello") returns ["xHello"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0015 begin`);
      const actual: string[] = addToHistory([], 'xHello');
      logInfo(`addToHistory(history=[], name="xHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="xHello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello"]');
      logInfo(`${BUNDLE}AddToHistory_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0016
     * @tc.name      SearchComponent_AddToHistory_0016
     * @tc.desc      addToHistory(history=[], name=" hello world ") returns [" hello world "]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0016 begin`);
      const actual: string[] = addToHistory([], ' hello world ');
      logInfo(`addToHistory(history=[], name=" hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name=" hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world "]');
      logInfo(`${BUNDLE}AddToHistory_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0017
     * @tc.name      SearchComponent_AddToHistory_0017
     * @tc.desc      addToHistory(history=[], name="hello worldhello world") returns ["hello worldhello world"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0017 begin`);
      const actual: string[] = addToHistory([], 'hello worldhello world');
      logInfo(`addToHistory(history=[], name="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="hello worl...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world"]');
      logInfo(`${BUNDLE}AddToHistory_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0018
     * @tc.name      SearchComponent_AddToHistory_0018
     * @tc.desc      addToHistory(history=[], name="hello world_1") returns ["hello world_1"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0018 begin`);
      const actual: string[] = addToHistory([], 'hello world_1');
      logInfo(`addToHistory(history=[], name="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="hello worl...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1"]');
      logInfo(`${BUNDLE}AddToHistory_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0019
     * @tc.name      SearchComponent_AddToHistory_0019
     * @tc.desc      addToHistory(history=[], name="xhello world") returns ["xhello world"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0019 begin`);
      const actual: string[] = addToHistory([], 'xhello world');
      logInfo(`addToHistory(history=[], name="xhello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="xhello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world"]');
      logInfo(`${BUNDLE}AddToHistory_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0020
     * @tc.name      SearchComponent_AddToHistory_0020
     * @tc.desc      addToHistory(history=[], name="   ") returns ["   "]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0020 begin`);
      const actual: string[] = addToHistory([], '   ');
      logInfo(`addToHistory(history=[], name="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="   "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   "]');
      logInfo(`${BUNDLE}AddToHistory_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0021
     * @tc.name      SearchComponent_AddToHistory_0021
     * @tc.desc      addToHistory(history=[], name="  ") returns ["  "]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0021 begin`);
      const actual: string[] = addToHistory([], '  ');
      logInfo(`addToHistory(history=[], name="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="  "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  "]');
      logInfo(`${BUNDLE}AddToHistory_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0022
     * @tc.name      SearchComponent_AddToHistory_0022
     * @tc.desc      addToHistory(history=[], name=" _1") returns [" _1"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_AddToHistory_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AddToHistory_0022 begin`);
      const actual: string[] = addToHistory([], ' _1');
      logInfo(`addToHistory(history=[], name=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name=" _1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1"]');
      logInfo(`${BUNDLE}AddToHistory_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0023
     * @tc.name      SearchComponent_AddToHistory_0023
     * @tc.desc      addToHistory(history=[], name="x ") returns ["x "]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0023 begin`);
      const actual: string[] = addToHistory([], 'x ');
      logInfo(`addToHistory(history=[], name="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name="x "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x "]');
      logInfo(`${BUNDLE}AddToHistory_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0024
     * @tc.name      SearchComponent_AddToHistory_0024
     * @tc.desc      addToHistory(history=[], name=" A ") returns [" A "]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0024 begin`);
      const actual: string[] = addToHistory([], ' A ');
      logInfo(`addToHistory(history=[], name=" A "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`addToHistory(history=[], name=" A "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A "]');
      logInfo(`${BUNDLE}AddToHistory_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0025
     * @tc.name      SearchComponent_AddToHistory_0025
     * @tc.desc      addToHistory(history=[""], name="Hello") returns ["Hello",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0025 begin`);
      const actual: string[] = addToHistory([''], 'Hello');
      logInfo(`addToHistory(history=[""], name="Hello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="Hello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello",""]');
      logInfo(`${BUNDLE}AddToHistory_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0026
     * @tc.name      SearchComponent_AddToHistory_0026
     * @tc.desc      addToHistory(history=[""], name="hello world") returns ["hello world",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0026 begin`);
      const actual: string[] = addToHistory([''], 'hello world');
      logInfo(`addToHistory(history=[""], name="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="hello wo...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world",""]');
      logInfo(`${BUNDLE}AddToHistory_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0027
     * @tc.name      SearchComponent_AddToHistory_0027
     * @tc.desc      addToHistory(history=[""], name=" ") returns [" ",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0027 begin`);
      const actual: string[] = addToHistory([''], ' ');
      logInfo(`addToHistory(history=[""], name=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name=" "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ",""]');
      logInfo(`${BUNDLE}AddToHistory_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0028
     * @tc.name      SearchComponent_AddToHistory_0028
     * @tc.desc      addToHistory(history=[""], name="A") returns ["A",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0028 begin`);
      const actual: string[] = addToHistory([''], 'A');
      logInfo(`addToHistory(history=[""], name="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="A"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A",""]');
      logInfo(`${BUNDLE}AddToHistory_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0029
     * @tc.name      SearchComponent_AddToHistory_0029
     * @tc.desc      addToHistory(history=[""], name="Sample Title 123") returns ["Sample Title 123",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0029 begin`);
      const actual: string[] = addToHistory([''], 'Sample Title 123');
      logInfo(`addToHistory(history=[""], name="Sample T...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="Sample T...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123",""]');
      logInfo(`${BUNDLE}AddToHistory_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0030
     * @tc.name      SearchComponent_AddToHistory_0030
     * @tc.desc      addToHistory(history=[""], name="??") returns ["??",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0030 begin`);
      const actual: string[] = addToHistory([''], '\u4e2d\u6587');
      logInfo(`addToHistory(history=[""], name="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="??"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587",""]');
      logInfo(`${BUNDLE}AddToHistory_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0031
     * @tc.name      SearchComponent_AddToHistory_0031
     * @tc.desc      addToHistory(history=[""], name="a") returns ["a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0031 begin`);
      const actual: string[] = addToHistory([''], 'a');
      logInfo(`addToHistory(history=[""], name="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="a"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a",""]');
      logInfo(`${BUNDLE}AddToHistory_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0032
     * @tc.name      SearchComponent_AddToHistory_0032
     * @tc.desc      addToHistory(history=[""], name="abc") returns ["abc",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0032 begin`);
      const actual: string[] = addToHistory([''], 'abc');
      logInfo(`addToHistory(history=[""], name="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="abc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc",""]');
      logInfo(`${BUNDLE}AddToHistory_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0033
     * @tc.name      SearchComponent_AddToHistory_0033
     * @tc.desc      addToHistory(history=[""], name="Hello World") returns ["Hello World",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0033 begin`);
      const actual: string[] = addToHistory([''], 'Hello World');
      logInfo(`addToHistory(history=[""], name="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="Hello Wo...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World",""]');
      logInfo(`${BUNDLE}AddToHistory_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0034
     * @tc.name      SearchComponent_AddToHistory_0034
     * @tc.desc      addToHistory(history=[""], name="123") returns ["123",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0034 begin`);
      const actual: string[] = addToHistory([''], '123');
      logInfo(`addToHistory(history=[""], name="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123",""]');
      logInfo(`${BUNDLE}AddToHistory_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0035
     * @tc.name      SearchComponent_AddToHistory_0035
     * @tc.desc      addToHistory(history=[""], name=" Hello ") returns [" Hello ",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0035 begin`);
      const actual: string[] = addToHistory([''], ' Hello ');
      logInfo(`addToHistory(history=[""], name=" Hello "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name=" Hello "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello ",""]');
      logInfo(`${BUNDLE}AddToHistory_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0036
     * @tc.name      SearchComponent_AddToHistory_0036
     * @tc.desc      addToHistory(history=[""], name="HelloHello") returns ["HelloHello",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0036 begin`);
      const actual: string[] = addToHistory([''], 'HelloHello');
      logInfo(`addToHistory(history=[""], name="HelloHel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="HelloHel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello",""]');
      logInfo(`${BUNDLE}AddToHistory_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0037
     * @tc.name      SearchComponent_AddToHistory_0037
     * @tc.desc      addToHistory(history=[""], name="Hello_1") returns ["Hello_1",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0037 begin`);
      const actual: string[] = addToHistory([''], 'Hello_1');
      logInfo(`addToHistory(history=[""], name="Hello_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="Hello_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1",""]');
      logInfo(`${BUNDLE}AddToHistory_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0038
     * @tc.name      SearchComponent_AddToHistory_0038
     * @tc.desc      addToHistory(history=[""], name="xHello") returns ["xHello",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0038 begin`);
      const actual: string[] = addToHistory([''], 'xHello');
      logInfo(`addToHistory(history=[""], name="xHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="xHello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello",""]');
      logInfo(`${BUNDLE}AddToHistory_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0039
     * @tc.name      SearchComponent_AddToHistory_0039
     * @tc.desc      addToHistory(history=[""], name=" hello world ") returns [" hello world ",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0039 begin`);
      const actual: string[] = addToHistory([''], ' hello world ');
      logInfo(`addToHistory(history=[""], name=" hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name=" hello w...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world ",""]');
      logInfo(`${BUNDLE}AddToHistory_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0040
     * @tc.name      SearchComponent_AddToHistory_0040
     * @tc.desc      addToHistory(history=[""], name="hello worldhello world") returns ["hello worldhello world",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0040 begin`);
      const actual: string[] = addToHistory([''], 'hello worldhello world');
      logInfo(`addToHistory(history=[""], name="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="hello wo...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world",""]');
      logInfo(`${BUNDLE}AddToHistory_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0041
     * @tc.name      SearchComponent_AddToHistory_0041
     * @tc.desc      addToHistory(history=[""], name="hello world_1") returns ["hello world_1",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0041 begin`);
      const actual: string[] = addToHistory([''], 'hello world_1');
      logInfo(`addToHistory(history=[""], name="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="hello wo...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1",""]');
      logInfo(`${BUNDLE}AddToHistory_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0042
     * @tc.name      SearchComponent_AddToHistory_0042
     * @tc.desc      addToHistory(history=[""], name="xhello world") returns ["xhello world",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0042 begin`);
      const actual: string[] = addToHistory([''], 'xhello world');
      logInfo(`addToHistory(history=[""], name="xhello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="xhello w...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world",""]');
      logInfo(`${BUNDLE}AddToHistory_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0043
     * @tc.name      SearchComponent_AddToHistory_0043
     * @tc.desc      addToHistory(history=[""], name="   ") returns ["   ",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0043 begin`);
      const actual: string[] = addToHistory([''], '   ');
      logInfo(`addToHistory(history=[""], name="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="   "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   ",""]');
      logInfo(`${BUNDLE}AddToHistory_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0044
     * @tc.name      SearchComponent_AddToHistory_0044
     * @tc.desc      addToHistory(history=[""], name="  ") returns ["  ",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0044 begin`);
      const actual: string[] = addToHistory([''], '  ');
      logInfo(`addToHistory(history=[""], name="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="  "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  ",""]');
      logInfo(`${BUNDLE}AddToHistory_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0045
     * @tc.name      SearchComponent_AddToHistory_0045
     * @tc.desc      addToHistory(history=[""], name=" _1") returns [" _1",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0045 begin`);
      const actual: string[] = addToHistory([''], ' _1');
      logInfo(`addToHistory(history=[""], name=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name=" _1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1",""]');
      logInfo(`${BUNDLE}AddToHistory_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0046
     * @tc.name      SearchComponent_AddToHistory_0046
     * @tc.desc      addToHistory(history=[""], name="x ") returns ["x ",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0046 begin`);
      const actual: string[] = addToHistory([''], 'x ');
      logInfo(`addToHistory(history=[""], name="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name="x "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x ",""]');
      logInfo(`${BUNDLE}AddToHistory_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0047
     * @tc.name      SearchComponent_AddToHistory_0047
     * @tc.desc      addToHistory(history=[""], name=" A ") returns [" A ",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0047 begin`);
      const actual: string[] = addToHistory([''], ' A ');
      logInfo(`addToHistory(history=[""], name=" A "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=[""], name=" A "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A ",""]');
      logInfo(`${BUNDLE}AddToHistory_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0048
     * @tc.name      SearchComponent_AddToHistory_0048
     * @tc.desc      addToHistory(history=["", "a"], name="Hello") returns ["Hello","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0048 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'Hello');
      logInfo(`addToHistory(history=["", "a"], name="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0049
     * @tc.name      SearchComponent_AddToHistory_0049
     * @tc.desc      addToHistory(history=["", "a"], name="hello world") returns ["hello world","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0049 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'hello world');
      logInfo(`addToHistory(history=["", "a"], name="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0050
     * @tc.name      SearchComponent_AddToHistory_0050
     * @tc.desc      addToHistory(history=["", "a"], name="") returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0050 begin`);
      const actual: string[] = addToHistory(['', 'a'], '');
      logInfo(`addToHistory(history=["", "a"], name=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`addToHistory(history=["", "a"], name=""): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AddToHistory_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0051
     * @tc.name      SearchComponent_AddToHistory_0051
     * @tc.desc      addToHistory(history=["", "a"], name=" ") returns [" ","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0051 begin`);
      const actual: string[] = addToHistory(['', 'a'], ' ');
      logInfo(`addToHistory(history=["", "a"], name=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name=" "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0052
     * @tc.name      SearchComponent_AddToHistory_0052
     * @tc.desc      addToHistory(history=["", "a"], name="A") returns ["A","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0052 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'A');
      logInfo(`addToHistory(history=["", "a"], name="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="A"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0053
     * @tc.name      SearchComponent_AddToHistory_0053
     * @tc.desc      addToHistory(history=["", "a"], name="Sample Title 123") returns ["Sample Title 123","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0053 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'Sample Title 123');
      logInfo(`addToHistory(history=["", "a"], name="Sam...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="Sam...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0054
     * @tc.name      SearchComponent_AddToHistory_0054
     * @tc.desc      addToHistory(history=["", "a"], name="??") returns ["??","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0054 begin`);
      const actual: string[] = addToHistory(['', 'a'], '\u4e2d\u6587');
      logInfo(`addToHistory(history=["", "a"], name="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="??"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0055
     * @tc.name      SearchComponent_AddToHistory_0055
     * @tc.desc      addToHistory(history=["", "a"], name="abc") returns ["abc","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0055 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'abc');
      logInfo(`addToHistory(history=["", "a"], name="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="abc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0056
     * @tc.name      SearchComponent_AddToHistory_0056
     * @tc.desc      addToHistory(history=["", "a"], name="Hello World") returns ["Hello World","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0056 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'Hello World');
      logInfo(`addToHistory(history=["", "a"], name="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0057
     * @tc.name      SearchComponent_AddToHistory_0057
     * @tc.desc      addToHistory(history=["", "a"], name="123") returns ["123","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0057 begin`);
      const actual: string[] = addToHistory(['', 'a'], '123');
      logInfo(`addToHistory(history=["", "a"], name="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0058
     * @tc.name      SearchComponent_AddToHistory_0058
     * @tc.desc      addToHistory(history=["", "a"], name=" Hello ") returns [" Hello ","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0058 begin`);
      const actual: string[] = addToHistory(['', 'a'], ' Hello ');
      logInfo(`addToHistory(history=["", "a"], name=" He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name=" He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello ","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0059
     * @tc.name      SearchComponent_AddToHistory_0059
     * @tc.desc      addToHistory(history=["", "a"], name="HelloHello") returns ["HelloHello","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0059 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'HelloHello');
      logInfo(`addToHistory(history=["", "a"], name="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0060
     * @tc.name      SearchComponent_AddToHistory_0060
     * @tc.desc      addToHistory(history=["", "a"], name="Hello_1") returns ["Hello_1","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0060 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'Hello_1');
      logInfo(`addToHistory(history=["", "a"], name="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0061
     * @tc.name      SearchComponent_AddToHistory_0061
     * @tc.desc      addToHistory(history=["", "a"], name="xHello") returns ["xHello","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0061 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'xHello');
      logInfo(`addToHistory(history=["", "a"], name="xHe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="xHe...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0062
     * @tc.name      SearchComponent_AddToHistory_0062
     * @tc.desc      addToHistory(history=["", "a"], name=" hello world ") returns [" hello world ","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0062 begin`);
      const actual: string[] = addToHistory(['', 'a'], ' hello world ');
      logInfo(`addToHistory(history=["", "a"], name=" he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name=" he...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" hello world ","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0063
     * @tc.name      SearchComponent_AddToHistory_0063
     * @tc.desc      addToHistory(history=["", "a"], name="hello worldhello world") returns ["hello worldhello world"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0063 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'hello worldhello world');
      logInfo(`addToHistory(history=["", "a"], name="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello worldhello world","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0064
     * @tc.name      SearchComponent_AddToHistory_0064
     * @tc.desc      addToHistory(history=["", "a"], name="hello world_1") returns ["hello world_1","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0064 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'hello world_1');
      logInfo(`addToHistory(history=["", "a"], name="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world_1","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0065
     * @tc.name      SearchComponent_AddToHistory_0065
     * @tc.desc      addToHistory(history=["", "a"], name="xhello world") returns ["xhello world","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0065 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'xhello world');
      logInfo(`addToHistory(history=["", "a"], name="xhe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="xhe...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xhello world","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0066
     * @tc.name      SearchComponent_AddToHistory_0066
     * @tc.desc      addToHistory(history=["", "a"], name="   ") returns ["   ","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0066 begin`);
      const actual: string[] = addToHistory(['', 'a'], '   ');
      logInfo(`addToHistory(history=["", "a"], name="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="   "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["   ","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0067
     * @tc.name      SearchComponent_AddToHistory_0067
     * @tc.desc      addToHistory(history=["", "a"], name="  ") returns ["  ","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0067 begin`);
      const actual: string[] = addToHistory(['', 'a'], '  ');
      logInfo(`addToHistory(history=["", "a"], name="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="  "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["  ","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0068
     * @tc.name      SearchComponent_AddToHistory_0068
     * @tc.desc      addToHistory(history=["", "a"], name=" _1") returns [" _1","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0068 begin`);
      const actual: string[] = addToHistory(['', 'a'], ' _1');
      logInfo(`addToHistory(history=["", "a"], name=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name=" _1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" _1","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0069
     * @tc.name      SearchComponent_AddToHistory_0069
     * @tc.desc      addToHistory(history=["", "a"], name="x ") returns ["x ","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0069 begin`);
      const actual: string[] = addToHistory(['', 'a'], 'x ');
      logInfo(`addToHistory(history=["", "a"], name="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name="x "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["x ","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0070
     * @tc.name      SearchComponent_AddToHistory_0070
     * @tc.desc      addToHistory(history=["", "a"], name=" A ") returns [" A ","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0070 begin`);
      const actual: string[] = addToHistory(['', 'a'], ' A ');
      logInfo(`addToHistory(history=["", "a"], name=" A "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["", "a"], name=" A "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" A ","","a"]');
      logInfo(`${BUNDLE}AddToHistory_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0071
     * @tc.name      SearchComponent_AddToHistory_0071
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="Hello") returns ["Hello","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0071 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'Hello');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0072
     * @tc.name      SearchComponent_AddToHistory_0072
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="hello world") returns ["hello world","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0072 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'hello world');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0073
     * @tc.name      SearchComponent_AddToHistory_0073
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="") returns ["","a","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0073 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], '');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0074
     * @tc.name      SearchComponent_AddToHistory_0074
     * @tc.desc      addToHistory(history=["a", "", "abc"], name=" ") returns [" ","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0074 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], ' ');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0075
     * @tc.name      SearchComponent_AddToHistory_0075
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="A") returns ["A","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0075 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'A');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0076
     * @tc.name      SearchComponent_AddToHistory_0076
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="Sample Title 123") returns ["Sample Title 123","a",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0076 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'Sample Title 123');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Sample Title 123","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0077
     * @tc.name      SearchComponent_AddToHistory_0077
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="??") returns ["??","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0077 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], '\u4e2d\u6587');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u4e2d\u6587","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0078
     * @tc.name      SearchComponent_AddToHistory_0078
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="a") returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0078 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'a');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0079
     * @tc.name      SearchComponent_AddToHistory_0079
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="abc") returns ["abc","a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0079 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'abc');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","a",""]');
      logInfo(`${BUNDLE}AddToHistory_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0080
     * @tc.name      SearchComponent_AddToHistory_0080
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="Hello World") returns ["Hello World","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0080 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'Hello World');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0081
     * @tc.name      SearchComponent_AddToHistory_0081
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="123") returns ["123","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0081 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], '123');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0082
     * @tc.name      SearchComponent_AddToHistory_0082
     * @tc.desc      addToHistory(history=["a", "", "abc"], name=" Hello ") returns [" Hello ","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0082 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], ' Hello ');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" Hello ","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0083
     * @tc.name      SearchComponent_AddToHistory_0083
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="HelloHello") returns ["HelloHello","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0083 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'HelloHello');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["HelloHello","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0084
     * @tc.name      SearchComponent_AddToHistory_0084
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="Hello_1") returns ["Hello_1","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AddToHistory_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AddToHistory_0084 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'Hello_1');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello_1","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ADD_TO_HISTORY_0085
     * @tc.name      SearchComponent_AddToHistory_0085
     * @tc.desc      addToHistory(history=["a", "", "abc"], name="xHello") returns ["xHello","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AddToHistory_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AddToHistory_0085 begin`);
      const actual: string[] = addToHistory(['a', '', 'abc'], 'xHello');
      logInfo(`addToHistory(history=["a", "", "abc"], na...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`addToHistory(history=["a", "", "abc"], na...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["xHello","a","","abc"]');
      logInfo(`${BUNDLE}AddToHistory_0085 end`);
    });
  });
}
