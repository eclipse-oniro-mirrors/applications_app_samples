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

/** Logic checks for listDropResult (72 cases). */
export default function listDropResultTest(): void {
  describe('ListDropResultTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0001
     * @tc.name      DragAndExchange_ListDropResult_0001
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDropResult_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0001 begin`);
      const actual: string[] = listDropResult([], 0, 0);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDropResult_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0002
     * @tc.name      DragAndExchange_ListDropResult_0002
     * @tc.desc      listDropResult(names=[], dragIndex=0, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDropResult_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0002 begin`);
      const actual: string[] = listDropResult([], 0, -1);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`listDropResult(names=[], dragIndex=0, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0003
     * @tc.name      DragAndExchange_ListDropResult_0003
     * @tc.desc      listDropResult(names=[], dragIndex=1, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0003 begin`);
      const actual: string[] = listDropResult([], 1, -1);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=1, ins...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0004
     * @tc.name      DragAndExchange_ListDropResult_0004
     * @tc.desc      listDropResult(names=[], dragIndex=2, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0004 begin`);
      const actual: string[] = listDropResult([], 2, -1);
      logInfo(`listDropResult(names=[], dragIndex=2, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=[], dragIndex=2, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=2, ins...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=2, ins...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0005
     * @tc.name      DragAndExchange_ListDropResult_0005
     * @tc.desc      listDropResult(names=[], dragIndex=5, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0005 begin`);
      const actual: string[] = listDropResult([], 5, -1);
      logInfo(`listDropResult(names=[], dragIndex=5, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=[], dragIndex=5, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=5, ins...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=5, ins...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0006
     * @tc.name      DragAndExchange_ListDropResult_0006
     * @tc.desc      listDropResult(names=[], dragIndex=10, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0006 begin`);
      const actual: string[] = listDropResult([], 10, -1);
      logInfo(`listDropResult(names=[], dragIndex=10, in...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=[], dragIndex=10, in...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=10, in...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=10, in...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0007
     * @tc.name      DragAndExchange_ListDropResult_0007
     * @tc.desc      listDropResult(names=[], dragIndex=3, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0007 begin`);
      const actual: string[] = listDropResult([], 3, -1);
      logInfo(`listDropResult(names=[], dragIndex=3, ins...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=[], dragIndex=3, ins...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=3, ins...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=3, ins...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0008
     * @tc.name      DragAndExchange_ListDropResult_0008
     * @tc.desc      listDropResult(names=[], dragIndex=100, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0008 begin`);
      const actual: string[] = listDropResult([], 100, -1);
      logInfo(`listDropResult(names=[], dragIndex=100, i...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=[], dragIndex=100, i...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=100, i...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=100, i...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0009
     * @tc.name      DragAndExchange_ListDropResult_0009
     * @tc.desc      listDropResult(names=[], dragIndex=15, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0009 begin`);
      const actual: string[] = listDropResult([], 15, -1);
      logInfo(`listDropResult(names=[], dragIndex=15, in...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=[], dragIndex=15, in...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=15, in...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=15, in...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0010
     * @tc.name      DragAndExchange_ListDropResult_0010
     * @tc.desc      listDropResult(names=[], dragIndex=20, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0010 begin`);
      const actual: string[] = listDropResult([], 20, -1);
      logInfo(`listDropResult(names=[], dragIndex=20, in...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=[], dragIndex=20, in...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=20, in...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=[], dragIndex=20, in...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0011
     * @tc.name      DragAndExchange_ListDropResult_0011
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=0, insertIndex=0) returns ["Hello"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0011 begin`);
      const actual: string[] = listDropResult(['Hello'], 0, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello"]');
      logInfo(`${BUNDLE}ListDropResult_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0012
     * @tc.name      DragAndExchange_ListDropResult_0012
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=1, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0012 begin`);
      const actual: string[] = listDropResult(['Hello'], 1, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0013
     * @tc.name      DragAndExchange_ListDropResult_0013
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=1, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0013 begin`);
      const actual: string[] = listDropResult(['Hello'], 1, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0014
     * @tc.name      DragAndExchange_ListDropResult_0014
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=2, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0014 begin`);
      const actual: string[] = listDropResult(['Hello'], 2, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0015
     * @tc.name      DragAndExchange_ListDropResult_0015
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=2, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0015 begin`);
      const actual: string[] = listDropResult(['Hello'], 2, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0016
     * @tc.name      DragAndExchange_ListDropResult_0016
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=5, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0016 begin`);
      const actual: string[] = listDropResult(['Hello'], 5, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0017
     * @tc.name      DragAndExchange_ListDropResult_0017
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=5, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0017 begin`);
      const actual: string[] = listDropResult(['Hello'], 5, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0018
     * @tc.name      DragAndExchange_ListDropResult_0018
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=10, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0018 begin`);
      const actual: string[] = listDropResult(['Hello'], 10, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0019
     * @tc.name      DragAndExchange_ListDropResult_0019
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=10, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0019 begin`);
      const actual: string[] = listDropResult(['Hello'], 10, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0020
     * @tc.name      DragAndExchange_ListDropResult_0020
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=3, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0020 begin`);
      const actual: string[] = listDropResult(['Hello'], 3, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0021
     * @tc.name      DragAndExchange_ListDropResult_0021
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=3, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0021 begin`);
      const actual: string[] = listDropResult(['Hello'], 3, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0022
     * @tc.name      DragAndExchange_ListDropResult_0022
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=100, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0022 begin`);
      const actual: string[] = listDropResult(['Hello'], 100, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0023
     * @tc.name      DragAndExchange_ListDropResult_0023
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=100, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0023 begin`);
      const actual: string[] = listDropResult(['Hello'], 100, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0024
     * @tc.name      DragAndExchange_ListDropResult_0024
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=15, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0024 begin`);
      const actual: string[] = listDropResult(['Hello'], 15, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0025
     * @tc.name      DragAndExchange_ListDropResult_0025
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=15, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0025 begin`);
      const actual: string[] = listDropResult(['Hello'], 15, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0026
     * @tc.name      DragAndExchange_ListDropResult_0026
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=20, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0026 begin`);
      const actual: string[] = listDropResult(['Hello'], 20, 0);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0027
     * @tc.name      DragAndExchange_ListDropResult_0027
     * @tc.desc      listDropResult(names=["Hello"], dragIndex=20, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0027 begin`);
      const actual: string[] = listDropResult(['Hello'], 20, -1);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["Hello"], dragIndex...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0028
     * @tc.name      DragAndExchange_ListDropResult_0028
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=0, insertIndex=0) returns ["Hello","hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0028 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 0, 0);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world"]');
      logInfo(`${BUNDLE}ListDropResult_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0029
     * @tc.name      DragAndExchange_ListDropResult_0029
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=0, insertIndex=1) returns ["hello world...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0029 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 0, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["Hello", "hello wor...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello"]');
      logInfo(`${BUNDLE}ListDropResult_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0030
     * @tc.name      DragAndExchange_ListDropResult_0030
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=0, insertIndex=-1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0030 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 0, -1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0031
     * @tc.name      DragAndExchange_ListDropResult_0031
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=2, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0031 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 2, 0);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0032
     * @tc.name      DragAndExchange_ListDropResult_0032
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=2, insertIndex=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0032 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 2, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0033
     * @tc.name      DragAndExchange_ListDropResult_0033
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=2, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0033 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 2, -1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0034
     * @tc.name      DragAndExchange_ListDropResult_0034
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=5, insertIndex=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0034 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 5, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0035
     * @tc.name      DragAndExchange_ListDropResult_0035
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=10, insertIndex=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0035 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 10, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0036
     * @tc.name      DragAndExchange_ListDropResult_0036
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=3, insertIndex=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0036 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 3, 0);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0037
     * @tc.name      DragAndExchange_ListDropResult_0037
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=3, insertIndex=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0037 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 3, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0038
     * @tc.name      DragAndExchange_ListDropResult_0038
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=3, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0038 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 3, -1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0039
     * @tc.name      DragAndExchange_ListDropResult_0039
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=100, insertIndex=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0039 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 100, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0040
     * @tc.name      DragAndExchange_ListDropResult_0040
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=15, insertIndex=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0040 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 15, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0041
     * @tc.name      DragAndExchange_ListDropResult_0041
     * @tc.desc      listDropResult(names=["Hello", "hello world"], dragIndex=20, insertIndex=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0041 begin`);
      const actual: string[] = listDropResult(['Hello', 'hello world'], 20, 1);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["Hello", "hello wor...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0042
     * @tc.name      DragAndExchange_ListDropResult_0042
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=0, insertIndex=0) returns ["hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0042 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 0, 0);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello",""]');
      logInfo(`${BUNDLE}ListDropResult_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0043
     * @tc.name      DragAndExchange_ListDropResult_0043
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=0, insertIndex=1) returns ["Hello",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0043 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 0, 1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world",""]');
      logInfo(`${BUNDLE}ListDropResult_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0044
     * @tc.name      DragAndExchange_ListDropResult_0044
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=0, insertIndex=2) returns ["","Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0044 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 0, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","Hello","hello world"]');
      logInfo(`${BUNDLE}ListDropResult_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0045
     * @tc.name      DragAndExchange_ListDropResult_0045
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=0, insertIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0045 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 0, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0046
     * @tc.name      DragAndExchange_ListDropResult_0046
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=1, insertIndex=2) returns ["hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0046 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 1, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["hello world", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","","Hello"]');
      logInfo(`${BUNDLE}ListDropResult_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0047
     * @tc.name      DragAndExchange_ListDropResult_0047
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=1, insertIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0047 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 1, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0048
     * @tc.name      DragAndExchange_ListDropResult_0048
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=2, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0048 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 2, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0049
     * @tc.name      DragAndExchange_ListDropResult_0049
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=5, insertIndex=0) returns "hello wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0049 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 5, 0);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0050
     * @tc.name      DragAndExchange_ListDropResult_0050
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=5, insertIndex=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0050 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 5, 1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0051
     * @tc.name      DragAndExchange_ListDropResult_0051
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=5, insertIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0051 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 5, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0052
     * @tc.name      DragAndExchange_ListDropResult_0052
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=5, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0052 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 5, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0053
     * @tc.name      DragAndExchange_ListDropResult_0053
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=10, insertIndex=0) returns "hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0053 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 10, 0);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0054
     * @tc.name      DragAndExchange_ListDropResult_0054
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=10, insertIndex=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0054 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 10, 1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0055
     * @tc.name      DragAndExchange_ListDropResult_0055
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=10, insertIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0055 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 10, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0056
     * @tc.name      DragAndExchange_ListDropResult_0056
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=10, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0056 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 10, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0057
     * @tc.name      DragAndExchange_ListDropResult_0057
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=3, insertIndex=0) returns "hello wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0057 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 3, 0);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0058
     * @tc.name      DragAndExchange_ListDropResult_0058
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=3, insertIndex=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0058 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 3, 1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0059
     * @tc.name      DragAndExchange_ListDropResult_0059
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=3, insertIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0059 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 3, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0060
     * @tc.name      DragAndExchange_ListDropResult_0060
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=3, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0060 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 3, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0061
     * @tc.name      DragAndExchange_ListDropResult_0061
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=100, insertIndex=0) returns "hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0061 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 100, 0);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0062
     * @tc.name      DragAndExchange_ListDropResult_0062
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=100, insertIndex=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0062 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 100, 1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0063
     * @tc.name      DragAndExchange_ListDropResult_0063
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=100, insertIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0063 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 100, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0064
     * @tc.name      DragAndExchange_ListDropResult_0064
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=100, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0064 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 100, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0065
     * @tc.name      DragAndExchange_ListDropResult_0065
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=15, insertIndex=0) returns "hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0065 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 15, 0);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0066
     * @tc.name      DragAndExchange_ListDropResult_0066
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=15, insertIndex=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0066 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 15, 1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0067
     * @tc.name      DragAndExchange_ListDropResult_0067
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=15, insertIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0067 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 15, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0068
     * @tc.name      DragAndExchange_ListDropResult_0068
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=15, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0068 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 15, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0069
     * @tc.name      DragAndExchange_ListDropResult_0069
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=20, insertIndex=0) returns "hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0069 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 20, 0);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('hello world');
      logInfo(`${BUNDLE}ListDropResult_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0070
     * @tc.name      DragAndExchange_ListDropResult_0070
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=20, insertIndex=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0070 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 20, 1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('Hello');
      logInfo(`${BUNDLE}ListDropResult_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0071
     * @tc.name      DragAndExchange_ListDropResult_0071
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=20, insertIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDropResult_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0071 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 20, 2);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('');
      logInfo(`${BUNDLE}ListDropResult_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DROP_RESULT_0072
     * @tc.name      DragAndExchange_ListDropResult_0072
     * @tc.desc      listDropResult(names=["hello world", "Hello", ""], dragIndex=20, insertIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDropResult_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDropResult_0072 begin`);
      const actual: string[] = listDropResult(['hello world', 'Hello', ''], 20, -1);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`listDropResult(names=["hello world", "Hel...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}ListDropResult_0072 end`);
    });
  });
}
