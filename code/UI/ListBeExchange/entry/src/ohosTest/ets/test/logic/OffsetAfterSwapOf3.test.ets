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
import { offsetAfterSwapOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for offsetAfterSwapOf (58 cases). */
export default function offsetAfterSwapOf3Test(): void {
  describe('OffsetAfterSwapOf3Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0193
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0193
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=110) returns -5498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0193 begin`);
      const actual: number = offsetAfterSwapOf(2, 110);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=110): actual=${actual}`);
      expect(actual).assertEqual(-5498);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0193 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0194
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0194
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=115) returns -5748
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0194 begin`);
      const actual: number = offsetAfterSwapOf(2, 115);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=115): actual=${actual}`);
      expect(actual).assertEqual(-5748);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0194 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0195
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0195
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=-49) returns 2452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0195 begin`);
      const actual: number = offsetAfterSwapOf(2, -49);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=-49): actual=${actual}`);
      expect(actual).assertEqual(2452);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0195 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0196
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0196
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=173) returns -8648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0196 begin`);
      const actual: number = offsetAfterSwapOf(2, 173);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=173): actual=${actual}`);
      expect(actual).assertEqual(-8648);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0196 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0197
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0197
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0197 begin`);
      const actual: number = offsetAfterSwapOf(3, 0);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0197 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0198
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0198
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=1) returns -47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0198 begin`);
      const actual: number = offsetAfterSwapOf(3, 1);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=1): actual=${actual}`);
      expect(actual).assertEqual(-47);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0198 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0199
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0199
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=-1) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0199 begin`);
      const actual: number = offsetAfterSwapOf(3, -1);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0199 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0200
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0200
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=2) returns -97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0200 begin`);
      const actual: number = offsetAfterSwapOf(3, 2);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=2): actual=${actual}`);
      expect(actual).assertEqual(-97);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0200 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0201
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0201
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=3) returns -147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0201 begin`);
      const actual: number = offsetAfterSwapOf(3, 3);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=3): actual=${actual}`);
      expect(actual).assertEqual(-147);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0201 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0202
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0202
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=10) returns -497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0202 begin`);
      const actual: number = offsetAfterSwapOf(3, 10);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-497);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0202 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0203
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0203
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=100) returns -4997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0203 begin`);
      const actual: number = offsetAfterSwapOf(3, 100);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=100): actual=${actual}`);
      expect(actual).assertEqual(-4997);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0203 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0204
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0204
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=5) returns -247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0204 begin`);
      const actual: number = offsetAfterSwapOf(3, 5);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=5): actual=${actual}`);
      expect(actual).assertEqual(-247);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0204 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0205
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0205
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=15) returns -747
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0205 begin`);
      const actual: number = offsetAfterSwapOf(3, 15);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-747);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0205 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0206
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0206
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=20) returns -997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0206 begin`);
      const actual: number = offsetAfterSwapOf(3, 20);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-997);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0206 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0207
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0207
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=25) returns -1247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0207 begin`);
      const actual: number = offsetAfterSwapOf(3, 25);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1247);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0207 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0208
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0208
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=30) returns -1497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0208 begin`);
      const actual: number = offsetAfterSwapOf(3, 30);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1497);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0208 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0209
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0209
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=35) returns -1747
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0209 begin`);
      const actual: number = offsetAfterSwapOf(3, 35);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1747);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0209 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0210
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0210
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=40) returns -1997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0210 begin`);
      const actual: number = offsetAfterSwapOf(3, 40);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-1997);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0210 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0211
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0211
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=45) returns -2247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0211 begin`);
      const actual: number = offsetAfterSwapOf(3, 45);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2247);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0211 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0212
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0212
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=50) returns -2497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0212 begin`);
      const actual: number = offsetAfterSwapOf(3, 50);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2497);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0212 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0213
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0213
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=55) returns -2747
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0213 begin`);
      const actual: number = offsetAfterSwapOf(3, 55);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2747);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0213 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0214
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0214
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=60) returns -2997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0214 begin`);
      const actual: number = offsetAfterSwapOf(3, 60);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-2997);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0214 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0215
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0215
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=65) returns -3247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0215 begin`);
      const actual: number = offsetAfterSwapOf(3, 65);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3247);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0215 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0216
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0216
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=70) returns -3497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0216 begin`);
      const actual: number = offsetAfterSwapOf(3, 70);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3497);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0216 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0217
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0217
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=75) returns -3747
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0217 begin`);
      const actual: number = offsetAfterSwapOf(3, 75);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3747);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0217 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0218
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0218
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=80) returns -3997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0218 begin`);
      const actual: number = offsetAfterSwapOf(3, 80);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-3997);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0218 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0219
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0219
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=85) returns -4247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0219 begin`);
      const actual: number = offsetAfterSwapOf(3, 85);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4247);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0219 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0220
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0220
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=90) returns -4497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0220 begin`);
      const actual: number = offsetAfterSwapOf(3, 90);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4497);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0220 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0221
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0221
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=95) returns -4747
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0221 begin`);
      const actual: number = offsetAfterSwapOf(3, 95);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=95): actual=${actual}`);
      expect(actual).assertEqual(-4747);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0221 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0222
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0222
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=105) returns -5247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0222 begin`);
      const actual: number = offsetAfterSwapOf(3, 105);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=105): actual=${actual}`);
      expect(actual).assertEqual(-5247);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0222 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0223
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0223
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=110) returns -5497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0223 begin`);
      const actual: number = offsetAfterSwapOf(3, 110);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=110): actual=${actual}`);
      expect(actual).assertEqual(-5497);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0223 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0224
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0224
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=115) returns -5747
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0224 begin`);
      const actual: number = offsetAfterSwapOf(3, 115);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=115): actual=${actual}`);
      expect(actual).assertEqual(-5747);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0224 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0225
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0225
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=-49) returns 2453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0225 begin`);
      const actual: number = offsetAfterSwapOf(3, -49);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=-49): actual=${actual}`);
      expect(actual).assertEqual(2453);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0225 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0226
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0226
     * @tc.desc      offsetAfterSwapOf(offsetY=3, direction=173) returns -8647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0226 begin`);
      const actual: number = offsetAfterSwapOf(3, 173);
      logInfo(`offsetAfterSwapOf(offsetY=3, direction=173): actual=${actual}`);
      expect(actual).assertEqual(-8647);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0226 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0227
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0227
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0227 begin`);
      const actual: number = offsetAfterSwapOf(10, 0);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=0): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0227 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0228
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0228
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=1) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0228 begin`);
      const actual: number = offsetAfterSwapOf(10, 1);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=1): actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0228 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0229
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0229
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=-1) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0229 begin`);
      const actual: number = offsetAfterSwapOf(10, -1);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0229 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0230
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0230
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=2) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0230 begin`);
      const actual: number = offsetAfterSwapOf(10, 2);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=2): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0230 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0231
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0231
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=3) returns -140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0231 begin`);
      const actual: number = offsetAfterSwapOf(10, 3);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=3): actual=${actual}`);
      expect(actual).assertEqual(-140);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0231 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0232
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0232
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=10) returns -490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0232 begin`);
      const actual: number = offsetAfterSwapOf(10, 10);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-490);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0232 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0233
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0233
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=100) returns -4990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0233 begin`);
      const actual: number = offsetAfterSwapOf(10, 100);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=100): actual=${actual}`);
      expect(actual).assertEqual(-4990);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0233 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0234
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0234
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=5) returns -240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0234 begin`);
      const actual: number = offsetAfterSwapOf(10, 5);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=5): actual=${actual}`);
      expect(actual).assertEqual(-240);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0234 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0235
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0235
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=15) returns -740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0235 begin`);
      const actual: number = offsetAfterSwapOf(10, 15);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-740);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0235 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0236
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0236
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=20) returns -990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0236 begin`);
      const actual: number = offsetAfterSwapOf(10, 20);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-990);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0236 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0237
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0237
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=25) returns -1240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0237 begin`);
      const actual: number = offsetAfterSwapOf(10, 25);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1240);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0237 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0238
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0238
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=30) returns -1490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0238 begin`);
      const actual: number = offsetAfterSwapOf(10, 30);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1490);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0238 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0239
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0239
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=35) returns -1740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0239 begin`);
      const actual: number = offsetAfterSwapOf(10, 35);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1740);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0239 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0240
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0240
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=40) returns -1990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0240 begin`);
      const actual: number = offsetAfterSwapOf(10, 40);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-1990);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0240 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0241
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0241
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=45) returns -2240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0241 begin`);
      const actual: number = offsetAfterSwapOf(10, 45);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2240);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0241 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0242
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0242
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=50) returns -2490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0242 begin`);
      const actual: number = offsetAfterSwapOf(10, 50);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2490);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0242 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0243
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0243
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=55) returns -2740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0243 begin`);
      const actual: number = offsetAfterSwapOf(10, 55);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2740);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0243 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0244
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0244
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=60) returns -2990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0244 begin`);
      const actual: number = offsetAfterSwapOf(10, 60);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-2990);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0244 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0245
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0245
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=65) returns -3240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0245 begin`);
      const actual: number = offsetAfterSwapOf(10, 65);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3240);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0245 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0246
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0246
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=70) returns -3490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0246 begin`);
      const actual: number = offsetAfterSwapOf(10, 70);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3490);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0246 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0247
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0247
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=75) returns -3740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0247 begin`);
      const actual: number = offsetAfterSwapOf(10, 75);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3740);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0247 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0248
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0248
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=80) returns -3990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0248 begin`);
      const actual: number = offsetAfterSwapOf(10, 80);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-3990);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0248 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0249
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0249
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=85) returns -4240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0249 begin`);
      const actual: number = offsetAfterSwapOf(10, 85);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4240);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0249 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0250
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0250
     * @tc.desc      offsetAfterSwapOf(offsetY=10, direction=90) returns -4490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0250 begin`);
      const actual: number = offsetAfterSwapOf(10, 90);
      logInfo(`offsetAfterSwapOf(offsetY=10, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4490);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0250 end`);
    });
  });
}
