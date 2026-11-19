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
import { gridIndexOf } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridIndexOf (40 cases). */
export default function gridIndexOf2Test(): void {
  describe('GridIndexOf2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0097
     * @tc.name      DragAndExchange_GridIndexOf_0097
     * @tc.desc      gridIndexOf(row=-2, column=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0097 begin`);
      const actual: number = gridIndexOf(-2, 1);
      logInfo(`gridIndexOf(row=-2, column=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0098
     * @tc.name      DragAndExchange_GridIndexOf_0098
     * @tc.desc      gridIndexOf(row=-2, column=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0098 begin`);
      const actual: number = gridIndexOf(-2, -2);
      logInfo(`gridIndexOf(row=-2, column=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0099
     * @tc.name      DragAndExchange_GridIndexOf_0099
     * @tc.desc      gridIndexOf(row=-2, column=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0099 begin`);
      const actual: number = gridIndexOf(-2, 2);
      logInfo(`gridIndexOf(row=-2, column=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0100
     * @tc.name      DragAndExchange_GridIndexOf_0100
     * @tc.desc      gridIndexOf(row=-2, column=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0100 begin`);
      const actual: number = gridIndexOf(-2, 3);
      logInfo(`gridIndexOf(row=-2, column=3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0101
     * @tc.name      DragAndExchange_GridIndexOf_0101
     * @tc.desc      gridIndexOf(row=-2, column=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0101 begin`);
      const actual: number = gridIndexOf(-2, 10);
      logInfo(`gridIndexOf(row=-2, column=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0102
     * @tc.name      DragAndExchange_GridIndexOf_0102
     * @tc.desc      gridIndexOf(row=-2, column=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0102 begin`);
      const actual: number = gridIndexOf(-2, 100);
      logInfo(`gridIndexOf(row=-2, column=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0103
     * @tc.name      DragAndExchange_GridIndexOf_0103
     * @tc.desc      gridIndexOf(row=-2, column=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0103 begin`);
      const actual: number = gridIndexOf(-2, 5);
      logInfo(`gridIndexOf(row=-2, column=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0104
     * @tc.name      DragAndExchange_GridIndexOf_0104
     * @tc.desc      gridIndexOf(row=-2, column=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0104 begin`);
      const actual: number = gridIndexOf(-2, 15);
      logInfo(`gridIndexOf(row=-2, column=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0105
     * @tc.name      DragAndExchange_GridIndexOf_0105
     * @tc.desc      gridIndexOf(row=-2, column=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0105 begin`);
      const actual: number = gridIndexOf(-2, 20);
      logInfo(`gridIndexOf(row=-2, column=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0106
     * @tc.name      DragAndExchange_GridIndexOf_0106
     * @tc.desc      gridIndexOf(row=-2, column=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0106 begin`);
      const actual: number = gridIndexOf(-2, 25);
      logInfo(`gridIndexOf(row=-2, column=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0107
     * @tc.name      DragAndExchange_GridIndexOf_0107
     * @tc.desc      gridIndexOf(row=-2, column=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0107 begin`);
      const actual: number = gridIndexOf(-2, 30);
      logInfo(`gridIndexOf(row=-2, column=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0108
     * @tc.name      DragAndExchange_GridIndexOf_0108
     * @tc.desc      gridIndexOf(row=-2, column=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0108 begin`);
      const actual: number = gridIndexOf(-2, 35);
      logInfo(`gridIndexOf(row=-2, column=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0109
     * @tc.name      DragAndExchange_GridIndexOf_0109
     * @tc.desc      gridIndexOf(row=-2, column=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0109 begin`);
      const actual: number = gridIndexOf(-2, 40);
      logInfo(`gridIndexOf(row=-2, column=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0110
     * @tc.name      DragAndExchange_GridIndexOf_0110
     * @tc.desc      gridIndexOf(row=-2, column=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0110 begin`);
      const actual: number = gridIndexOf(-2, 45);
      logInfo(`gridIndexOf(row=-2, column=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0111
     * @tc.name      DragAndExchange_GridIndexOf_0111
     * @tc.desc      gridIndexOf(row=-2, column=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0111 begin`);
      const actual: number = gridIndexOf(-2, 50);
      logInfo(`gridIndexOf(row=-2, column=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0112
     * @tc.name      DragAndExchange_GridIndexOf_0112
     * @tc.desc      gridIndexOf(row=-2, column=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0112 begin`);
      const actual: number = gridIndexOf(-2, 55);
      logInfo(`gridIndexOf(row=-2, column=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0113
     * @tc.name      DragAndExchange_GridIndexOf_0113
     * @tc.desc      gridIndexOf(row=-2, column=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0113 begin`);
      const actual: number = gridIndexOf(-2, 60);
      logInfo(`gridIndexOf(row=-2, column=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0114
     * @tc.name      DragAndExchange_GridIndexOf_0114
     * @tc.desc      gridIndexOf(row=-2, column=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0114 begin`);
      const actual: number = gridIndexOf(-2, 65);
      logInfo(`gridIndexOf(row=-2, column=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0115
     * @tc.name      DragAndExchange_GridIndexOf_0115
     * @tc.desc      gridIndexOf(row=-2, column=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0115 begin`);
      const actual: number = gridIndexOf(-2, 70);
      logInfo(`gridIndexOf(row=-2, column=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0116
     * @tc.name      DragAndExchange_GridIndexOf_0116
     * @tc.desc      gridIndexOf(row=-2, column=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0116 begin`);
      const actual: number = gridIndexOf(-2, 75);
      logInfo(`gridIndexOf(row=-2, column=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0117
     * @tc.name      DragAndExchange_GridIndexOf_0117
     * @tc.desc      gridIndexOf(row=-2, column=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0117 begin`);
      const actual: number = gridIndexOf(-2, 80);
      logInfo(`gridIndexOf(row=-2, column=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0118
     * @tc.name      DragAndExchange_GridIndexOf_0118
     * @tc.desc      gridIndexOf(row=-2, column=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0118 begin`);
      const actual: number = gridIndexOf(-2, 85);
      logInfo(`gridIndexOf(row=-2, column=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0119
     * @tc.name      DragAndExchange_GridIndexOf_0119
     * @tc.desc      gridIndexOf(row=-2, column=90) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0119 begin`);
      const actual: number = gridIndexOf(-2, 90);
      logInfo(`gridIndexOf(row=-2, column=90): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0120
     * @tc.name      DragAndExchange_GridIndexOf_0120
     * @tc.desc      gridIndexOf(row=-2, column=95) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0120 begin`);
      const actual: number = gridIndexOf(-2, 95);
      logInfo(`gridIndexOf(row=-2, column=95): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0121
     * @tc.name      DragAndExchange_GridIndexOf_0121
     * @tc.desc      gridIndexOf(row=-2, column=105) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0121 begin`);
      const actual: number = gridIndexOf(-2, 105);
      logInfo(`gridIndexOf(row=-2, column=105): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0122
     * @tc.name      DragAndExchange_GridIndexOf_0122
     * @tc.desc      gridIndexOf(row=-2, column=110) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0122 begin`);
      const actual: number = gridIndexOf(-2, 110);
      logInfo(`gridIndexOf(row=-2, column=110): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0123
     * @tc.name      DragAndExchange_GridIndexOf_0123
     * @tc.desc      gridIndexOf(row=-2, column=78) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0123 begin`);
      const actual: number = gridIndexOf(-2, 78);
      logInfo(`gridIndexOf(row=-2, column=78): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0124
     * @tc.name      DragAndExchange_GridIndexOf_0124
     * @tc.desc      gridIndexOf(row=-2, column=34) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0124 begin`);
      const actual: number = gridIndexOf(-2, 34);
      logInfo(`gridIndexOf(row=-2, column=34): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0125
     * @tc.name      DragAndExchange_GridIndexOf_0125
     * @tc.desc      gridIndexOf(row=2, column=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0125 begin`);
      const actual: number = gridIndexOf(2, -1);
      logInfo(`gridIndexOf(row=2, column=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0126
     * @tc.name      DragAndExchange_GridIndexOf_0126
     * @tc.desc      gridIndexOf(row=2, column=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0126 begin`);
      const actual: number = gridIndexOf(2, -2);
      logInfo(`gridIndexOf(row=2, column=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0127
     * @tc.name      DragAndExchange_GridIndexOf_0127
     * @tc.desc      gridIndexOf(row=2, column=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0127 begin`);
      const actual: number = gridIndexOf(2, 10);
      logInfo(`gridIndexOf(row=2, column=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0128
     * @tc.name      DragAndExchange_GridIndexOf_0128
     * @tc.desc      gridIndexOf(row=2, column=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0128 begin`);
      const actual: number = gridIndexOf(2, 100);
      logInfo(`gridIndexOf(row=2, column=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0129
     * @tc.name      DragAndExchange_GridIndexOf_0129
     * @tc.desc      gridIndexOf(row=2, column=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0129 begin`);
      const actual: number = gridIndexOf(2, 5);
      logInfo(`gridIndexOf(row=2, column=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0130
     * @tc.name      DragAndExchange_GridIndexOf_0130
     * @tc.desc      gridIndexOf(row=2, column=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0130 begin`);
      const actual: number = gridIndexOf(2, 15);
      logInfo(`gridIndexOf(row=2, column=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0131
     * @tc.name      DragAndExchange_GridIndexOf_0131
     * @tc.desc      gridIndexOf(row=2, column=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0131 begin`);
      const actual: number = gridIndexOf(2, 20);
      logInfo(`gridIndexOf(row=2, column=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0132
     * @tc.name      DragAndExchange_GridIndexOf_0132
     * @tc.desc      gridIndexOf(row=2, column=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0132 begin`);
      const actual: number = gridIndexOf(2, 25);
      logInfo(`gridIndexOf(row=2, column=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0133
     * @tc.name      DragAndExchange_GridIndexOf_0133
     * @tc.desc      gridIndexOf(row=2, column=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0133 begin`);
      const actual: number = gridIndexOf(2, 30);
      logInfo(`gridIndexOf(row=2, column=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0134
     * @tc.name      DragAndExchange_GridIndexOf_0134
     * @tc.desc      gridIndexOf(row=2, column=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0134 begin`);
      const actual: number = gridIndexOf(2, 35);
      logInfo(`gridIndexOf(row=2, column=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0135
     * @tc.name      DragAndExchange_GridIndexOf_0135
     * @tc.desc      gridIndexOf(row=2, column=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0135 begin`);
      const actual: number = gridIndexOf(2, 40);
      logInfo(`gridIndexOf(row=2, column=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0135 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0136
     * @tc.name      DragAndExchange_GridIndexOf_0136
     * @tc.desc      gridIndexOf(row=2, column=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0136 begin`);
      const actual: number = gridIndexOf(2, 45);
      logInfo(`gridIndexOf(row=2, column=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0136 end`);
    });
  });
}
