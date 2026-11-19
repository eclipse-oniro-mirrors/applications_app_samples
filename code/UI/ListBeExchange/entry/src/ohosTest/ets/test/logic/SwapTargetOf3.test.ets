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

/** Logic checks for swapTargetOf (58 cases). */
export default function swapTargetOf3Test(): void {
  describe('SwapTargetOf3Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0193
     * @tc.name      ListBeExchange_SwapTargetOf_0193
     * @tc.desc      swapTargetOf(index=5, direction=-2, length=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0193 begin`);
      const actual: number = swapTargetOf(5, -2, 100);
      logInfo(`swapTargetOf(index=5, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SwapTargetOf_0193 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0194
     * @tc.name      ListBeExchange_SwapTargetOf_0194
     * @tc.desc      swapTargetOf(index=1, direction=-2, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0194 begin`);
      const actual: number = swapTargetOf(1, -2, 2);
      logInfo(`swapTargetOf(index=1, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0194 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0195
     * @tc.name      ListBeExchange_SwapTargetOf_0195
     * @tc.desc      swapTargetOf(index=2, direction=10, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0195 begin`);
      const actual: number = swapTargetOf(2, 10, 3);
      logInfo(`swapTargetOf(index=2, direction=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0195 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0196
     * @tc.name      ListBeExchange_SwapTargetOf_0196
     * @tc.desc      swapTargetOf(index=-1, direction=20, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0196 begin`);
      const actual: number = swapTargetOf(-1, 20, 0);
      logInfo(`swapTargetOf(index=-1, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0196 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0197
     * @tc.name      ListBeExchange_SwapTargetOf_0197
     * @tc.desc      swapTargetOf(index=100, direction=0, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0197 begin`);
      const actual: number = swapTargetOf(100, 0, 15);
      logInfo(`swapTargetOf(index=100, direction=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0197 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0198
     * @tc.name      ListBeExchange_SwapTargetOf_0198
     * @tc.desc      swapTargetOf(index=-2, direction=0, length=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0198 begin`);
      const actual: number = swapTargetOf(-2, 0, -2);
      logInfo(`swapTargetOf(index=-2, direction=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwapTargetOf_0198 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0199
     * @tc.name      ListBeExchange_SwapTargetOf_0199
     * @tc.desc      swapTargetOf(index=-1, direction=120, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0199 begin`);
      const actual: number = swapTargetOf(-1, 120, 1);
      logInfo(`swapTargetOf(index=-1, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0199 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0200
     * @tc.name      ListBeExchange_SwapTargetOf_0200
     * @tc.desc      swapTargetOf(index=20, direction=10, length=100) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0200 begin`);
      const actual: number = swapTargetOf(20, 10, 100);
      logInfo(`swapTargetOf(index=20, direction=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}SwapTargetOf_0200 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0201
     * @tc.name      ListBeExchange_SwapTargetOf_0201
     * @tc.desc      swapTargetOf(index=2, direction=120, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0201 begin`);
      const actual: number = swapTargetOf(2, 120, -1);
      logInfo(`swapTargetOf(index=2, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0201 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0202
     * @tc.name      ListBeExchange_SwapTargetOf_0202
     * @tc.desc      swapTargetOf(index=3, direction=-2, length=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0202 begin`);
      const actual: number = swapTargetOf(3, -2, 10);
      logInfo(`swapTargetOf(index=3, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0202 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0203
     * @tc.name      ListBeExchange_SwapTargetOf_0203
     * @tc.desc      swapTargetOf(index=3, direction=1, length=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0203 begin`);
      const actual: number = swapTargetOf(3, 1, 3);
      logInfo(`swapTargetOf(index=3, direction=1, length=3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0203 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0204
     * @tc.name      ListBeExchange_SwapTargetOf_0204
     * @tc.desc      swapTargetOf(index=3, direction=2, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0204 begin`);
      const actual: number = swapTargetOf(3, 2, -57);
      logInfo(`swapTargetOf(index=3, direction=2, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0204 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0205
     * @tc.name      ListBeExchange_SwapTargetOf_0205
     * @tc.desc      swapTargetOf(index=1, direction=2, length=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0205 begin`);
      const actual: number = swapTargetOf(1, 2, 10);
      logInfo(`swapTargetOf(index=1, direction=2, length...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SwapTargetOf_0205 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0206
     * @tc.name      ListBeExchange_SwapTargetOf_0206
     * @tc.desc      swapTargetOf(index=-1, direction=2, length=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0206 begin`);
      const actual: number = swapTargetOf(-1, 2, 5);
      logInfo(`swapTargetOf(index=-1, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0206 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0207
     * @tc.name      ListBeExchange_SwapTargetOf_0207
     * @tc.desc      swapTargetOf(index=3, direction=3, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0207 begin`);
      const actual: number = swapTargetOf(3, 3, 2);
      logInfo(`swapTargetOf(index=3, direction=3, length=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0207 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0208
     * @tc.name      ListBeExchange_SwapTargetOf_0208
     * @tc.desc      swapTargetOf(index=0, direction=20, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0208 begin`);
      const actual: number = swapTargetOf(0, 20, 15);
      logInfo(`swapTargetOf(index=0, direction=20, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0208 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0209
     * @tc.name      ListBeExchange_SwapTargetOf_0209
     * @tc.desc      swapTargetOf(index=5, direction=5, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0209 begin`);
      const actual: number = swapTargetOf(5, 5, -2);
      logInfo(`swapTargetOf(index=5, direction=5, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0209 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0210
     * @tc.name      ListBeExchange_SwapTargetOf_0210
     * @tc.desc      swapTargetOf(index=100, direction=120, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0210 begin`);
      const actual: number = swapTargetOf(100, 120, 5);
      logInfo(`swapTargetOf(index=100, direction=120, le...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0210 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0211
     * @tc.name      ListBeExchange_SwapTargetOf_0211
     * @tc.desc      swapTargetOf(index=0, direction=3, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0211 begin`);
      const actual: number = swapTargetOf(0, 3, -1);
      logInfo(`swapTargetOf(index=0, direction=3, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0211 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0212
     * @tc.name      ListBeExchange_SwapTargetOf_0212
     * @tc.desc      swapTargetOf(index=0, direction=100, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0212 begin`);
      const actual: number = swapTargetOf(0, 100, 10);
      logInfo(`swapTargetOf(index=0, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0212 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0213
     * @tc.name      ListBeExchange_SwapTargetOf_0213
     * @tc.desc      swapTargetOf(index=-1, direction=5, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0213 begin`);
      const actual: number = swapTargetOf(-1, 5, -57);
      logInfo(`swapTargetOf(index=-1, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0213 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0214
     * @tc.name      ListBeExchange_SwapTargetOf_0214
     * @tc.desc      swapTargetOf(index=15, direction=100, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0214 begin`);
      const actual: number = swapTargetOf(15, 100, 2);
      logInfo(`swapTargetOf(index=15, direction=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0214 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0215
     * @tc.name      ListBeExchange_SwapTargetOf_0215
     * @tc.desc      swapTargetOf(index=15, direction=-1, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0215 begin`);
      const actual: number = swapTargetOf(15, -1, -1);
      logInfo(`swapTargetOf(index=15, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0215 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0216
     * @tc.name      ListBeExchange_SwapTargetOf_0216
     * @tc.desc      swapTargetOf(index=15, direction=120, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0216 begin`);
      const actual: number = swapTargetOf(15, 120, 1);
      logInfo(`swapTargetOf(index=15, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0216 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0217
     * @tc.name      ListBeExchange_SwapTargetOf_0217
     * @tc.desc      swapTargetOf(index=20, direction=-1, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0217 begin`);
      const actual: number = swapTargetOf(20, -1, 2);
      logInfo(`swapTargetOf(index=20, direction=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0217 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0218
     * @tc.name      ListBeExchange_SwapTargetOf_0218
     * @tc.desc      swapTargetOf(index=0, direction=-2, length=15) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0218 begin`);
      const actual: number = swapTargetOf(0, -2, 15);
      logInfo(`swapTargetOf(index=0, direction=-2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwapTargetOf_0218 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0219
     * @tc.name      ListBeExchange_SwapTargetOf_0219
     * @tc.desc      swapTargetOf(index=10, direction=120, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0219 begin`);
      const actual: number = swapTargetOf(10, 120, 0);
      logInfo(`swapTargetOf(index=10, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0219 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0220
     * @tc.name      ListBeExchange_SwapTargetOf_0220
     * @tc.desc      swapTargetOf(index=5, direction=100, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0220 begin`);
      const actual: number = swapTargetOf(5, 100, 1);
      logInfo(`swapTargetOf(index=5, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0220 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0221
     * @tc.name      ListBeExchange_SwapTargetOf_0221
     * @tc.desc      swapTargetOf(index=3, direction=1, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0221 begin`);
      const actual: number = swapTargetOf(3, 1, -57);
      logInfo(`swapTargetOf(index=3, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0221 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0222
     * @tc.name      ListBeExchange_SwapTargetOf_0222
     * @tc.desc      swapTargetOf(index=20, direction=20, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0222 begin`);
      const actual: number = swapTargetOf(20, 20, 0);
      logInfo(`swapTargetOf(index=20, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0222 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0223
     * @tc.name      ListBeExchange_SwapTargetOf_0223
     * @tc.desc      swapTargetOf(index=0, direction=120, length=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0223 begin`);
      const actual: number = swapTargetOf(0, 120, -35);
      logInfo(`swapTargetOf(index=0, direction=120, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0223 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0224
     * @tc.name      ListBeExchange_SwapTargetOf_0224
     * @tc.desc      swapTargetOf(index=15, direction=15, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0224 begin`);
      const actual: number = swapTargetOf(15, 15, -57);
      logInfo(`swapTargetOf(index=15, direction=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0224 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0225
     * @tc.name      ListBeExchange_SwapTargetOf_0225
     * @tc.desc      swapTargetOf(index=-2, direction=3, length=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0225 begin`);
      const actual: number = swapTargetOf(-2, 3, 100);
      logInfo(`swapTargetOf(index=-2, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwapTargetOf_0225 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0226
     * @tc.name      ListBeExchange_SwapTargetOf_0226
     * @tc.desc      swapTargetOf(index=115, direction=2, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0226 begin`);
      const actual: number = swapTargetOf(115, 2, 2);
      logInfo(`swapTargetOf(index=115, direction=2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0226 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0227
     * @tc.name      ListBeExchange_SwapTargetOf_0227
     * @tc.desc      swapTargetOf(index=-2, direction=10, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0227 begin`);
      const actual: number = swapTargetOf(-2, 10, 1);
      logInfo(`swapTargetOf(index=-2, direction=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0227 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0228
     * @tc.name      ListBeExchange_SwapTargetOf_0228
     * @tc.desc      swapTargetOf(index=20, direction=10, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0228 begin`);
      const actual: number = swapTargetOf(20, 10, 1);
      logInfo(`swapTargetOf(index=20, direction=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0228 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0229
     * @tc.name      ListBeExchange_SwapTargetOf_0229
     * @tc.desc      swapTargetOf(index=20, direction=2, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0229 begin`);
      const actual: number = swapTargetOf(20, 2, -2);
      logInfo(`swapTargetOf(index=20, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0229 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0230
     * @tc.name      ListBeExchange_SwapTargetOf_0230
     * @tc.desc      swapTargetOf(index=20, direction=2, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0230 begin`);
      const actual: number = swapTargetOf(20, 2, 1);
      logInfo(`swapTargetOf(index=20, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0230 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0231
     * @tc.name      ListBeExchange_SwapTargetOf_0231
     * @tc.desc      swapTargetOf(index=5, direction=1, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0231 begin`);
      const actual: number = swapTargetOf(5, 1, -2);
      logInfo(`swapTargetOf(index=5, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0231 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0232
     * @tc.name      ListBeExchange_SwapTargetOf_0232
     * @tc.desc      swapTargetOf(index=1, direction=1, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0232 begin`);
      const actual: number = swapTargetOf(1, 1, -2);
      logInfo(`swapTargetOf(index=1, direction=1, length...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0232 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0233
     * @tc.name      ListBeExchange_SwapTargetOf_0233
     * @tc.desc      swapTargetOf(index=15, direction=2, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0233 begin`);
      const actual: number = swapTargetOf(15, 2, 1);
      logInfo(`swapTargetOf(index=15, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0233 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0234
     * @tc.name      ListBeExchange_SwapTargetOf_0234
     * @tc.desc      swapTargetOf(index=115, direction=20, length=-57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_SwapTargetOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0234 begin`);
      const actual: number = swapTargetOf(115, 20, -57);
      logInfo(`swapTargetOf(index=115, direction=20, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0234 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0235
     * @tc.name      ListBeExchange_SwapTargetOf_0235
     * @tc.desc      swapTargetOf(index=-1, direction=-2, length=0) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0235 begin`);
      const actual: number = swapTargetOf(-1, -2, 0);
      logInfo(`swapTargetOf(index=-1, direction=-2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}SwapTargetOf_0235 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0236
     * @tc.name      ListBeExchange_SwapTargetOf_0236
     * @tc.desc      swapTargetOf(index=115, direction=120, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0236 begin`);
      const actual: number = swapTargetOf(115, 120, -2);
      logInfo(`swapTargetOf(index=115, direction=120, le...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0236 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0237
     * @tc.name      ListBeExchange_SwapTargetOf_0237
     * @tc.desc      swapTargetOf(index=20, direction=120, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0237 begin`);
      const actual: number = swapTargetOf(20, 120, 10);
      logInfo(`swapTargetOf(index=20, direction=120, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0237 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0238
     * @tc.name      ListBeExchange_SwapTargetOf_0238
     * @tc.desc      swapTargetOf(index=-2, direction=2, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0238 begin`);
      const actual: number = swapTargetOf(-2, 2, -1);
      logInfo(`swapTargetOf(index=-2, direction=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0238 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0239
     * @tc.name      ListBeExchange_SwapTargetOf_0239
     * @tc.desc      swapTargetOf(index=2, direction=2, length=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0239 begin`);
      const actual: number = swapTargetOf(2, 2, 5);
      logInfo(`swapTargetOf(index=2, direction=2, length=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}SwapTargetOf_0239 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0240
     * @tc.name      ListBeExchange_SwapTargetOf_0240
     * @tc.desc      swapTargetOf(index=100, direction=2, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0240 begin`);
      const actual: number = swapTargetOf(100, 2, -2);
      logInfo(`swapTargetOf(index=100, direction=2, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0240 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0241
     * @tc.name      ListBeExchange_SwapTargetOf_0241
     * @tc.desc      swapTargetOf(index=-1, direction=20, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0241 begin`);
      const actual: number = swapTargetOf(-1, 20, 1);
      logInfo(`swapTargetOf(index=-1, direction=20, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0241 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0242
     * @tc.name      ListBeExchange_SwapTargetOf_0242
     * @tc.desc      swapTargetOf(index=115, direction=1, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0242 begin`);
      const actual: number = swapTargetOf(115, 1, -2);
      logInfo(`swapTargetOf(index=115, direction=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0242 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0243
     * @tc.name      ListBeExchange_SwapTargetOf_0243
     * @tc.desc      swapTargetOf(index=100, direction=5, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0243 begin`);
      const actual: number = swapTargetOf(100, 5, 1);
      logInfo(`swapTargetOf(index=100, direction=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0243 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0244
     * @tc.name      ListBeExchange_SwapTargetOf_0244
     * @tc.desc      swapTargetOf(index=3, direction=100, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0244 begin`);
      const actual: number = swapTargetOf(3, 100, 0);
      logInfo(`swapTargetOf(index=3, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0244 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0245
     * @tc.name      ListBeExchange_SwapTargetOf_0245
     * @tc.desc      swapTargetOf(index=0, direction=100, length=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0245 begin`);
      const actual: number = swapTargetOf(0, 100, -2);
      logInfo(`swapTargetOf(index=0, direction=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0245 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0246
     * @tc.name      ListBeExchange_SwapTargetOf_0246
     * @tc.desc      swapTargetOf(index=20, direction=3, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0246 begin`);
      const actual: number = swapTargetOf(20, 3, 5);
      logInfo(`swapTargetOf(index=20, direction=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0246 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0247
     * @tc.name      ListBeExchange_SwapTargetOf_0247
     * @tc.desc      swapTargetOf(index=115, direction=5, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_SwapTargetOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0247 begin`);
      const actual: number = swapTargetOf(115, 5, -1);
      logInfo(`swapTargetOf(index=115, direction=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0247 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0248
     * @tc.name      ListBeExchange_SwapTargetOf_0248
     * @tc.desc      swapTargetOf(index=10, direction=5, length=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0248 begin`);
      const actual: number = swapTargetOf(10, 5, 2);
      logInfo(`swapTargetOf(index=10, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0248 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0249
     * @tc.name      ListBeExchange_SwapTargetOf_0249
     * @tc.desc      swapTargetOf(index=115, direction=3, length=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0249 begin`);
      const actual: number = swapTargetOf(115, 3, 100);
      logInfo(`swapTargetOf(index=115, direction=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0249 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SWAP_TARGET_OF_0250
     * @tc.name      ListBeExchange_SwapTargetOf_0250
     * @tc.desc      swapTargetOf(index=10, direction=5, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_SwapTargetOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SwapTargetOf_0250 begin`);
      const actual: number = swapTargetOf(10, 5, 0);
      logInfo(`swapTargetOf(index=10, direction=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwapTargetOf_0250 end`);
    });
  });
}
