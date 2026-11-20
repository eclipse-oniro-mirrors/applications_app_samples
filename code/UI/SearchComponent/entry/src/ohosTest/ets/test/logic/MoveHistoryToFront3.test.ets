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

/** Logic checks for moveHistoryToFront (67 cases). */
export default function moveHistoryToFront3Test(): void {
  describe('MoveHistoryToFront3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0174
     * @tc.name      SearchComponent_MoveHistoryToFront_0174
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=45) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0174 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 45);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0174 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0175
     * @tc.name      SearchComponent_MoveHistoryToFront_0175
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=50) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0175 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 50);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0175 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0176
     * @tc.name      SearchComponent_MoveHistoryToFront_0176
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=55) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0176 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 55);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0176 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0177
     * @tc.name      SearchComponent_MoveHistoryToFront_0177
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=60) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0177 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 60);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0177 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0178
     * @tc.name      SearchComponent_MoveHistoryToFront_0178
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=65) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0178 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 65);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0178 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0179
     * @tc.name      SearchComponent_MoveHistoryToFront_0179
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=70) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0179 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 70);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0179 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0180
     * @tc.name      SearchComponent_MoveHistoryToFront_0180
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=75) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0180 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 75);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0180 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0181
     * @tc.name      SearchComponent_MoveHistoryToFront_0181
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=80) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0181 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 80);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0181 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0182
     * @tc.name      SearchComponent_MoveHistoryToFront_0182
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=85) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0182 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 85);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0182 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0183
     * @tc.name      SearchComponent_MoveHistoryToFront_0183
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=90) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0183 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 90);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0183 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0184
     * @tc.name      SearchComponent_MoveHistoryToFront_0184
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=95) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0184 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 95);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0184 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0185
     * @tc.name      SearchComponent_MoveHistoryToFront_0185
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=105) returns ["","a","abc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0185 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 105);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0185 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0186
     * @tc.name      SearchComponent_MoveHistoryToFront_0186
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=110) returns ["","a","abc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0186 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 110);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0186 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0187
     * @tc.name      SearchComponent_MoveHistoryToFront_0187
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=-86) returns ["","a","abc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0187 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], -86);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0187 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0188
     * @tc.name      SearchComponent_MoveHistoryToFront_0188
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=194) returns ["","a","abc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0188 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 194);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0188 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0189
     * @tc.name      SearchComponent_MoveHistoryToFront_0189
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=-42) returns ["","a","abc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0189 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], -42);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0189 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0190
     * @tc.name      SearchComponent_MoveHistoryToFront_0190
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=-1) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0190 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], -1);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0190 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0191
     * @tc.name      SearchComponent_MoveHistoryToFront_0191
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=5) returns ["Hello World...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0191 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0191 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0192
     * @tc.name      SearchComponent_MoveHistoryToFront_0192
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=10) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0192 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 10);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0192 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0193
     * @tc.name      SearchComponent_MoveHistoryToFront_0193
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=100) returns ["Hello Wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0193 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 100);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0193 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0194
     * @tc.name      SearchComponent_MoveHistoryToFront_0194
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=15) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0194 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 15);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0194 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0195
     * @tc.name      SearchComponent_MoveHistoryToFront_0195
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=20) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0195 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 20);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0195 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0196
     * @tc.name      SearchComponent_MoveHistoryToFront_0196
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=25) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0196 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 25);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0196 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0197
     * @tc.name      SearchComponent_MoveHistoryToFront_0197
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=30) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0197 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 30);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0197 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0198
     * @tc.name      SearchComponent_MoveHistoryToFront_0198
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=35) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0198 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 35);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0198 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0199
     * @tc.name      SearchComponent_MoveHistoryToFront_0199
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=40) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0199 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 40);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0199 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0200
     * @tc.name      SearchComponent_MoveHistoryToFront_0200
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=45) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0200 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 45);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0200 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0201
     * @tc.name      SearchComponent_MoveHistoryToFront_0201
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=50) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0201 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 50);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0201 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0202
     * @tc.name      SearchComponent_MoveHistoryToFront_0202
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=55) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0202 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 55);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0202 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0203
     * @tc.name      SearchComponent_MoveHistoryToFront_0203
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=60) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0203 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 60);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0203 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0204
     * @tc.name      SearchComponent_MoveHistoryToFront_0204
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=65) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0204 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 65);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0204 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0205
     * @tc.name      SearchComponent_MoveHistoryToFront_0205
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=70) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0205 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 70);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0205 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0206
     * @tc.name      SearchComponent_MoveHistoryToFront_0206
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=75) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0206 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 75);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0206 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0207
     * @tc.name      SearchComponent_MoveHistoryToFront_0207
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=80) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0207 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 80);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0207 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0208
     * @tc.name      SearchComponent_MoveHistoryToFront_0208
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=85) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0208 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 85);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0208 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0209
     * @tc.name      SearchComponent_MoveHistoryToFront_0209
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=90) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0209 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 90);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0209 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0210
     * @tc.name      SearchComponent_MoveHistoryToFront_0210
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=95) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0210 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 95);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0210 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0211
     * @tc.name      SearchComponent_MoveHistoryToFront_0211
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=105) returns ["Hello Wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0211 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 105);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0211 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0212
     * @tc.name      SearchComponent_MoveHistoryToFront_0212
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=110) returns ["Hello Wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0212 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 110);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0212 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0213
     * @tc.name      SearchComponent_MoveHistoryToFront_0213
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=-86) returns ["Hello Wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0213 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], -86);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0213 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0214
     * @tc.name      SearchComponent_MoveHistoryToFront_0214
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=194) returns ["Hello Wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0214 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], 194);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0214 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0215
     * @tc.name      SearchComponent_MoveHistoryToFront_0215
     * @tc.desc      moveHistoryToFront(history=["Hello World", "a", " ", "a", "123"], index=-42) returns ["Hello Wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0215 begin`);
      const actual: string[] = moveHistoryToFront(['Hello World', 'a', ' ', 'a', '123'], -42);
      logInfo(`moveHistoryToFront(history=["Hello World"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["Hello World"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0215 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0216
     * @tc.name      SearchComponent_MoveHistoryToFront_0216
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=-1) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0216 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], -1);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0216 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0217
     * @tc.name      SearchComponent_MoveHistoryToFront_0217
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=10) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0217 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 10);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0217 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0218
     * @tc.name      SearchComponent_MoveHistoryToFront_0218
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=100) returns ["123...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0218 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 100);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0218 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0219
     * @tc.name      SearchComponent_MoveHistoryToFront_0219
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=15) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0219 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 15);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0219 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0220
     * @tc.name      SearchComponent_MoveHistoryToFront_0220
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=20) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0220 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 20);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0220 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0221
     * @tc.name      SearchComponent_MoveHistoryToFront_0221
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=25) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0221 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 25);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0221 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0222
     * @tc.name      SearchComponent_MoveHistoryToFront_0222
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=30) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0222 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 30);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0222 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0223
     * @tc.name      SearchComponent_MoveHistoryToFront_0223
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=35) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0223 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 35);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0223 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0224
     * @tc.name      SearchComponent_MoveHistoryToFront_0224
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=40) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0224 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 40);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0224 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0225
     * @tc.name      SearchComponent_MoveHistoryToFront_0225
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=45) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0225 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 45);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0225 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0226
     * @tc.name      SearchComponent_MoveHistoryToFront_0226
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=50) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0226 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 50);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0226 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0227
     * @tc.name      SearchComponent_MoveHistoryToFront_0227
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=55) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0227 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 55);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0227 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0228
     * @tc.name      SearchComponent_MoveHistoryToFront_0228
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=60) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0228 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 60);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0228 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0229
     * @tc.name      SearchComponent_MoveHistoryToFront_0229
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=65) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0229 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 65);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0229 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0230
     * @tc.name      SearchComponent_MoveHistoryToFront_0230
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=70) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0230 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 70);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0230 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0231
     * @tc.name      SearchComponent_MoveHistoryToFront_0231
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=75) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0231 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 75);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0231 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0232
     * @tc.name      SearchComponent_MoveHistoryToFront_0232
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=80) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0232 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 80);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0232 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0233
     * @tc.name      SearchComponent_MoveHistoryToFront_0233
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=85) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0233 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 85);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0233 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0234
     * @tc.name      SearchComponent_MoveHistoryToFront_0234
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=90) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0234 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 90);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0234 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0235
     * @tc.name      SearchComponent_MoveHistoryToFront_0235
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=95) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0235 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 95);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0235 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0236
     * @tc.name      SearchComponent_MoveHistoryToFront_0236
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=105) returns ["123...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0236 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 105);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0236 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0237
     * @tc.name      SearchComponent_MoveHistoryToFront_0237
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=110) returns ["123...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0237 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 110);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0237 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0238
     * @tc.name      SearchComponent_MoveHistoryToFront_0238
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=-86) returns ["123...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0238 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], -86);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0238 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0239
     * @tc.name      SearchComponent_MoveHistoryToFront_0239
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=194) returns ["123...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0239 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], 194);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0239 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0240
     * @tc.name      SearchComponent_MoveHistoryToFront_0240
     * @tc.desc      moveHistoryToFront(history=["123", " ", "Hello World", "abc", "a", ""], index=-42) returns ["123...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0240 begin`);
      const actual: string[] = moveHistoryToFront(['123', ' ', 'Hello World', 'abc', 'a', ''], -42);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`moveHistoryToFront(history=["123", " ", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0240 end`);
    });
  });
}
