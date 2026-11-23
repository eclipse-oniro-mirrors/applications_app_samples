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
import { reorder } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for reorder (82 cases). */
export default function reorderTest(): void {
  describe('ReorderTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0001
     * @tc.name      ListBeExchange_Reorder_0001
     * @tc.desc      reorder(items=[], index=0, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_Reorder_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}Reorder_0001 begin`);
      const actual: string[] = reorder([], 0, 0);
      logInfo(`reorder(items=[], index=0, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0002
     * @tc.name      ListBeExchange_Reorder_0002
     * @tc.desc      reorder(items=[""], index=0, newIndex=0) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_Reorder_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}Reorder_0002 begin`);
      const actual: string[] = reorder([''], 0, 0);
      logInfo(`reorder(items=[""], index=0, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=0): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0003
     * @tc.name      ListBeExchange_Reorder_0003
     * @tc.desc      reorder(items=[""], index=1, newIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0003 begin`);
      const actual: string[] = reorder([''], 1, 0);
      logInfo(`reorder(items=[""], index=1, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=1, newIndex=0): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0004
     * @tc.name      ListBeExchange_Reorder_0004
     * @tc.desc      reorder(items=[""], index=1, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0004 begin`);
      const actual: string[] = reorder([''], 1, 1);
      logInfo(`reorder(items=[""], index=1, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0005
     * @tc.name      ListBeExchange_Reorder_0005
     * @tc.desc      reorder(items=["", "a"], index=0, newIndex=0) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0005 begin`);
      const actual: string[] = reorder(['', 'a'], 0, 0);
      logInfo(`reorder(items=["", "a"], index=0, newInde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=["", "a"], index=0, newInde...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}Reorder_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0006
     * @tc.name      ListBeExchange_Reorder_0006
     * @tc.desc      reorder(items=["", "a"], index=0, newIndex=1) returns ["a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0006 begin`);
      const actual: string[] = reorder(['', 'a'], 0, 1);
      logInfo(`reorder(items=["", "a"], index=0, newInde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=["", "a"], index=0, newInde...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a",""]');
      logInfo(`${BUNDLE}Reorder_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0007
     * @tc.name      ListBeExchange_Reorder_0007
     * @tc.desc      reorder(items=["", "a"], index=2, newIndex=0) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0007 begin`);
      const actual: string[] = reorder(['', 'a'], 2, 0);
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('a');
      logInfo(`${BUNDLE}Reorder_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0008
     * @tc.name      ListBeExchange_Reorder_0008
     * @tc.desc      reorder(items=["", "a"], index=2, newIndex=1) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0008 begin`);
      const actual: string[] = reorder(['', 'a'], 2, 1);
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('a');
      logInfo(`${BUNDLE}Reorder_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0009
     * @tc.name      ListBeExchange_Reorder_0009
     * @tc.desc      reorder(items=["", "a"], index=2, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0009 begin`);
      const actual: string[] = reorder(['', 'a'], 2, 2);
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('a');
      logInfo(`reorder(items=["", "a"], index=2, newInde...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0010
     * @tc.name      ListBeExchange_Reorder_0010
     * @tc.desc      reorder(items=["a", "", "abc"], index=0, newIndex=0) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0010 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 0, 0);
      logInfo(`reorder(items=["a", "", "abc"], index=0, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["a", "", "abc"], index=0, ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}Reorder_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0011
     * @tc.name      ListBeExchange_Reorder_0011
     * @tc.desc      reorder(items=["a", "", "abc"], index=0, newIndex=1) returns ["","a","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0011 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 0, 1);
      logInfo(`reorder(items=["a", "", "abc"], index=0, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["a", "", "abc"], index=0, ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc"]');
      logInfo(`${BUNDLE}Reorder_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0012
     * @tc.name      ListBeExchange_Reorder_0012
     * @tc.desc      reorder(items=["a", "", "abc"], index=0, newIndex=2) returns ["","abc","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0012 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 0, 2);
      logInfo(`reorder(items=["a", "", "abc"], index=0, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["a", "", "abc"], index=0, ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","abc","a"]');
      logInfo(`${BUNDLE}Reorder_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0013
     * @tc.name      ListBeExchange_Reorder_0013
     * @tc.desc      reorder(items=["a", "", "abc"], index=1, newIndex=2) returns ["a","abc",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0013 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 1, 2);
      logInfo(`reorder(items=["a", "", "abc"], index=1, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["a", "", "abc"], index=1, ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","abc",""]');
      logInfo(`${BUNDLE}Reorder_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0014
     * @tc.name      ListBeExchange_Reorder_0014
     * @tc.desc      reorder(items=["a", "", "abc"], index=2, newIndex=0) returns ["abc","a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0014 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 2, 0);
      logInfo(`reorder(items=["a", "", "abc"], index=2, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["a", "", "abc"], index=2, ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","a",""]');
      logInfo(`${BUNDLE}Reorder_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0015
     * @tc.name      ListBeExchange_Reorder_0015
     * @tc.desc      reorder(items=["a", "", "abc"], index=5, newIndex=0) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0015 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 5, 0);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('a');
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('abc');
      logInfo(`${BUNDLE}Reorder_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0016
     * @tc.name      ListBeExchange_Reorder_0016
     * @tc.desc      reorder(items=["a", "", "abc"], index=5, newIndex=1) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0016 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 5, 1);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('a');
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('abc');
      logInfo(`${BUNDLE}Reorder_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0017
     * @tc.name      ListBeExchange_Reorder_0017
     * @tc.desc      reorder(items=["a", "", "abc"], index=5, newIndex=2) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0017 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 5, 2);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('a');
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('abc');
      logInfo(`${BUNDLE}Reorder_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0018
     * @tc.name      ListBeExchange_Reorder_0018
     * @tc.desc      reorder(items=["a", "", "abc"], index=5, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0018 begin`);
      const actual: string[] = reorder(['a', '', 'abc'], 5, 5);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('a');
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`reorder(items=["a", "", "abc"], index=5, ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0019
     * @tc.name      ListBeExchange_Reorder_0019
     * @tc.desc      reorder(items=["abc", "abc"], index=0, newIndex=0) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0019 begin`);
      const actual: string[] = reorder(['abc', 'abc'], 0, 0);
      logInfo(`reorder(items=["abc", "abc"], index=0, ne...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=["abc", "abc"], index=0, ne...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}Reorder_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0020
     * @tc.name      ListBeExchange_Reorder_0020
     * @tc.desc      reorder(items=["abc", "abc"], index=2, newIndex=0) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0020 begin`);
      const actual: string[] = reorder(['abc', 'abc'], 2, 0);
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('abc');
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('abc');
      logInfo(`${BUNDLE}Reorder_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0021
     * @tc.name      ListBeExchange_Reorder_0021
     * @tc.desc      reorder(items=["abc", "abc"], index=2, newIndex=1) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0021 begin`);
      const actual: string[] = reorder(['abc', 'abc'], 2, 1);
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('abc');
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('abc');
      logInfo(`${BUNDLE}Reorder_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0022
     * @tc.name      ListBeExchange_Reorder_0022
     * @tc.desc      reorder(items=["abc", "abc"], index=2, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0022 begin`);
      const actual: string[] = reorder(['abc', 'abc'], 2, 2);
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('abc');
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('abc');
      logInfo(`reorder(items=["abc", "abc"], index=2, ne...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0023
     * @tc.name      ListBeExchange_Reorder_0023
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=0, newIndex=0) returns ["","a","abc","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0023 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 0, 0);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}Reorder_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0024
     * @tc.name      ListBeExchange_Reorder_0024
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=0, newIndex=1) returns ["a","","abc","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0024 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 0, 1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","Hello World"," "]');
      logInfo(`${BUNDLE}Reorder_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0025
     * @tc.name      ListBeExchange_Reorder_0025
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=0, newIndex=2) returns ["a","abc","","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0025 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 0, 2);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","abc","","Hello World"," "]');
      logInfo(`${BUNDLE}Reorder_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0026
     * @tc.name      ListBeExchange_Reorder_0026
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=0, newIndex=-1) returns ["a","abc","He...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0026 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 0, -1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","abc","Hello World",""," "]');
      logInfo(`${BUNDLE}Reorder_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0027
     * @tc.name      ListBeExchange_Reorder_0027
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=0, newIndex=5) returns ["a","abc","Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0027 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 0, 5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","abc","Hello World"," ",""]');
      logInfo(`${BUNDLE}Reorder_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0028
     * @tc.name      ListBeExchange_Reorder_0028
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=1, newIndex=2) returns ["","abc","a","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0028 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 1, 2);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","abc","a","Hello World"," "]');
      logInfo(`${BUNDLE}Reorder_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0029
     * @tc.name      ListBeExchange_Reorder_0029
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=1, newIndex=-1) returns ["","abc","Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0029 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 1, -1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","abc","Hello World","a"," "]');
      logInfo(`${BUNDLE}Reorder_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0030
     * @tc.name      ListBeExchange_Reorder_0030
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=1, newIndex=5) returns ["","abc","Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0030 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 1, 5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","abc","Hello World"," ","a"]');
      logInfo(`${BUNDLE}Reorder_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0031
     * @tc.name      ListBeExchange_Reorder_0031
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=2, newIndex=0) returns ["abc","","a","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0031 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 2, 0);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","","a","Hello World"," "]');
      logInfo(`${BUNDLE}Reorder_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0032
     * @tc.name      ListBeExchange_Reorder_0032
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=2, newIndex=-1) returns ["","a","Hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0032 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 2, -1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","Hello World","abc"," "]');
      logInfo(`${BUNDLE}Reorder_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0033
     * @tc.name      ListBeExchange_Reorder_0033
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=2, newIndex=5) returns ["","a","Hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0033 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 2, 5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","Hello World"," ","abc"]');
      logInfo(`${BUNDLE}Reorder_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0034
     * @tc.name      ListBeExchange_Reorder_0034
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=-1, newIndex=0) returns [" ","","a","a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0034 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], -1, 0);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","","a","abc","Hello World"]');
      logInfo(`${BUNDLE}Reorder_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0035
     * @tc.name      ListBeExchange_Reorder_0035
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=-1, newIndex=1) returns [""," ","a","a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0035 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], -1, 1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""," ","a","abc","Hello World"]');
      logInfo(`${BUNDLE}Reorder_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0036
     * @tc.name      ListBeExchange_Reorder_0036
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=-1, newIndex=2) returns ["","a"," ","a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0036 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], -1, 2);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"," ","abc","Hello World"]');
      logInfo(`${BUNDLE}Reorder_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0037
     * @tc.name      ListBeExchange_Reorder_0037
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=-1, newIndex=-1) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0037 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], -1, -1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc"," ","Hello World"]');
      logInfo(`${BUNDLE}Reorder_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0038
     * @tc.name      ListBeExchange_Reorder_0038
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=5, newIndex=0) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0038 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 5, 0);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('a');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual(' ');
      logInfo(`${BUNDLE}Reorder_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0039
     * @tc.name      ListBeExchange_Reorder_0039
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=5, newIndex=1) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0039 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 5, 1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('a');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual(' ');
      logInfo(`${BUNDLE}Reorder_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0040
     * @tc.name      ListBeExchange_Reorder_0040
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=5, newIndex=2) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0040 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 5, 2);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual(' ');
      logInfo(`${BUNDLE}Reorder_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0041
     * @tc.name      ListBeExchange_Reorder_0041
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=5, newIndex=-1) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0041 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 5, -1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('abc');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual(' ');
      logInfo(`${BUNDLE}Reorder_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0042
     * @tc.name      ListBeExchange_Reorder_0042
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=5, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0042 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 5, 5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('abc');
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0043
     * @tc.name      ListBeExchange_Reorder_0043
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=3, newIndex=0) returns ["Hello World",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0043 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 3, 0);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","","a","abc"," "]');
      logInfo(`${BUNDLE}Reorder_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0044
     * @tc.name      ListBeExchange_Reorder_0044
     * @tc.desc      reorder(items=["", "a", "abc", "Hello World", " "], index=3, newIndex=1) returns ["","Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0044 begin`);
      const actual: string[] = reorder(['', 'a', 'abc', 'Hello World', ' '], 3, 1);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`reorder(items=["", "a", "abc", "Hello Wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","Hello World","a","abc"," "]');
      logInfo(`${BUNDLE}Reorder_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0045
     * @tc.name      ListBeExchange_Reorder_0045
     * @tc.desc      reorder(items=[], index=0, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0045 begin`);
      const actual: string[] = reorder([], 0, 1);
      logInfo(`reorder(items=[], index=0, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0046
     * @tc.name      ListBeExchange_Reorder_0046
     * @tc.desc      reorder(items=[], index=0, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0046 begin`);
      const actual: string[] = reorder([], 0, 2);
      logInfo(`reorder(items=[], index=0, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0047
     * @tc.name      ListBeExchange_Reorder_0047
     * @tc.desc      reorder(items=[], index=0, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0047 begin`);
      const actual: string[] = reorder([], 0, -1);
      logInfo(`reorder(items=[], index=0, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0048
     * @tc.name      ListBeExchange_Reorder_0048
     * @tc.desc      reorder(items=[], index=0, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0048 begin`);
      const actual: string[] = reorder([], 0, 5);
      logInfo(`reorder(items=[], index=0, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0049
     * @tc.name      ListBeExchange_Reorder_0049
     * @tc.desc      reorder(items=[], index=0, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0049 begin`);
      const actual: string[] = reorder([], 0, 10);
      logInfo(`reorder(items=[], index=0, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0050
     * @tc.name      ListBeExchange_Reorder_0050
     * @tc.desc      reorder(items=[], index=0, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0050 begin`);
      const actual: string[] = reorder([], 0, 3);
      logInfo(`reorder(items=[], index=0, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0051
     * @tc.name      ListBeExchange_Reorder_0051
     * @tc.desc      reorder(items=[], index=0, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0051 begin`);
      const actual: string[] = reorder([], 0, 100);
      logInfo(`reorder(items=[], index=0, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0052
     * @tc.name      ListBeExchange_Reorder_0052
     * @tc.desc      reorder(items=[], index=0, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0052 begin`);
      const actual: string[] = reorder([], 0, 15);
      logInfo(`reorder(items=[], index=0, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0053
     * @tc.name      ListBeExchange_Reorder_0053
     * @tc.desc      reorder(items=[], index=0, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0053 begin`);
      const actual: string[] = reorder([], 0, 20);
      logInfo(`reorder(items=[], index=0, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0054
     * @tc.name      ListBeExchange_Reorder_0054
     * @tc.desc      reorder(items=[], index=0, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0054 begin`);
      const actual: string[] = reorder([], 0, 31.78);
      logInfo(`reorder(items=[], index=0, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0055
     * @tc.name      ListBeExchange_Reorder_0055
     * @tc.desc      reorder(items=[], index=0, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0055 begin`);
      const actual: string[] = reorder([], 0, 2.08);
      logInfo(`reorder(items=[], index=0, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=0, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0056
     * @tc.name      ListBeExchange_Reorder_0056
     * @tc.desc      reorder(items=[], index=1, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0056 begin`);
      const actual: string[] = reorder([], 1, 0);
      logInfo(`reorder(items=[], index=1, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0057
     * @tc.name      ListBeExchange_Reorder_0057
     * @tc.desc      reorder(items=[], index=1, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0057 begin`);
      const actual: string[] = reorder([], 1, 1);
      logInfo(`reorder(items=[], index=1, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0058
     * @tc.name      ListBeExchange_Reorder_0058
     * @tc.desc      reorder(items=[], index=1, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0058 begin`);
      const actual: string[] = reorder([], 1, 2);
      logInfo(`reorder(items=[], index=1, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0059
     * @tc.name      ListBeExchange_Reorder_0059
     * @tc.desc      reorder(items=[], index=1, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0059 begin`);
      const actual: string[] = reorder([], 1, -1);
      logInfo(`reorder(items=[], index=1, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0060
     * @tc.name      ListBeExchange_Reorder_0060
     * @tc.desc      reorder(items=[], index=1, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0060 begin`);
      const actual: string[] = reorder([], 1, 5);
      logInfo(`reorder(items=[], index=1, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0061
     * @tc.name      ListBeExchange_Reorder_0061
     * @tc.desc      reorder(items=[], index=1, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0061 begin`);
      const actual: string[] = reorder([], 1, 10);
      logInfo(`reorder(items=[], index=1, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0062
     * @tc.name      ListBeExchange_Reorder_0062
     * @tc.desc      reorder(items=[], index=1, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0062 begin`);
      const actual: string[] = reorder([], 1, 3);
      logInfo(`reorder(items=[], index=1, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0063
     * @tc.name      ListBeExchange_Reorder_0063
     * @tc.desc      reorder(items=[], index=1, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0063 begin`);
      const actual: string[] = reorder([], 1, 100);
      logInfo(`reorder(items=[], index=1, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0064
     * @tc.name      ListBeExchange_Reorder_0064
     * @tc.desc      reorder(items=[], index=1, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0064 begin`);
      const actual: string[] = reorder([], 1, 15);
      logInfo(`reorder(items=[], index=1, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0065
     * @tc.name      ListBeExchange_Reorder_0065
     * @tc.desc      reorder(items=[], index=1, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0065 begin`);
      const actual: string[] = reorder([], 1, 20);
      logInfo(`reorder(items=[], index=1, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0066
     * @tc.name      ListBeExchange_Reorder_0066
     * @tc.desc      reorder(items=[], index=1, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0066 begin`);
      const actual: string[] = reorder([], 1, 31.78);
      logInfo(`reorder(items=[], index=1, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0067
     * @tc.name      ListBeExchange_Reorder_0067
     * @tc.desc      reorder(items=[], index=1, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0067 begin`);
      const actual: string[] = reorder([], 1, 2.08);
      logInfo(`reorder(items=[], index=1, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=1, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0068
     * @tc.name      ListBeExchange_Reorder_0068
     * @tc.desc      reorder(items=[], index=2, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0068 begin`);
      const actual: string[] = reorder([], 2, 0);
      logInfo(`reorder(items=[], index=2, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0069
     * @tc.name      ListBeExchange_Reorder_0069
     * @tc.desc      reorder(items=[], index=2, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0069 begin`);
      const actual: string[] = reorder([], 2, 1);
      logInfo(`reorder(items=[], index=2, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0070
     * @tc.name      ListBeExchange_Reorder_0070
     * @tc.desc      reorder(items=[], index=2, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0070 begin`);
      const actual: string[] = reorder([], 2, 2);
      logInfo(`reorder(items=[], index=2, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0071
     * @tc.name      ListBeExchange_Reorder_0071
     * @tc.desc      reorder(items=[], index=2, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0071 begin`);
      const actual: string[] = reorder([], 2, -1);
      logInfo(`reorder(items=[], index=2, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0072
     * @tc.name      ListBeExchange_Reorder_0072
     * @tc.desc      reorder(items=[], index=2, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0072 begin`);
      const actual: string[] = reorder([], 2, 5);
      logInfo(`reorder(items=[], index=2, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0073
     * @tc.name      ListBeExchange_Reorder_0073
     * @tc.desc      reorder(items=[], index=2, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0073 begin`);
      const actual: string[] = reorder([], 2, 10);
      logInfo(`reorder(items=[], index=2, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0074
     * @tc.name      ListBeExchange_Reorder_0074
     * @tc.desc      reorder(items=[], index=2, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0074 begin`);
      const actual: string[] = reorder([], 2, 3);
      logInfo(`reorder(items=[], index=2, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0075
     * @tc.name      ListBeExchange_Reorder_0075
     * @tc.desc      reorder(items=[], index=2, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0075 begin`);
      const actual: string[] = reorder([], 2, 100);
      logInfo(`reorder(items=[], index=2, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0076
     * @tc.name      ListBeExchange_Reorder_0076
     * @tc.desc      reorder(items=[], index=2, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0076 begin`);
      const actual: string[] = reorder([], 2, 15);
      logInfo(`reorder(items=[], index=2, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0077
     * @tc.name      ListBeExchange_Reorder_0077
     * @tc.desc      reorder(items=[], index=2, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0077 begin`);
      const actual: string[] = reorder([], 2, 20);
      logInfo(`reorder(items=[], index=2, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0078
     * @tc.name      ListBeExchange_Reorder_0078
     * @tc.desc      reorder(items=[], index=2, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0078 begin`);
      const actual: string[] = reorder([], 2, 31.78);
      logInfo(`reorder(items=[], index=2, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0079
     * @tc.name      ListBeExchange_Reorder_0079
     * @tc.desc      reorder(items=[], index=2, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0079 begin`);
      const actual: string[] = reorder([], 2, 2.08);
      logInfo(`reorder(items=[], index=2, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=2, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0080
     * @tc.name      ListBeExchange_Reorder_0080
     * @tc.desc      reorder(items=[], index=-1, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0080 begin`);
      const actual: string[] = reorder([], -1, 0);
      logInfo(`reorder(items=[], index=-1, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0081
     * @tc.name      ListBeExchange_Reorder_0081
     * @tc.desc      reorder(items=[], index=-1, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0081 begin`);
      const actual: string[] = reorder([], -1, 1);
      logInfo(`reorder(items=[], index=-1, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0082
     * @tc.name      ListBeExchange_Reorder_0082
     * @tc.desc      reorder(items=[], index=-1, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0082 begin`);
      const actual: string[] = reorder([], -1, 2);
      logInfo(`reorder(items=[], index=-1, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0082 end`);
    });
  });
}
