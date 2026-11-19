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
import { gridDropResult } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridDropResult (63 cases). */
export default function gridDropResult2Test(): void {
  describe('GridDropResult2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0073
     * @tc.name      DragAndExchange_GridDropResult_0073
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=100, insertIndex=1, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0073 begin`);
      const actual: string[] = gridDropResult(['', ''], 100, 1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0074
     * @tc.name      DragAndExchange_GridDropResult_0074
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=100, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0074 begin`);
      const actual: string[] = gridDropResult(['', ''], 100, -1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0075
     * @tc.name      DragAndExchange_GridDropResult_0075
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=0, insertIndex=0, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0075 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 0, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`${BUNDLE}GridDropResult_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0076
     * @tc.name      DragAndExchange_GridDropResult_0076
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=0, insertIndex=1, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0076 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello",""," ","A"]');
      logInfo(`${BUNDLE}GridDropResult_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0077
     * @tc.name      DragAndExchange_GridDropResult_0077
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=0, insertIndex=2, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0077 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 2, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","hello world","Hello"," ","A"]');
      logInfo(`${BUNDLE}GridDropResult_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0078
     * @tc.name      DragAndExchange_GridDropResult_0078
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=0, insertIndex=-1, isSucc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0078 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, -1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('A');
      logInfo(`${BUNDLE}GridDropResult_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0079
     * @tc.name      DragAndExchange_GridDropResult_0079
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=0, insertIndex=3, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0079 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 0, 3, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","hello world","","Hello","A"]');
      logInfo(`${BUNDLE}GridDropResult_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0080
     * @tc.name      DragAndExchange_GridDropResult_0080
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=1, insertIndex=2, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0080 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 1, 2, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","","hello world"," ","A"]');
      logInfo(`${BUNDLE}GridDropResult_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0081
     * @tc.name      DragAndExchange_GridDropResult_0081
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=1, insertIndex=-1, isSucc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0081 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 1, -1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('A');
      logInfo(`${BUNDLE}GridDropResult_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0082
     * @tc.name      DragAndExchange_GridDropResult_0082
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=1, insertIndex=3, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0082 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 1, 3, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello"," ","","hello world","A"]');
      logInfo(`${BUNDLE}GridDropResult_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0083
     * @tc.name      DragAndExchange_GridDropResult_0083
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=2, insertIndex=-1, isSucc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0083 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 2, -1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('A');
      logInfo(`${BUNDLE}GridDropResult_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0084
     * @tc.name      DragAndExchange_GridDropResult_0084
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=2, insertIndex=3, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0084 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 2, 3, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world"," ","","A"]');
      logInfo(`${BUNDLE}GridDropResult_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0085
     * @tc.name      DragAndExchange_GridDropResult_0085
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=5, insertIndex=0, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0085 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 0, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0086
     * @tc.name      DragAndExchange_GridDropResult_0086
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=5, insertIndex=1, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0086 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0087
     * @tc.name      DragAndExchange_GridDropResult_0087
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=5, insertIndex=2, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0087 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 2, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0088
     * @tc.name      DragAndExchange_GridDropResult_0088
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=5, insertIndex=-1, isSucc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0088 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, -1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0089
     * @tc.name      DragAndExchange_GridDropResult_0089
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=5, insertIndex=3, isSucce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0089 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 5, 3, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual(' ');
      logInfo(`${BUNDLE}GridDropResult_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0090
     * @tc.name      DragAndExchange_GridDropResult_0090
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=10, insertIndex=2, isSucc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0090 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 10, 2, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0091
     * @tc.name      DragAndExchange_GridDropResult_0091
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=10, insertIndex=3, isSucc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0091 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 10, 3, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual(' ');
      logInfo(`${BUNDLE}GridDropResult_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0092
     * @tc.name      DragAndExchange_GridDropResult_0092
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=100, insertIndex=2, isSuc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0092 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 100, 2, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0093
     * @tc.name      DragAndExchange_GridDropResult_0093
     * @tc.desc      gridDropResult(names=["Hello", "hello world", "", " ", "A"], itemIndex=100, insertIndex=3, isSuc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0093 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world', '', ' ', 'A'], 100, 3, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual(' ');
      logInfo(`${BUNDLE}GridDropResult_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0094
     * @tc.name      DragAndExchange_GridDropResult_0094
     * @tc.desc      gridDropResult(names=[" ", "hello world", "A", "hello world", "Sample Title 123"], itemIndex=0, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0094 begin`);
      const actual: string[] = gridDropResult([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 0, true);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=[" ", "hello world",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`${BUNDLE}GridDropResult_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0095
     * @tc.name      DragAndExchange_GridDropResult_0095
     * @tc.desc      gridDropResult(names=[" ", "hello world", "A", "hello world", "Sample Title 123"], itemIndex=0, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0095 begin`);
      const actual: string[] = gridDropResult([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 1, true);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=[" ", "hello world",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world"," ","A","hello world","Sample Title 123"]');
      logInfo(`${BUNDLE}GridDropResult_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0096
     * @tc.name      DragAndExchange_GridDropResult_0096
     * @tc.desc      gridDropResult(names=[" ", "hello world", "A", "hello world", "Sample Title 123"], itemIndex=0, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0096 begin`);
      const actual: string[] = gridDropResult([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 2, true);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=[" ", "hello world",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","hello world"," ","hello world","Sample Title 123"]');
      logInfo(`${BUNDLE}GridDropResult_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0097
     * @tc.name      DragAndExchange_GridDropResult_0097
     * @tc.desc      gridDropResult(names=[" ", "hello world", "A", "hello world", "Sample Title 123"], itemIndex=0, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0097 begin`);
      const actual: string[] = gridDropResult([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, -1,
        true);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('A');
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}GridDropResult_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0098
     * @tc.name      DragAndExchange_GridDropResult_0098
     * @tc.desc      gridDropResult(names=[" ", "hello world", "A", "hello world", "Sample Title 123"], itemIndex=0, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0098 begin`);
      const actual: string[] = gridDropResult([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 3, true);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=[" ", "hello world",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","hello world","A"," ","Sample Title 123"]');
      logInfo(`${BUNDLE}GridDropResult_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0099
     * @tc.name      DragAndExchange_GridDropResult_0099
     * @tc.desc      gridDropResult(names=[" ", "hello world", "A", "hello world", "Sample Title 123"], itemIndex=1, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0099 begin`);
      const actual: string[] = gridDropResult([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 1, 2, true);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=[" ", "hello world",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","A","hello world","hello world","Sample Title 123"]');
      logInfo(`${BUNDLE}GridDropResult_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0100
     * @tc.name      DragAndExchange_GridDropResult_0100
     * @tc.desc      gridDropResult(names=[" ", "hello world", "A", "hello world", "Sample Title 123"], itemIndex=1, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0100 begin`);
      const actual: string[] = gridDropResult([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 1, -1,
        true);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual(' ');
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('A');
      logInfo(`gridDropResult(names=[" ", "hello world",...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}GridDropResult_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0101
     * @tc.name      DragAndExchange_GridDropResult_0101
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=0, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0101 begin`);
      const actual: string[] = gridDropResult([], 0, 0, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0102
     * @tc.name      DragAndExchange_GridDropResult_0102
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=1, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0102 begin`);
      const actual: string[] = gridDropResult([], 0, 1, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0103
     * @tc.name      DragAndExchange_GridDropResult_0103
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=1, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0103 begin`);
      const actual: string[] = gridDropResult([], 0, 1, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0104
     * @tc.name      DragAndExchange_GridDropResult_0104
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=2, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0104 begin`);
      const actual: string[] = gridDropResult([], 0, 2, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0105
     * @tc.name      DragAndExchange_GridDropResult_0105
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=2, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0105 begin`);
      const actual: string[] = gridDropResult([], 0, 2, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0106
     * @tc.name      DragAndExchange_GridDropResult_0106
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=-1, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0106 begin`);
      const actual: string[] = gridDropResult([], 0, -1, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0107
     * @tc.name      DragAndExchange_GridDropResult_0107
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=5, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0107 begin`);
      const actual: string[] = gridDropResult([], 0, 5, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0108
     * @tc.name      DragAndExchange_GridDropResult_0108
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=5, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0108 begin`);
      const actual: string[] = gridDropResult([], 0, 5, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0109
     * @tc.name      DragAndExchange_GridDropResult_0109
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=10, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0109 begin`);
      const actual: string[] = gridDropResult([], 0, 10, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0110
     * @tc.name      DragAndExchange_GridDropResult_0110
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=10, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0110 begin`);
      const actual: string[] = gridDropResult([], 0, 10, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0111
     * @tc.name      DragAndExchange_GridDropResult_0111
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=3, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0111 begin`);
      const actual: string[] = gridDropResult([], 0, 3, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0112
     * @tc.name      DragAndExchange_GridDropResult_0112
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=3, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0112 begin`);
      const actual: string[] = gridDropResult([], 0, 3, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0113
     * @tc.name      DragAndExchange_GridDropResult_0113
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=100, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0113 begin`);
      const actual: string[] = gridDropResult([], 0, 100, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0114
     * @tc.name      DragAndExchange_GridDropResult_0114
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=100, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0114 begin`);
      const actual: string[] = gridDropResult([], 0, 100, false);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0115
     * @tc.name      DragAndExchange_GridDropResult_0115
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=0, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0115 begin`);
      const actual: string[] = gridDropResult([], 1, 0, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0116
     * @tc.name      DragAndExchange_GridDropResult_0116
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=0, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0116 begin`);
      const actual: string[] = gridDropResult([], 1, 0, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0117
     * @tc.name      DragAndExchange_GridDropResult_0117
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=1, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0117 begin`);
      const actual: string[] = gridDropResult([], 1, 1, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0118
     * @tc.name      DragAndExchange_GridDropResult_0118
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=1, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0118 begin`);
      const actual: string[] = gridDropResult([], 1, 1, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0119
     * @tc.name      DragAndExchange_GridDropResult_0119
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=2, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0119 begin`);
      const actual: string[] = gridDropResult([], 1, 2, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0120
     * @tc.name      DragAndExchange_GridDropResult_0120
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=2, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0120 begin`);
      const actual: string[] = gridDropResult([], 1, 2, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0121
     * @tc.name      DragAndExchange_GridDropResult_0121
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=-1, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0121 begin`);
      const actual: string[] = gridDropResult([], 1, -1, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0122
     * @tc.name      DragAndExchange_GridDropResult_0122
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=5, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0122 begin`);
      const actual: string[] = gridDropResult([], 1, 5, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0123
     * @tc.name      DragAndExchange_GridDropResult_0123
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=5, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0123 begin`);
      const actual: string[] = gridDropResult([], 1, 5, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0124
     * @tc.name      DragAndExchange_GridDropResult_0124
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=10, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0124 begin`);
      const actual: string[] = gridDropResult([], 1, 10, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0125
     * @tc.name      DragAndExchange_GridDropResult_0125
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=10, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0125 begin`);
      const actual: string[] = gridDropResult([], 1, 10, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0126
     * @tc.name      DragAndExchange_GridDropResult_0126
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=3, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0126 begin`);
      const actual: string[] = gridDropResult([], 1, 3, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0127
     * @tc.name      DragAndExchange_GridDropResult_0127
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=3, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0127 begin`);
      const actual: string[] = gridDropResult([], 1, 3, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0128
     * @tc.name      DragAndExchange_GridDropResult_0128
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=100, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0128 begin`);
      const actual: string[] = gridDropResult([], 1, 100, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0129
     * @tc.name      DragAndExchange_GridDropResult_0129
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=100, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0129 begin`);
      const actual: string[] = gridDropResult([], 1, 100, false);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0130
     * @tc.name      DragAndExchange_GridDropResult_0130
     * @tc.desc      gridDropResult(names=[], itemIndex=2, insertIndex=0, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0130 begin`);
      const actual: string[] = gridDropResult([], 2, 0, true);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0131
     * @tc.name      DragAndExchange_GridDropResult_0131
     * @tc.desc      gridDropResult(names=[], itemIndex=2, insertIndex=0, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0131 begin`);
      const actual: string[] = gridDropResult([], 2, 0, false);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0132
     * @tc.name      DragAndExchange_GridDropResult_0132
     * @tc.desc      gridDropResult(names=[], itemIndex=2, insertIndex=1, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0132 begin`);
      const actual: string[] = gridDropResult([], 2, 1, true);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0133
     * @tc.name      DragAndExchange_GridDropResult_0133
     * @tc.desc      gridDropResult(names=[], itemIndex=2, insertIndex=1, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0133 begin`);
      const actual: string[] = gridDropResult([], 2, 1, false);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0134
     * @tc.name      DragAndExchange_GridDropResult_0134
     * @tc.desc      gridDropResult(names=[], itemIndex=2, insertIndex=2, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0134 begin`);
      const actual: string[] = gridDropResult([], 2, 2, true);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0135
     * @tc.name      DragAndExchange_GridDropResult_0135
     * @tc.desc      gridDropResult(names=[], itemIndex=2, insertIndex=2, isSuccess=false) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridDropResult_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0135 begin`);
      const actual: string[] = gridDropResult([], 2, 2, false);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0135 end`);
    });
  });
}
