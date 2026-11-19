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
import { refAfterSwapOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for refAfterSwapOf (58 cases). */
export default function refAfterSwapOf3Test(): void {
  describe('RefAfterSwapOf3Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0193
     * @tc.name      ListBeExchange_RefAfterSwapOf_0193
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=78.64) returns 3934
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0193 begin`);
      const actual: number = refAfterSwapOf(2, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(3934);
      logInfo(`${BUNDLE}RefAfterSwapOf_0193 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0194
     * @tc.name      ListBeExchange_RefAfterSwapOf_0194
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=37) returns 1852
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0194 begin`);
      const actual: number = refAfterSwapOf(2, 37);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(1852);
      logInfo(`${BUNDLE}RefAfterSwapOf_0194 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0195
     * @tc.name      ListBeExchange_RefAfterSwapOf_0195
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0195 begin`);
      const actual: number = refAfterSwapOf(3, 0);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RefAfterSwapOf_0195 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0196
     * @tc.name      ListBeExchange_RefAfterSwapOf_0196
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=1) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0196 begin`);
      const actual: number = refAfterSwapOf(3, 1);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction=1): actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}RefAfterSwapOf_0196 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0197
     * @tc.name      ListBeExchange_RefAfterSwapOf_0197
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=-1) returns -47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0197 begin`);
      const actual: number = refAfterSwapOf(3, -1);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(-47);
      logInfo(`${BUNDLE}RefAfterSwapOf_0197 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0198
     * @tc.name      ListBeExchange_RefAfterSwapOf_0198
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=2) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0198 begin`);
      const actual: number = refAfterSwapOf(3, 2);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction=2): actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}RefAfterSwapOf_0198 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0199
     * @tc.name      ListBeExchange_RefAfterSwapOf_0199
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=3) returns 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0199 begin`);
      const actual: number = refAfterSwapOf(3, 3);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction=3): actual=${actual}`);
      expect(actual).assertEqual(153);
      logInfo(`${BUNDLE}RefAfterSwapOf_0199 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0200
     * @tc.name      ListBeExchange_RefAfterSwapOf_0200
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=10) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0200 begin`);
      const actual: number = refAfterSwapOf(3, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}RefAfterSwapOf_0200 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0201
     * @tc.name      ListBeExchange_RefAfterSwapOf_0201
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=100) returns 5003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0201 begin`);
      const actual: number = refAfterSwapOf(3, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(5003);
      logInfo(`${BUNDLE}RefAfterSwapOf_0201 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0202
     * @tc.name      ListBeExchange_RefAfterSwapOf_0202
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=5) returns 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0202 begin`);
      const actual: number = refAfterSwapOf(3, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction=5): actual=${actual}`);
      expect(actual).assertEqual(253);
      logInfo(`${BUNDLE}RefAfterSwapOf_0202 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0203
     * @tc.name      ListBeExchange_RefAfterSwapOf_0203
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=15) returns 753
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0203 begin`);
      const actual: number = refAfterSwapOf(3, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(753);
      logInfo(`${BUNDLE}RefAfterSwapOf_0203 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0204
     * @tc.name      ListBeExchange_RefAfterSwapOf_0204
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=20) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0204 begin`);
      const actual: number = refAfterSwapOf(3, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}RefAfterSwapOf_0204 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0205
     * @tc.name      ListBeExchange_RefAfterSwapOf_0205
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=25) returns 1253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0205 begin`);
      const actual: number = refAfterSwapOf(3, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(1253);
      logInfo(`${BUNDLE}RefAfterSwapOf_0205 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0206
     * @tc.name      ListBeExchange_RefAfterSwapOf_0206
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=30) returns 1503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0206 begin`);
      const actual: number = refAfterSwapOf(3, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(1503);
      logInfo(`${BUNDLE}RefAfterSwapOf_0206 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0207
     * @tc.name      ListBeExchange_RefAfterSwapOf_0207
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=35) returns 1753
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0207 begin`);
      const actual: number = refAfterSwapOf(3, 35);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(1753);
      logInfo(`${BUNDLE}RefAfterSwapOf_0207 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0208
     * @tc.name      ListBeExchange_RefAfterSwapOf_0208
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=40) returns 2003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0208 begin`);
      const actual: number = refAfterSwapOf(3, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(2003);
      logInfo(`${BUNDLE}RefAfterSwapOf_0208 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0209
     * @tc.name      ListBeExchange_RefAfterSwapOf_0209
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=45) returns 2253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0209 begin`);
      const actual: number = refAfterSwapOf(3, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(2253);
      logInfo(`${BUNDLE}RefAfterSwapOf_0209 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0210
     * @tc.name      ListBeExchange_RefAfterSwapOf_0210
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=50) returns 2503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0210 begin`);
      const actual: number = refAfterSwapOf(3, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(2503);
      logInfo(`${BUNDLE}RefAfterSwapOf_0210 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0211
     * @tc.name      ListBeExchange_RefAfterSwapOf_0211
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=55) returns 2753
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0211 begin`);
      const actual: number = refAfterSwapOf(3, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(2753);
      logInfo(`${BUNDLE}RefAfterSwapOf_0211 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0212
     * @tc.name      ListBeExchange_RefAfterSwapOf_0212
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=60) returns 3003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0212 begin`);
      const actual: number = refAfterSwapOf(3, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(3003);
      logInfo(`${BUNDLE}RefAfterSwapOf_0212 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0213
     * @tc.name      ListBeExchange_RefAfterSwapOf_0213
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=65) returns 3253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0213 begin`);
      const actual: number = refAfterSwapOf(3, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(3253);
      logInfo(`${BUNDLE}RefAfterSwapOf_0213 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0214
     * @tc.name      ListBeExchange_RefAfterSwapOf_0214
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=70) returns 3503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0214 begin`);
      const actual: number = refAfterSwapOf(3, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(3503);
      logInfo(`${BUNDLE}RefAfterSwapOf_0214 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0215
     * @tc.name      ListBeExchange_RefAfterSwapOf_0215
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=75) returns 3753
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0215 begin`);
      const actual: number = refAfterSwapOf(3, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(3753);
      logInfo(`${BUNDLE}RefAfterSwapOf_0215 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0216
     * @tc.name      ListBeExchange_RefAfterSwapOf_0216
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=80) returns 4003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0216 begin`);
      const actual: number = refAfterSwapOf(3, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(4003);
      logInfo(`${BUNDLE}RefAfterSwapOf_0216 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0217
     * @tc.name      ListBeExchange_RefAfterSwapOf_0217
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=85) returns 4253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0217 begin`);
      const actual: number = refAfterSwapOf(3, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(4253);
      logInfo(`${BUNDLE}RefAfterSwapOf_0217 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0218
     * @tc.name      ListBeExchange_RefAfterSwapOf_0218
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=90) returns 4503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0218 begin`);
      const actual: number = refAfterSwapOf(3, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(4503);
      logInfo(`${BUNDLE}RefAfterSwapOf_0218 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0219
     * @tc.name      ListBeExchange_RefAfterSwapOf_0219
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=95) returns 4753
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0219 begin`);
      const actual: number = refAfterSwapOf(3, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(4753);
      logInfo(`${BUNDLE}RefAfterSwapOf_0219 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0220
     * @tc.name      ListBeExchange_RefAfterSwapOf_0220
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=105) returns 5253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0220 begin`);
      const actual: number = refAfterSwapOf(3, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(5253);
      logInfo(`${BUNDLE}RefAfterSwapOf_0220 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0221
     * @tc.name      ListBeExchange_RefAfterSwapOf_0221
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=110) returns 5503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0221 begin`);
      const actual: number = refAfterSwapOf(3, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(5503);
      logInfo(`${BUNDLE}RefAfterSwapOf_0221 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0222
     * @tc.name      ListBeExchange_RefAfterSwapOf_0222
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=115) returns 5753
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0222 begin`);
      const actual: number = refAfterSwapOf(3, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(5753);
      logInfo(`${BUNDLE}RefAfterSwapOf_0222 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0223
     * @tc.name      ListBeExchange_RefAfterSwapOf_0223
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=78.64) returns 3935
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0223 begin`);
      const actual: number = refAfterSwapOf(3, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(3935);
      logInfo(`${BUNDLE}RefAfterSwapOf_0223 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0224
     * @tc.name      ListBeExchange_RefAfterSwapOf_0224
     * @tc.desc      refAfterSwapOf(dragRefOffset=3, direction=37) returns 1853
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0224 begin`);
      const actual: number = refAfterSwapOf(3, 37);
      logInfo(`refAfterSwapOf(dragRefOffset=3, direction...: actual=${actual}`);
      expect(actual).assertEqual(1853);
      logInfo(`${BUNDLE}RefAfterSwapOf_0224 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0225
     * @tc.name      ListBeExchange_RefAfterSwapOf_0225
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0225 begin`);
      const actual: number = refAfterSwapOf(10, 0);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RefAfterSwapOf_0225 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0226
     * @tc.name      ListBeExchange_RefAfterSwapOf_0226
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=1) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0226 begin`);
      const actual: number = refAfterSwapOf(10, 1);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RefAfterSwapOf_0226 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0227
     * @tc.name      ListBeExchange_RefAfterSwapOf_0227
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=-1) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0227 begin`);
      const actual: number = refAfterSwapOf(10, -1);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}RefAfterSwapOf_0227 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0228
     * @tc.name      ListBeExchange_RefAfterSwapOf_0228
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=2) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0228 begin`);
      const actual: number = refAfterSwapOf(10, 2);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RefAfterSwapOf_0228 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0229
     * @tc.name      ListBeExchange_RefAfterSwapOf_0229
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=3) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0229 begin`);
      const actual: number = refAfterSwapOf(10, 3);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}RefAfterSwapOf_0229 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0230
     * @tc.name      ListBeExchange_RefAfterSwapOf_0230
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=10) returns 510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0230 begin`);
      const actual: number = refAfterSwapOf(10, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(510);
      logInfo(`${BUNDLE}RefAfterSwapOf_0230 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0231
     * @tc.name      ListBeExchange_RefAfterSwapOf_0231
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=100) returns 5010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0231 begin`);
      const actual: number = refAfterSwapOf(10, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(5010);
      logInfo(`${BUNDLE}RefAfterSwapOf_0231 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0232
     * @tc.name      ListBeExchange_RefAfterSwapOf_0232
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=5) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0232 begin`);
      const actual: number = refAfterSwapOf(10, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}RefAfterSwapOf_0232 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0233
     * @tc.name      ListBeExchange_RefAfterSwapOf_0233
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=15) returns 760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0233 begin`);
      const actual: number = refAfterSwapOf(10, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(760);
      logInfo(`${BUNDLE}RefAfterSwapOf_0233 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0234
     * @tc.name      ListBeExchange_RefAfterSwapOf_0234
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=20) returns 1010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0234 begin`);
      const actual: number = refAfterSwapOf(10, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(1010);
      logInfo(`${BUNDLE}RefAfterSwapOf_0234 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0235
     * @tc.name      ListBeExchange_RefAfterSwapOf_0235
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=25) returns 1260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0235 begin`);
      const actual: number = refAfterSwapOf(10, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(1260);
      logInfo(`${BUNDLE}RefAfterSwapOf_0235 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0236
     * @tc.name      ListBeExchange_RefAfterSwapOf_0236
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=30) returns 1510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0236 begin`);
      const actual: number = refAfterSwapOf(10, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(1510);
      logInfo(`${BUNDLE}RefAfterSwapOf_0236 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0237
     * @tc.name      ListBeExchange_RefAfterSwapOf_0237
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=35) returns 1760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0237 begin`);
      const actual: number = refAfterSwapOf(10, 35);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(1760);
      logInfo(`${BUNDLE}RefAfterSwapOf_0237 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0238
     * @tc.name      ListBeExchange_RefAfterSwapOf_0238
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=40) returns 2010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0238 begin`);
      const actual: number = refAfterSwapOf(10, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(2010);
      logInfo(`${BUNDLE}RefAfterSwapOf_0238 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0239
     * @tc.name      ListBeExchange_RefAfterSwapOf_0239
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=45) returns 2260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0239 begin`);
      const actual: number = refAfterSwapOf(10, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(2260);
      logInfo(`${BUNDLE}RefAfterSwapOf_0239 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0240
     * @tc.name      ListBeExchange_RefAfterSwapOf_0240
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=50) returns 2510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0240 begin`);
      const actual: number = refAfterSwapOf(10, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(2510);
      logInfo(`${BUNDLE}RefAfterSwapOf_0240 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0241
     * @tc.name      ListBeExchange_RefAfterSwapOf_0241
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=55) returns 2760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0241 begin`);
      const actual: number = refAfterSwapOf(10, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(2760);
      logInfo(`${BUNDLE}RefAfterSwapOf_0241 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0242
     * @tc.name      ListBeExchange_RefAfterSwapOf_0242
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=60) returns 3010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0242 begin`);
      const actual: number = refAfterSwapOf(10, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(3010);
      logInfo(`${BUNDLE}RefAfterSwapOf_0242 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0243
     * @tc.name      ListBeExchange_RefAfterSwapOf_0243
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=65) returns 3260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0243 begin`);
      const actual: number = refAfterSwapOf(10, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(3260);
      logInfo(`${BUNDLE}RefAfterSwapOf_0243 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0244
     * @tc.name      ListBeExchange_RefAfterSwapOf_0244
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=70) returns 3510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0244 begin`);
      const actual: number = refAfterSwapOf(10, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(3510);
      logInfo(`${BUNDLE}RefAfterSwapOf_0244 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0245
     * @tc.name      ListBeExchange_RefAfterSwapOf_0245
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=75) returns 3760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0245 begin`);
      const actual: number = refAfterSwapOf(10, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(3760);
      logInfo(`${BUNDLE}RefAfterSwapOf_0245 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0246
     * @tc.name      ListBeExchange_RefAfterSwapOf_0246
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=80) returns 4010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0246 begin`);
      const actual: number = refAfterSwapOf(10, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(4010);
      logInfo(`${BUNDLE}RefAfterSwapOf_0246 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0247
     * @tc.name      ListBeExchange_RefAfterSwapOf_0247
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=85) returns 4260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0247 begin`);
      const actual: number = refAfterSwapOf(10, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(4260);
      logInfo(`${BUNDLE}RefAfterSwapOf_0247 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0248
     * @tc.name      ListBeExchange_RefAfterSwapOf_0248
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=90) returns 4510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0248 begin`);
      const actual: number = refAfterSwapOf(10, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(4510);
      logInfo(`${BUNDLE}RefAfterSwapOf_0248 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0249
     * @tc.name      ListBeExchange_RefAfterSwapOf_0249
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=95) returns 4760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0249 begin`);
      const actual: number = refAfterSwapOf(10, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(4760);
      logInfo(`${BUNDLE}RefAfterSwapOf_0249 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0250
     * @tc.name      ListBeExchange_RefAfterSwapOf_0250
     * @tc.desc      refAfterSwapOf(dragRefOffset=10, direction=105) returns 5260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0250 begin`);
      const actual: number = refAfterSwapOf(10, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=10, directio...: actual=${actual}`);
      expect(actual).assertEqual(5260);
      logInfo(`${BUNDLE}RefAfterSwapOf_0250 end`);
    });
  });
}
