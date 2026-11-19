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
import { swapNames } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for swapNames (64 cases). */
export default function swapNames2Test(): void {
  describe('SwapNames2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0073
     * @tc.name      DragAndExchange_SwapNames_0073
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=20) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0073 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 20);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0074
     * @tc.name      DragAndExchange_SwapNames_0074
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=179) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0074 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 179);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0075
     * @tc.name      DragAndExchange_SwapNames_0075
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=70) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0075 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 70);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0076
     * @tc.name      DragAndExchange_SwapNames_0076
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0076 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, -1);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0077
     * @tc.name      DragAndExchange_SwapNames_0077
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0077 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 5);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0078
     * @tc.name      DragAndExchange_SwapNames_0078
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0078 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 10);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0079
     * @tc.name      DragAndExchange_SwapNames_0079
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0079 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0080
     * @tc.name      DragAndExchange_SwapNames_0080
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0080 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 100);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0081
     * @tc.name      DragAndExchange_SwapNames_0081
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0081 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 15);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0082
     * @tc.name      DragAndExchange_SwapNames_0082
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0082 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 20);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0083
     * @tc.name      DragAndExchange_SwapNames_0083
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=179) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0083 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 179);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0084
     * @tc.name      DragAndExchange_SwapNames_0084
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=2, index2=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0084 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 2, 70);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0085
     * @tc.name      DragAndExchange_SwapNames_0085
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0085 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 5);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0086
     * @tc.name      DragAndExchange_SwapNames_0086
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0086 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 10);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0087
     * @tc.name      DragAndExchange_SwapNames_0087
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0087 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0088
     * @tc.name      DragAndExchange_SwapNames_0088
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0088 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 100);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0089
     * @tc.name      DragAndExchange_SwapNames_0089
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0089 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 15);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0090
     * @tc.name      DragAndExchange_SwapNames_0090
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0090 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 20);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0091
     * @tc.name      DragAndExchange_SwapNames_0091
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=179) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0091 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 179);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0092
     * @tc.name      DragAndExchange_SwapNames_0092
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=-1, index2=70) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0092 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], -1, 70);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0093
     * @tc.name      DragAndExchange_SwapNames_0093
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=71, index2=0) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0093 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 71, 0);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0094
     * @tc.name      DragAndExchange_SwapNames_0094
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=71, index2=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0094 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 71, 1);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0095
     * @tc.name      DragAndExchange_SwapNames_0095
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=71, index2=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0095 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 71, 2);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0096
     * @tc.name      DragAndExchange_SwapNames_0096
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=71, index2=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0096 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 71, -1);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0097
     * @tc.name      DragAndExchange_SwapNames_0097
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=0) returns ["",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0097 begin`);
      const actual: string[] = swapNames(['', ''], 0, 0);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["", ""], index1=0, index...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["",""]');
      logInfo(`${BUNDLE}SwapNames_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0098
     * @tc.name      DragAndExchange_SwapNames_0098
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0098 begin`);
      const actual: string[] = swapNames(['', ''], 0, 2);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0099
     * @tc.name      DragAndExchange_SwapNames_0099
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0099 begin`);
      const actual: string[] = swapNames(['', ''], 0, -1);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0100
     * @tc.name      DragAndExchange_SwapNames_0100
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0100 begin`);
      const actual: string[] = swapNames(['', ''], 0, 5);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0101
     * @tc.name      DragAndExchange_SwapNames_0101
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0101 begin`);
      const actual: string[] = swapNames(['', ''], 0, 10);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0102
     * @tc.name      DragAndExchange_SwapNames_0102
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0102 begin`);
      const actual: string[] = swapNames(['', ''], 0, 3);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0103
     * @tc.name      DragAndExchange_SwapNames_0103
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0103 begin`);
      const actual: string[] = swapNames(['', ''], 0, 100);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0104
     * @tc.name      DragAndExchange_SwapNames_0104
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0104 begin`);
      const actual: string[] = swapNames(['', ''], 0, 15);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0105
     * @tc.name      DragAndExchange_SwapNames_0105
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0105 begin`);
      const actual: string[] = swapNames(['', ''], 0, 20);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0106
     * @tc.name      DragAndExchange_SwapNames_0106
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=179) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0106 begin`);
      const actual: string[] = swapNames(['', ''], 0, 179);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0107
     * @tc.name      DragAndExchange_SwapNames_0107
     * @tc.desc      swapNames(names=["", ""], index1=0, index2=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0107 begin`);
      const actual: string[] = swapNames(['', ''], 0, 70);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=0, index...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0108
     * @tc.name      DragAndExchange_SwapNames_0108
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0108 begin`);
      const actual: string[] = swapNames(['', ''], 1, 2);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0109
     * @tc.name      DragAndExchange_SwapNames_0109
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0109 begin`);
      const actual: string[] = swapNames(['', ''], 1, -1);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0110
     * @tc.name      DragAndExchange_SwapNames_0110
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0110 begin`);
      const actual: string[] = swapNames(['', ''], 1, 5);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0111
     * @tc.name      DragAndExchange_SwapNames_0111
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0111 begin`);
      const actual: string[] = swapNames(['', ''], 1, 10);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0112
     * @tc.name      DragAndExchange_SwapNames_0112
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0112 begin`);
      const actual: string[] = swapNames(['', ''], 1, 3);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0113
     * @tc.name      DragAndExchange_SwapNames_0113
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0113 begin`);
      const actual: string[] = swapNames(['', ''], 1, 100);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0114
     * @tc.name      DragAndExchange_SwapNames_0114
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0114 begin`);
      const actual: string[] = swapNames(['', ''], 1, 15);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0115
     * @tc.name      DragAndExchange_SwapNames_0115
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0115 begin`);
      const actual: string[] = swapNames(['', ''], 1, 20);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0116
     * @tc.name      DragAndExchange_SwapNames_0116
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=179) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0116 begin`);
      const actual: string[] = swapNames(['', ''], 1, 179);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0117
     * @tc.name      DragAndExchange_SwapNames_0117
     * @tc.desc      swapNames(names=["", ""], index1=1, index2=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0117 begin`);
      const actual: string[] = swapNames(['', ''], 1, 70);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=1, index...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0118
     * @tc.name      DragAndExchange_SwapNames_0118
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0118 begin`);
      const actual: string[] = swapNames(['', ''], 2, 2);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0119
     * @tc.name      DragAndExchange_SwapNames_0119
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0119 begin`);
      const actual: string[] = swapNames(['', ''], 2, 5);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0120
     * @tc.name      DragAndExchange_SwapNames_0120
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0120 begin`);
      const actual: string[] = swapNames(['', ''], 2, 10);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0121
     * @tc.name      DragAndExchange_SwapNames_0121
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0121 begin`);
      const actual: string[] = swapNames(['', ''], 2, 3);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0122
     * @tc.name      DragAndExchange_SwapNames_0122
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0122 begin`);
      const actual: string[] = swapNames(['', ''], 2, 100);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0123
     * @tc.name      DragAndExchange_SwapNames_0123
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0123 begin`);
      const actual: string[] = swapNames(['', ''], 2, 15);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0124
     * @tc.name      DragAndExchange_SwapNames_0124
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0124 begin`);
      const actual: string[] = swapNames(['', ''], 2, 20);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0125
     * @tc.name      DragAndExchange_SwapNames_0125
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=179) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0125 begin`);
      const actual: string[] = swapNames(['', ''], 2, 179);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0126
     * @tc.name      DragAndExchange_SwapNames_0126
     * @tc.desc      swapNames(names=["", ""], index1=2, index2=70) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0126 begin`);
      const actual: string[] = swapNames(['', ''], 2, 70);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=2, index...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0127
     * @tc.name      DragAndExchange_SwapNames_0127
     * @tc.desc      swapNames(names=["", ""], index1=71, index2=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0127 begin`);
      const actual: string[] = swapNames(['', ''], 71, 0);
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0128
     * @tc.name      DragAndExchange_SwapNames_0128
     * @tc.desc      swapNames(names=["", ""], index1=71, index2=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0128 begin`);
      const actual: string[] = swapNames(['', ''], 71, 1);
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0129
     * @tc.name      DragAndExchange_SwapNames_0129
     * @tc.desc      swapNames(names=["", ""], index1=71, index2=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0129 begin`);
      const actual: string[] = swapNames(['', ''], 71, 2);
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["", ""], index1=71, inde...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0130
     * @tc.name      DragAndExchange_SwapNames_0130
     * @tc.desc      swapNames(names=["Hello", "hello world", "", " ", "A"], index1=0, index2=0) returns ["Hello","he...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0130 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world', '', ' ', 'A'], 0, 0);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`swapNames(names=["Hello", "hello world", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`${BUNDLE}SwapNames_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0131
     * @tc.name      DragAndExchange_SwapNames_0131
     * @tc.desc      swapNames(names=["Hello", "hello world", "", " ", "A"], index1=0, index2=1) returns ["hello worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0131 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world', '', ' ', 'A'], 0, 1);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`swapNames(names=["Hello", "hello world", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello",""," ","A"]');
      logInfo(`${BUNDLE}SwapNames_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0132
     * @tc.name      DragAndExchange_SwapNames_0132
     * @tc.desc      swapNames(names=["Hello", "hello world", "", " ", "A"], index1=0, index2=2) returns ["","hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0132 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world', '', ' ', 'A'], 0, 2);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`swapNames(names=["Hello", "hello world", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","hello world","Hello"," ","A"]');
      logInfo(`${BUNDLE}SwapNames_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0133
     * @tc.name      DragAndExchange_SwapNames_0133
     * @tc.desc      swapNames(names=["Hello", "hello world", "", " ", "A"], index1=0, index2=-1) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0133 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world', '', ' ', 'A'], 0, -1);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual[4]=${actual[4]}`);
      expect(actual[4]).assertEqual('A');
      logInfo(`${BUNDLE}SwapNames_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0134
     * @tc.name      DragAndExchange_SwapNames_0134
     * @tc.desc      swapNames(names=["Hello", "hello world", "", " ", "A"], index1=0, index2=5) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0134 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world', '', ' ', 'A'], 0, 5);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0135
     * @tc.name      DragAndExchange_SwapNames_0135
     * @tc.desc      swapNames(names=["Hello", "hello world", "", " ", "A"], index1=0, index2=3) returns [" ","hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0135 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world', '', ' ', 'A'], 0, 3);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`swapNames(names=["Hello", "hello world", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[" ","hello world","","Hello","A"]');
      logInfo(`${BUNDLE}SwapNames_0135 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0136
     * @tc.name      DragAndExchange_SwapNames_0136
     * @tc.desc      swapNames(names=["Hello", "hello world", "", " ", "A"], index1=1, index2=2) returns ["Hello","",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0136 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world', '', ' ', 'A'], 1, 2);
      logInfo(`swapNames(names=["Hello", "hello world", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`swapNames(names=["Hello", "hello world", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","","hello world"," ","A"]');
      logInfo(`${BUNDLE}SwapNames_0136 end`);
    });
  });
}
