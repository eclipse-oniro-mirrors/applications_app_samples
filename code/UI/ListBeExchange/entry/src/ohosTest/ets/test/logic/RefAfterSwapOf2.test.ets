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

/** Logic checks for refAfterSwapOf (96 cases). */
export default function refAfterSwapOf2Test(): void {
  describe('RefAfterSwapOf2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0097
     * @tc.name      ListBeExchange_RefAfterSwapOf_0097
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=30) returns 1501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0097 begin`);
      const actual: number = refAfterSwapOf(1, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(1501);
      logInfo(`${BUNDLE}RefAfterSwapOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0098
     * @tc.name      ListBeExchange_RefAfterSwapOf_0098
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=35) returns 1751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0098 begin`);
      const actual: number = refAfterSwapOf(1, 35);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(1751);
      logInfo(`${BUNDLE}RefAfterSwapOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0099
     * @tc.name      ListBeExchange_RefAfterSwapOf_0099
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=40) returns 2001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0099 begin`);
      const actual: number = refAfterSwapOf(1, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(2001);
      logInfo(`${BUNDLE}RefAfterSwapOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0100
     * @tc.name      ListBeExchange_RefAfterSwapOf_0100
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=45) returns 2251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0100 begin`);
      const actual: number = refAfterSwapOf(1, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(2251);
      logInfo(`${BUNDLE}RefAfterSwapOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0101
     * @tc.name      ListBeExchange_RefAfterSwapOf_0101
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=50) returns 2501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0101 begin`);
      const actual: number = refAfterSwapOf(1, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(2501);
      logInfo(`${BUNDLE}RefAfterSwapOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0102
     * @tc.name      ListBeExchange_RefAfterSwapOf_0102
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=55) returns 2751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0102 begin`);
      const actual: number = refAfterSwapOf(1, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(2751);
      logInfo(`${BUNDLE}RefAfterSwapOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0103
     * @tc.name      ListBeExchange_RefAfterSwapOf_0103
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=60) returns 3001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0103 begin`);
      const actual: number = refAfterSwapOf(1, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(3001);
      logInfo(`${BUNDLE}RefAfterSwapOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0104
     * @tc.name      ListBeExchange_RefAfterSwapOf_0104
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=65) returns 3251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0104 begin`);
      const actual: number = refAfterSwapOf(1, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(3251);
      logInfo(`${BUNDLE}RefAfterSwapOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0105
     * @tc.name      ListBeExchange_RefAfterSwapOf_0105
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=70) returns 3501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0105 begin`);
      const actual: number = refAfterSwapOf(1, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(3501);
      logInfo(`${BUNDLE}RefAfterSwapOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0106
     * @tc.name      ListBeExchange_RefAfterSwapOf_0106
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=75) returns 3751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0106 begin`);
      const actual: number = refAfterSwapOf(1, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(3751);
      logInfo(`${BUNDLE}RefAfterSwapOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0107
     * @tc.name      ListBeExchange_RefAfterSwapOf_0107
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=80) returns 4001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0107 begin`);
      const actual: number = refAfterSwapOf(1, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(4001);
      logInfo(`${BUNDLE}RefAfterSwapOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0108
     * @tc.name      ListBeExchange_RefAfterSwapOf_0108
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=85) returns 4251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0108 begin`);
      const actual: number = refAfterSwapOf(1, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(4251);
      logInfo(`${BUNDLE}RefAfterSwapOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0109
     * @tc.name      ListBeExchange_RefAfterSwapOf_0109
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=90) returns 4501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0109 begin`);
      const actual: number = refAfterSwapOf(1, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(4501);
      logInfo(`${BUNDLE}RefAfterSwapOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0110
     * @tc.name      ListBeExchange_RefAfterSwapOf_0110
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=95) returns 4751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0110 begin`);
      const actual: number = refAfterSwapOf(1, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(4751);
      logInfo(`${BUNDLE}RefAfterSwapOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0111
     * @tc.name      ListBeExchange_RefAfterSwapOf_0111
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=105) returns 5251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0111 begin`);
      const actual: number = refAfterSwapOf(1, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(5251);
      logInfo(`${BUNDLE}RefAfterSwapOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0112
     * @tc.name      ListBeExchange_RefAfterSwapOf_0112
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=110) returns 5501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0112 begin`);
      const actual: number = refAfterSwapOf(1, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(5501);
      logInfo(`${BUNDLE}RefAfterSwapOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0113
     * @tc.name      ListBeExchange_RefAfterSwapOf_0113
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=115) returns 5751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0113 begin`);
      const actual: number = refAfterSwapOf(1, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(5751);
      logInfo(`${BUNDLE}RefAfterSwapOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0114
     * @tc.name      ListBeExchange_RefAfterSwapOf_0114
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=78.64) returns 3933
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0114 begin`);
      const actual: number = refAfterSwapOf(1, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(3933);
      logInfo(`${BUNDLE}RefAfterSwapOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0115
     * @tc.name      ListBeExchange_RefAfterSwapOf_0115
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=37) returns 1851
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0115 begin`);
      const actual: number = refAfterSwapOf(1, 37);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(1851);
      logInfo(`${BUNDLE}RefAfterSwapOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0116
     * @tc.name      ListBeExchange_RefAfterSwapOf_0116
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=3) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0116 begin`);
      const actual: number = refAfterSwapOf(50, 3);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}RefAfterSwapOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0117
     * @tc.name      ListBeExchange_RefAfterSwapOf_0117
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=10) returns 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0117 begin`);
      const actual: number = refAfterSwapOf(50, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(550);
      logInfo(`${BUNDLE}RefAfterSwapOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0118
     * @tc.name      ListBeExchange_RefAfterSwapOf_0118
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=100) returns 5050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0118 begin`);
      const actual: number = refAfterSwapOf(50, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(5050);
      logInfo(`${BUNDLE}RefAfterSwapOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0119
     * @tc.name      ListBeExchange_RefAfterSwapOf_0119
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=5) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0119 begin`);
      const actual: number = refAfterSwapOf(50, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}RefAfterSwapOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0120
     * @tc.name      ListBeExchange_RefAfterSwapOf_0120
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=15) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0120 begin`);
      const actual: number = refAfterSwapOf(50, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}RefAfterSwapOf_0120 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0121
     * @tc.name      ListBeExchange_RefAfterSwapOf_0121
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=20) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0121 begin`);
      const actual: number = refAfterSwapOf(50, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(1050);
      logInfo(`${BUNDLE}RefAfterSwapOf_0121 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0122
     * @tc.name      ListBeExchange_RefAfterSwapOf_0122
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=25) returns 1300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0122 begin`);
      const actual: number = refAfterSwapOf(50, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(1300);
      logInfo(`${BUNDLE}RefAfterSwapOf_0122 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0123
     * @tc.name      ListBeExchange_RefAfterSwapOf_0123
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=30) returns 1550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0123 begin`);
      const actual: number = refAfterSwapOf(50, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(1550);
      logInfo(`${BUNDLE}RefAfterSwapOf_0123 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0124
     * @tc.name      ListBeExchange_RefAfterSwapOf_0124
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=35) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0124 begin`);
      const actual: number = refAfterSwapOf(50, 35);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}RefAfterSwapOf_0124 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0125
     * @tc.name      ListBeExchange_RefAfterSwapOf_0125
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=40) returns 2050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0125 begin`);
      const actual: number = refAfterSwapOf(50, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(2050);
      logInfo(`${BUNDLE}RefAfterSwapOf_0125 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0126
     * @tc.name      ListBeExchange_RefAfterSwapOf_0126
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=45) returns 2300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0126 begin`);
      const actual: number = refAfterSwapOf(50, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(2300);
      logInfo(`${BUNDLE}RefAfterSwapOf_0126 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0127
     * @tc.name      ListBeExchange_RefAfterSwapOf_0127
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=50) returns 2550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0127 begin`);
      const actual: number = refAfterSwapOf(50, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(2550);
      logInfo(`${BUNDLE}RefAfterSwapOf_0127 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0128
     * @tc.name      ListBeExchange_RefAfterSwapOf_0128
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=55) returns 2800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0128 begin`);
      const actual: number = refAfterSwapOf(50, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(2800);
      logInfo(`${BUNDLE}RefAfterSwapOf_0128 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0129
     * @tc.name      ListBeExchange_RefAfterSwapOf_0129
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=60) returns 3050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0129 begin`);
      const actual: number = refAfterSwapOf(50, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(3050);
      logInfo(`${BUNDLE}RefAfterSwapOf_0129 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0130
     * @tc.name      ListBeExchange_RefAfterSwapOf_0130
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=65) returns 3300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0130 begin`);
      const actual: number = refAfterSwapOf(50, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(3300);
      logInfo(`${BUNDLE}RefAfterSwapOf_0130 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0131
     * @tc.name      ListBeExchange_RefAfterSwapOf_0131
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=70) returns 3550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0131 begin`);
      const actual: number = refAfterSwapOf(50, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(3550);
      logInfo(`${BUNDLE}RefAfterSwapOf_0131 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0132
     * @tc.name      ListBeExchange_RefAfterSwapOf_0132
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=75) returns 3800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0132 begin`);
      const actual: number = refAfterSwapOf(50, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(3800);
      logInfo(`${BUNDLE}RefAfterSwapOf_0132 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0133
     * @tc.name      ListBeExchange_RefAfterSwapOf_0133
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=80) returns 4050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0133 begin`);
      const actual: number = refAfterSwapOf(50, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(4050);
      logInfo(`${BUNDLE}RefAfterSwapOf_0133 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0134
     * @tc.name      ListBeExchange_RefAfterSwapOf_0134
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=85) returns 4300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0134 begin`);
      const actual: number = refAfterSwapOf(50, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(4300);
      logInfo(`${BUNDLE}RefAfterSwapOf_0134 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0135
     * @tc.name      ListBeExchange_RefAfterSwapOf_0135
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=90) returns 4550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0135 begin`);
      const actual: number = refAfterSwapOf(50, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(4550);
      logInfo(`${BUNDLE}RefAfterSwapOf_0135 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0136
     * @tc.name      ListBeExchange_RefAfterSwapOf_0136
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=95) returns 4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0136 begin`);
      const actual: number = refAfterSwapOf(50, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(4800);
      logInfo(`${BUNDLE}RefAfterSwapOf_0136 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0137
     * @tc.name      ListBeExchange_RefAfterSwapOf_0137
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=105) returns 5300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0137 begin`);
      const actual: number = refAfterSwapOf(50, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(5300);
      logInfo(`${BUNDLE}RefAfterSwapOf_0137 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0138
     * @tc.name      ListBeExchange_RefAfterSwapOf_0138
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=110) returns 5550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0138 begin`);
      const actual: number = refAfterSwapOf(50, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(5550);
      logInfo(`${BUNDLE}RefAfterSwapOf_0138 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0139
     * @tc.name      ListBeExchange_RefAfterSwapOf_0139
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=115) returns 5800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0139 begin`);
      const actual: number = refAfterSwapOf(50, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(5800);
      logInfo(`${BUNDLE}RefAfterSwapOf_0139 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0140
     * @tc.name      ListBeExchange_RefAfterSwapOf_0140
     * @tc.desc      refAfterSwapOf(dragRefOffset=50, direction=78.64) returns 3982
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0140 begin`);
      const actual: number = refAfterSwapOf(50, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=50, directio...: actual=${actual}`);
      expect(actual).assertEqual(3982);
      logInfo(`${BUNDLE}RefAfterSwapOf_0140 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0141
     * @tc.name      ListBeExchange_RefAfterSwapOf_0141
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=10) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0141 begin`);
      const actual: number = refAfterSwapOf(100, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}RefAfterSwapOf_0141 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0142
     * @tc.name      ListBeExchange_RefAfterSwapOf_0142
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=100) returns 5100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0142 begin`);
      const actual: number = refAfterSwapOf(100, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(5100);
      logInfo(`${BUNDLE}RefAfterSwapOf_0142 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0143
     * @tc.name      ListBeExchange_RefAfterSwapOf_0143
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=5) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0143 begin`);
      const actual: number = refAfterSwapOf(100, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}RefAfterSwapOf_0143 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0144
     * @tc.name      ListBeExchange_RefAfterSwapOf_0144
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=15) returns 850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0144 begin`);
      const actual: number = refAfterSwapOf(100, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(850);
      logInfo(`${BUNDLE}RefAfterSwapOf_0144 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0145
     * @tc.name      ListBeExchange_RefAfterSwapOf_0145
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=20) returns 1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0145 begin`);
      const actual: number = refAfterSwapOf(100, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}RefAfterSwapOf_0145 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0146
     * @tc.name      ListBeExchange_RefAfterSwapOf_0146
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=25) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0146 begin`);
      const actual: number = refAfterSwapOf(100, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}RefAfterSwapOf_0146 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0147
     * @tc.name      ListBeExchange_RefAfterSwapOf_0147
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=30) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0147 begin`);
      const actual: number = refAfterSwapOf(100, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}RefAfterSwapOf_0147 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0148
     * @tc.name      ListBeExchange_RefAfterSwapOf_0148
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=40) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0148 begin`);
      const actual: number = refAfterSwapOf(100, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}RefAfterSwapOf_0148 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0149
     * @tc.name      ListBeExchange_RefAfterSwapOf_0149
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=45) returns 2350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0149 begin`);
      const actual: number = refAfterSwapOf(100, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(2350);
      logInfo(`${BUNDLE}RefAfterSwapOf_0149 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0150
     * @tc.name      ListBeExchange_RefAfterSwapOf_0150
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=50) returns 2600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0150 begin`);
      const actual: number = refAfterSwapOf(100, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(2600);
      logInfo(`${BUNDLE}RefAfterSwapOf_0150 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0151
     * @tc.name      ListBeExchange_RefAfterSwapOf_0151
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=55) returns 2850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0151 begin`);
      const actual: number = refAfterSwapOf(100, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(2850);
      logInfo(`${BUNDLE}RefAfterSwapOf_0151 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0152
     * @tc.name      ListBeExchange_RefAfterSwapOf_0152
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=60) returns 3100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0152 begin`);
      const actual: number = refAfterSwapOf(100, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(3100);
      logInfo(`${BUNDLE}RefAfterSwapOf_0152 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0153
     * @tc.name      ListBeExchange_RefAfterSwapOf_0153
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=65) returns 3350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0153 begin`);
      const actual: number = refAfterSwapOf(100, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(3350);
      logInfo(`${BUNDLE}RefAfterSwapOf_0153 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0154
     * @tc.name      ListBeExchange_RefAfterSwapOf_0154
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=70) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0154 begin`);
      const actual: number = refAfterSwapOf(100, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}RefAfterSwapOf_0154 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0155
     * @tc.name      ListBeExchange_RefAfterSwapOf_0155
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=75) returns 3850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0155 begin`);
      const actual: number = refAfterSwapOf(100, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(3850);
      logInfo(`${BUNDLE}RefAfterSwapOf_0155 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0156
     * @tc.name      ListBeExchange_RefAfterSwapOf_0156
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=80) returns 4100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0156 begin`);
      const actual: number = refAfterSwapOf(100, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(4100);
      logInfo(`${BUNDLE}RefAfterSwapOf_0156 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0157
     * @tc.name      ListBeExchange_RefAfterSwapOf_0157
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=85) returns 4350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0157 begin`);
      const actual: number = refAfterSwapOf(100, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(4350);
      logInfo(`${BUNDLE}RefAfterSwapOf_0157 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0158
     * @tc.name      ListBeExchange_RefAfterSwapOf_0158
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=90) returns 4600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0158 begin`);
      const actual: number = refAfterSwapOf(100, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(4600);
      logInfo(`${BUNDLE}RefAfterSwapOf_0158 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0159
     * @tc.name      ListBeExchange_RefAfterSwapOf_0159
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=95) returns 4850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0159 begin`);
      const actual: number = refAfterSwapOf(100, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(4850);
      logInfo(`${BUNDLE}RefAfterSwapOf_0159 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0160
     * @tc.name      ListBeExchange_RefAfterSwapOf_0160
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=105) returns 5350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0160 begin`);
      const actual: number = refAfterSwapOf(100, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(5350);
      logInfo(`${BUNDLE}RefAfterSwapOf_0160 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0161
     * @tc.name      ListBeExchange_RefAfterSwapOf_0161
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=110) returns 5600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0161 begin`);
      const actual: number = refAfterSwapOf(100, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(5600);
      logInfo(`${BUNDLE}RefAfterSwapOf_0161 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0162
     * @tc.name      ListBeExchange_RefAfterSwapOf_0162
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=115) returns 5850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0162 begin`);
      const actual: number = refAfterSwapOf(100, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(5850);
      logInfo(`${BUNDLE}RefAfterSwapOf_0162 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0163
     * @tc.name      ListBeExchange_RefAfterSwapOf_0163
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=78.64) returns 4032
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0163 begin`);
      const actual: number = refAfterSwapOf(100, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(4032);
      logInfo(`${BUNDLE}RefAfterSwapOf_0163 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0164
     * @tc.name      ListBeExchange_RefAfterSwapOf_0164
     * @tc.desc      refAfterSwapOf(dragRefOffset=100, direction=37) returns 1950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0164 begin`);
      const actual: number = refAfterSwapOf(100, 37);
      logInfo(`refAfterSwapOf(dragRefOffset=100, directi...: actual=${actual}`);
      expect(actual).assertEqual(1950);
      logInfo(`${BUNDLE}RefAfterSwapOf_0164 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0165
     * @tc.name      ListBeExchange_RefAfterSwapOf_0165
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0165 begin`);
      const actual: number = refAfterSwapOf(2, 0);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RefAfterSwapOf_0165 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0166
     * @tc.name      ListBeExchange_RefAfterSwapOf_0166
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=1) returns 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0166 begin`);
      const actual: number = refAfterSwapOf(2, 1);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction=1): actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`${BUNDLE}RefAfterSwapOf_0166 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0167
     * @tc.name      ListBeExchange_RefAfterSwapOf_0167
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=-1) returns -48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0167 begin`);
      const actual: number = refAfterSwapOf(2, -1);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(-48);
      logInfo(`${BUNDLE}RefAfterSwapOf_0167 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0168
     * @tc.name      ListBeExchange_RefAfterSwapOf_0168
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=2) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0168 begin`);
      const actual: number = refAfterSwapOf(2, 2);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction=2): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}RefAfterSwapOf_0168 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0169
     * @tc.name      ListBeExchange_RefAfterSwapOf_0169
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=3) returns 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0169 begin`);
      const actual: number = refAfterSwapOf(2, 3);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction=3): actual=${actual}`);
      expect(actual).assertEqual(152);
      logInfo(`${BUNDLE}RefAfterSwapOf_0169 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0170
     * @tc.name      ListBeExchange_RefAfterSwapOf_0170
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=10) returns 502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0170 begin`);
      const actual: number = refAfterSwapOf(2, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(502);
      logInfo(`${BUNDLE}RefAfterSwapOf_0170 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0171
     * @tc.name      ListBeExchange_RefAfterSwapOf_0171
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=100) returns 5002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0171 begin`);
      const actual: number = refAfterSwapOf(2, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(5002);
      logInfo(`${BUNDLE}RefAfterSwapOf_0171 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0172
     * @tc.name      ListBeExchange_RefAfterSwapOf_0172
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=5) returns 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0172 begin`);
      const actual: number = refAfterSwapOf(2, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction=5): actual=${actual}`);
      expect(actual).assertEqual(252);
      logInfo(`${BUNDLE}RefAfterSwapOf_0172 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0173
     * @tc.name      ListBeExchange_RefAfterSwapOf_0173
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=15) returns 752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0173 begin`);
      const actual: number = refAfterSwapOf(2, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(752);
      logInfo(`${BUNDLE}RefAfterSwapOf_0173 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0174
     * @tc.name      ListBeExchange_RefAfterSwapOf_0174
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=20) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0174 begin`);
      const actual: number = refAfterSwapOf(2, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}RefAfterSwapOf_0174 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0175
     * @tc.name      ListBeExchange_RefAfterSwapOf_0175
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=25) returns 1252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0175 begin`);
      const actual: number = refAfterSwapOf(2, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(1252);
      logInfo(`${BUNDLE}RefAfterSwapOf_0175 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0176
     * @tc.name      ListBeExchange_RefAfterSwapOf_0176
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=30) returns 1502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0176 begin`);
      const actual: number = refAfterSwapOf(2, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(1502);
      logInfo(`${BUNDLE}RefAfterSwapOf_0176 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0177
     * @tc.name      ListBeExchange_RefAfterSwapOf_0177
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=35) returns 1752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0177 begin`);
      const actual: number = refAfterSwapOf(2, 35);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(1752);
      logInfo(`${BUNDLE}RefAfterSwapOf_0177 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0178
     * @tc.name      ListBeExchange_RefAfterSwapOf_0178
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=40) returns 2002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0178 begin`);
      const actual: number = refAfterSwapOf(2, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(2002);
      logInfo(`${BUNDLE}RefAfterSwapOf_0178 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0179
     * @tc.name      ListBeExchange_RefAfterSwapOf_0179
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=45) returns 2252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0179 begin`);
      const actual: number = refAfterSwapOf(2, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(2252);
      logInfo(`${BUNDLE}RefAfterSwapOf_0179 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0180
     * @tc.name      ListBeExchange_RefAfterSwapOf_0180
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=50) returns 2502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0180 begin`);
      const actual: number = refAfterSwapOf(2, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(2502);
      logInfo(`${BUNDLE}RefAfterSwapOf_0180 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0181
     * @tc.name      ListBeExchange_RefAfterSwapOf_0181
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=55) returns 2752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0181 begin`);
      const actual: number = refAfterSwapOf(2, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(2752);
      logInfo(`${BUNDLE}RefAfterSwapOf_0181 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0182
     * @tc.name      ListBeExchange_RefAfterSwapOf_0182
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=60) returns 3002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0182 begin`);
      const actual: number = refAfterSwapOf(2, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(3002);
      logInfo(`${BUNDLE}RefAfterSwapOf_0182 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0183
     * @tc.name      ListBeExchange_RefAfterSwapOf_0183
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=65) returns 3252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0183 begin`);
      const actual: number = refAfterSwapOf(2, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(3252);
      logInfo(`${BUNDLE}RefAfterSwapOf_0183 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0184
     * @tc.name      ListBeExchange_RefAfterSwapOf_0184
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=70) returns 3502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0184 begin`);
      const actual: number = refAfterSwapOf(2, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(3502);
      logInfo(`${BUNDLE}RefAfterSwapOf_0184 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0185
     * @tc.name      ListBeExchange_RefAfterSwapOf_0185
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=75) returns 3752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0185 begin`);
      const actual: number = refAfterSwapOf(2, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(3752);
      logInfo(`${BUNDLE}RefAfterSwapOf_0185 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0186
     * @tc.name      ListBeExchange_RefAfterSwapOf_0186
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=80) returns 4002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0186 begin`);
      const actual: number = refAfterSwapOf(2, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(4002);
      logInfo(`${BUNDLE}RefAfterSwapOf_0186 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0187
     * @tc.name      ListBeExchange_RefAfterSwapOf_0187
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=85) returns 4252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0187 begin`);
      const actual: number = refAfterSwapOf(2, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(4252);
      logInfo(`${BUNDLE}RefAfterSwapOf_0187 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0188
     * @tc.name      ListBeExchange_RefAfterSwapOf_0188
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=90) returns 4502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0188 begin`);
      const actual: number = refAfterSwapOf(2, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(4502);
      logInfo(`${BUNDLE}RefAfterSwapOf_0188 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0189
     * @tc.name      ListBeExchange_RefAfterSwapOf_0189
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=95) returns 4752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0189 begin`);
      const actual: number = refAfterSwapOf(2, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(4752);
      logInfo(`${BUNDLE}RefAfterSwapOf_0189 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0190
     * @tc.name      ListBeExchange_RefAfterSwapOf_0190
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=105) returns 5252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0190 begin`);
      const actual: number = refAfterSwapOf(2, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(5252);
      logInfo(`${BUNDLE}RefAfterSwapOf_0190 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0191
     * @tc.name      ListBeExchange_RefAfterSwapOf_0191
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=110) returns 5502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0191 begin`);
      const actual: number = refAfterSwapOf(2, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(5502);
      logInfo(`${BUNDLE}RefAfterSwapOf_0191 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0192
     * @tc.name      ListBeExchange_RefAfterSwapOf_0192
     * @tc.desc      refAfterSwapOf(dragRefOffset=2, direction=115) returns 5752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0192 begin`);
      const actual: number = refAfterSwapOf(2, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=2, direction...: actual=${actual}`);
      expect(actual).assertEqual(5752);
      logInfo(`${BUNDLE}RefAfterSwapOf_0192 end`);
    });
  });
}
