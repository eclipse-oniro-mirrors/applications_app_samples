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

/** Logic checks for offsetAfterSwapOf (96 cases). */
export default function offsetAfterSwapOf2Test(): void {
  describe('OffsetAfterSwapOf2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0097
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0097
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=25) returns -1249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0097 begin`);
      const actual: number = offsetAfterSwapOf(1, 25);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1249);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0098
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0098
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=30) returns -1499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0098 begin`);
      const actual: number = offsetAfterSwapOf(1, 30);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1499);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0099
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0099
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=35) returns -1749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0099 begin`);
      const actual: number = offsetAfterSwapOf(1, 35);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1749);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0100
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0100
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=40) returns -1999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0100 begin`);
      const actual: number = offsetAfterSwapOf(1, 40);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-1999);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0101
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0101
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=45) returns -2249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0101 begin`);
      const actual: number = offsetAfterSwapOf(1, 45);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2249);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0102
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0102
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=50) returns -2499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0102 begin`);
      const actual: number = offsetAfterSwapOf(1, 50);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2499);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0103
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0103
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=55) returns -2749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0103 begin`);
      const actual: number = offsetAfterSwapOf(1, 55);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2749);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0104
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0104
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=60) returns -2999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0104 begin`);
      const actual: number = offsetAfterSwapOf(1, 60);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-2999);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0105
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0105
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=65) returns -3249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0105 begin`);
      const actual: number = offsetAfterSwapOf(1, 65);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3249);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0106
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0106
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=70) returns -3499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0106 begin`);
      const actual: number = offsetAfterSwapOf(1, 70);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3499);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0107
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0107
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=75) returns -3749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0107 begin`);
      const actual: number = offsetAfterSwapOf(1, 75);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3749);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0108
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0108
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=80) returns -3999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0108 begin`);
      const actual: number = offsetAfterSwapOf(1, 80);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-3999);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0109
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0109
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=85) returns -4249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0109 begin`);
      const actual: number = offsetAfterSwapOf(1, 85);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4249);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0110
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0110
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=90) returns -4499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0110 begin`);
      const actual: number = offsetAfterSwapOf(1, 90);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4499);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0111
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0111
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=95) returns -4749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0111 begin`);
      const actual: number = offsetAfterSwapOf(1, 95);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=95): actual=${actual}`);
      expect(actual).assertEqual(-4749);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0112
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0112
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=105) returns -5249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0112 begin`);
      const actual: number = offsetAfterSwapOf(1, 105);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=105): actual=${actual}`);
      expect(actual).assertEqual(-5249);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0113
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0113
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=110) returns -5499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0113 begin`);
      const actual: number = offsetAfterSwapOf(1, 110);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=110): actual=${actual}`);
      expect(actual).assertEqual(-5499);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0114
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0114
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=115) returns -5749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0114 begin`);
      const actual: number = offsetAfterSwapOf(1, 115);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=115): actual=${actual}`);
      expect(actual).assertEqual(-5749);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0115
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0115
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=-49) returns 2451
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0115 begin`);
      const actual: number = offsetAfterSwapOf(1, -49);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=-49): actual=${actual}`);
      expect(actual).assertEqual(2451);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0116
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0116
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=173) returns -8649
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0116 begin`);
      const actual: number = offsetAfterSwapOf(1, 173);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=173): actual=${actual}`);
      expect(actual).assertEqual(-8649);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0117
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0117
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=-1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0117 begin`);
      const actual: number = offsetAfterSwapOf(50, -1);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0118
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0118
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=10) returns -450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0118 begin`);
      const actual: number = offsetAfterSwapOf(50, 10);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-450);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0119
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0119
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=100) returns -4950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0119 begin`);
      const actual: number = offsetAfterSwapOf(50, 100);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=100): actual=${actual}`);
      expect(actual).assertEqual(-4950);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0120
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0120
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=15) returns -700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0120 begin`);
      const actual: number = offsetAfterSwapOf(50, 15);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-700);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0120 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0121
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0121
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=20) returns -950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0121 begin`);
      const actual: number = offsetAfterSwapOf(50, 20);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-950);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0121 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0122
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0122
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=25) returns -1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0122 begin`);
      const actual: number = offsetAfterSwapOf(50, 25);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0122 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0123
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0123
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=30) returns -1450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0123 begin`);
      const actual: number = offsetAfterSwapOf(50, 30);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1450);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0123 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0124
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0124
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=35) returns -1700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0124 begin`);
      const actual: number = offsetAfterSwapOf(50, 35);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1700);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0124 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0125
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0125
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=40) returns -1950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0125 begin`);
      const actual: number = offsetAfterSwapOf(50, 40);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-1950);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0125 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0126
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0126
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=45) returns -2200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0126 begin`);
      const actual: number = offsetAfterSwapOf(50, 45);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2200);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0126 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0127
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0127
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=50) returns -2450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0127 begin`);
      const actual: number = offsetAfterSwapOf(50, 50);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2450);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0127 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0128
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0128
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=55) returns -2700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0128 begin`);
      const actual: number = offsetAfterSwapOf(50, 55);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2700);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0128 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0129
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0129
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=60) returns -2950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0129 begin`);
      const actual: number = offsetAfterSwapOf(50, 60);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-2950);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0129 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0130
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0130
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=65) returns -3200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0130 begin`);
      const actual: number = offsetAfterSwapOf(50, 65);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3200);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0130 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0131
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0131
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=70) returns -3450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0131 begin`);
      const actual: number = offsetAfterSwapOf(50, 70);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3450);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0131 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0132
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0132
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=75) returns -3700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0132 begin`);
      const actual: number = offsetAfterSwapOf(50, 75);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3700);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0132 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0133
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0133
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=80) returns -3950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0133 begin`);
      const actual: number = offsetAfterSwapOf(50, 80);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-3950);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0133 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0134
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0134
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=85) returns -4200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0134 begin`);
      const actual: number = offsetAfterSwapOf(50, 85);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4200);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0134 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0135
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0135
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=90) returns -4450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0135 begin`);
      const actual: number = offsetAfterSwapOf(50, 90);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4450);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0135 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0136
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0136
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=95) returns -4700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0136 begin`);
      const actual: number = offsetAfterSwapOf(50, 95);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=95): actual=${actual}`);
      expect(actual).assertEqual(-4700);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0136 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0137
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0137
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=105) returns -5200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0137 begin`);
      const actual: number = offsetAfterSwapOf(50, 105);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=105): actual=${actual}`);
      expect(actual).assertEqual(-5200);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0137 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0138
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0138
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=110) returns -5450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0138 begin`);
      const actual: number = offsetAfterSwapOf(50, 110);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=110): actual=${actual}`);
      expect(actual).assertEqual(-5450);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0138 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0139
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0139
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=115) returns -5700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0139 begin`);
      const actual: number = offsetAfterSwapOf(50, 115);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=115): actual=${actual}`);
      expect(actual).assertEqual(-5700);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0139 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0140
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0140
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=-49) returns 2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0140 begin`);
      const actual: number = offsetAfterSwapOf(50, -49);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=-49): actual=${actual}`);
      expect(actual).assertEqual(2500);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0140 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0141
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0141
     * @tc.desc      offsetAfterSwapOf(offsetY=50, direction=173) returns -8600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0141 begin`);
      const actual: number = offsetAfterSwapOf(50, 173);
      logInfo(`offsetAfterSwapOf(offsetY=50, direction=173): actual=${actual}`);
      expect(actual).assertEqual(-8600);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0141 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0142
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0142
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=-1) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0142 begin`);
      const actual: number = offsetAfterSwapOf(100, -1);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0142 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0143
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0143
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=10) returns -400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0143 begin`);
      const actual: number = offsetAfterSwapOf(100, 10);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-400);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0143 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0144
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0144
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=100) returns -4900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0144 begin`);
      const actual: number = offsetAfterSwapOf(100, 100);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-4900);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0144 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0145
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0145
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=15) returns -650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0145 begin`);
      const actual: number = offsetAfterSwapOf(100, 15);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-650);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0145 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0146
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0146
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=20) returns -900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0146 begin`);
      const actual: number = offsetAfterSwapOf(100, 20);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-900);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0146 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0147
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0147
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=25) returns -1150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0147 begin`);
      const actual: number = offsetAfterSwapOf(100, 25);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1150);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0147 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0148
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0148
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=30) returns -1400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0148 begin`);
      const actual: number = offsetAfterSwapOf(100, 30);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1400);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0148 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0149
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0149
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=35) returns -1650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0149 begin`);
      const actual: number = offsetAfterSwapOf(100, 35);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1650);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0149 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0150
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0150
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=40) returns -1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0150 begin`);
      const actual: number = offsetAfterSwapOf(100, 40);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-1900);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0150 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0151
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0151
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=45) returns -2150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0151 begin`);
      const actual: number = offsetAfterSwapOf(100, 45);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2150);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0151 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0152
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0152
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=50) returns -2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0152 begin`);
      const actual: number = offsetAfterSwapOf(100, 50);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2400);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0152 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0153
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0153
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=55) returns -2650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0153 begin`);
      const actual: number = offsetAfterSwapOf(100, 55);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2650);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0153 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0154
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0154
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=60) returns -2900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0154 begin`);
      const actual: number = offsetAfterSwapOf(100, 60);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-2900);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0154 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0155
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0155
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=65) returns -3150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0155 begin`);
      const actual: number = offsetAfterSwapOf(100, 65);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3150);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0155 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0156
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0156
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=70) returns -3400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0156 begin`);
      const actual: number = offsetAfterSwapOf(100, 70);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3400);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0156 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0157
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0157
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=75) returns -3650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0157 begin`);
      const actual: number = offsetAfterSwapOf(100, 75);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3650);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0157 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0158
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0158
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=80) returns -3900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0158 begin`);
      const actual: number = offsetAfterSwapOf(100, 80);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-3900);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0158 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0159
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0159
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=85) returns -4150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0159 begin`);
      const actual: number = offsetAfterSwapOf(100, 85);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4150);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0159 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0160
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0160
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=90) returns -4400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0160 begin`);
      const actual: number = offsetAfterSwapOf(100, 90);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4400);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0160 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0161
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0161
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=95) returns -4650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0161 begin`);
      const actual: number = offsetAfterSwapOf(100, 95);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=95): actual=${actual}`);
      expect(actual).assertEqual(-4650);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0161 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0162
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0162
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=105) returns -5150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0162 begin`);
      const actual: number = offsetAfterSwapOf(100, 105);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-5150);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0162 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0163
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0163
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=110) returns -5400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0163 begin`);
      const actual: number = offsetAfterSwapOf(100, 110);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-5400);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0163 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0164
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0164
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=115) returns -5650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0164 begin`);
      const actual: number = offsetAfterSwapOf(100, 115);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-5650);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0164 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0165
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0165
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=-49) returns 2550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0165 begin`);
      const actual: number = offsetAfterSwapOf(100, -49);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=...: actual=${actual}`);
      expect(actual).assertEqual(2550);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0165 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0166
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0166
     * @tc.desc      offsetAfterSwapOf(offsetY=100, direction=173) returns -8550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0166 begin`);
      const actual: number = offsetAfterSwapOf(100, 173);
      logInfo(`offsetAfterSwapOf(offsetY=100, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-8550);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0166 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0167
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0167
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0167 begin`);
      const actual: number = offsetAfterSwapOf(2, 0);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0167 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0168
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0168
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=1) returns -48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0168 begin`);
      const actual: number = offsetAfterSwapOf(2, 1);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=1): actual=${actual}`);
      expect(actual).assertEqual(-48);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0168 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0169
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0169
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=-1) returns 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0169 begin`);
      const actual: number = offsetAfterSwapOf(2, -1);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0169 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0170
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0170
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=2) returns -98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0170 begin`);
      const actual: number = offsetAfterSwapOf(2, 2);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=2): actual=${actual}`);
      expect(actual).assertEqual(-98);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0170 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0171
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0171
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=3) returns -148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0171 begin`);
      const actual: number = offsetAfterSwapOf(2, 3);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=3): actual=${actual}`);
      expect(actual).assertEqual(-148);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0171 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0172
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0172
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=10) returns -498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0172 begin`);
      const actual: number = offsetAfterSwapOf(2, 10);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-498);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0172 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0173
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0173
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=100) returns -4998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0173 begin`);
      const actual: number = offsetAfterSwapOf(2, 100);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=100): actual=${actual}`);
      expect(actual).assertEqual(-4998);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0173 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0174
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0174
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=5) returns -248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0174 begin`);
      const actual: number = offsetAfterSwapOf(2, 5);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=5): actual=${actual}`);
      expect(actual).assertEqual(-248);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0174 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0175
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0175
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=15) returns -748
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0175 begin`);
      const actual: number = offsetAfterSwapOf(2, 15);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-748);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0175 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0176
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0176
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=20) returns -998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0176 begin`);
      const actual: number = offsetAfterSwapOf(2, 20);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-998);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0176 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0177
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0177
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=25) returns -1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0177 begin`);
      const actual: number = offsetAfterSwapOf(2, 25);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1248);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0177 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0178
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0178
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=30) returns -1498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0178 begin`);
      const actual: number = offsetAfterSwapOf(2, 30);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1498);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0178 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0179
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0179
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=35) returns -1748
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0179 begin`);
      const actual: number = offsetAfterSwapOf(2, 35);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1748);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0179 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0180
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0180
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=40) returns -1998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0180 begin`);
      const actual: number = offsetAfterSwapOf(2, 40);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-1998);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0180 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0181
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0181
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=45) returns -2248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0181 begin`);
      const actual: number = offsetAfterSwapOf(2, 45);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2248);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0181 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0182
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0182
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=50) returns -2498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0182 begin`);
      const actual: number = offsetAfterSwapOf(2, 50);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2498);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0182 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0183
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0183
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=55) returns -2748
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0183 begin`);
      const actual: number = offsetAfterSwapOf(2, 55);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2748);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0183 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0184
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0184
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=60) returns -2998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0184 begin`);
      const actual: number = offsetAfterSwapOf(2, 60);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-2998);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0184 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0185
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0185
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=65) returns -3248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0185 begin`);
      const actual: number = offsetAfterSwapOf(2, 65);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3248);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0185 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0186
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0186
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=70) returns -3498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0186 begin`);
      const actual: number = offsetAfterSwapOf(2, 70);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3498);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0186 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0187
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0187
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=75) returns -3748
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0187 begin`);
      const actual: number = offsetAfterSwapOf(2, 75);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3748);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0187 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0188
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0188
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=80) returns -3998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0188 begin`);
      const actual: number = offsetAfterSwapOf(2, 80);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-3998);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0188 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0189
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0189
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=85) returns -4248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0189 begin`);
      const actual: number = offsetAfterSwapOf(2, 85);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4248);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0189 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0190
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0190
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=90) returns -4498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0190 begin`);
      const actual: number = offsetAfterSwapOf(2, 90);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4498);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0190 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0191
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0191
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=95) returns -4748
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0191 begin`);
      const actual: number = offsetAfterSwapOf(2, 95);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=95): actual=${actual}`);
      expect(actual).assertEqual(-4748);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0191 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0192
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0192
     * @tc.desc      offsetAfterSwapOf(offsetY=2, direction=105) returns -5248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0192 begin`);
      const actual: number = offsetAfterSwapOf(2, 105);
      logInfo(`offsetAfterSwapOf(offsetY=2, direction=105): actual=${actual}`);
      expect(actual).assertEqual(-5248);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0192 end`);
    });
  });
}
