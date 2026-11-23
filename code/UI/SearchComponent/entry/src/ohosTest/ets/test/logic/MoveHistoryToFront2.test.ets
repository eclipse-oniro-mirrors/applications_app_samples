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

/** Logic checks for moveHistoryToFront (85 cases). */
export default function moveHistoryToFront2Test(): void {
  describe('MoveHistoryToFront2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0089
     * @tc.name      SearchComponent_MoveHistoryToFront_0089
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=30) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0089 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 30);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0090
     * @tc.name      SearchComponent_MoveHistoryToFront_0090
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=35) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0090 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 35);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0091
     * @tc.name      SearchComponent_MoveHistoryToFront_0091
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=40) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0091 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 40);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0092
     * @tc.name      SearchComponent_MoveHistoryToFront_0092
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=45) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0092 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 45);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0093
     * @tc.name      SearchComponent_MoveHistoryToFront_0093
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=50) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0093 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 50);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0094
     * @tc.name      SearchComponent_MoveHistoryToFront_0094
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=55) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0094 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 55);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0095
     * @tc.name      SearchComponent_MoveHistoryToFront_0095
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=60) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0095 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 60);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0096
     * @tc.name      SearchComponent_MoveHistoryToFront_0096
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=65) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0096 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 65);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0096 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0097
     * @tc.name      SearchComponent_MoveHistoryToFront_0097
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=70) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0097 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 70);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0098
     * @tc.name      SearchComponent_MoveHistoryToFront_0098
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=75) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0098 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 75);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0099
     * @tc.name      SearchComponent_MoveHistoryToFront_0099
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=80) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0099 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 80);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0100
     * @tc.name      SearchComponent_MoveHistoryToFront_0100
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=85) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0100 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 85);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0101
     * @tc.name      SearchComponent_MoveHistoryToFront_0101
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=90) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0101 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 90);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0102
     * @tc.name      SearchComponent_MoveHistoryToFront_0102
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=95) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0102 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 95);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0103
     * @tc.name      SearchComponent_MoveHistoryToFront_0103
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=105) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0103 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 105);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0104
     * @tc.name      SearchComponent_MoveHistoryToFront_0104
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=110) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0104 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 110);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0105
     * @tc.name      SearchComponent_MoveHistoryToFront_0105
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=-86) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0105 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], -86);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0106
     * @tc.name      SearchComponent_MoveHistoryToFront_0106
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=194) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0106 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], 194);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0107
     * @tc.name      SearchComponent_MoveHistoryToFront_0107
     * @tc.desc      moveHistoryToFront(history=["", "a"], index=-42) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0107 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a'], -42);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["", "a"], ind...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0108
     * @tc.name      SearchComponent_MoveHistoryToFront_0108
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=-1) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0108 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], -1);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0109
     * @tc.name      SearchComponent_MoveHistoryToFront_0109
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=5) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0109 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 5);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0110
     * @tc.name      SearchComponent_MoveHistoryToFront_0110
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=10) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0110 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 10);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0111
     * @tc.name      SearchComponent_MoveHistoryToFront_0111
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=3) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0111 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0112
     * @tc.name      SearchComponent_MoveHistoryToFront_0112
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=100) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0112 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 100);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0113
     * @tc.name      SearchComponent_MoveHistoryToFront_0113
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=15) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0113 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 15);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0114
     * @tc.name      SearchComponent_MoveHistoryToFront_0114
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=20) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0114 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 20);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0115
     * @tc.name      SearchComponent_MoveHistoryToFront_0115
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=25) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0115 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 25);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0116
     * @tc.name      SearchComponent_MoveHistoryToFront_0116
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=30) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0116 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 30);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0117
     * @tc.name      SearchComponent_MoveHistoryToFront_0117
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=35) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0117 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 35);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0118
     * @tc.name      SearchComponent_MoveHistoryToFront_0118
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=40) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0118 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 40);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0119
     * @tc.name      SearchComponent_MoveHistoryToFront_0119
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=45) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0119 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 45);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0120
     * @tc.name      SearchComponent_MoveHistoryToFront_0120
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=50) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0120 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 50);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0121
     * @tc.name      SearchComponent_MoveHistoryToFront_0121
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=55) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0121 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 55);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0122
     * @tc.name      SearchComponent_MoveHistoryToFront_0122
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=60) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0122 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 60);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0123
     * @tc.name      SearchComponent_MoveHistoryToFront_0123
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=65) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0123 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 65);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0124
     * @tc.name      SearchComponent_MoveHistoryToFront_0124
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=70) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0124 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 70);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0125
     * @tc.name      SearchComponent_MoveHistoryToFront_0125
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=75) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0125 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 75);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0125 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0126
     * @tc.name      SearchComponent_MoveHistoryToFront_0126
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=80) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0126 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 80);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0126 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0127
     * @tc.name      SearchComponent_MoveHistoryToFront_0127
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=85) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0127 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 85);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0127 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0128
     * @tc.name      SearchComponent_MoveHistoryToFront_0128
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=90) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0128 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 90);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0128 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0129
     * @tc.name      SearchComponent_MoveHistoryToFront_0129
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=95) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0129 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 95);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0129 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0130
     * @tc.name      SearchComponent_MoveHistoryToFront_0130
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=105) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0130 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 105);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0130 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0131
     * @tc.name      SearchComponent_MoveHistoryToFront_0131
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=110) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0131 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 110);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0131 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0132
     * @tc.name      SearchComponent_MoveHistoryToFront_0132
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=-86) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0132 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], -86);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0132 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0133
     * @tc.name      SearchComponent_MoveHistoryToFront_0133
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=194) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0133 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], 194);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0133 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0134
     * @tc.name      SearchComponent_MoveHistoryToFront_0134
     * @tc.desc      moveHistoryToFront(history=["a", "", "abc"], index=-42) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0134 begin`);
      const actual: string[] = moveHistoryToFront(['a', '', 'abc'], -42);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`moveHistoryToFront(history=["a", "", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0134 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0135
     * @tc.name      SearchComponent_MoveHistoryToFront_0135
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=1) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0135 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 1);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0135 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0136
     * @tc.name      SearchComponent_MoveHistoryToFront_0136
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=-1) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0136 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], -1);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0136 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0137
     * @tc.name      SearchComponent_MoveHistoryToFront_0137
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=2) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0137 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0137 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0138
     * @tc.name      SearchComponent_MoveHistoryToFront_0138
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=5) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0138 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 5);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0138 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0139
     * @tc.name      SearchComponent_MoveHistoryToFront_0139
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=10) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0139 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 10);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0139 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0140
     * @tc.name      SearchComponent_MoveHistoryToFront_0140
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=3) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0140 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 3);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0140 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0141
     * @tc.name      SearchComponent_MoveHistoryToFront_0141
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=100) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0141 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 100);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0141 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0142
     * @tc.name      SearchComponent_MoveHistoryToFront_0142
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=15) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0142 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 15);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0142 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0143
     * @tc.name      SearchComponent_MoveHistoryToFront_0143
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=20) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0143 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 20);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0143 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0144
     * @tc.name      SearchComponent_MoveHistoryToFront_0144
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=25) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0144 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 25);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0144 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0145
     * @tc.name      SearchComponent_MoveHistoryToFront_0145
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=30) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0145 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 30);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0145 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0146
     * @tc.name      SearchComponent_MoveHistoryToFront_0146
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=35) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0146 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 35);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0146 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0147
     * @tc.name      SearchComponent_MoveHistoryToFront_0147
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=40) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0147 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 40);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0147 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0148
     * @tc.name      SearchComponent_MoveHistoryToFront_0148
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=45) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0148 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 45);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0148 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0149
     * @tc.name      SearchComponent_MoveHistoryToFront_0149
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=50) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0149 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 50);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0149 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0150
     * @tc.name      SearchComponent_MoveHistoryToFront_0150
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=55) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0150 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 55);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0150 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0151
     * @tc.name      SearchComponent_MoveHistoryToFront_0151
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=60) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0151 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 60);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0151 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0152
     * @tc.name      SearchComponent_MoveHistoryToFront_0152
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=65) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0152 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 65);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0152 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0153
     * @tc.name      SearchComponent_MoveHistoryToFront_0153
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=70) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0153 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 70);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0153 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0154
     * @tc.name      SearchComponent_MoveHistoryToFront_0154
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=75) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0154 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 75);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0154 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0155
     * @tc.name      SearchComponent_MoveHistoryToFront_0155
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=80) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0155 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 80);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0155 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0156
     * @tc.name      SearchComponent_MoveHistoryToFront_0156
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=85) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0156 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 85);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0156 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0157
     * @tc.name      SearchComponent_MoveHistoryToFront_0157
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=90) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0157 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 90);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0157 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0158
     * @tc.name      SearchComponent_MoveHistoryToFront_0158
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=95) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0158 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 95);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0158 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0159
     * @tc.name      SearchComponent_MoveHistoryToFront_0159
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=105) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0159 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 105);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0159 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0160
     * @tc.name      SearchComponent_MoveHistoryToFront_0160
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=110) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0160 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 110);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0160 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0161
     * @tc.name      SearchComponent_MoveHistoryToFront_0161
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=-86) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0161 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], -86);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0161 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0162
     * @tc.name      SearchComponent_MoveHistoryToFront_0162
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=194) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0162 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], 194);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0162 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0163
     * @tc.name      SearchComponent_MoveHistoryToFront_0163
     * @tc.desc      moveHistoryToFront(history=["abc", "abc"], index=-42) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_MoveHistoryToFront_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0163 begin`);
      const actual: string[] = moveHistoryToFront(['abc', 'abc'], -42);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`moveHistoryToFront(history=["abc", "abc"]...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0163 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0164
     * @tc.name      SearchComponent_MoveHistoryToFront_0164
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=-1) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_MoveHistoryToFront_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0164 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], -1);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0164 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0165
     * @tc.name      SearchComponent_MoveHistoryToFront_0165
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=5) returns ["","a","abc",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0165 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0165 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0166
     * @tc.name      SearchComponent_MoveHistoryToFront_0166
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=10) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0166 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 10);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0166 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0167
     * @tc.name      SearchComponent_MoveHistoryToFront_0167
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=100) returns ["","a","abc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0167 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 100);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0167 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0168
     * @tc.name      SearchComponent_MoveHistoryToFront_0168
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=15) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0168 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 15);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0168 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0169
     * @tc.name      SearchComponent_MoveHistoryToFront_0169
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=20) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0169 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 20);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0169 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0170
     * @tc.name      SearchComponent_MoveHistoryToFront_0170
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=25) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0170 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 25);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0170 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0171
     * @tc.name      SearchComponent_MoveHistoryToFront_0171
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=30) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0171 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 30);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0171 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0172
     * @tc.name      SearchComponent_MoveHistoryToFront_0172
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=35) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0172 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 35);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0172 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MOVE_HISTORY_TO_FRONT_0173
     * @tc.name      SearchComponent_MoveHistoryToFront_0173
     * @tc.desc      moveHistoryToFront(history=["", "a", "abc", "Hello World", " "], index=40) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_MoveHistoryToFront_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MoveHistoryToFront_0173 begin`);
      const actual: string[] = moveHistoryToFront(['', 'a', 'abc', 'Hello World', ' '], 40);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`moveHistoryToFront(history=["", "a", "abc...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}MoveHistoryToFront_0173 end`);
    });
  });
}
