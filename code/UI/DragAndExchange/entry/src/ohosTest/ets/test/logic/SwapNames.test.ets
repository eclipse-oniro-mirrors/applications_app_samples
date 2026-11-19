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

/** Logic checks for swapNames (72 cases). */
export default function swapNamesTest(): void {
  describe('SwapNamesTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0001
     * @tc.name      DragAndExchange_SwapNames_0001
     * @tc.desc      swapNames(names=[], index1=0, index2=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_SwapNames_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SwapNames_0001 begin`);
      const actual: string[] = swapNames([], 0, 0);
      logInfo(`swapNames(names=[], index1=0, index2=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`swapNames(names=[], index1=0, index2=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0002
     * @tc.name      DragAndExchange_SwapNames_0002
     * @tc.desc      swapNames(names=[], index1=0, index2=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_SwapNames_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SwapNames_0002 begin`);
      const actual: string[] = swapNames([], 0, 1);
      logInfo(`swapNames(names=[], index1=0, index2=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=[], index1=0, index2=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0003
     * @tc.name      DragAndExchange_SwapNames_0003
     * @tc.desc      swapNames(names=[], index1=0, index2=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0003 begin`);
      const actual: string[] = swapNames([], 0, 2);
      logInfo(`swapNames(names=[], index1=0, index2=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=[], index1=0, index2=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=2): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=2): actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0004
     * @tc.name      DragAndExchange_SwapNames_0004
     * @tc.desc      swapNames(names=[], index1=0, index2=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0004 begin`);
      const actual: string[] = swapNames([], 0, 5);
      logInfo(`swapNames(names=[], index1=0, index2=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=[], index1=0, index2=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=5): actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=5): actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0005
     * @tc.name      DragAndExchange_SwapNames_0005
     * @tc.desc      swapNames(names=[], index1=0, index2=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0005 begin`);
      const actual: string[] = swapNames([], 0, 10);
      logInfo(`swapNames(names=[], index1=0, index2=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=[], index1=0, index2=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=10): actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=10): actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0006
     * @tc.name      DragAndExchange_SwapNames_0006
     * @tc.desc      swapNames(names=[], index1=0, index2=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0006 begin`);
      const actual: string[] = swapNames([], 0, 3);
      logInfo(`swapNames(names=[], index1=0, index2=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=[], index1=0, index2=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=3): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=3): actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0007
     * @tc.name      DragAndExchange_SwapNames_0007
     * @tc.desc      swapNames(names=[], index1=0, index2=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0007 begin`);
      const actual: string[] = swapNames([], 0, 100);
      logInfo(`swapNames(names=[], index1=0, index2=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=[], index1=0, index2=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=100): actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=100): actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0008
     * @tc.name      DragAndExchange_SwapNames_0008
     * @tc.desc      swapNames(names=[], index1=0, index2=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0008 begin`);
      const actual: string[] = swapNames([], 0, 15);
      logInfo(`swapNames(names=[], index1=0, index2=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=[], index1=0, index2=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=15): actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=15): actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0009
     * @tc.name      DragAndExchange_SwapNames_0009
     * @tc.desc      swapNames(names=[], index1=0, index2=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0009 begin`);
      const actual: string[] = swapNames([], 0, 20);
      logInfo(`swapNames(names=[], index1=0, index2=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=[], index1=0, index2=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=20): actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=20): actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0010
     * @tc.name      DragAndExchange_SwapNames_0010
     * @tc.desc      swapNames(names=[], index1=0, index2=179) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0010 begin`);
      const actual: string[] = swapNames([], 0, 179);
      logInfo(`swapNames(names=[], index1=0, index2=179): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=[], index1=0, index2=179): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=179): actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=179): actual[179]=${actual[179]}`);
      expect(actual[179]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0011
     * @tc.name      DragAndExchange_SwapNames_0011
     * @tc.desc      swapNames(names=[], index1=0, index2=70) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0011 begin`);
      const actual: string[] = swapNames([], 0, 70);
      logInfo(`swapNames(names=[], index1=0, index2=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=[], index1=0, index2=70): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=70): actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=[], index1=0, index2=70): actual[70]=${actual[70]}`);
      expect(actual[70]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0012
     * @tc.name      DragAndExchange_SwapNames_0012
     * @tc.desc      swapNames(names=[], index1=-1, index2=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0012 begin`);
      const actual: string[] = swapNames([], -1, -1);
      logInfo(`swapNames(names=[], index1=-1, index2=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SwapNames_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0013
     * @tc.name      DragAndExchange_SwapNames_0013
     * @tc.desc      swapNames(names=[], index1=71, index2=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_SwapNames_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapNames_0013 begin`);
      const actual: string[] = swapNames([], 71, 0);
      logInfo(`swapNames(names=[], index1=71, index2=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=[], index1=71, index2=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=[], index1=71, index2=0): actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=[], index1=71, index2=0): actual[71]=${actual[71]}`);
      expect(actual[71]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0014
     * @tc.name      DragAndExchange_SwapNames_0014
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=0) returns ["Hello"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0014 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 0);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello"]');
      logInfo(`${BUNDLE}SwapNames_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0015
     * @tc.name      DragAndExchange_SwapNames_0015
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0015 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 1);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0016
     * @tc.name      DragAndExchange_SwapNames_0016
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=2) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0016 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 2);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0017
     * @tc.name      DragAndExchange_SwapNames_0017
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=5) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0017 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 5);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0018
     * @tc.name      DragAndExchange_SwapNames_0018
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=10) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0018 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 10);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0019
     * @tc.name      DragAndExchange_SwapNames_0019
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=3) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0019 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 3);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0020
     * @tc.name      DragAndExchange_SwapNames_0020
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=100) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0020 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 100);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0021
     * @tc.name      DragAndExchange_SwapNames_0021
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=15) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0021 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 15);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0022
     * @tc.name      DragAndExchange_SwapNames_0022
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=20) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0022 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 20);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0023
     * @tc.name      DragAndExchange_SwapNames_0023
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=179) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0023 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 179);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0024
     * @tc.name      DragAndExchange_SwapNames_0024
     * @tc.desc      swapNames(names=["Hello"], index1=0, index2=70) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0024 begin`);
      const actual: string[] = swapNames(['Hello'], 0, 70);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=0, inde...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0025
     * @tc.name      DragAndExchange_SwapNames_0025
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0025 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 1);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0026
     * @tc.name      DragAndExchange_SwapNames_0026
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0026 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 2);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0027
     * @tc.name      DragAndExchange_SwapNames_0027
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0027 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 5);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0028
     * @tc.name      DragAndExchange_SwapNames_0028
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0028 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 10);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0029
     * @tc.name      DragAndExchange_SwapNames_0029
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0029 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 3);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0030
     * @tc.name      DragAndExchange_SwapNames_0030
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0030 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 100);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0031
     * @tc.name      DragAndExchange_SwapNames_0031
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0031 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 15);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0032
     * @tc.name      DragAndExchange_SwapNames_0032
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0032 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 20);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0033
     * @tc.name      DragAndExchange_SwapNames_0033
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=179) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0033 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 179);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0034
     * @tc.name      DragAndExchange_SwapNames_0034
     * @tc.desc      swapNames(names=["Hello"], index1=1, index2=70) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0034 begin`);
      const actual: string[] = swapNames(['Hello'], 1, 70);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=1, inde...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0035
     * @tc.name      DragAndExchange_SwapNames_0035
     * @tc.desc      swapNames(names=["Hello"], index1=71, index2=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0035 begin`);
      const actual: string[] = swapNames(['Hello'], 71, 0);
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0036
     * @tc.name      DragAndExchange_SwapNames_0036
     * @tc.desc      swapNames(names=["Hello"], index1=71, index2=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0036 begin`);
      const actual: string[] = swapNames(['Hello'], 71, 1);
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["Hello"], index1=71, ind...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0037
     * @tc.name      DragAndExchange_SwapNames_0037
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=0, index2=0) returns ["Hello","hello world"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0037 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 0, 0);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["Hello", "hello world"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world"]');
      logInfo(`${BUNDLE}SwapNames_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0038
     * @tc.name      DragAndExchange_SwapNames_0038
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=0, index2=1) returns ["hello world","Hello"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0038 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 0, 1);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["Hello", "hello world"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello"]');
      logInfo(`${BUNDLE}SwapNames_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0039
     * @tc.name      DragAndExchange_SwapNames_0039
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=0, index2=2) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0039 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 0, 2);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0040
     * @tc.name      DragAndExchange_SwapNames_0040
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=0, index2=-1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0040 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 0, -1);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0041
     * @tc.name      DragAndExchange_SwapNames_0041
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=0, index2=3) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0041 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 0, 3);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0042
     * @tc.name      DragAndExchange_SwapNames_0042
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=2) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0042 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 2);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0043
     * @tc.name      DragAndExchange_SwapNames_0043
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=5) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0043 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 5);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0044
     * @tc.name      DragAndExchange_SwapNames_0044
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=10) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0044 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 10);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0045
     * @tc.name      DragAndExchange_SwapNames_0045
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=3) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0045 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 3);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0046
     * @tc.name      DragAndExchange_SwapNames_0046
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=100) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0046 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 100);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0047
     * @tc.name      DragAndExchange_SwapNames_0047
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=15) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0047 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 15);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0048
     * @tc.name      DragAndExchange_SwapNames_0048
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=20) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0048 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 20);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0049
     * @tc.name      DragAndExchange_SwapNames_0049
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=179) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0049 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 179);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0050
     * @tc.name      DragAndExchange_SwapNames_0050
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=1, index2=70) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0050 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 1, 70);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0051
     * @tc.name      DragAndExchange_SwapNames_0051
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=2, index2=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0051 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 2, 2);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0052
     * @tc.name      DragAndExchange_SwapNames_0052
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=2, index2=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0052 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 2, 3);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('hello world');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertUndefined();
      logInfo(`${BUNDLE}SwapNames_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0053
     * @tc.name      DragAndExchange_SwapNames_0053
     * @tc.desc      swapNames(names=["Hello", "hello world"], index1=71, index2=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0053 begin`);
      const actual: string[] = swapNames(['Hello', 'hello world'], 71, 1);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('Hello');
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["Hello", "hello world"],...: actual[71]=${actual[71]}`);
      expect(actual[71]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0054
     * @tc.name      DragAndExchange_SwapNames_0054
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=0) returns ["hello world","Hello"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0054 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 0);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","Hello",""]');
      logInfo(`${BUNDLE}SwapNames_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0055
     * @tc.name      DragAndExchange_SwapNames_0055
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=1) returns ["Hello","hello world"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0055 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 1);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello","hello world",""]');
      logInfo(`${BUNDLE}SwapNames_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0056
     * @tc.name      DragAndExchange_SwapNames_0056
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=2) returns ["","Hello","hello wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0056 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 2);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","Hello","hello world"]');
      logInfo(`${BUNDLE}SwapNames_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0057
     * @tc.name      DragAndExchange_SwapNames_0057
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0057 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, -1);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0058
     * @tc.name      DragAndExchange_SwapNames_0058
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=5) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0058 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 5);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0059
     * @tc.name      DragAndExchange_SwapNames_0059
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=10) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0059 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 10);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0060
     * @tc.name      DragAndExchange_SwapNames_0060
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=3) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0060 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('Hello');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0061
     * @tc.name      DragAndExchange_SwapNames_0061
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=100) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0061 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 100);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0062
     * @tc.name      DragAndExchange_SwapNames_0062
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=15) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0062 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 15);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0063
     * @tc.name      DragAndExchange_SwapNames_0063
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=20) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0063 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 20);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[20]=${actual[20]}`);
      expect(actual[20]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0064
     * @tc.name      DragAndExchange_SwapNames_0064
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=179) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0064 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 179);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[89]=${actual[89]}`);
      expect(actual[89]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[179]=${actual[179]}`);
      expect(actual[179]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0065
     * @tc.name      DragAndExchange_SwapNames_0065
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=0, index2=70) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0065 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 0, 70);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[35]=${actual[35]}`);
      expect(actual[35]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[70]=${actual[70]}`);
      expect(actual[70]).assertEqual('hello world');
      logInfo(`${BUNDLE}SwapNames_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0066
     * @tc.name      DragAndExchange_SwapNames_0066
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=2) returns ["hello world","","Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0066 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 2);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["hello world","","Hello"]');
      logInfo(`${BUNDLE}SwapNames_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0067
     * @tc.name      DragAndExchange_SwapNames_0067
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_SwapNames_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapNames_0067 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, -1);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`${BUNDLE}SwapNames_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0068
     * @tc.name      DragAndExchange_SwapNames_0068
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=5) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0068 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 5);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[2]=${actual[2]}`);
      expect(actual[2]).assertEqual('');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0069
     * @tc.name      DragAndExchange_SwapNames_0069
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=10) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0069 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 10);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[5]=${actual[5]}`);
      expect(actual[5]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[10]=${actual[10]}`);
      expect(actual[10]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0070
     * @tc.name      DragAndExchange_SwapNames_0070
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=3) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0070 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 3);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[3]=${actual[3]}`);
      expect(actual[3]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0071
     * @tc.name      DragAndExchange_SwapNames_0071
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=100) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0071 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 100);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[50]=${actual[50]}`);
      expect(actual[50]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[100]=${actual[100]}`);
      expect(actual[100]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_SWAP_NAMES_0072
     * @tc.name      DragAndExchange_SwapNames_0072
     * @tc.desc      swapNames(names=["hello world", "Hello", ""], index1=1, index2=15) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_SwapNames_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapNames_0072 begin`);
      const actual: string[] = swapNames(['hello world', 'Hello', ''], 1, 15);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('hello world');
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[7]=${actual[7]}`);
      expect(actual[7]).assertUndefined();
      logInfo(`swapNames(names=["hello world", "Hello", ...: actual[15]=${actual[15]}`);
      expect(actual[15]).assertEqual('Hello');
      logInfo(`${BUNDLE}SwapNames_0072 end`);
    });
  });
}
