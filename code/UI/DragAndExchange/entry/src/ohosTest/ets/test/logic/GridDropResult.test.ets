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

/** Logic checks for gridDropResult (72 cases). */
export default function gridDropResultTest(): void {
  describe('GridDropResultTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0001
     * @tc.name      DragAndExchange_GridDropResult_0001
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=0, isSuccess=true) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDropResult_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0001 begin`);
      const actual: string[] = gridDropResult([], 0, 0, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDropResult_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0002
     * @tc.name      DragAndExchange_GridDropResult_0002
     * @tc.desc      gridDropResult(names=[], itemIndex=0, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDropResult_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0002 begin`);
      const actual: string[] = gridDropResult([], 0, -1, true);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`gridDropResult(names=[], itemIndex=0, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0003
     * @tc.name      DragAndExchange_GridDropResult_0003
     * @tc.desc      gridDropResult(names=[], itemIndex=1, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0003 begin`);
      const actual: string[] = gridDropResult([], 1, -1, true);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=1, ins...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0004
     * @tc.name      DragAndExchange_GridDropResult_0004
     * @tc.desc      gridDropResult(names=[], itemIndex=2, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0004 begin`);
      const actual: string[] = gridDropResult([], 2, -1, true);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=2, ins...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0005
     * @tc.name      DragAndExchange_GridDropResult_0005
     * @tc.desc      gridDropResult(names=[], itemIndex=5, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0005 begin`);
      const actual: string[] = gridDropResult([], 5, -1, true);
      logInfo(`gridDropResult(names=[], itemIndex=5, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=[], itemIndex=5, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=5, ins...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=5, ins...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0006
     * @tc.name      DragAndExchange_GridDropResult_0006
     * @tc.desc      gridDropResult(names=[], itemIndex=10, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0006 begin`);
      const actual: string[] = gridDropResult([], 10, -1, true);
      logInfo(`gridDropResult(names=[], itemIndex=10, in...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=[], itemIndex=10, in...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=10, in...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=10, in...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0007
     * @tc.name      DragAndExchange_GridDropResult_0007
     * @tc.desc      gridDropResult(names=[], itemIndex=3, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0007 begin`);
      const actual: string[] = gridDropResult([], 3, -1, true);
      logInfo(`gridDropResult(names=[], itemIndex=3, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=[], itemIndex=3, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=3, ins...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=3, ins...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0008
     * @tc.name      DragAndExchange_GridDropResult_0008
     * @tc.desc      gridDropResult(names=[], itemIndex=100, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0008 begin`);
      const actual: string[] = gridDropResult([], 100, -1, true);
      logInfo(`gridDropResult(names=[], itemIndex=100, i...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=[], itemIndex=100, i...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=100, i...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=[], itemIndex=100, i...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0009
     * @tc.name      DragAndExchange_GridDropResult_0009
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=0, insertIndex=0, isSuccess=true) returns ["Hello"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0009 begin`);
      const actual: string[] = gridDropResult(['Hello'], 0, 0, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello"]');
      logInfo(`${BUNDLE}GridDropResult_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0010
     * @tc.name      DragAndExchange_GridDropResult_0010
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=1, insertIndex=0, isSuccess=true) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0010 begin`);
      const actual: string[] = gridDropResult(['Hello'], 1, 0, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0011
     * @tc.name      DragAndExchange_GridDropResult_0011
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=1, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0011 begin`);
      const actual: string[] = gridDropResult(['Hello'], 1, -1, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0012
     * @tc.name      DragAndExchange_GridDropResult_0012
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=2, insertIndex=0, isSuccess=true) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0012 begin`);
      const actual: string[] = gridDropResult(['Hello'], 2, 0, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0013
     * @tc.name      DragAndExchange_GridDropResult_0013
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=2, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0013 begin`);
      const actual: string[] = gridDropResult(['Hello'], 2, -1, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0014
     * @tc.name      DragAndExchange_GridDropResult_0014
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=5, insertIndex=0, isSuccess=true) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0014 begin`);
      const actual: string[] = gridDropResult(['Hello'], 5, 0, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0015
     * @tc.name      DragAndExchange_GridDropResult_0015
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=5, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0015 begin`);
      const actual: string[] = gridDropResult(['Hello'], 5, -1, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0016
     * @tc.name      DragAndExchange_GridDropResult_0016
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=10, insertIndex=0, isSuccess=true) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0016 begin`);
      const actual: string[] = gridDropResult(['Hello'], 10, 0, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0017
     * @tc.name      DragAndExchange_GridDropResult_0017
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=10, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0017 begin`);
      const actual: string[] = gridDropResult(['Hello'], 10, -1, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0018
     * @tc.name      DragAndExchange_GridDropResult_0018
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=3, insertIndex=0, isSuccess=true) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0018 begin`);
      const actual: string[] = gridDropResult(['Hello'], 3, 0, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0019
     * @tc.name      DragAndExchange_GridDropResult_0019
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=3, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0019 begin`);
      const actual: string[] = gridDropResult(['Hello'], 3, -1, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0020
     * @tc.name      DragAndExchange_GridDropResult_0020
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=100, insertIndex=0, isSuccess=true) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0020 begin`);
      const actual: string[] = gridDropResult(['Hello'], 100, 0, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0021
     * @tc.name      DragAndExchange_GridDropResult_0021
     * @tc.desc      gridDropResult(names=["Hello"], itemIndex=100, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0021 begin`);
      const actual: string[] = gridDropResult(['Hello'], 100, -1, true);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello"], itemIndex...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0022
     * @tc.name      DragAndExchange_GridDropResult_0022
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=0, insertIndex=0, isSuccess=true) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0022 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 0, 0, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world"]');
      logInfo(`${BUNDLE}GridDropResult_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0023
     * @tc.name      DragAndExchange_GridDropResult_0023
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=0, insertIndex=1, isSuccess=true) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0023 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 0, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello"]');
      logInfo(`${BUNDLE}GridDropResult_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0024
     * @tc.name      DragAndExchange_GridDropResult_0024
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=0, insertIndex=-1, isSuccess=true) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0024 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 0, -1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0025
     * @tc.name      DragAndExchange_GridDropResult_0025
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=2, insertIndex=0, isSuccess=true) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0025 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 2, 0, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0026
     * @tc.name      DragAndExchange_GridDropResult_0026
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=2, insertIndex=1, isSuccess=true) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0026 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 2, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0027
     * @tc.name      DragAndExchange_GridDropResult_0027
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=2, insertIndex=-1, isSuccess=true) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0027 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 2, -1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0028
     * @tc.name      DragAndExchange_GridDropResult_0028
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=5, insertIndex=1, isSuccess=true) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0028 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 5, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0029
     * @tc.name      DragAndExchange_GridDropResult_0029
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=10, insertIndex=1, isSuccess=true) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0029 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 10, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0030
     * @tc.name      DragAndExchange_GridDropResult_0030
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=3, insertIndex=0, isSuccess=true) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0030 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 3, 0, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0031
     * @tc.name      DragAndExchange_GridDropResult_0031
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=3, insertIndex=1, isSuccess=true) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0031 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 3, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0032
     * @tc.name      DragAndExchange_GridDropResult_0032
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=3, insertIndex=-1, isSuccess=true) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0032 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 3, -1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0033
     * @tc.name      DragAndExchange_GridDropResult_0033
     * @tc.desc      gridDropResult(names=["Hello", "hello world"], itemIndex=100, insertIndex=1, isSuccess=true) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0033 begin`);
      const actual: string[] = gridDropResult(['Hello', 'hello world'], 100, 1, true);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["Hello", "hello wor...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0034
     * @tc.name      DragAndExchange_GridDropResult_0034
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=0, insertIndex=0, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0034 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 0, 0, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello",""]');
      logInfo(`${BUNDLE}GridDropResult_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0035
     * @tc.name      DragAndExchange_GridDropResult_0035
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=0, insertIndex=1, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0035 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 0, 1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world",""]');
      logInfo(`${BUNDLE}GridDropResult_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0036
     * @tc.name      DragAndExchange_GridDropResult_0036
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=0, insertIndex=2, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0036 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 0, 2, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","Hello","hello world"]');
      logInfo(`${BUNDLE}GridDropResult_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0037
     * @tc.name      DragAndExchange_GridDropResult_0037
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=0, insertIndex=-1, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0037 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 0, -1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0038
     * @tc.name      DragAndExchange_GridDropResult_0038
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=1, insertIndex=2, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0038 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 1, 2, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","","Hello"]');
      logInfo(`${BUNDLE}GridDropResult_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0039
     * @tc.name      DragAndExchange_GridDropResult_0039
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=1, insertIndex=-1, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0039 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 1, -1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0040
     * @tc.name      DragAndExchange_GridDropResult_0040
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=2, insertIndex=-1, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0040 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 2, -1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0041
     * @tc.name      DragAndExchange_GridDropResult_0041
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=5, insertIndex=0, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0041 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 5, 0, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0042
     * @tc.name      DragAndExchange_GridDropResult_0042
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=5, insertIndex=1, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0042 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 5, 1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0043
     * @tc.name      DragAndExchange_GridDropResult_0043
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=5, insertIndex=2, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0043 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 5, 2, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0044
     * @tc.name      DragAndExchange_GridDropResult_0044
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=5, insertIndex=-1, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0044 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 5, -1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0045
     * @tc.name      DragAndExchange_GridDropResult_0045
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=10, insertIndex=0, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0045 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 10, 0, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0046
     * @tc.name      DragAndExchange_GridDropResult_0046
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=10, insertIndex=1, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0046 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 10, 1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0047
     * @tc.name      DragAndExchange_GridDropResult_0047
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=10, insertIndex=2, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0047 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 10, 2, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0048
     * @tc.name      DragAndExchange_GridDropResult_0048
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=10, insertIndex=-1, isSuccess=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0048 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 10, -1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0049
     * @tc.name      DragAndExchange_GridDropResult_0049
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=3, insertIndex=0, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0049 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 3, 0, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0050
     * @tc.name      DragAndExchange_GridDropResult_0050
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=3, insertIndex=1, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0050 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 3, 1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0051
     * @tc.name      DragAndExchange_GridDropResult_0051
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=3, insertIndex=2, isSuccess=true) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0051 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 3, 2, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0052
     * @tc.name      DragAndExchange_GridDropResult_0052
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=3, insertIndex=-1, isSuccess=true) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0052 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 3, -1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0053
     * @tc.name      DragAndExchange_GridDropResult_0053
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=100, insertIndex=0, isSuccess=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0053 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 100, 0, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('hello world');
      logInfo(`${BUNDLE}GridDropResult_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0054
     * @tc.name      DragAndExchange_GridDropResult_0054
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=100, insertIndex=1, isSuccess=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0054 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 100, 1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('Hello');
      logInfo(`${BUNDLE}GridDropResult_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0055
     * @tc.name      DragAndExchange_GridDropResult_0055
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=100, insertIndex=2, isSuccess=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0055 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 100, 2, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0056
     * @tc.name      DragAndExchange_GridDropResult_0056
     * @tc.desc      gridDropResult(names=["hello world", "Hello", ""], itemIndex=100, insertIndex=-1, isSuccess=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0056 begin`);
      const actual: string[] = gridDropResult(['hello world', 'Hello', ''], 100, -1, true);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0057
     * @tc.name      DragAndExchange_GridDropResult_0057
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=0, insertIndex=0, isSuccess=true) returns ["",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0057 begin`);
      const actual: string[] = gridDropResult(['', ''], 0, 0, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["",""]');
      logInfo(`${BUNDLE}GridDropResult_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0058
     * @tc.name      DragAndExchange_GridDropResult_0058
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=0, insertIndex=-1, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0058 begin`);
      const actual: string[] = gridDropResult(['', ''], 0, -1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0059
     * @tc.name      DragAndExchange_GridDropResult_0059
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=1, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0059 begin`);
      const actual: string[] = gridDropResult(['', ''], 1, -1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0060
     * @tc.name      DragAndExchange_GridDropResult_0060
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=2, insertIndex=0, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0060 begin`);
      const actual: string[] = gridDropResult(['', ''], 2, 0, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0061
     * @tc.name      DragAndExchange_GridDropResult_0061
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=2, insertIndex=1, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0061 begin`);
      const actual: string[] = gridDropResult(['', ''], 2, 1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0062
     * @tc.name      DragAndExchange_GridDropResult_0062
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=2, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0062 begin`);
      const actual: string[] = gridDropResult(['', ''], 2, -1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0063
     * @tc.name      DragAndExchange_GridDropResult_0063
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=5, insertIndex=0, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0063 begin`);
      const actual: string[] = gridDropResult(['', ''], 5, 0, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0064
     * @tc.name      DragAndExchange_GridDropResult_0064
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=5, insertIndex=1, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0064 begin`);
      const actual: string[] = gridDropResult(['', ''], 5, 1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0065
     * @tc.name      DragAndExchange_GridDropResult_0065
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=5, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0065 begin`);
      const actual: string[] = gridDropResult(['', ''], 5, -1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0066
     * @tc.name      DragAndExchange_GridDropResult_0066
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=10, insertIndex=0, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0066 begin`);
      const actual: string[] = gridDropResult(['', ''], 10, 0, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0067
     * @tc.name      DragAndExchange_GridDropResult_0067
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=10, insertIndex=1, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0067 begin`);
      const actual: string[] = gridDropResult(['', ''], 10, 1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0068
     * @tc.name      DragAndExchange_GridDropResult_0068
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=10, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0068 begin`);
      const actual: string[] = gridDropResult(['', ''], 10, -1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0069
     * @tc.name      DragAndExchange_GridDropResult_0069
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=3, insertIndex=0, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0069 begin`);
      const actual: string[] = gridDropResult(['', ''], 3, 0, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0070
     * @tc.name      DragAndExchange_GridDropResult_0070
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=3, insertIndex=1, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0070 begin`);
      const actual: string[] = gridDropResult(['', ''], 3, 1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0071
     * @tc.name      DragAndExchange_GridDropResult_0071
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=3, insertIndex=-1, isSuccess=true) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDropResult_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0071 begin`);
      const actual: string[] = gridDropResult(['', ''], 3, -1, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}GridDropResult_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DROP_RESULT_0072
     * @tc.name      DragAndExchange_GridDropResult_0072
     * @tc.desc      gridDropResult(names=["", ""], itemIndex=100, insertIndex=0, isSuccess=true) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDropResult_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDropResult_0072 begin`);
      const actual: string[] = gridDropResult(['', ''], 100, 0, true);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`gridDropResult(names=["", ""], itemIndex=...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}GridDropResult_0072 end`);
    });
  });
}
