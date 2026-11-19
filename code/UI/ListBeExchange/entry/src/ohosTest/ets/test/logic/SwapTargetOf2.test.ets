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
export default function swapTargetOf2Test(): void {
  describe('SwapTargetOf2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0097
     * @tc.name      ListBeExchange_SwapTargetOf_0097
     * @tc.desc      swapTargetOf(index=20, direction=-2, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0097 begin`);
      const actual: number = swapTargetOf(20, -2, -57);
      logInfo(`swapTargetOf(index=20, direction=-2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0098
     * @tc.name      ListBeExchange_SwapTargetOf_0098
     * @tc.desc      swapTargetOf(index=100, direction=1, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0098 begin`);
      const actual: number = swapTargetOf(100, 1, 2);
      logInfo(`swapTargetOf(index=100, direction=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0099
     * @tc.name      ListBeExchange_SwapTargetOf_0099
     * @tc.desc      swapTargetOf(index=2, direction=120, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0099 begin`);
      const actual: number = swapTargetOf(2, 120, 1);
      logInfo(`swapTargetOf(index=2, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0100
     * @tc.name      ListBeExchange_SwapTargetOf_0100
     * @tc.desc      swapTargetOf(index=15, direction=100, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0100 begin`);
      const actual: number = swapTargetOf(15, 100, -35);
      logInfo(`swapTargetOf(index=15, direction=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0101
     * @tc.name      ListBeExchange_SwapTargetOf_0101
     * @tc.desc      swapTargetOf(index=3, direction=1, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0101 begin`);
      const actual: number = swapTargetOf(3, 1, -1);
      logInfo(`swapTargetOf(index=3, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0102
     * @tc.name      ListBeExchange_SwapTargetOf_0102
     * @tc.desc      swapTargetOf(index=-2, direction=15, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0102 begin`);
      const actual: number = swapTargetOf(-2, 15, 1);
      logInfo(`swapTargetOf(index=-2, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0103
     * @tc.name      ListBeExchange_SwapTargetOf_0103
     * @tc.desc      swapTargetOf(index=3, direction=-1, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0103 begin`);
      const actual: number = swapTargetOf(3, -1, -35);
      logInfo(`swapTargetOf(index=3, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0104
     * @tc.name      ListBeExchange_SwapTargetOf_0104
     * @tc.desc      swapTargetOf(index=10, direction=1, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0104 begin`);
      const actual: number = swapTargetOf(10, 1, -2);
      logInfo(`swapTargetOf(index=10, direction=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0105
     * @tc.name      ListBeExchange_SwapTargetOf_0105
     * @tc.desc      swapTargetOf(index=15, direction=-1, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0105 begin`);
      const actual: number = swapTargetOf(15, -1, -2);
      logInfo(`swapTargetOf(index=15, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0106
     * @tc.name      ListBeExchange_SwapTargetOf_0106
     * @tc.desc      swapTargetOf(index=20, direction=15, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0106 begin`);
      const actual: number = swapTargetOf(20, 15, -1);
      logInfo(`swapTargetOf(index=20, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0107
     * @tc.name      ListBeExchange_SwapTargetOf_0107
     * @tc.desc      swapTargetOf(index=0, direction=-2, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0107 begin`);
      const actual: number = swapTargetOf(0, -2, -57);
      logInfo(`swapTargetOf(index=0, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0108
     * @tc.name      ListBeExchange_SwapTargetOf_0108
     * @tc.desc      swapTargetOf(index=100, direction=0, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0108 begin`);
      const actual: number = swapTargetOf(100, 0, 10);
      logInfo(`swapTargetOf(index=100, direction=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0109
     * @tc.name      ListBeExchange_SwapTargetOf_0109
     * @tc.desc      swapTargetOf(index=2, direction=-1, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0109 begin`);
      const actual: number = swapTargetOf(2, -1, 1);
      logInfo(`swapTargetOf(index=2, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0110
     * @tc.name      ListBeExchange_SwapTargetOf_0110
     * @tc.desc      swapTargetOf(index=-2, direction=15, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0110 begin`);
      const actual: number = swapTargetOf(-2, 15, 3);
      logInfo(`swapTargetOf(index=-2, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0111
     * @tc.name      ListBeExchange_SwapTargetOf_0111
     * @tc.desc      swapTargetOf(index=0, direction=3, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0111 begin`);
      const actual: number = swapTargetOf(0, 3, -35);
      logInfo(`swapTargetOf(index=0, direction=3, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0112
     * @tc.name      ListBeExchange_SwapTargetOf_0112
     * @tc.desc      swapTargetOf(index=5, direction=15, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0112 begin`);
      const actual: number = swapTargetOf(5, 15, 0);
      logInfo(`swapTargetOf(index=5, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0113
     * @tc.name      ListBeExchange_SwapTargetOf_0113
     * @tc.desc      swapTargetOf(index=115, direction=5, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0113 begin`);
      const actual: number = swapTargetOf(115, 5, 10);
      logInfo(`swapTargetOf(index=115, direction=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0114
     * @tc.name      ListBeExchange_SwapTargetOf_0114
     * @tc.desc      swapTargetOf(index=115, direction=5, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0114 begin`);
      const actual: number = swapTargetOf(115, 5, -57);
      logInfo(`swapTargetOf(index=115, direction=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0115
     * @tc.name      ListBeExchange_SwapTargetOf_0115
     * @tc.desc      swapTargetOf(index=1, direction=15, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0115 begin`);
      const actual: number = swapTargetOf(1, 15, 5);
      logInfo(`swapTargetOf(index=1, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0116
     * @tc.name      ListBeExchange_SwapTargetOf_0116
     * @tc.desc      swapTargetOf(index=1, direction=1, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0116 begin`);
      const actual: number = swapTargetOf(1, 1, 2);
      logInfo(`swapTargetOf(index=1, direction=1, length=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SwapTargetOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0117
     * @tc.name      ListBeExchange_SwapTargetOf_0117
     * @tc.desc      swapTargetOf(index=3, direction=3, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0117 begin`);
      const actual: number = swapTargetOf(3, 3, 3);
      logInfo(`swapTargetOf(index=3, direction=3, length=3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0118
     * @tc.name      ListBeExchange_SwapTargetOf_0118
     * @tc.desc      swapTargetOf(index=115, direction=3, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0118 begin`);
      const actual: number = swapTargetOf(115, 3, -57);
      logInfo(`swapTargetOf(index=115, direction=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0119
     * @tc.name      ListBeExchange_SwapTargetOf_0119
     * @tc.desc      swapTargetOf(index=5, direction=-1, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0119 begin`);
      const actual: number = swapTargetOf(5, -1, 1);
      logInfo(`swapTargetOf(index=5, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0120
     * @tc.name      ListBeExchange_SwapTargetOf_0120
     * @tc.desc      swapTargetOf(index=3, direction=-2, length=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0120 begin`);
      const actual: number = swapTargetOf(3, -2, 2);
      logInfo(`swapTargetOf(index=3, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0120 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0121
     * @tc.name      ListBeExchange_SwapTargetOf_0121
     * @tc.desc      swapTargetOf(index=2, direction=-2, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0121 begin`);
      const actual: number = swapTargetOf(2, -2, 10);
      logInfo(`swapTargetOf(index=2, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwapTargetOf_0121 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0122
     * @tc.name      ListBeExchange_SwapTargetOf_0122
     * @tc.desc      swapTargetOf(index=3, direction=10, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0122 begin`);
      const actual: number = swapTargetOf(3, 10, 10);
      logInfo(`swapTargetOf(index=3, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0122 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0123
     * @tc.name      ListBeExchange_SwapTargetOf_0123
     * @tc.desc      swapTargetOf(index=5, direction=2, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0123 begin`);
      const actual: number = swapTargetOf(5, 2, 5);
      logInfo(`swapTargetOf(index=5, direction=2, length=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0123 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0124
     * @tc.name      ListBeExchange_SwapTargetOf_0124
     * @tc.desc      swapTargetOf(index=-2, direction=-2, length=5) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0124 begin`);
      const actual: number = swapTargetOf(-2, -2, 5);
      logInfo(`swapTargetOf(index=-2, direction=-2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}SwapTargetOf_0124 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0125
     * @tc.name      ListBeExchange_SwapTargetOf_0125
     * @tc.desc      swapTargetOf(index=-1, direction=20, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0125 begin`);
      const actual: number = swapTargetOf(-1, 20, 2);
      logInfo(`swapTargetOf(index=-1, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0125 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0126
     * @tc.name      ListBeExchange_SwapTargetOf_0126
     * @tc.desc      swapTargetOf(index=-2, direction=-1, length=15) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0126 begin`);
      const actual: number = swapTargetOf(-2, -1, 15);
      logInfo(`swapTargetOf(index=-2, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}SwapTargetOf_0126 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0127
     * @tc.name      ListBeExchange_SwapTargetOf_0127
     * @tc.desc      swapTargetOf(index=1, direction=15, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0127 begin`);
      const actual: number = swapTargetOf(1, 15, 10);
      logInfo(`swapTargetOf(index=1, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0127 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0128
     * @tc.name      ListBeExchange_SwapTargetOf_0128
     * @tc.desc      swapTargetOf(index=20, direction=20, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0128 begin`);
      const actual: number = swapTargetOf(20, 20, 5);
      logInfo(`swapTargetOf(index=20, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0128 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0129
     * @tc.name      ListBeExchange_SwapTargetOf_0129
     * @tc.desc      swapTargetOf(index=20, direction=120, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0129 begin`);
      const actual: number = swapTargetOf(20, 120, -2);
      logInfo(`swapTargetOf(index=20, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0129 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0130
     * @tc.name      ListBeExchange_SwapTargetOf_0130
     * @tc.desc      swapTargetOf(index=1, direction=0, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0130 begin`);
      const actual: number = swapTargetOf(1, 0, -1);
      logInfo(`swapTargetOf(index=1, direction=0, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0130 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0131
     * @tc.name      ListBeExchange_SwapTargetOf_0131
     * @tc.desc      swapTargetOf(index=2, direction=1, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0131 begin`);
      const actual: number = swapTargetOf(2, 1, -35);
      logInfo(`swapTargetOf(index=2, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0131 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0132
     * @tc.name      ListBeExchange_SwapTargetOf_0132
     * @tc.desc      swapTargetOf(index=20, direction=20, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0132 begin`);
      const actual: number = swapTargetOf(20, 20, -2);
      logInfo(`swapTargetOf(index=20, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0132 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0133
     * @tc.name      ListBeExchange_SwapTargetOf_0133
     * @tc.desc      swapTargetOf(index=20, direction=100, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0133 begin`);
      const actual: number = swapTargetOf(20, 100, 10);
      logInfo(`swapTargetOf(index=20, direction=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0133 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0134
     * @tc.name      ListBeExchange_SwapTargetOf_0134
     * @tc.desc      swapTargetOf(index=1, direction=0, length=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0134 begin`);
      const actual: number = swapTargetOf(1, 0, 2);
      logInfo(`swapTargetOf(index=1, direction=0, length=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0134 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0135
     * @tc.name      ListBeExchange_SwapTargetOf_0135
     * @tc.desc      swapTargetOf(index=15, direction=5, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0135 begin`);
      const actual: number = swapTargetOf(15, 5, 15);
      logInfo(`swapTargetOf(index=15, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0135 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0136
     * @tc.name      ListBeExchange_SwapTargetOf_0136
     * @tc.desc      swapTargetOf(index=10, direction=15, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0136 begin`);
      const actual: number = swapTargetOf(10, 15, 5);
      logInfo(`swapTargetOf(index=10, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0136 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0137
     * @tc.name      ListBeExchange_SwapTargetOf_0137
     * @tc.desc      swapTargetOf(index=-2, direction=5, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0137 begin`);
      const actual: number = swapTargetOf(-2, 5, -2);
      logInfo(`swapTargetOf(index=-2, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0137 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0138
     * @tc.name      ListBeExchange_SwapTargetOf_0138
     * @tc.desc      swapTargetOf(index=10, direction=15, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0138 begin`);
      const actual: number = swapTargetOf(10, 15, 15);
      logInfo(`swapTargetOf(index=10, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0138 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0139
     * @tc.name      ListBeExchange_SwapTargetOf_0139
     * @tc.desc      swapTargetOf(index=1, direction=15, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0139 begin`);
      const actual: number = swapTargetOf(1, 15, 3);
      logInfo(`swapTargetOf(index=1, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0139 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0140
     * @tc.name      ListBeExchange_SwapTargetOf_0140
     * @tc.desc      swapTargetOf(index=20, direction=-2, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0140 begin`);
      const actual: number = swapTargetOf(20, -2, 10);
      logInfo(`swapTargetOf(index=20, direction=-2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0140 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0141
     * @tc.name      ListBeExchange_SwapTargetOf_0141
     * @tc.desc      swapTargetOf(index=20, direction=-2, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0141 begin`);
      const actual: number = swapTargetOf(20, -2, 1);
      logInfo(`swapTargetOf(index=20, direction=-2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0141 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0142
     * @tc.name      ListBeExchange_SwapTargetOf_0142
     * @tc.desc      swapTargetOf(index=0, direction=20, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0142 begin`);
      const actual: number = swapTargetOf(0, 20, 1);
      logInfo(`swapTargetOf(index=0, direction=20, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0142 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0143
     * @tc.name      ListBeExchange_SwapTargetOf_0143
     * @tc.desc      swapTargetOf(index=-2, direction=3, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0143 begin`);
      const actual: number = swapTargetOf(-2, 3, 1);
      logInfo(`swapTargetOf(index=-2, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0143 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0144
     * @tc.name      ListBeExchange_SwapTargetOf_0144
     * @tc.desc      swapTargetOf(index=3, direction=100, length=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0144 begin`);
      const actual: number = swapTargetOf(3, 100, 100);
      logInfo(`swapTargetOf(index=3, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0144 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0145
     * @tc.name      ListBeExchange_SwapTargetOf_0145
     * @tc.desc      swapTargetOf(index=115, direction=1, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0145 begin`);
      const actual: number = swapTargetOf(115, 1, 5);
      logInfo(`swapTargetOf(index=115, direction=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0145 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0146
     * @tc.name      ListBeExchange_SwapTargetOf_0146
     * @tc.desc      swapTargetOf(index=115, direction=5, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0146 begin`);
      const actual: number = swapTargetOf(115, 5, 0);
      logInfo(`swapTargetOf(index=115, direction=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0146 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0147
     * @tc.name      ListBeExchange_SwapTargetOf_0147
     * @tc.desc      swapTargetOf(index=-2, direction=3, length=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0147 begin`);
      const actual: number = swapTargetOf(-2, 3, 15);
      logInfo(`swapTargetOf(index=-2, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0147 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0148
     * @tc.name      ListBeExchange_SwapTargetOf_0148
     * @tc.desc      swapTargetOf(index=0, direction=20, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0148 begin`);
      const actual: number = swapTargetOf(0, 20, 5);
      logInfo(`swapTargetOf(index=0, direction=20, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0148 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0149
     * @tc.name      ListBeExchange_SwapTargetOf_0149
     * @tc.desc      swapTargetOf(index=10, direction=-1, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0149 begin`);
      const actual: number = swapTargetOf(10, -1, 3);
      logInfo(`swapTargetOf(index=10, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0149 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0150
     * @tc.name      ListBeExchange_SwapTargetOf_0150
     * @tc.desc      swapTargetOf(index=5, direction=3, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0150 begin`);
      const actual: number = swapTargetOf(5, 3, 1);
      logInfo(`swapTargetOf(index=5, direction=3, length=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0150 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0151
     * @tc.name      ListBeExchange_SwapTargetOf_0151
     * @tc.desc      swapTargetOf(index=100, direction=1, length=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0151 begin`);
      const actual: number = swapTargetOf(100, 1, 100);
      logInfo(`swapTargetOf(index=100, direction=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0151 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0152
     * @tc.name      ListBeExchange_SwapTargetOf_0152
     * @tc.desc      swapTargetOf(index=3, direction=1, length=15) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0152 begin`);
      const actual: number = swapTargetOf(3, 1, 15);
      logInfo(`swapTargetOf(index=3, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}SwapTargetOf_0152 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0153
     * @tc.name      ListBeExchange_SwapTargetOf_0153
     * @tc.desc      swapTargetOf(index=20, direction=5, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0153 begin`);
      const actual: number = swapTargetOf(20, 5, 3);
      logInfo(`swapTargetOf(index=20, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0153 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0154
     * @tc.name      ListBeExchange_SwapTargetOf_0154
     * @tc.desc      swapTargetOf(index=2, direction=5, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0154 begin`);
      const actual: number = swapTargetOf(2, 5, 2);
      logInfo(`swapTargetOf(index=2, direction=5, length=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0154 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0155
     * @tc.name      ListBeExchange_SwapTargetOf_0155
     * @tc.desc      swapTargetOf(index=100, direction=15, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0155 begin`);
      const actual: number = swapTargetOf(100, 15, 10);
      logInfo(`swapTargetOf(index=100, direction=15, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0155 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0156
     * @tc.name      ListBeExchange_SwapTargetOf_0156
     * @tc.desc      swapTargetOf(index=15, direction=5, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0156 begin`);
      const actual: number = swapTargetOf(15, 5, 5);
      logInfo(`swapTargetOf(index=15, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0156 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0157
     * @tc.name      ListBeExchange_SwapTargetOf_0157
     * @tc.desc      swapTargetOf(index=-1, direction=100, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0157 begin`);
      const actual: number = swapTargetOf(-1, 100, 2);
      logInfo(`swapTargetOf(index=-1, direction=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0157 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0158
     * @tc.name      ListBeExchange_SwapTargetOf_0158
     * @tc.desc      swapTargetOf(index=1, direction=-1, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0158 begin`);
      const actual: number = swapTargetOf(1, -1, 5);
      logInfo(`swapTargetOf(index=1, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwapTargetOf_0158 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0159
     * @tc.name      ListBeExchange_SwapTargetOf_0159
     * @tc.desc      swapTargetOf(index=-1, direction=120, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0159 begin`);
      const actual: number = swapTargetOf(-1, 120, -2);
      logInfo(`swapTargetOf(index=-1, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0159 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0160
     * @tc.name      ListBeExchange_SwapTargetOf_0160
     * @tc.desc      swapTargetOf(index=1, direction=-2, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0160 begin`);
      const actual: number = swapTargetOf(1, -2, -1);
      logInfo(`swapTargetOf(index=1, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0160 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0161
     * @tc.name      ListBeExchange_SwapTargetOf_0161
     * @tc.desc      swapTargetOf(index=-1, direction=120, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0161 begin`);
      const actual: number = swapTargetOf(-1, 120, -35);
      logInfo(`swapTargetOf(index=-1, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0161 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0162
     * @tc.name      ListBeExchange_SwapTargetOf_0162
     * @tc.desc      swapTargetOf(index=20, direction=5, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0162 begin`);
      const actual: number = swapTargetOf(20, 5, -1);
      logInfo(`swapTargetOf(index=20, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0162 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0163
     * @tc.name      ListBeExchange_SwapTargetOf_0163
     * @tc.desc      swapTargetOf(index=0, direction=15, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0163 begin`);
      const actual: number = swapTargetOf(0, 15, -2);
      logInfo(`swapTargetOf(index=0, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0163 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0164
     * @tc.name      ListBeExchange_SwapTargetOf_0164
     * @tc.desc      swapTargetOf(index=100, direction=1, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0164 begin`);
      const actual: number = swapTargetOf(100, 1, 3);
      logInfo(`swapTargetOf(index=100, direction=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0164 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0165
     * @tc.name      ListBeExchange_SwapTargetOf_0165
     * @tc.desc      swapTargetOf(index=10, direction=3, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0165 begin`);
      const actual: number = swapTargetOf(10, 3, 2);
      logInfo(`swapTargetOf(index=10, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0165 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0166
     * @tc.name      ListBeExchange_SwapTargetOf_0166
     * @tc.desc      swapTargetOf(index=100, direction=3, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0166 begin`);
      const actual: number = swapTargetOf(100, 3, 15);
      logInfo(`swapTargetOf(index=100, direction=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0166 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0167
     * @tc.name      ListBeExchange_SwapTargetOf_0167
     * @tc.desc      swapTargetOf(index=3, direction=15, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0167 begin`);
      const actual: number = swapTargetOf(3, 15, -1);
      logInfo(`swapTargetOf(index=3, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0167 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0168
     * @tc.name      ListBeExchange_SwapTargetOf_0168
     * @tc.desc      swapTargetOf(index=100, direction=20, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0168 begin`);
      const actual: number = swapTargetOf(100, 20, 3);
      logInfo(`swapTargetOf(index=100, direction=20, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0168 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0169
     * @tc.name      ListBeExchange_SwapTargetOf_0169
     * @tc.desc      swapTargetOf(index=1, direction=10, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0169 begin`);
      const actual: number = swapTargetOf(1, 10, -1);
      logInfo(`swapTargetOf(index=1, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0169 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0170
     * @tc.name      ListBeExchange_SwapTargetOf_0170
     * @tc.desc      swapTargetOf(index=0, direction=15, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0170 begin`);
      const actual: number = swapTargetOf(0, 15, 3);
      logInfo(`swapTargetOf(index=0, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0170 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0171
     * @tc.name      ListBeExchange_SwapTargetOf_0171
     * @tc.desc      swapTargetOf(index=2, direction=15, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0171 begin`);
      const actual: number = swapTargetOf(2, 15, 1);
      logInfo(`swapTargetOf(index=2, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0171 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0172
     * @tc.name      ListBeExchange_SwapTargetOf_0172
     * @tc.desc      swapTargetOf(index=2, direction=-1, length=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0172 begin`);
      const actual: number = swapTargetOf(2, -1, 10);
      logInfo(`swapTargetOf(index=2, direction=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0172 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0173
     * @tc.name      ListBeExchange_SwapTargetOf_0173
     * @tc.desc      swapTargetOf(index=15, direction=20, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0173 begin`);
      const actual: number = swapTargetOf(15, 20, -2);
      logInfo(`swapTargetOf(index=15, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0173 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0174
     * @tc.name      ListBeExchange_SwapTargetOf_0174
     * @tc.desc      swapTargetOf(index=0, direction=10, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0174 begin`);
      const actual: number = swapTargetOf(0, 10, 1);
      logInfo(`swapTargetOf(index=0, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0174 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0175
     * @tc.name      ListBeExchange_SwapTargetOf_0175
     * @tc.desc      swapTargetOf(index=2, direction=15, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0175 begin`);
      const actual: number = swapTargetOf(2, 15, 15);
      logInfo(`swapTargetOf(index=2, direction=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0175 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0176
     * @tc.name      ListBeExchange_SwapTargetOf_0176
     * @tc.desc      swapTargetOf(index=-2, direction=3, length=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0176 begin`);
      const actual: number = swapTargetOf(-2, 3, 10);
      logInfo(`swapTargetOf(index=-2, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0176 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0177
     * @tc.name      ListBeExchange_SwapTargetOf_0177
     * @tc.desc      swapTargetOf(index=100, direction=-1, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0177 begin`);
      const actual: number = swapTargetOf(100, -1, 2);
      logInfo(`swapTargetOf(index=100, direction=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0177 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0178
     * @tc.name      ListBeExchange_SwapTargetOf_0178
     * @tc.desc      swapTargetOf(index=15, direction=3, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0178 begin`);
      const actual: number = swapTargetOf(15, 3, 0);
      logInfo(`swapTargetOf(index=15, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0178 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0179
     * @tc.name      ListBeExchange_SwapTargetOf_0179
     * @tc.desc      swapTargetOf(index=10, direction=5, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0179 begin`);
      const actual: number = swapTargetOf(10, 5, -35);
      logInfo(`swapTargetOf(index=10, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0179 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0180
     * @tc.name      ListBeExchange_SwapTargetOf_0180
     * @tc.desc      swapTargetOf(index=15, direction=15, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0180 begin`);
      const actual: number = swapTargetOf(15, 15, 10);
      logInfo(`swapTargetOf(index=15, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0180 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0181
     * @tc.name      ListBeExchange_SwapTargetOf_0181
     * @tc.desc      swapTargetOf(index=2, direction=10, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0181 begin`);
      const actual: number = swapTargetOf(2, 10, -57);
      logInfo(`swapTargetOf(index=2, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0181 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0182
     * @tc.name      ListBeExchange_SwapTargetOf_0182
     * @tc.desc      swapTargetOf(index=15, direction=2, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0182 begin`);
      const actual: number = swapTargetOf(15, 2, -35);
      logInfo(`swapTargetOf(index=15, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0182 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0183
     * @tc.name      ListBeExchange_SwapTargetOf_0183
     * @tc.desc      swapTargetOf(index=-2, direction=-1, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0183 begin`);
      const actual: number = swapTargetOf(-2, -1, -57);
      logInfo(`swapTargetOf(index=-2, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0183 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0184
     * @tc.name      ListBeExchange_SwapTargetOf_0184
     * @tc.desc      swapTargetOf(index=-2, direction=0, length=1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0184 begin`);
      const actual: number = swapTargetOf(-2, 0, 1);
      logInfo(`swapTargetOf(index=-2, direction=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwapTargetOf_0184 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0185
     * @tc.name      ListBeExchange_SwapTargetOf_0185
     * @tc.desc      swapTargetOf(index=1, direction=100, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0185 begin`);
      const actual: number = swapTargetOf(1, 100, -35);
      logInfo(`swapTargetOf(index=1, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0185 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0186
     * @tc.name      ListBeExchange_SwapTargetOf_0186
     * @tc.desc      swapTargetOf(index=10, direction=5, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0186 begin`);
      const actual: number = swapTargetOf(10, 5, -57);
      logInfo(`swapTargetOf(index=10, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0186 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0187
     * @tc.name      ListBeExchange_SwapTargetOf_0187
     * @tc.desc      swapTargetOf(index=3, direction=100, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0187 begin`);
      const actual: number = swapTargetOf(3, 100, 1);
      logInfo(`swapTargetOf(index=3, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0187 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0188
     * @tc.name      ListBeExchange_SwapTargetOf_0188
     * @tc.desc      swapTargetOf(index=100, direction=120, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0188 begin`);
      const actual: number = swapTargetOf(100, 120, 0);
      logInfo(`swapTargetOf(index=100, direction=120, le...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0188 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0189
     * @tc.name      ListBeExchange_SwapTargetOf_0189
     * @tc.desc      swapTargetOf(index=100, direction=3, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0189 begin`);
      const actual: number = swapTargetOf(100, 3, -57);
      logInfo(`swapTargetOf(index=100, direction=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0189 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0190
     * @tc.name      ListBeExchange_SwapTargetOf_0190
     * @tc.desc      swapTargetOf(index=20, direction=2, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0190 begin`);
      const actual: number = swapTargetOf(20, 2, 0);
      logInfo(`swapTargetOf(index=20, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0190 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0191
     * @tc.name      ListBeExchange_SwapTargetOf_0191
     * @tc.desc      swapTargetOf(index=15, direction=10, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0191 begin`);
      const actual: number = swapTargetOf(15, 10, -57);
      logInfo(`swapTargetOf(index=15, direction=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0191 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0192
     * @tc.name      ListBeExchange_SwapTargetOf_0192
     * @tc.desc      swapTargetOf(index=0, direction=100, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0192 begin`);
      const actual: number = swapTargetOf(0, 100, 1);
      logInfo(`swapTargetOf(index=0, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0192 end`);
    });
  });
}
