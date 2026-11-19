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
import { swapTargetOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for swapTargetOf (96 cases). */
export default function swapTargetOfTest(): void {
  describe('SwapTargetOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0001
     * @tc.name      ListBeExchange_SwapTargetOf_0001
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_SwapTargetOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0001 begin`);
      const actual: number = swapTargetOf(0, -1, 0);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0002
     * @tc.name      ListBeExchange_SwapTargetOf_0002
     * @tc.desc      swapTargetOf(index=1, direction=-1, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_SwapTargetOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0002 begin`);
      const actual: number = swapTargetOf(1, -1, 0);
      logInfo(`swapTargetOf(index=1, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwapTargetOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0003
     * @tc.name      ListBeExchange_SwapTargetOf_0003
     * @tc.desc      swapTargetOf(index=-1, direction=-1, length=0) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0003 begin`);
      const actual: number = swapTargetOf(-1, -1, 0);
      logInfo(`swapTargetOf(index=-1, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwapTargetOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0004
     * @tc.name      ListBeExchange_SwapTargetOf_0004
     * @tc.desc      swapTargetOf(index=-2, direction=-1, length=0) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0004 begin`);
      const actual: number = swapTargetOf(-2, -1, 0);
      logInfo(`swapTargetOf(index=-2, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}SwapTargetOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0005
     * @tc.name      ListBeExchange_SwapTargetOf_0005
     * @tc.desc      swapTargetOf(index=-2, direction=-2, length=2) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0005 begin`);
      const actual: number = swapTargetOf(-2, -2, 2);
      logInfo(`swapTargetOf(index=-2, direction=-2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}SwapTargetOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0006
     * @tc.name      ListBeExchange_SwapTargetOf_0006
     * @tc.desc      swapTargetOf(index=2, direction=1, length=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0006 begin`);
      const actual: number = swapTargetOf(2, 1, 100);
      logInfo(`swapTargetOf(index=2, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SwapTargetOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0007
     * @tc.name      ListBeExchange_SwapTargetOf_0007
     * @tc.desc      swapTargetOf(index=2, direction=-1, length=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0007 begin`);
      const actual: number = swapTargetOf(2, -1, 2);
      logInfo(`swapTargetOf(index=2, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0008
     * @tc.name      ListBeExchange_SwapTargetOf_0008
     * @tc.desc      swapTargetOf(index=1, direction=3, length=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0008 begin`);
      const actual: number = swapTargetOf(1, 3, 5);
      logInfo(`swapTargetOf(index=1, direction=3, length=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}SwapTargetOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0009
     * @tc.name      ListBeExchange_SwapTargetOf_0009
     * @tc.desc      swapTargetOf(index=2, direction=0, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0009 begin`);
      const actual: number = swapTargetOf(2, 0, 2);
      logInfo(`swapTargetOf(index=2, direction=0, length=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SwapTargetOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0010
     * @tc.name      ListBeExchange_SwapTargetOf_0010
     * @tc.desc      swapTargetOf(index=20, direction=2, length=100) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0010 begin`);
      const actual: number = swapTargetOf(20, 2, 100);
      logInfo(`swapTargetOf(index=20, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}SwapTargetOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0011
     * @tc.name      ListBeExchange_SwapTargetOf_0011
     * @tc.desc      swapTargetOf(index=2, direction=15, length=100) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0011 begin`);
      const actual: number = swapTargetOf(2, 15, 100);
      logInfo(`swapTargetOf(index=2, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}SwapTargetOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0012
     * @tc.name      ListBeExchange_SwapTargetOf_0012
     * @tc.desc      swapTargetOf(index=0, direction=100, length=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0012 begin`);
      const actual: number = swapTargetOf(0, 100, 100);
      logInfo(`swapTargetOf(index=0, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SwapTargetOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0013
     * @tc.name      ListBeExchange_SwapTargetOf_0013
     * @tc.desc      swapTargetOf(index=10, direction=20, length=100) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0013 begin`);
      const actual: number = swapTargetOf(10, 20, 100);
      logInfo(`swapTargetOf(index=10, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}SwapTargetOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0014
     * @tc.name      ListBeExchange_SwapTargetOf_0014
     * @tc.desc      swapTargetOf(index=3, direction=10, length=15) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0014 begin`);
      const actual: number = swapTargetOf(3, 10, 15);
      logInfo(`swapTargetOf(index=3, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}SwapTargetOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0015
     * @tc.name      ListBeExchange_SwapTargetOf_0015
     * @tc.desc      swapTargetOf(index=0, direction=5, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0015 begin`);
      const actual: number = swapTargetOf(0, 5, 5);
      logInfo(`swapTargetOf(index=0, direction=5, length=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}SwapTargetOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0016
     * @tc.name      ListBeExchange_SwapTargetOf_0016
     * @tc.desc      swapTargetOf(index=20, direction=1, length=100) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0016 begin`);
      const actual: number = swapTargetOf(20, 1, 100);
      logInfo(`swapTargetOf(index=20, direction=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}SwapTargetOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0017
     * @tc.name      ListBeExchange_SwapTargetOf_0017
     * @tc.desc      swapTargetOf(index=0, direction=15, length=100) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0017 begin`);
      const actual: number = swapTargetOf(0, 15, 100);
      logInfo(`swapTargetOf(index=0, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}SwapTargetOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0018
     * @tc.name      ListBeExchange_SwapTargetOf_0018
     * @tc.desc      swapTargetOf(index=3, direction=15, length=100) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0018 begin`);
      const actual: number = swapTargetOf(3, 15, 100);
      logInfo(`swapTargetOf(index=3, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}SwapTargetOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0019
     * @tc.name      ListBeExchange_SwapTargetOf_0019
     * @tc.desc      swapTargetOf(index=10, direction=-1, length=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0019 begin`);
      const actual: number = swapTargetOf(10, -1, 10);
      logInfo(`swapTargetOf(index=10, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}SwapTargetOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0020
     * @tc.name      ListBeExchange_SwapTargetOf_0020
     * @tc.desc      swapTargetOf(index=100, direction=-2, length=100) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0020 begin`);
      const actual: number = swapTargetOf(100, -2, 100);
      logInfo(`swapTargetOf(index=100, direction=-2, len...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}SwapTargetOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0021
     * @tc.name      ListBeExchange_SwapTargetOf_0021
     * @tc.desc      swapTargetOf(index=5, direction=1, length=100) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0021 begin`);
      const actual: number = swapTargetOf(5, 1, 100);
      logInfo(`swapTargetOf(index=5, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}SwapTargetOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0022
     * @tc.name      ListBeExchange_SwapTargetOf_0022
     * @tc.desc      swapTargetOf(index=0, direction=10, length=15) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0022 begin`);
      const actual: number = swapTargetOf(0, 10, 15);
      logInfo(`swapTargetOf(index=0, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}SwapTargetOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0023
     * @tc.name      ListBeExchange_SwapTargetOf_0023
     * @tc.desc      swapTargetOf(index=-1, direction=100, length=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0023 begin`);
      const actual: number = swapTargetOf(-1, 100, 100);
      logInfo(`swapTargetOf(index=-1, direction=100, len...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}SwapTargetOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0024
     * @tc.name      ListBeExchange_SwapTargetOf_0024
     * @tc.desc      swapTargetOf(index=10, direction=-2, length=10) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0024 begin`);
      const actual: number = swapTargetOf(10, -2, 10);
      logInfo(`swapTargetOf(index=10, direction=-2, leng...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}SwapTargetOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0025
     * @tc.name      ListBeExchange_SwapTargetOf_0025
     * @tc.desc      swapTargetOf(index=10, direction=2, length=100) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0025 begin`);
      const actual: number = swapTargetOf(10, 2, 100);
      logInfo(`swapTargetOf(index=10, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}SwapTargetOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0026
     * @tc.name      ListBeExchange_SwapTargetOf_0026
     * @tc.desc      swapTargetOf(index=15, direction=1, length=100) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0026 begin`);
      const actual: number = swapTargetOf(15, 1, 100);
      logInfo(`swapTargetOf(index=15, direction=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}SwapTargetOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0027
     * @tc.name      ListBeExchange_SwapTargetOf_0027
     * @tc.desc      swapTargetOf(index=15, direction=5, length=100) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0027 begin`);
      const actual: number = swapTargetOf(15, 5, 100);
      logInfo(`swapTargetOf(index=15, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}SwapTargetOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0028
     * @tc.name      ListBeExchange_SwapTargetOf_0028
     * @tc.desc      swapTargetOf(index=-1, direction=15, length=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0028 begin`);
      const actual: number = swapTargetOf(-1, 15, 15);
      logInfo(`swapTargetOf(index=-1, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}SwapTargetOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0029
     * @tc.name      ListBeExchange_SwapTargetOf_0029
     * @tc.desc      swapTargetOf(index=5, direction=2, length=15) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0029 begin`);
      const actual: number = swapTargetOf(5, 2, 15);
      logInfo(`swapTargetOf(index=5, direction=2, length...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}SwapTargetOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0030
     * @tc.name      ListBeExchange_SwapTargetOf_0030
     * @tc.desc      swapTargetOf(index=3, direction=20, length=100) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0030 begin`);
      const actual: number = swapTargetOf(3, 20, 100);
      logInfo(`swapTargetOf(index=3, direction=20, lengt...: actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}SwapTargetOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0031
     * @tc.name      ListBeExchange_SwapTargetOf_0031
     * @tc.desc      swapTargetOf(index=2, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0031 begin`);
      const actual: number = swapTargetOf(2, -1, 0);
      logInfo(`swapTargetOf(index=2, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0032
     * @tc.name      ListBeExchange_SwapTargetOf_0032
     * @tc.desc      swapTargetOf(index=5, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0032 begin`);
      const actual: number = swapTargetOf(5, -1, 0);
      logInfo(`swapTargetOf(index=5, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0033
     * @tc.name      ListBeExchange_SwapTargetOf_0033
     * @tc.desc      swapTargetOf(index=10, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0033 begin`);
      const actual: number = swapTargetOf(10, -1, 0);
      logInfo(`swapTargetOf(index=10, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0034
     * @tc.name      ListBeExchange_SwapTargetOf_0034
     * @tc.desc      swapTargetOf(index=3, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0034 begin`);
      const actual: number = swapTargetOf(3, -1, 0);
      logInfo(`swapTargetOf(index=3, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0035
     * @tc.name      ListBeExchange_SwapTargetOf_0035
     * @tc.desc      swapTargetOf(index=100, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0035 begin`);
      const actual: number = swapTargetOf(100, -1, 0);
      logInfo(`swapTargetOf(index=100, direction=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0036
     * @tc.name      ListBeExchange_SwapTargetOf_0036
     * @tc.desc      swapTargetOf(index=15, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0036 begin`);
      const actual: number = swapTargetOf(15, -1, 0);
      logInfo(`swapTargetOf(index=15, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0037
     * @tc.name      ListBeExchange_SwapTargetOf_0037
     * @tc.desc      swapTargetOf(index=20, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0037 begin`);
      const actual: number = swapTargetOf(20, -1, 0);
      logInfo(`swapTargetOf(index=20, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0038
     * @tc.name      ListBeExchange_SwapTargetOf_0038
     * @tc.desc      swapTargetOf(index=115, direction=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0038 begin`);
      const actual: number = swapTargetOf(115, -1, 0);
      logInfo(`swapTargetOf(index=115, direction=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0039
     * @tc.name      ListBeExchange_SwapTargetOf_0039
     * @tc.desc      swapTargetOf(index=0, direction=-2, length=0) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0039 begin`);
      const actual: number = swapTargetOf(0, -2, 0);
      logInfo(`swapTargetOf(index=0, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwapTargetOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0040
     * @tc.name      ListBeExchange_SwapTargetOf_0040
     * @tc.desc      swapTargetOf(index=0, direction=0, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0040 begin`);
      const actual: number = swapTargetOf(0, 0, 0);
      logInfo(`swapTargetOf(index=0, direction=0, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwapTargetOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0041
     * @tc.name      ListBeExchange_SwapTargetOf_0041
     * @tc.desc      swapTargetOf(index=0, direction=1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0041 begin`);
      const actual: number = swapTargetOf(0, 1, 0);
      logInfo(`swapTargetOf(index=0, direction=1, length=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0042
     * @tc.name      ListBeExchange_SwapTargetOf_0042
     * @tc.desc      swapTargetOf(index=0, direction=2, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0042 begin`);
      const actual: number = swapTargetOf(0, 2, 0);
      logInfo(`swapTargetOf(index=0, direction=2, length=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0043
     * @tc.name      ListBeExchange_SwapTargetOf_0043
     * @tc.desc      swapTargetOf(index=0, direction=3, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0043 begin`);
      const actual: number = swapTargetOf(0, 3, 0);
      logInfo(`swapTargetOf(index=0, direction=3, length=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0044
     * @tc.name      ListBeExchange_SwapTargetOf_0044
     * @tc.desc      swapTargetOf(index=0, direction=10, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0044 begin`);
      const actual: number = swapTargetOf(0, 10, 0);
      logInfo(`swapTargetOf(index=0, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0045
     * @tc.name      ListBeExchange_SwapTargetOf_0045
     * @tc.desc      swapTargetOf(index=0, direction=100, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0045 begin`);
      const actual: number = swapTargetOf(0, 100, 0);
      logInfo(`swapTargetOf(index=0, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0046
     * @tc.name      ListBeExchange_SwapTargetOf_0046
     * @tc.desc      swapTargetOf(index=0, direction=5, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0046 begin`);
      const actual: number = swapTargetOf(0, 5, 0);
      logInfo(`swapTargetOf(index=0, direction=5, length=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0047
     * @tc.name      ListBeExchange_SwapTargetOf_0047
     * @tc.desc      swapTargetOf(index=0, direction=15, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0047 begin`);
      const actual: number = swapTargetOf(0, 15, 0);
      logInfo(`swapTargetOf(index=0, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0048
     * @tc.name      ListBeExchange_SwapTargetOf_0048
     * @tc.desc      swapTargetOf(index=0, direction=20, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0048 begin`);
      const actual: number = swapTargetOf(0, 20, 0);
      logInfo(`swapTargetOf(index=0, direction=20, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0049
     * @tc.name      ListBeExchange_SwapTargetOf_0049
     * @tc.desc      swapTargetOf(index=0, direction=120, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0049 begin`);
      const actual: number = swapTargetOf(0, 120, 0);
      logInfo(`swapTargetOf(index=0, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0050
     * @tc.name      ListBeExchange_SwapTargetOf_0050
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0050 begin`);
      const actual: number = swapTargetOf(0, -1, 1);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0051
     * @tc.name      ListBeExchange_SwapTargetOf_0051
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0051 begin`);
      const actual: number = swapTargetOf(0, -1, -1);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0052
     * @tc.name      ListBeExchange_SwapTargetOf_0052
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0052 begin`);
      const actual: number = swapTargetOf(0, -1, -2);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0053
     * @tc.name      ListBeExchange_SwapTargetOf_0053
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0053 begin`);
      const actual: number = swapTargetOf(0, -1, 2);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0054
     * @tc.name      ListBeExchange_SwapTargetOf_0054
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0054 begin`);
      const actual: number = swapTargetOf(0, -1, 5);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0055
     * @tc.name      ListBeExchange_SwapTargetOf_0055
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0055 begin`);
      const actual: number = swapTargetOf(0, -1, 10);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0056
     * @tc.name      ListBeExchange_SwapTargetOf_0056
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0056 begin`);
      const actual: number = swapTargetOf(0, -1, 100);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0057
     * @tc.name      ListBeExchange_SwapTargetOf_0057
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0057 begin`);
      const actual: number = swapTargetOf(0, -1, 3);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0058
     * @tc.name      ListBeExchange_SwapTargetOf_0058
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0058 begin`);
      const actual: number = swapTargetOf(0, -1, 15);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0059
     * @tc.name      ListBeExchange_SwapTargetOf_0059
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0059 begin`);
      const actual: number = swapTargetOf(0, -1, -35);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0060
     * @tc.name      ListBeExchange_SwapTargetOf_0060
     * @tc.desc      swapTargetOf(index=0, direction=-1, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0060 begin`);
      const actual: number = swapTargetOf(0, -1, -57);
      logInfo(`swapTargetOf(index=0, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0061
     * @tc.name      ListBeExchange_SwapTargetOf_0061
     * @tc.desc      swapTargetOf(index=15, direction=120, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0061 begin`);
      const actual: number = swapTargetOf(15, 120, -35);
      logInfo(`swapTargetOf(index=15, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0062
     * @tc.name      ListBeExchange_SwapTargetOf_0062
     * @tc.desc      swapTargetOf(index=20, direction=0, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0062 begin`);
      const actual: number = swapTargetOf(20, 0, 3);
      logInfo(`swapTargetOf(index=20, direction=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0063
     * @tc.name      ListBeExchange_SwapTargetOf_0063
     * @tc.desc      swapTargetOf(index=-2, direction=120, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0063 begin`);
      const actual: number = swapTargetOf(-2, 120, 0);
      logInfo(`swapTargetOf(index=-2, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0064
     * @tc.name      ListBeExchange_SwapTargetOf_0064
     * @tc.desc      swapTargetOf(index=-1, direction=15, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0064 begin`);
      const actual: number = swapTargetOf(-1, 15, -1);
      logInfo(`swapTargetOf(index=-1, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0065
     * @tc.name      ListBeExchange_SwapTargetOf_0065
     * @tc.desc      swapTargetOf(index=10, direction=120, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0065 begin`);
      const actual: number = swapTargetOf(10, 120, 1);
      logInfo(`swapTargetOf(index=10, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0066
     * @tc.name      ListBeExchange_SwapTargetOf_0066
     * @tc.desc      swapTargetOf(index=-1, direction=-1, length=10) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0066 begin`);
      const actual: number = swapTargetOf(-1, -1, 10);
      logInfo(`swapTargetOf(index=-1, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwapTargetOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0067
     * @tc.name      ListBeExchange_SwapTargetOf_0067
     * @tc.desc      swapTargetOf(index=3, direction=0, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0067 begin`);
      const actual: number = swapTargetOf(3, 0, 2);
      logInfo(`swapTargetOf(index=3, direction=0, length=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0068
     * @tc.name      ListBeExchange_SwapTargetOf_0068
     * @tc.desc      swapTargetOf(index=2, direction=-2, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0068 begin`);
      const actual: number = swapTargetOf(2, -2, 3);
      logInfo(`swapTargetOf(index=2, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwapTargetOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0069
     * @tc.name      ListBeExchange_SwapTargetOf_0069
     * @tc.desc      swapTargetOf(index=20, direction=15, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0069 begin`);
      const actual: number = swapTargetOf(20, 15, -35);
      logInfo(`swapTargetOf(index=20, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0070
     * @tc.name      ListBeExchange_SwapTargetOf_0070
     * @tc.desc      swapTargetOf(index=2, direction=120, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0070 begin`);
      const actual: number = swapTargetOf(2, 120, 5);
      logInfo(`swapTargetOf(index=2, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0071
     * @tc.name      ListBeExchange_SwapTargetOf_0071
     * @tc.desc      swapTargetOf(index=20, direction=100, length=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0071 begin`);
      const actual: number = swapTargetOf(20, 100, 100);
      logInfo(`swapTargetOf(index=20, direction=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0072
     * @tc.name      ListBeExchange_SwapTargetOf_0072
     * @tc.desc      swapTargetOf(index=5, direction=-2, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0072 begin`);
      const actual: number = swapTargetOf(5, -2, -2);
      logInfo(`swapTargetOf(index=5, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0073
     * @tc.name      ListBeExchange_SwapTargetOf_0073
     * @tc.desc      swapTargetOf(index=1, direction=15, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0073 begin`);
      const actual: number = swapTargetOf(1, 15, -35);
      logInfo(`swapTargetOf(index=1, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0074
     * @tc.name      ListBeExchange_SwapTargetOf_0074
     * @tc.desc      swapTargetOf(index=-1, direction=1, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0074 begin`);
      const actual: number = swapTargetOf(-1, 1, 1);
      logInfo(`swapTargetOf(index=-1, direction=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwapTargetOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0075
     * @tc.name      ListBeExchange_SwapTargetOf_0075
     * @tc.desc      swapTargetOf(index=0, direction=120, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0075 begin`);
      const actual: number = swapTargetOf(0, 120, 10);
      logInfo(`swapTargetOf(index=0, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0076
     * @tc.name      ListBeExchange_SwapTargetOf_0076
     * @tc.desc      swapTargetOf(index=15, direction=20, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0076 begin`);
      const actual: number = swapTargetOf(15, 20, -35);
      logInfo(`swapTargetOf(index=15, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0077
     * @tc.name      ListBeExchange_SwapTargetOf_0077
     * @tc.desc      swapTargetOf(index=100, direction=3, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0077 begin`);
      const actual: number = swapTargetOf(100, 3, 2);
      logInfo(`swapTargetOf(index=100, direction=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0078
     * @tc.name      ListBeExchange_SwapTargetOf_0078
     * @tc.desc      swapTargetOf(index=1, direction=120, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0078 begin`);
      const actual: number = swapTargetOf(1, 120, -35);
      logInfo(`swapTargetOf(index=1, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0079
     * @tc.name      ListBeExchange_SwapTargetOf_0079
     * @tc.desc      swapTargetOf(index=5, direction=3, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0079 begin`);
      const actual: number = swapTargetOf(5, 3, -57);
      logInfo(`swapTargetOf(index=5, direction=3, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0080
     * @tc.name      ListBeExchange_SwapTargetOf_0080
     * @tc.desc      swapTargetOf(index=-2, direction=120, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0080 begin`);
      const actual: number = swapTargetOf(-2, 120, 1);
      logInfo(`swapTargetOf(index=-2, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0081
     * @tc.name      ListBeExchange_SwapTargetOf_0081
     * @tc.desc      swapTargetOf(index=3, direction=5, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0081 begin`);
      const actual: number = swapTargetOf(3, 5, 5);
      logInfo(`swapTargetOf(index=3, direction=5, length=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0082
     * @tc.name      ListBeExchange_SwapTargetOf_0082
     * @tc.desc      swapTargetOf(index=-1, direction=0, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0082 begin`);
      const actual: number = swapTargetOf(-1, 0, -2);
      logInfo(`swapTargetOf(index=-1, direction=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0083
     * @tc.name      ListBeExchange_SwapTargetOf_0083
     * @tc.desc      swapTargetOf(index=100, direction=15, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0083 begin`);
      const actual: number = swapTargetOf(100, 15, 0);
      logInfo(`swapTargetOf(index=100, direction=15, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0084
     * @tc.name      ListBeExchange_SwapTargetOf_0084
     * @tc.desc      swapTargetOf(index=1, direction=5, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0084 begin`);
      const actual: number = swapTargetOf(1, 5, -35);
      logInfo(`swapTargetOf(index=1, direction=5, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0085
     * @tc.name      ListBeExchange_SwapTargetOf_0085
     * @tc.desc      swapTargetOf(index=0, direction=10, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0085 begin`);
      const actual: number = swapTargetOf(0, 10, -2);
      logInfo(`swapTargetOf(index=0, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0086
     * @tc.name      ListBeExchange_SwapTargetOf_0086
     * @tc.desc      swapTargetOf(index=20, direction=5, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0086 begin`);
      const actual: number = swapTargetOf(20, 5, 5);
      logInfo(`swapTargetOf(index=20, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0087
     * @tc.name      ListBeExchange_SwapTargetOf_0087
     * @tc.desc      swapTargetOf(index=5, direction=120, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0087 begin`);
      const actual: number = swapTargetOf(5, 120, -1);
      logInfo(`swapTargetOf(index=5, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0088
     * @tc.name      ListBeExchange_SwapTargetOf_0088
     * @tc.desc      swapTargetOf(index=-1, direction=3, length=15) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0088 begin`);
      const actual: number = swapTargetOf(-1, 3, 15);
      logInfo(`swapTargetOf(index=-1, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SwapTargetOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0089
     * @tc.name      ListBeExchange_SwapTargetOf_0089
     * @tc.desc      swapTargetOf(index=20, direction=100, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0089 begin`);
      const actual: number = swapTargetOf(20, 100, -2);
      logInfo(`swapTargetOf(index=20, direction=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0090
     * @tc.name      ListBeExchange_SwapTargetOf_0090
     * @tc.desc      swapTargetOf(index=115, direction=120, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0090 begin`);
      const actual: number = swapTargetOf(115, 120, 15);
      logInfo(`swapTargetOf(index=115, direction=120, le...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0091
     * @tc.name      ListBeExchange_SwapTargetOf_0091
     * @tc.desc      swapTargetOf(index=5, direction=1, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0091 begin`);
      const actual: number = swapTargetOf(5, 1, 2);
      logInfo(`swapTargetOf(index=5, direction=1, length=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0092
     * @tc.name      ListBeExchange_SwapTargetOf_0092
     * @tc.desc      swapTargetOf(index=-2, direction=0, length=0) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0092 begin`);
      const actual: number = swapTargetOf(-2, 0, 0);
      logInfo(`swapTargetOf(index=-2, direction=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwapTargetOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0093
     * @tc.name      ListBeExchange_SwapTargetOf_0093
     * @tc.desc      swapTargetOf(index=1, direction=100, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0093 begin`);
      const actual: number = swapTargetOf(1, 100, -57);
      logInfo(`swapTargetOf(index=1, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0094
     * @tc.name      ListBeExchange_SwapTargetOf_0094
     * @tc.desc      swapTargetOf(index=100, direction=-2, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0094 begin`);
      const actual: number = swapTargetOf(100, -2, -57);
      logInfo(`swapTargetOf(index=100, direction=-2, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0095
     * @tc.name      ListBeExchange_SwapTargetOf_0095
     * @tc.desc      swapTargetOf(index=115, direction=100, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0095 begin`);
      const actual: number = swapTargetOf(115, 100, 1);
      logInfo(`swapTargetOf(index=115, direction=100, le...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0096
     * @tc.name      ListBeExchange_SwapTargetOf_0096
     * @tc.desc      swapTargetOf(index=15, direction=10, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0096 begin`);
      const actual: number = swapTargetOf(15, 10, 0);
      logInfo(`swapTargetOf(index=15, direction=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0096 end`);
    });
  });
}
