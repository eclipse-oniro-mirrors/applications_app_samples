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
import { relativeOffsetOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for relativeOffsetOf (96 cases). */
export default function relativeOffsetOf2Test(): void {
  describe('RelativeOffsetOf2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0097
     * @tc.name      ListBeExchange_RelativeOffsetOf_0097
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=80) returns -79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0097 begin`);
      const actual: number = relativeOffsetOf(1, 80);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-79);
      logInfo(`${BUNDLE}RelativeOffsetOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0098
     * @tc.name      ListBeExchange_RelativeOffsetOf_0098
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=85) returns -84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0098 begin`);
      const actual: number = relativeOffsetOf(1, 85);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-84);
      logInfo(`${BUNDLE}RelativeOffsetOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0099
     * @tc.name      ListBeExchange_RelativeOffsetOf_0099
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=90) returns -89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0099 begin`);
      const actual: number = relativeOffsetOf(1, 90);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-89);
      logInfo(`${BUNDLE}RelativeOffsetOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0100
     * @tc.name      ListBeExchange_RelativeOffsetOf_0100
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=95) returns -94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0100 begin`);
      const actual: number = relativeOffsetOf(1, 95);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-94);
      logInfo(`${BUNDLE}RelativeOffsetOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0101
     * @tc.name      ListBeExchange_RelativeOffsetOf_0101
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=105) returns -104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0101 begin`);
      const actual: number = relativeOffsetOf(1, 105);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-104);
      logInfo(`${BUNDLE}RelativeOffsetOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0102
     * @tc.name      ListBeExchange_RelativeOffsetOf_0102
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=133) returns -132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0102 begin`);
      const actual: number = relativeOffsetOf(1, 133);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-132);
      logInfo(`${BUNDLE}RelativeOffsetOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0103
     * @tc.name      ListBeExchange_RelativeOffsetOf_0103
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=143) returns -142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0103 begin`);
      const actual: number = relativeOffsetOf(1, 143);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-142);
      logInfo(`${BUNDLE}RelativeOffsetOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0104
     * @tc.name      ListBeExchange_RelativeOffsetOf_0104
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=-100) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0104 begin`);
      const actual: number = relativeOffsetOf(50, -100);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RelativeOffsetOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0105
     * @tc.name      ListBeExchange_RelativeOffsetOf_0105
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=-1) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0105 begin`);
      const actual: number = relativeOffsetOf(50, -1);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}RelativeOffsetOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0106
     * @tc.name      ListBeExchange_RelativeOffsetOf_0106
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=0) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0106 begin`);
      const actual: number = relativeOffsetOf(50, 0);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RelativeOffsetOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0107
     * @tc.name      ListBeExchange_RelativeOffsetOf_0107
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=1) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0107 begin`);
      const actual: number = relativeOffsetOf(50, 1);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}RelativeOffsetOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0108
     * @tc.name      ListBeExchange_RelativeOffsetOf_0108
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=2) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0108 begin`);
      const actual: number = relativeOffsetOf(50, 2);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}RelativeOffsetOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0109
     * @tc.name      ListBeExchange_RelativeOffsetOf_0109
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=3) returns 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0109 begin`);
      const actual: number = relativeOffsetOf(50, 3);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(47);
      logInfo(`${BUNDLE}RelativeOffsetOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0110
     * @tc.name      ListBeExchange_RelativeOffsetOf_0110
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=10) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0110 begin`);
      const actual: number = relativeOffsetOf(50, 10);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RelativeOffsetOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0111
     * @tc.name      ListBeExchange_RelativeOffsetOf_0111
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=5) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0111 begin`);
      const actual: number = relativeOffsetOf(50, 5);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}RelativeOffsetOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0112
     * @tc.name      ListBeExchange_RelativeOffsetOf_0112
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=15) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0112 begin`);
      const actual: number = relativeOffsetOf(50, 15);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RelativeOffsetOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0113
     * @tc.name      ListBeExchange_RelativeOffsetOf_0113
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=20) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0113 begin`);
      const actual: number = relativeOffsetOf(50, 20);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RelativeOffsetOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0114
     * @tc.name      ListBeExchange_RelativeOffsetOf_0114
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0114 begin`);
      const actual: number = relativeOffsetOf(50, 25);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RelativeOffsetOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0115
     * @tc.name      ListBeExchange_RelativeOffsetOf_0115
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=30) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0115 begin`);
      const actual: number = relativeOffsetOf(50, 30);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RelativeOffsetOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0116
     * @tc.name      ListBeExchange_RelativeOffsetOf_0116
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=35) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0116 begin`);
      const actual: number = relativeOffsetOf(50, 35);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RelativeOffsetOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0117
     * @tc.name      ListBeExchange_RelativeOffsetOf_0117
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=40) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0117 begin`);
      const actual: number = relativeOffsetOf(50, 40);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RelativeOffsetOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0118
     * @tc.name      ListBeExchange_RelativeOffsetOf_0118
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=45) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0118 begin`);
      const actual: number = relativeOffsetOf(50, 45);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RelativeOffsetOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0119
     * @tc.name      ListBeExchange_RelativeOffsetOf_0119
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=133) returns -83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0119 begin`);
      const actual: number = relativeOffsetOf(50, 133);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-83);
      logInfo(`${BUNDLE}RelativeOffsetOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0120
     * @tc.name      ListBeExchange_RelativeOffsetOf_0120
     * @tc.desc      relativeOffsetOf(offsetY=50, dragRefOffset=143) returns -93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0120 begin`);
      const actual: number = relativeOffsetOf(50, 143);
      logInfo(`relativeOffsetOf(offsetY=50, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-93);
      logInfo(`${BUNDLE}RelativeOffsetOf_0120 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0121
     * @tc.name      ListBeExchange_RelativeOffsetOf_0121
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=-100) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0121 begin`);
      const actual: number = relativeOffsetOf(100, -100);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}RelativeOffsetOf_0121 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0122
     * @tc.name      ListBeExchange_RelativeOffsetOf_0122
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=2) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0122 begin`);
      const actual: number = relativeOffsetOf(100, 2);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}RelativeOffsetOf_0122 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0123
     * @tc.name      ListBeExchange_RelativeOffsetOf_0123
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=3) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0123 begin`);
      const actual: number = relativeOffsetOf(100, 3);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}RelativeOffsetOf_0123 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0124
     * @tc.name      ListBeExchange_RelativeOffsetOf_0124
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=10) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0124 begin`);
      const actual: number = relativeOffsetOf(100, 10);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RelativeOffsetOf_0124 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0125
     * @tc.name      ListBeExchange_RelativeOffsetOf_0125
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=5) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0125 begin`);
      const actual: number = relativeOffsetOf(100, 5);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}RelativeOffsetOf_0125 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0126
     * @tc.name      ListBeExchange_RelativeOffsetOf_0126
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=15) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0126 begin`);
      const actual: number = relativeOffsetOf(100, 15);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}RelativeOffsetOf_0126 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0127
     * @tc.name      ListBeExchange_RelativeOffsetOf_0127
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=20) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0127 begin`);
      const actual: number = relativeOffsetOf(100, 20);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RelativeOffsetOf_0127 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0128
     * @tc.name      ListBeExchange_RelativeOffsetOf_0128
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=25) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0128 begin`);
      const actual: number = relativeOffsetOf(100, 25);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}RelativeOffsetOf_0128 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0129
     * @tc.name      ListBeExchange_RelativeOffsetOf_0129
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=30) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0129 begin`);
      const actual: number = relativeOffsetOf(100, 30);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RelativeOffsetOf_0129 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0130
     * @tc.name      ListBeExchange_RelativeOffsetOf_0130
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=35) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0130 begin`);
      const actual: number = relativeOffsetOf(100, 35);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RelativeOffsetOf_0130 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0131
     * @tc.name      ListBeExchange_RelativeOffsetOf_0131
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=40) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0131 begin`);
      const actual: number = relativeOffsetOf(100, 40);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RelativeOffsetOf_0131 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0132
     * @tc.name      ListBeExchange_RelativeOffsetOf_0132
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=45) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0132 begin`);
      const actual: number = relativeOffsetOf(100, 45);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}RelativeOffsetOf_0132 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0133
     * @tc.name      ListBeExchange_RelativeOffsetOf_0133
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=133) returns -33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0133 begin`);
      const actual: number = relativeOffsetOf(100, 133);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(-33);
      logInfo(`${BUNDLE}RelativeOffsetOf_0133 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0134
     * @tc.name      ListBeExchange_RelativeOffsetOf_0134
     * @tc.desc      relativeOffsetOf(offsetY=100, dragRefOffset=143) returns -43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0134 begin`);
      const actual: number = relativeOffsetOf(100, 143);
      logInfo(`relativeOffsetOf(offsetY=100, dragRefOffs...: actual=${actual}`);
      expect(actual).assertEqual(-43);
      logInfo(`${BUNDLE}RelativeOffsetOf_0134 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0135
     * @tc.name      ListBeExchange_RelativeOffsetOf_0135
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=-100) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0135 begin`);
      const actual: number = relativeOffsetOf(2, -100);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}RelativeOffsetOf_0135 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0136
     * @tc.name      ListBeExchange_RelativeOffsetOf_0136
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0136 begin`);
      const actual: number = relativeOffsetOf(2, -1);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RelativeOffsetOf_0136 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0137
     * @tc.name      ListBeExchange_RelativeOffsetOf_0137
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=50) returns -48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0137 begin`);
      const actual: number = relativeOffsetOf(2, 50);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-48);
      logInfo(`${BUNDLE}RelativeOffsetOf_0137 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0138
     * @tc.name      ListBeExchange_RelativeOffsetOf_0138
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=100) returns -98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0138 begin`);
      const actual: number = relativeOffsetOf(2, 100);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-98);
      logInfo(`${BUNDLE}RelativeOffsetOf_0138 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0139
     * @tc.name      ListBeExchange_RelativeOffsetOf_0139
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=10) returns -8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0139 begin`);
      const actual: number = relativeOffsetOf(2, 10);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-8);
      logInfo(`${BUNDLE}RelativeOffsetOf_0139 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0140
     * @tc.name      ListBeExchange_RelativeOffsetOf_0140
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=15) returns -13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0140 begin`);
      const actual: number = relativeOffsetOf(2, 15);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-13);
      logInfo(`${BUNDLE}RelativeOffsetOf_0140 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0141
     * @tc.name      ListBeExchange_RelativeOffsetOf_0141
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=20) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0141 begin`);
      const actual: number = relativeOffsetOf(2, 20);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}RelativeOffsetOf_0141 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0142
     * @tc.name      ListBeExchange_RelativeOffsetOf_0142
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=25) returns -23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0142 begin`);
      const actual: number = relativeOffsetOf(2, 25);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-23);
      logInfo(`${BUNDLE}RelativeOffsetOf_0142 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0143
     * @tc.name      ListBeExchange_RelativeOffsetOf_0143
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=30) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0143 begin`);
      const actual: number = relativeOffsetOf(2, 30);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}RelativeOffsetOf_0143 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0144
     * @tc.name      ListBeExchange_RelativeOffsetOf_0144
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=40) returns -38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0144 begin`);
      const actual: number = relativeOffsetOf(2, 40);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-38);
      logInfo(`${BUNDLE}RelativeOffsetOf_0144 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0145
     * @tc.name      ListBeExchange_RelativeOffsetOf_0145
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=55) returns -53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0145 begin`);
      const actual: number = relativeOffsetOf(2, 55);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-53);
      logInfo(`${BUNDLE}RelativeOffsetOf_0145 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0146
     * @tc.name      ListBeExchange_RelativeOffsetOf_0146
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=60) returns -58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0146 begin`);
      const actual: number = relativeOffsetOf(2, 60);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-58);
      logInfo(`${BUNDLE}RelativeOffsetOf_0146 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0147
     * @tc.name      ListBeExchange_RelativeOffsetOf_0147
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=65) returns -63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0147 begin`);
      const actual: number = relativeOffsetOf(2, 65);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-63);
      logInfo(`${BUNDLE}RelativeOffsetOf_0147 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0148
     * @tc.name      ListBeExchange_RelativeOffsetOf_0148
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=70) returns -68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0148 begin`);
      const actual: number = relativeOffsetOf(2, 70);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-68);
      logInfo(`${BUNDLE}RelativeOffsetOf_0148 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0149
     * @tc.name      ListBeExchange_RelativeOffsetOf_0149
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=75) returns -73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0149 begin`);
      const actual: number = relativeOffsetOf(2, 75);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-73);
      logInfo(`${BUNDLE}RelativeOffsetOf_0149 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0150
     * @tc.name      ListBeExchange_RelativeOffsetOf_0150
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=80) returns -78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0150 begin`);
      const actual: number = relativeOffsetOf(2, 80);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-78);
      logInfo(`${BUNDLE}RelativeOffsetOf_0150 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0151
     * @tc.name      ListBeExchange_RelativeOffsetOf_0151
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=90) returns -88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0151 begin`);
      const actual: number = relativeOffsetOf(2, 90);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-88);
      logInfo(`${BUNDLE}RelativeOffsetOf_0151 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0152
     * @tc.name      ListBeExchange_RelativeOffsetOf_0152
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=133) returns -131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0152 begin`);
      const actual: number = relativeOffsetOf(2, 133);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-131);
      logInfo(`${BUNDLE}RelativeOffsetOf_0152 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0153
     * @tc.name      ListBeExchange_RelativeOffsetOf_0153
     * @tc.desc      relativeOffsetOf(offsetY=2, dragRefOffset=143) returns -141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0153 begin`);
      const actual: number = relativeOffsetOf(2, 143);
      logInfo(`relativeOffsetOf(offsetY=2, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-141);
      logInfo(`${BUNDLE}RelativeOffsetOf_0153 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0154
     * @tc.name      ListBeExchange_RelativeOffsetOf_0154
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=-100) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0154 begin`);
      const actual: number = relativeOffsetOf(3, -100);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}RelativeOffsetOf_0154 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0155
     * @tc.name      ListBeExchange_RelativeOffsetOf_0155
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=-1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0155 begin`);
      const actual: number = relativeOffsetOf(3, -1);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RelativeOffsetOf_0155 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0156
     * @tc.name      ListBeExchange_RelativeOffsetOf_0156
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=50) returns -47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0156 begin`);
      const actual: number = relativeOffsetOf(3, 50);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-47);
      logInfo(`${BUNDLE}RelativeOffsetOf_0156 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0157
     * @tc.name      ListBeExchange_RelativeOffsetOf_0157
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=100) returns -97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0157 begin`);
      const actual: number = relativeOffsetOf(3, 100);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-97);
      logInfo(`${BUNDLE}RelativeOffsetOf_0157 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0158
     * @tc.name      ListBeExchange_RelativeOffsetOf_0158
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=10) returns -7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0158 begin`);
      const actual: number = relativeOffsetOf(3, 10);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-7);
      logInfo(`${BUNDLE}RelativeOffsetOf_0158 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0159
     * @tc.name      ListBeExchange_RelativeOffsetOf_0159
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=15) returns -12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0159 begin`);
      const actual: number = relativeOffsetOf(3, 15);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-12);
      logInfo(`${BUNDLE}RelativeOffsetOf_0159 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0160
     * @tc.name      ListBeExchange_RelativeOffsetOf_0160
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=20) returns -17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0160 begin`);
      const actual: number = relativeOffsetOf(3, 20);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-17);
      logInfo(`${BUNDLE}RelativeOffsetOf_0160 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0161
     * @tc.name      ListBeExchange_RelativeOffsetOf_0161
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=25) returns -22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0161 begin`);
      const actual: number = relativeOffsetOf(3, 25);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-22);
      logInfo(`${BUNDLE}RelativeOffsetOf_0161 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0162
     * @tc.name      ListBeExchange_RelativeOffsetOf_0162
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=30) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0162 begin`);
      const actual: number = relativeOffsetOf(3, 30);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}RelativeOffsetOf_0162 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0163
     * @tc.name      ListBeExchange_RelativeOffsetOf_0163
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=35) returns -32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0163 begin`);
      const actual: number = relativeOffsetOf(3, 35);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-32);
      logInfo(`${BUNDLE}RelativeOffsetOf_0163 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0164
     * @tc.name      ListBeExchange_RelativeOffsetOf_0164
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=40) returns -37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0164 begin`);
      const actual: number = relativeOffsetOf(3, 40);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-37);
      logInfo(`${BUNDLE}RelativeOffsetOf_0164 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0165
     * @tc.name      ListBeExchange_RelativeOffsetOf_0165
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=45) returns -42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0165 begin`);
      const actual: number = relativeOffsetOf(3, 45);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-42);
      logInfo(`${BUNDLE}RelativeOffsetOf_0165 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0166
     * @tc.name      ListBeExchange_RelativeOffsetOf_0166
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=55) returns -52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0166 begin`);
      const actual: number = relativeOffsetOf(3, 55);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-52);
      logInfo(`${BUNDLE}RelativeOffsetOf_0166 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0167
     * @tc.name      ListBeExchange_RelativeOffsetOf_0167
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=60) returns -57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0167 begin`);
      const actual: number = relativeOffsetOf(3, 60);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-57);
      logInfo(`${BUNDLE}RelativeOffsetOf_0167 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0168
     * @tc.name      ListBeExchange_RelativeOffsetOf_0168
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=65) returns -62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0168 begin`);
      const actual: number = relativeOffsetOf(3, 65);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-62);
      logInfo(`${BUNDLE}RelativeOffsetOf_0168 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0169
     * @tc.name      ListBeExchange_RelativeOffsetOf_0169
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=70) returns -67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0169 begin`);
      const actual: number = relativeOffsetOf(3, 70);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-67);
      logInfo(`${BUNDLE}RelativeOffsetOf_0169 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0170
     * @tc.name      ListBeExchange_RelativeOffsetOf_0170
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=75) returns -72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0170 begin`);
      const actual: number = relativeOffsetOf(3, 75);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-72);
      logInfo(`${BUNDLE}RelativeOffsetOf_0170 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0171
     * @tc.name      ListBeExchange_RelativeOffsetOf_0171
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=80) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0171 begin`);
      const actual: number = relativeOffsetOf(3, 80);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}RelativeOffsetOf_0171 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0172
     * @tc.name      ListBeExchange_RelativeOffsetOf_0172
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=85) returns -82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0172 begin`);
      const actual: number = relativeOffsetOf(3, 85);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-82);
      logInfo(`${BUNDLE}RelativeOffsetOf_0172 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0173
     * @tc.name      ListBeExchange_RelativeOffsetOf_0173
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=90) returns -87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0173 begin`);
      const actual: number = relativeOffsetOf(3, 90);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-87);
      logInfo(`${BUNDLE}RelativeOffsetOf_0173 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0174
     * @tc.name      ListBeExchange_RelativeOffsetOf_0174
     * @tc.desc      relativeOffsetOf(offsetY=3, dragRefOffset=95) returns -92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0174 begin`);
      const actual: number = relativeOffsetOf(3, 95);
      logInfo(`relativeOffsetOf(offsetY=3, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-92);
      logInfo(`${BUNDLE}RelativeOffsetOf_0174 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0175
     * @tc.name      ListBeExchange_RelativeOffsetOf_0175
     * @tc.desc      relativeOffsetOf(offsetY=10, dragRefOffset=-100) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0175 begin`);
      const actual: number = relativeOffsetOf(10, -100);
      logInfo(`relativeOffsetOf(offsetY=10, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RelativeOffsetOf_0175 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0176
     * @tc.name      ListBeExchange_RelativeOffsetOf_0176
     * @tc.desc      relativeOffsetOf(offsetY=10, dragRefOffset=-1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0176 begin`);
      const actual: number = relativeOffsetOf(10, -1);
      logInfo(`relativeOffsetOf(offsetY=10, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}RelativeOffsetOf_0176 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0177
     * @tc.name      ListBeExchange_RelativeOffsetOf_0177
     * @tc.desc      relativeOffsetOf(offsetY=10, dragRefOffset=1) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0177 begin`);
      const actual: number = relativeOffsetOf(10, 1);
      logInfo(`relativeOffsetOf(offsetY=10, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}RelativeOffsetOf_0177 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0178
     * @tc.name      ListBeExchange_RelativeOffsetOf_0178
     * @tc.desc      relativeOffsetOf(offsetY=10, dragRefOffset=2) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0178 begin`);
      const actual: number = relativeOffsetOf(10, 2);
      logInfo(`relativeOffsetOf(offsetY=10, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RelativeOffsetOf_0178 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0179
     * @tc.name      ListBeExchange_RelativeOffsetOf_0179
     * @tc.desc      relativeOffsetOf(offsetY=10, dragRefOffset=3) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0179 begin`);
      const actual: number = relativeOffsetOf(10, 3);
      logInfo(`relativeOffsetOf(offsetY=10, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}RelativeOffsetOf_0179 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0180
     * @tc.name      ListBeExchange_RelativeOffsetOf_0180
     * @tc.desc      relativeOffsetOf(offsetY=10, dragRefOffset=133) returns -123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0180 begin`);
      const actual: number = relativeOffsetOf(10, 133);
      logInfo(`relativeOffsetOf(offsetY=10, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-123);
      logInfo(`${BUNDLE}RelativeOffsetOf_0180 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0181
     * @tc.name      ListBeExchange_RelativeOffsetOf_0181
     * @tc.desc      relativeOffsetOf(offsetY=10, dragRefOffset=134) returns -124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0181 begin`);
      const actual: number = relativeOffsetOf(10, 134);
      logInfo(`relativeOffsetOf(offsetY=10, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-124);
      logInfo(`${BUNDLE}RelativeOffsetOf_0181 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0182
     * @tc.name      ListBeExchange_RelativeOffsetOf_0182
     * @tc.desc      relativeOffsetOf(offsetY=5, dragRefOffset=-100) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0182 begin`);
      const actual: number = relativeOffsetOf(5, -100);
      logInfo(`relativeOffsetOf(offsetY=5, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RelativeOffsetOf_0182 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0183
     * @tc.name      ListBeExchange_RelativeOffsetOf_0183
     * @tc.desc      relativeOffsetOf(offsetY=5, dragRefOffset=-1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0183 begin`);
      const actual: number = relativeOffsetOf(5, -1);
      logInfo(`relativeOffsetOf(offsetY=5, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}RelativeOffsetOf_0183 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0184
     * @tc.name      ListBeExchange_RelativeOffsetOf_0184
     * @tc.desc      relativeOffsetOf(offsetY=5, dragRefOffset=133) returns -128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0184 begin`);
      const actual: number = relativeOffsetOf(5, 133);
      logInfo(`relativeOffsetOf(offsetY=5, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-128);
      logInfo(`${BUNDLE}RelativeOffsetOf_0184 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0185
     * @tc.name      ListBeExchange_RelativeOffsetOf_0185
     * @tc.desc      relativeOffsetOf(offsetY=5, dragRefOffset=134) returns -129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0185 begin`);
      const actual: number = relativeOffsetOf(5, 134);
      logInfo(`relativeOffsetOf(offsetY=5, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-129);
      logInfo(`${BUNDLE}RelativeOffsetOf_0185 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0186
     * @tc.name      ListBeExchange_RelativeOffsetOf_0186
     * @tc.desc      relativeOffsetOf(offsetY=5, dragRefOffset=143) returns -138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0186 begin`);
      const actual: number = relativeOffsetOf(5, 143);
      logInfo(`relativeOffsetOf(offsetY=5, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-138);
      logInfo(`${BUNDLE}RelativeOffsetOf_0186 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0187
     * @tc.name      ListBeExchange_RelativeOffsetOf_0187
     * @tc.desc      relativeOffsetOf(offsetY=15, dragRefOffset=-100) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0187 begin`);
      const actual: number = relativeOffsetOf(15, -100);
      logInfo(`relativeOffsetOf(offsetY=15, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}RelativeOffsetOf_0187 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0188
     * @tc.name      ListBeExchange_RelativeOffsetOf_0188
     * @tc.desc      relativeOffsetOf(offsetY=15, dragRefOffset=-1) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0188 begin`);
      const actual: number = relativeOffsetOf(15, -1);
      logInfo(`relativeOffsetOf(offsetY=15, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}RelativeOffsetOf_0188 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0189
     * @tc.name      ListBeExchange_RelativeOffsetOf_0189
     * @tc.desc      relativeOffsetOf(offsetY=15, dragRefOffset=1) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0189 begin`);
      const actual: number = relativeOffsetOf(15, 1);
      logInfo(`relativeOffsetOf(offsetY=15, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RelativeOffsetOf_0189 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0190
     * @tc.name      ListBeExchange_RelativeOffsetOf_0190
     * @tc.desc      relativeOffsetOf(offsetY=15, dragRefOffset=2) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0190 begin`);
      const actual: number = relativeOffsetOf(15, 2);
      logInfo(`relativeOffsetOf(offsetY=15, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}RelativeOffsetOf_0190 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0191
     * @tc.name      ListBeExchange_RelativeOffsetOf_0191
     * @tc.desc      relativeOffsetOf(offsetY=15, dragRefOffset=3) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0191 begin`);
      const actual: number = relativeOffsetOf(15, 3);
      logInfo(`relativeOffsetOf(offsetY=15, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}RelativeOffsetOf_0191 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0192
     * @tc.name      ListBeExchange_RelativeOffsetOf_0192
     * @tc.desc      relativeOffsetOf(offsetY=15, dragRefOffset=133) returns -118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0192 begin`);
      const actual: number = relativeOffsetOf(15, 133);
      logInfo(`relativeOffsetOf(offsetY=15, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-118);
      logInfo(`${BUNDLE}RelativeOffsetOf_0192 end`);
    });
  });
}
