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
import { listDropResult } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listDropResult (63 cases). */
export default function listDropResult2Test(): void {
  describe('ListDropResult2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0073
     * @tc.name      DragAndExchange_ListDropResult_0073
     * @tc.desc      listDropResult(names=["", ""], dragIndex=0, insertIndex=0) returns ["",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0073 begin`);
      const actual: string[] = listDropResult(['', ''], 0, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["",""]');
      logInfo(`${BUNDLE}ListDropResult_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0074
     * @tc.name      DragAndExchange_ListDropResult_0074
     * @tc.desc      listDropResult(names=["", ""], dragIndex=0, insertIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0074 begin`);
      const actual: string[] = listDropResult(['', ''], 0, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0075
     * @tc.name      DragAndExchange_ListDropResult_0075
     * @tc.desc      listDropResult(names=["", ""], dragIndex=1, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0075 begin`);
      const actual: string[] = listDropResult(['', ''], 1, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0076
     * @tc.name      DragAndExchange_ListDropResult_0076
     * @tc.desc      listDropResult(names=["", ""], dragIndex=2, insertIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0076 begin`);
      const actual: string[] = listDropResult(['', ''], 2, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0077
     * @tc.name      DragAndExchange_ListDropResult_0077
     * @tc.desc      listDropResult(names=["", ""], dragIndex=2, insertIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0077 begin`);
      const actual: string[] = listDropResult(['', ''], 2, 1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0078
     * @tc.name      DragAndExchange_ListDropResult_0078
     * @tc.desc      listDropResult(names=["", ""], dragIndex=2, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0078 begin`);
      const actual: string[] = listDropResult(['', ''], 2, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0079
     * @tc.name      DragAndExchange_ListDropResult_0079
     * @tc.desc      listDropResult(names=["", ""], dragIndex=5, insertIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0079 begin`);
      const actual: string[] = listDropResult(['', ''], 5, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0080
     * @tc.name      DragAndExchange_ListDropResult_0080
     * @tc.desc      listDropResult(names=["", ""], dragIndex=5, insertIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0080 begin`);
      const actual: string[] = listDropResult(['', ''], 5, 1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0081
     * @tc.name      DragAndExchange_ListDropResult_0081
     * @tc.desc      listDropResult(names=["", ""], dragIndex=5, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0081 begin`);
      const actual: string[] = listDropResult(['', ''], 5, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0082
     * @tc.name      DragAndExchange_ListDropResult_0082
     * @tc.desc      listDropResult(names=["", ""], dragIndex=10, insertIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0082 begin`);
      const actual: string[] = listDropResult(['', ''], 10, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0083
     * @tc.name      DragAndExchange_ListDropResult_0083
     * @tc.desc      listDropResult(names=["", ""], dragIndex=10, insertIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0083 begin`);
      const actual: string[] = listDropResult(['', ''], 10, 1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0084
     * @tc.name      DragAndExchange_ListDropResult_0084
     * @tc.desc      listDropResult(names=["", ""], dragIndex=10, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0084 begin`);
      const actual: string[] = listDropResult(['', ''], 10, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0085
     * @tc.name      DragAndExchange_ListDropResult_0085
     * @tc.desc      listDropResult(names=["", ""], dragIndex=3, insertIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0085 begin`);
      const actual: string[] = listDropResult(['', ''], 3, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0086
     * @tc.name      DragAndExchange_ListDropResult_0086
     * @tc.desc      listDropResult(names=["", ""], dragIndex=3, insertIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0086 begin`);
      const actual: string[] = listDropResult(['', ''], 3, 1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0087
     * @tc.name      DragAndExchange_ListDropResult_0087
     * @tc.desc      listDropResult(names=["", ""], dragIndex=3, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0087 begin`);
      const actual: string[] = listDropResult(['', ''], 3, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0088
     * @tc.name      DragAndExchange_ListDropResult_0088
     * @tc.desc      listDropResult(names=["", ""], dragIndex=100, insertIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0088 begin`);
      const actual: string[] = listDropResult(['', ''], 100, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0089
     * @tc.name      DragAndExchange_ListDropResult_0089
     * @tc.desc      listDropResult(names=["", ""], dragIndex=100, insertIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0089 begin`);
      const actual: string[] = listDropResult(['', ''], 100, 1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0090
     * @tc.name      DragAndExchange_ListDropResult_0090
     * @tc.desc      listDropResult(names=["", ""], dragIndex=100, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0090 begin`);
      const actual: string[] = listDropResult(['', ''], 100, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0091
     * @tc.name      DragAndExchange_ListDropResult_0091
     * @tc.desc      listDropResult(names=["", ""], dragIndex=15, insertIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0091 begin`);
      const actual: string[] = listDropResult(['', ''], 15, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0092
     * @tc.name      DragAndExchange_ListDropResult_0092
     * @tc.desc      listDropResult(names=["", ""], dragIndex=15, insertIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0092 begin`);
      const actual: string[] = listDropResult(['', ''], 15, 1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0093
     * @tc.name      DragAndExchange_ListDropResult_0093
     * @tc.desc      listDropResult(names=["", ""], dragIndex=15, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0093 begin`);
      const actual: string[] = listDropResult(['', ''], 15, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0094
     * @tc.name      DragAndExchange_ListDropResult_0094
     * @tc.desc      listDropResult(names=["", ""], dragIndex=20, insertIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0094 begin`);
      const actual: string[] = listDropResult(['', ''], 20, 0);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0095
     * @tc.name      DragAndExchange_ListDropResult_0095
     * @tc.desc      listDropResult(names=["", ""], dragIndex=20, insertIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0095 begin`);
      const actual: string[] = listDropResult(['', ''], 20, 1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0096
     * @tc.name      DragAndExchange_ListDropResult_0096
     * @tc.desc      listDropResult(names=["", ""], dragIndex=20, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0096 begin`);
      const actual: string[] = listDropResult(['', ''], 20, -1);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["", ""], dragIndex=...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0097
     * @tc.name      DragAndExchange_ListDropResult_0097
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=0, insertIndex=0) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0097 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 0);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`${BUNDLE}ListDropResult_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0098
     * @tc.name      DragAndExchange_ListDropResult_0098
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=0, insertIndex=1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0098 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello",""," ","A"]');
      logInfo(`${BUNDLE}ListDropResult_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0099
     * @tc.name      DragAndExchange_ListDropResult_0099
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=0, insertIndex=2) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0099 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 2);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","hello world","Hello"," ","A"]');
      logInfo(`${BUNDLE}ListDropResult_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0100
     * @tc.name      DragAndExchange_ListDropResult_0100
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=0, insertIndex=-1) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0100 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, -1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('A');
      logInfo(`${BUNDLE}ListDropResult_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0101
     * @tc.name      DragAndExchange_ListDropResult_0101
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=0, insertIndex=3) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0101 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","hello world","","Hello","A"]');
      logInfo(`${BUNDLE}ListDropResult_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0102
     * @tc.name      DragAndExchange_ListDropResult_0102
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=1, insertIndex=2) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0102 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 1, 2);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","","hello world"," ","A"]');
      logInfo(`${BUNDLE}ListDropResult_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0103
     * @tc.name      DragAndExchange_ListDropResult_0103
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=1, insertIndex=-1) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0103 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 1, -1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('A');
      logInfo(`${BUNDLE}ListDropResult_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0104
     * @tc.name      DragAndExchange_ListDropResult_0104
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=1, insertIndex=3) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0104 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 1, 3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello"," ","","hello world","A"]');
      logInfo(`${BUNDLE}ListDropResult_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0105
     * @tc.name      DragAndExchange_ListDropResult_0105
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=2, insertIndex=-1) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0105 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 2, -1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('A');
      logInfo(`${BUNDLE}ListDropResult_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0106
     * @tc.name      DragAndExchange_ListDropResult_0106
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=2, insertIndex=3) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0106 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 2, 3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world"," ","","A"]');
      logInfo(`${BUNDLE}ListDropResult_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0107
     * @tc.name      DragAndExchange_ListDropResult_0107
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=5, insertIndex=0) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0107 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 0);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0108
     * @tc.name      DragAndExchange_ListDropResult_0108
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=5, insertIndex=1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0108 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0109
     * @tc.name      DragAndExchange_ListDropResult_0109
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=5, insertIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0109 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 2);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0110
     * @tc.name      DragAndExchange_ListDropResult_0110
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=5, insertIndex=-1) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0110 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, -1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0111
     * @tc.name      DragAndExchange_ListDropResult_0111
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=5, insertIndex=3) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0111 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual(' ');
      logInfo(`${BUNDLE}ListDropResult_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0112
     * @tc.name      DragAndExchange_ListDropResult_0112
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=10, insertIndex=2) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0112 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 10, 2);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0113
     * @tc.name      DragAndExchange_ListDropResult_0113
     * @tc.desc      listDropResult(names=["Hello", "hello world", "", " ", "A"], dragIndex=10, insertIndex=3) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0113 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world', '', ' ', 'A'], 10, 3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual(' ');
      logInfo(`${BUNDLE}ListDropResult_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0114
     * @tc.name      DragAndExchange_ListDropResult_0114
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0114 begin`);
      const actual: string[] = listDropResult([], 0, 1);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0115
     * @tc.name      DragAndExchange_ListDropResult_0115
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=2) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0115 begin`);
      const actual: string[] = listDropResult([], 0, 2);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0116
     * @tc.name      DragAndExchange_ListDropResult_0116
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=5) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0116 begin`);
      const actual: string[] = listDropResult([], 0, 5);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0117
     * @tc.name      DragAndExchange_ListDropResult_0117
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=10) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0117 begin`);
      const actual: string[] = listDropResult([], 0, 10);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0118
     * @tc.name      DragAndExchange_ListDropResult_0118
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=3) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0118 begin`);
      const actual: string[] = listDropResult([], 0, 3);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0119
     * @tc.name      DragAndExchange_ListDropResult_0119
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=100) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0119 begin`);
      const actual: string[] = listDropResult([], 0, 100);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0120
     * @tc.name      DragAndExchange_ListDropResult_0120
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=15) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0120 begin`);
      const actual: string[] = listDropResult([], 0, 15);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0121
     * @tc.name      DragAndExchange_ListDropResult_0121
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=20) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0121 begin`);
      const actual: string[] = listDropResult([], 0, 20);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0122
     * @tc.name      DragAndExchange_ListDropResult_0122
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=-9) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0122 begin`);
      const actual: string[] = listDropResult([], 0, -9);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0123
     * @tc.name      DragAndExchange_ListDropResult_0123
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=75.57) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0123 begin`);
      const actual: string[] = listDropResult([], 0, 75.57);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0124
     * @tc.name      DragAndExchange_ListDropResult_0124
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0124 begin`);
      const actual: string[] = listDropResult([], 1, 0);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0125
     * @tc.name      DragAndExchange_ListDropResult_0125
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0125 begin`);
      const actual: string[] = listDropResult([], 1, 1);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0126
     * @tc.name      DragAndExchange_ListDropResult_0126
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=2) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0126 begin`);
      const actual: string[] = listDropResult([], 1, 2);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0127
     * @tc.name      DragAndExchange_ListDropResult_0127
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=5) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0127 begin`);
      const actual: string[] = listDropResult([], 1, 5);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0128
     * @tc.name      DragAndExchange_ListDropResult_0128
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=10) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0128 begin`);
      const actual: string[] = listDropResult([], 1, 10);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0129
     * @tc.name      DragAndExchange_ListDropResult_0129
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=3) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0129 begin`);
      const actual: string[] = listDropResult([], 1, 3);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0130
     * @tc.name      DragAndExchange_ListDropResult_0130
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=100) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0130 begin`);
      const actual: string[] = listDropResult([], 1, 100);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0131
     * @tc.name      DragAndExchange_ListDropResult_0131
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=15) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0131 begin`);
      const actual: string[] = listDropResult([], 1, 15);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0132
     * @tc.name      DragAndExchange_ListDropResult_0132
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=20) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0132 begin`);
      const actual: string[] = listDropResult([], 1, 20);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0133
     * @tc.name      DragAndExchange_ListDropResult_0133
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=-9) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0133 begin`);
      const actual: string[] = listDropResult([], 1, -9);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0134
     * @tc.name      DragAndExchange_ListDropResult_0134
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=75.57) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0134 begin`);
      const actual: string[] = listDropResult([], 1, 75.57);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0135
     * @tc.name      DragAndExchange_ListDropResult_0135
     * @tc.desc      listDropResult(names=[], dragIndex=2, insertIndex=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListDropResult_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0135 begin`);
      const actual: string[] = listDropResult([], 2, 0);
      logInfo(`listDropResult(names=[], dragIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0135 end`);
    });
  });
}
