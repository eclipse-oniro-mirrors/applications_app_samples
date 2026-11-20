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
import { moveHistoryToFront } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for moveHistoryToFront (88 cases). */
export default function moveHistoryToFrontTest(): void {
  describe('MoveHistoryToFrontTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0001
     * @tc.name      SearchComponent_MoveHistoryToFront_0001
     * @tc.desc      moveHistoryToFront(history=[], index=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_MoveHistoryToFront_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0001 begin`);
      const actual: string[] = moveHistoryToFront([], 0);
      logInfo(`moveHistoryToFront(history=[], index=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0002
     * @tc.name      SearchComponent_MoveHistoryToFront_0002
     * @tc.desc      moveHistoryToFront(history=[""], index=0) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_MoveHistoryToFront_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0002 begin`);
      const actual: string[] = moveHistoryToFront([''], 0);
      logInfo(`moveHistoryToFront(history=[""], index=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=0): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0003
     * @tc.name      SearchComponent_MoveHistoryToFront_0003
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=0) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0003 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 0);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0004
     * @tc.name      SearchComponent_MoveHistoryToFront_0004
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=1) returns ["a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0004 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 1);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0005
     * @tc.name      SearchComponent_MoveHistoryToFront_0005
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=0) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0005 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 0);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0006
     * @tc.name      SearchComponent_MoveHistoryToFront_0006
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=1) returns ["","a","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0006 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 1);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0007
     * @tc.name      SearchComponent_MoveHistoryToFront_0007
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=2) returns ["abc","a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0007 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 2);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0008
     * @tc.name      SearchComponent_MoveHistoryToFront_0008
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=0) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0008 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 0);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0009
     * @tc.name      SearchComponent_MoveHistoryToFront_0009
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=0) returns ["","a","abc",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0009 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 0);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0010
     * @tc.name      SearchComponent_MoveHistoryToFront_0010
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=1) returns ["a","","abc",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0010 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 1);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0011
     * @tc.name      SearchComponent_MoveHistoryToFront_0011
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=2) returns ["abc","","a",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0011 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 2);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","","a","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0012
     * @tc.name      SearchComponent_MoveHistoryToFront_0012
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=3) returns ["Hello World"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0012 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 3);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","","a","abc"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0013
     * @tc.name      SearchComponent_MoveHistoryToFront_0013
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=0) returns ["Hello World...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0013 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 0);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0014
     * @tc.name      SearchComponent_MoveHistoryToFront_0014
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=1) returns ["a","Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0014 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 1);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","Hello World"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0015
     * @tc.name      SearchComponent_MoveHistoryToFront_0015
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=2) returns [" ","Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0015 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 2);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","Hello World","a","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0016
     * @tc.name      SearchComponent_MoveHistoryToFront_0016
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=3) returns ["a","Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0016 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 3);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","Hello World","a"," ","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0017
     * @tc.name      SearchComponent_MoveHistoryToFront_0017
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=0) returns ["123",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0017 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 0);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0018
     * @tc.name      SearchComponent_MoveHistoryToFront_0018
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=1) returns [" ","1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0018 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 1);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","123","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0019
     * @tc.name      SearchComponent_MoveHistoryToFront_0019
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=2) returns ["Hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0019 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 2);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","123"," ","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0020
     * @tc.name      SearchComponent_MoveHistoryToFront_0020
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=5) returns ["","12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0020 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 5);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","123"," ","Hello World","abc","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0021
     * @tc.name      SearchComponent_MoveHistoryToFront_0021
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=3) returns ["abc",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0021 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 3);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","123"," ","Hello World","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0022
     * @tc.name      SearchComponent_MoveHistoryToFront_0022
     * @tc.desc      moveHistoryToFront(history=[], index=1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0022 begin`);
      const actual: string[] = moveHistoryToFront([], 1);
      logInfo(`moveHistoryToFront(history=[], index=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0023
     * @tc.name      SearchComponent_MoveHistoryToFront_0023
     * @tc.desc      moveHistoryToFront(history=[], index=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0023 begin`);
      const actual: string[] = moveHistoryToFront([], -1);
      logInfo(`moveHistoryToFront(history=[], index=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0024
     * @tc.name      SearchComponent_MoveHistoryToFront_0024
     * @tc.desc      moveHistoryToFront(history=[], index=2) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0024 begin`);
      const actual: string[] = moveHistoryToFront([], 2);
      logInfo(`moveHistoryToFront(history=[], index=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0025
     * @tc.name      SearchComponent_MoveHistoryToFront_0025
     * @tc.desc      moveHistoryToFront(history=[], index=5) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0025 begin`);
      const actual: string[] = moveHistoryToFront([], 5);
      logInfo(`moveHistoryToFront(history=[], index=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0026
     * @tc.name      SearchComponent_MoveHistoryToFront_0026
     * @tc.desc      moveHistoryToFront(history=[], index=10) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0026 begin`);
      const actual: string[] = moveHistoryToFront([], 10);
      logInfo(`moveHistoryToFront(history=[], index=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0027
     * @tc.name      SearchComponent_MoveHistoryToFront_0027
     * @tc.desc      moveHistoryToFront(history=[], index=3) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0027 begin`);
      const actual: string[] = moveHistoryToFront([], 3);
      logInfo(`moveHistoryToFront(history=[], index=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0028
     * @tc.name      SearchComponent_MoveHistoryToFront_0028
     * @tc.desc      moveHistoryToFront(history=[], index=100) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0028 begin`);
      const actual: string[] = moveHistoryToFront([], 100);
      logInfo(`moveHistoryToFront(history=[], index=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0029
     * @tc.name      SearchComponent_MoveHistoryToFront_0029
     * @tc.desc      moveHistoryToFront(history=[], index=15) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0029 begin`);
      const actual: string[] = moveHistoryToFront([], 15);
      logInfo(`moveHistoryToFront(history=[], index=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0030
     * @tc.name      SearchComponent_MoveHistoryToFront_0030
     * @tc.desc      moveHistoryToFront(history=[], index=20) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0030 begin`);
      const actual: string[] = moveHistoryToFront([], 20);
      logInfo(`moveHistoryToFront(history=[], index=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0031
     * @tc.name      SearchComponent_MoveHistoryToFront_0031
     * @tc.desc      moveHistoryToFront(history=[], index=25) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0031 begin`);
      const actual: string[] = moveHistoryToFront([], 25);
      logInfo(`moveHistoryToFront(history=[], index=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0032
     * @tc.name      SearchComponent_MoveHistoryToFront_0032
     * @tc.desc      moveHistoryToFront(history=[], index=30) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0032 begin`);
      const actual: string[] = moveHistoryToFront([], 30);
      logInfo(`moveHistoryToFront(history=[], index=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0033
     * @tc.name      SearchComponent_MoveHistoryToFront_0033
     * @tc.desc      moveHistoryToFront(history=[], index=35) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0033 begin`);
      const actual: string[] = moveHistoryToFront([], 35);
      logInfo(`moveHistoryToFront(history=[], index=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0034
     * @tc.name      SearchComponent_MoveHistoryToFront_0034
     * @tc.desc      moveHistoryToFront(history=[], index=40) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0034 begin`);
      const actual: string[] = moveHistoryToFront([], 40);
      logInfo(`moveHistoryToFront(history=[], index=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0035
     * @tc.name      SearchComponent_MoveHistoryToFront_0035
     * @tc.desc      moveHistoryToFront(history=[], index=45) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0035 begin`);
      const actual: string[] = moveHistoryToFront([], 45);
      logInfo(`moveHistoryToFront(history=[], index=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0036
     * @tc.name      SearchComponent_MoveHistoryToFront_0036
     * @tc.desc      moveHistoryToFront(history=[], index=50) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0036 begin`);
      const actual: string[] = moveHistoryToFront([], 50);
      logInfo(`moveHistoryToFront(history=[], index=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0037
     * @tc.name      SearchComponent_MoveHistoryToFront_0037
     * @tc.desc      moveHistoryToFront(history=[], index=55) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0037 begin`);
      const actual: string[] = moveHistoryToFront([], 55);
      logInfo(`moveHistoryToFront(history=[], index=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0038
     * @tc.name      SearchComponent_MoveHistoryToFront_0038
     * @tc.desc      moveHistoryToFront(history=[], index=60) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0038 begin`);
      const actual: string[] = moveHistoryToFront([], 60);
      logInfo(`moveHistoryToFront(history=[], index=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0039
     * @tc.name      SearchComponent_MoveHistoryToFront_0039
     * @tc.desc      moveHistoryToFront(history=[], index=65) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0039 begin`);
      const actual: string[] = moveHistoryToFront([], 65);
      logInfo(`moveHistoryToFront(history=[], index=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0040
     * @tc.name      SearchComponent_MoveHistoryToFront_0040
     * @tc.desc      moveHistoryToFront(history=[], index=70) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0040 begin`);
      const actual: string[] = moveHistoryToFront([], 70);
      logInfo(`moveHistoryToFront(history=[], index=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0041
     * @tc.name      SearchComponent_MoveHistoryToFront_0041
     * @tc.desc      moveHistoryToFront(history=[], index=75) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0041 begin`);
      const actual: string[] = moveHistoryToFront([], 75);
      logInfo(`moveHistoryToFront(history=[], index=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0042
     * @tc.name      SearchComponent_MoveHistoryToFront_0042
     * @tc.desc      moveHistoryToFront(history=[], index=80) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0042 begin`);
      const actual: string[] = moveHistoryToFront([], 80);
      logInfo(`moveHistoryToFront(history=[], index=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0043
     * @tc.name      SearchComponent_MoveHistoryToFront_0043
     * @tc.desc      moveHistoryToFront(history=[], index=85) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0043 begin`);
      const actual: string[] = moveHistoryToFront([], 85);
      logInfo(`moveHistoryToFront(history=[], index=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0044
     * @tc.name      SearchComponent_MoveHistoryToFront_0044
     * @tc.desc      moveHistoryToFront(history=[], index=90) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0044 begin`);
      const actual: string[] = moveHistoryToFront([], 90);
      logInfo(`moveHistoryToFront(history=[], index=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0045
     * @tc.name      SearchComponent_MoveHistoryToFront_0045
     * @tc.desc      moveHistoryToFront(history=[], index=95) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0045 begin`);
      const actual: string[] = moveHistoryToFront([], 95);
      logInfo(`moveHistoryToFront(history=[], index=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0046
     * @tc.name      SearchComponent_MoveHistoryToFront_0046
     * @tc.desc      moveHistoryToFront(history=[], index=105) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0046 begin`);
      const actual: string[] = moveHistoryToFront([], 105);
      logInfo(`moveHistoryToFront(history=[], index=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0047
     * @tc.name      SearchComponent_MoveHistoryToFront_0047
     * @tc.desc      moveHistoryToFront(history=[], index=110) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0047 begin`);
      const actual: string[] = moveHistoryToFront([], 110);
      logInfo(`moveHistoryToFront(history=[], index=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0048
     * @tc.name      SearchComponent_MoveHistoryToFront_0048
     * @tc.desc      moveHistoryToFront(history=[], index=-86) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0048 begin`);
      const actual: string[] = moveHistoryToFront([], -86);
      logInfo(`moveHistoryToFront(history=[], index=-86): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0049
     * @tc.name      SearchComponent_MoveHistoryToFront_0049
     * @tc.desc      moveHistoryToFront(history=[], index=194) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0049 begin`);
      const actual: string[] = moveHistoryToFront([], 194);
      logInfo(`moveHistoryToFront(history=[], index=194): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0050
     * @tc.name      SearchComponent_MoveHistoryToFront_0050
     * @tc.desc      moveHistoryToFront(history=[], index=-42) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0050 begin`);
      const actual: string[] = moveHistoryToFront([], -42);
      logInfo(`moveHistoryToFront(history=[], index=-42): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}MoveHistoryToFront_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0051
     * @tc.name      SearchComponent_MoveHistoryToFront_0051
     * @tc.desc      moveHistoryToFront(history=[""], index=1) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0051 begin`);
      const actual: string[] = moveHistoryToFront([''], 1);
      logInfo(`moveHistoryToFront(history=[""], index=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0052
     * @tc.name      SearchComponent_MoveHistoryToFront_0052
     * @tc.desc      moveHistoryToFront(history=[""], index=-1) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0052 begin`);
      const actual: string[] = moveHistoryToFront([''], -1);
      logInfo(`moveHistoryToFront(history=[""], index=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=-1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0053
     * @tc.name      SearchComponent_MoveHistoryToFront_0053
     * @tc.desc      moveHistoryToFront(history=[""], index=2) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0053 begin`);
      const actual: string[] = moveHistoryToFront([''], 2);
      logInfo(`moveHistoryToFront(history=[""], index=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=2): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0054
     * @tc.name      SearchComponent_MoveHistoryToFront_0054
     * @tc.desc      moveHistoryToFront(history=[""], index=5) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0054 begin`);
      const actual: string[] = moveHistoryToFront([''], 5);
      logInfo(`moveHistoryToFront(history=[""], index=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=5): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0055
     * @tc.name      SearchComponent_MoveHistoryToFront_0055
     * @tc.desc      moveHistoryToFront(history=[""], index=10) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0055 begin`);
      const actual: string[] = moveHistoryToFront([''], 10);
      logInfo(`moveHistoryToFront(history=[""], index=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=10): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0056
     * @tc.name      SearchComponent_MoveHistoryToFront_0056
     * @tc.desc      moveHistoryToFront(history=[""], index=3) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0056 begin`);
      const actual: string[] = moveHistoryToFront([''], 3);
      logInfo(`moveHistoryToFront(history=[""], index=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=3): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0057
     * @tc.name      SearchComponent_MoveHistoryToFront_0057
     * @tc.desc      moveHistoryToFront(history=[""], index=100) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0057 begin`);
      const actual: string[] = moveHistoryToFront([''], 100);
      logInfo(`moveHistoryToFront(history=[""], index=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=100): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0058
     * @tc.name      SearchComponent_MoveHistoryToFront_0058
     * @tc.desc      moveHistoryToFront(history=[""], index=15) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0058 begin`);
      const actual: string[] = moveHistoryToFront([''], 15);
      logInfo(`moveHistoryToFront(history=[""], index=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=15): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0059
     * @tc.name      SearchComponent_MoveHistoryToFront_0059
     * @tc.desc      moveHistoryToFront(history=[""], index=20) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0059 begin`);
      const actual: string[] = moveHistoryToFront([''], 20);
      logInfo(`moveHistoryToFront(history=[""], index=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=20): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0060
     * @tc.name      SearchComponent_MoveHistoryToFront_0060
     * @tc.desc      moveHistoryToFront(history=[""], index=25) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0060 begin`);
      const actual: string[] = moveHistoryToFront([''], 25);
      logInfo(`moveHistoryToFront(history=[""], index=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=25): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0061
     * @tc.name      SearchComponent_MoveHistoryToFront_0061
     * @tc.desc      moveHistoryToFront(history=[""], index=30) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0061 begin`);
      const actual: string[] = moveHistoryToFront([''], 30);
      logInfo(`moveHistoryToFront(history=[""], index=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=30): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0062
     * @tc.name      SearchComponent_MoveHistoryToFront_0062
     * @tc.desc      moveHistoryToFront(history=[""], index=35) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0062 begin`);
      const actual: string[] = moveHistoryToFront([''], 35);
      logInfo(`moveHistoryToFront(history=[""], index=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=35): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0063
     * @tc.name      SearchComponent_MoveHistoryToFront_0063
     * @tc.desc      moveHistoryToFront(history=[""], index=40) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0063 begin`);
      const actual: string[] = moveHistoryToFront([''], 40);
      logInfo(`moveHistoryToFront(history=[""], index=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=40): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0064
     * @tc.name      SearchComponent_MoveHistoryToFront_0064
     * @tc.desc      moveHistoryToFront(history=[""], index=45) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0064 begin`);
      const actual: string[] = moveHistoryToFront([''], 45);
      logInfo(`moveHistoryToFront(history=[""], index=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=45): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0065
     * @tc.name      SearchComponent_MoveHistoryToFront_0065
     * @tc.desc      moveHistoryToFront(history=[""], index=50) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0065 begin`);
      const actual: string[] = moveHistoryToFront([''], 50);
      logInfo(`moveHistoryToFront(history=[""], index=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=50): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0066
     * @tc.name      SearchComponent_MoveHistoryToFront_0066
     * @tc.desc      moveHistoryToFront(history=[""], index=55) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0066 begin`);
      const actual: string[] = moveHistoryToFront([''], 55);
      logInfo(`moveHistoryToFront(history=[""], index=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=55): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0067
     * @tc.name      SearchComponent_MoveHistoryToFront_0067
     * @tc.desc      moveHistoryToFront(history=[""], index=60) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0067 begin`);
      const actual: string[] = moveHistoryToFront([''], 60);
      logInfo(`moveHistoryToFront(history=[""], index=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=60): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0068
     * @tc.name      SearchComponent_MoveHistoryToFront_0068
     * @tc.desc      moveHistoryToFront(history=[""], index=65) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0068 begin`);
      const actual: string[] = moveHistoryToFront([''], 65);
      logInfo(`moveHistoryToFront(history=[""], index=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=65): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0069
     * @tc.name      SearchComponent_MoveHistoryToFront_0069
     * @tc.desc      moveHistoryToFront(history=[""], index=70) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0069 begin`);
      const actual: string[] = moveHistoryToFront([''], 70);
      logInfo(`moveHistoryToFront(history=[""], index=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=70): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0070
     * @tc.name      SearchComponent_MoveHistoryToFront_0070
     * @tc.desc      moveHistoryToFront(history=[""], index=75) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0070 begin`);
      const actual: string[] = moveHistoryToFront([''], 75);
      logInfo(`moveHistoryToFront(history=[""], index=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=75): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0071
     * @tc.name      SearchComponent_MoveHistoryToFront_0071
     * @tc.desc      moveHistoryToFront(history=[""], index=80) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0071 begin`);
      const actual: string[] = moveHistoryToFront([''], 80);
      logInfo(`moveHistoryToFront(history=[""], index=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=80): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0072
     * @tc.name      SearchComponent_MoveHistoryToFront_0072
     * @tc.desc      moveHistoryToFront(history=[""], index=85) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0072 begin`);
      const actual: string[] = moveHistoryToFront([''], 85);
      logInfo(`moveHistoryToFront(history=[""], index=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=85): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0073
     * @tc.name      SearchComponent_MoveHistoryToFront_0073
     * @tc.desc      moveHistoryToFront(history=[""], index=90) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0073 begin`);
      const actual: string[] = moveHistoryToFront([''], 90);
      logInfo(`moveHistoryToFront(history=[""], index=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=90): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0074
     * @tc.name      SearchComponent_MoveHistoryToFront_0074
     * @tc.desc      moveHistoryToFront(history=[""], index=95) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0074 begin`);
      const actual: string[] = moveHistoryToFront([''], 95);
      logInfo(`moveHistoryToFront(history=[""], index=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=95): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0075
     * @tc.name      SearchComponent_MoveHistoryToFront_0075
     * @tc.desc      moveHistoryToFront(history=[""], index=105) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0075 begin`);
      const actual: string[] = moveHistoryToFront([''], 105);
      logInfo(`moveHistoryToFront(history=[""], index=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=105): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0076
     * @tc.name      SearchComponent_MoveHistoryToFront_0076
     * @tc.desc      moveHistoryToFront(history=[""], index=110) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0076 begin`);
      const actual: string[] = moveHistoryToFront([''], 110);
      logInfo(`moveHistoryToFront(history=[""], index=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=110): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0077
     * @tc.name      SearchComponent_MoveHistoryToFront_0077
     * @tc.desc      moveHistoryToFront(history=[""], index=-86) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0077 begin`);
      const actual: string[] = moveHistoryToFront([''], -86);
      logInfo(`moveHistoryToFront(history=[""], index=-86): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=-86): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0078
     * @tc.name      SearchComponent_MoveHistoryToFront_0078
     * @tc.desc      moveHistoryToFront(history=[""], index=194) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0078 begin`);
      const actual: string[] = moveHistoryToFront([''], 194);
      logInfo(`moveHistoryToFront(history=[""], index=194): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=194): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0079
     * @tc.name      SearchComponent_MoveHistoryToFront_0079
     * @tc.desc      moveHistoryToFront(history=[""], index=-42) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0079 begin`);
      const actual: string[] = moveHistoryToFront([''], -42);
      logInfo(`moveHistoryToFront(history=[""], index=-42): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`moveHistoryToFront(history=[""], index=-42): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0080
     * @tc.name      SearchComponent_MoveHistoryToFront_0080
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=-1) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0080 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], -1);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0081
     * @tc.name      SearchComponent_MoveHistoryToFront_0081
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=2) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0081 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0082
     * @tc.name      SearchComponent_MoveHistoryToFront_0082
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=5) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0082 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 5);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0083
     * @tc.name      SearchComponent_MoveHistoryToFront_0083
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=10) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0083 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 10);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0084
     * @tc.name      SearchComponent_MoveHistoryToFront_0084
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=3) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0084 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 3);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0085
     * @tc.name      SearchComponent_MoveHistoryToFront_0085
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=100) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0085 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 100);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0086
     * @tc.name      SearchComponent_MoveHistoryToFront_0086
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=15) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0086 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 15);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0087
     * @tc.name      SearchComponent_MoveHistoryToFront_0087
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=20) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0087 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 20);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0088
     * @tc.name      SearchComponent_MoveHistoryToFront_0088
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=25) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0088 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 25);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0088 end`);
    });
  });
}
