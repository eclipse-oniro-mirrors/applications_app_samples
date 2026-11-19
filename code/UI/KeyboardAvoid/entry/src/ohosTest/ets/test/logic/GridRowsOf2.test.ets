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
import { gridRowsOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridRowsOf (96 cases). */
export default function gridRowsOf2Test(): void {
  describe('GridRowsOf2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0097
     * @tc.name      KeyboardAvoid_GridRowsOf_0097
     * @tc.desc      gridRowsOf(itemCount=1, columns=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0097 begin`);
      const actual: number = gridRowsOf(1, 40);
      logInfo(`gridRowsOf(itemCount=1, columns=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0098
     * @tc.name      KeyboardAvoid_GridRowsOf_0098
     * @tc.desc      gridRowsOf(itemCount=1, columns=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0098 begin`);
      const actual: number = gridRowsOf(1, 45);
      logInfo(`gridRowsOf(itemCount=1, columns=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0099
     * @tc.name      KeyboardAvoid_GridRowsOf_0099
     * @tc.desc      gridRowsOf(itemCount=1, columns=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0099 begin`);
      const actual: number = gridRowsOf(1, 50);
      logInfo(`gridRowsOf(itemCount=1, columns=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0100
     * @tc.name      KeyboardAvoid_GridRowsOf_0100
     * @tc.desc      gridRowsOf(itemCount=1, columns=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0100 begin`);
      const actual: number = gridRowsOf(1, 55);
      logInfo(`gridRowsOf(itemCount=1, columns=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0101
     * @tc.name      KeyboardAvoid_GridRowsOf_0101
     * @tc.desc      gridRowsOf(itemCount=1, columns=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0101 begin`);
      const actual: number = gridRowsOf(1, 60);
      logInfo(`gridRowsOf(itemCount=1, columns=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0102
     * @tc.name      KeyboardAvoid_GridRowsOf_0102
     * @tc.desc      gridRowsOf(itemCount=1, columns=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0102 begin`);
      const actual: number = gridRowsOf(1, 65);
      logInfo(`gridRowsOf(itemCount=1, columns=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0103
     * @tc.name      KeyboardAvoid_GridRowsOf_0103
     * @tc.desc      gridRowsOf(itemCount=1, columns=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0103 begin`);
      const actual: number = gridRowsOf(1, 70);
      logInfo(`gridRowsOf(itemCount=1, columns=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0104
     * @tc.name      KeyboardAvoid_GridRowsOf_0104
     * @tc.desc      gridRowsOf(itemCount=1, columns=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0104 begin`);
      const actual: number = gridRowsOf(1, 75);
      logInfo(`gridRowsOf(itemCount=1, columns=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0105
     * @tc.name      KeyboardAvoid_GridRowsOf_0105
     * @tc.desc      gridRowsOf(itemCount=1, columns=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0105 begin`);
      const actual: number = gridRowsOf(1, 80);
      logInfo(`gridRowsOf(itemCount=1, columns=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0106
     * @tc.name      KeyboardAvoid_GridRowsOf_0106
     * @tc.desc      gridRowsOf(itemCount=1, columns=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0106 begin`);
      const actual: number = gridRowsOf(1, 85);
      logInfo(`gridRowsOf(itemCount=1, columns=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0107
     * @tc.name      KeyboardAvoid_GridRowsOf_0107
     * @tc.desc      gridRowsOf(itemCount=1, columns=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0107 begin`);
      const actual: number = gridRowsOf(1, 90);
      logInfo(`gridRowsOf(itemCount=1, columns=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0108
     * @tc.name      KeyboardAvoid_GridRowsOf_0108
     * @tc.desc      gridRowsOf(itemCount=1, columns=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0108 begin`);
      const actual: number = gridRowsOf(1, 95);
      logInfo(`gridRowsOf(itemCount=1, columns=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0109
     * @tc.name      KeyboardAvoid_GridRowsOf_0109
     * @tc.desc      gridRowsOf(itemCount=1, columns=105) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0109 begin`);
      const actual: number = gridRowsOf(1, 105);
      logInfo(`gridRowsOf(itemCount=1, columns=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0110
     * @tc.name      KeyboardAvoid_GridRowsOf_0110
     * @tc.desc      gridRowsOf(itemCount=1, columns=110) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0110 begin`);
      const actual: number = gridRowsOf(1, 110);
      logInfo(`gridRowsOf(itemCount=1, columns=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0111
     * @tc.name      KeyboardAvoid_GridRowsOf_0111
     * @tc.desc      gridRowsOf(itemCount=1, columns=115) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0111 begin`);
      const actual: number = gridRowsOf(1, 115);
      logInfo(`gridRowsOf(itemCount=1, columns=115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0112
     * @tc.name      KeyboardAvoid_GridRowsOf_0112
     * @tc.desc      gridRowsOf(itemCount=1, columns=42.3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0112 begin`);
      const actual: number = gridRowsOf(1, 42.3);
      logInfo(`gridRowsOf(itemCount=1, columns=42.3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0113
     * @tc.name      KeyboardAvoid_GridRowsOf_0113
     * @tc.desc      gridRowsOf(itemCount=1, columns=22) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0113 begin`);
      const actual: number = gridRowsOf(1, 22);
      logInfo(`gridRowsOf(itemCount=1, columns=22): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0114
     * @tc.name      KeyboardAvoid_GridRowsOf_0114
     * @tc.desc      gridRowsOf(itemCount=-1, columns=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0114 begin`);
      const actual: number = gridRowsOf(-1, 0);
      logInfo(`gridRowsOf(itemCount=-1, columns=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0115
     * @tc.name      KeyboardAvoid_GridRowsOf_0115
     * @tc.desc      gridRowsOf(itemCount=-1, columns=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0115 begin`);
      const actual: number = gridRowsOf(-1, -1);
      logInfo(`gridRowsOf(itemCount=-1, columns=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0116
     * @tc.name      KeyboardAvoid_GridRowsOf_0116
     * @tc.desc      gridRowsOf(itemCount=-1, columns=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0116 begin`);
      const actual: number = gridRowsOf(-1, 2);
      logInfo(`gridRowsOf(itemCount=-1, columns=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0117
     * @tc.name      KeyboardAvoid_GridRowsOf_0117
     * @tc.desc      gridRowsOf(itemCount=-1, columns=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0117 begin`);
      const actual: number = gridRowsOf(-1, 3);
      logInfo(`gridRowsOf(itemCount=-1, columns=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0118
     * @tc.name      KeyboardAvoid_GridRowsOf_0118
     * @tc.desc      gridRowsOf(itemCount=-1, columns=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0118 begin`);
      const actual: number = gridRowsOf(-1, 10);
      logInfo(`gridRowsOf(itemCount=-1, columns=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0119
     * @tc.name      KeyboardAvoid_GridRowsOf_0119
     * @tc.desc      gridRowsOf(itemCount=-1, columns=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0119 begin`);
      const actual: number = gridRowsOf(-1, 100);
      logInfo(`gridRowsOf(itemCount=-1, columns=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0120
     * @tc.name      KeyboardAvoid_GridRowsOf_0120
     * @tc.desc      gridRowsOf(itemCount=-1, columns=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0120 begin`);
      const actual: number = gridRowsOf(-1, 5);
      logInfo(`gridRowsOf(itemCount=-1, columns=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0121
     * @tc.name      KeyboardAvoid_GridRowsOf_0121
     * @tc.desc      gridRowsOf(itemCount=-1, columns=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0121 begin`);
      const actual: number = gridRowsOf(-1, 15);
      logInfo(`gridRowsOf(itemCount=-1, columns=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0122
     * @tc.name      KeyboardAvoid_GridRowsOf_0122
     * @tc.desc      gridRowsOf(itemCount=-1, columns=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0122 begin`);
      const actual: number = gridRowsOf(-1, 20);
      logInfo(`gridRowsOf(itemCount=-1, columns=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0123
     * @tc.name      KeyboardAvoid_GridRowsOf_0123
     * @tc.desc      gridRowsOf(itemCount=-1, columns=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0123 begin`);
      const actual: number = gridRowsOf(-1, 25);
      logInfo(`gridRowsOf(itemCount=-1, columns=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0124
     * @tc.name      KeyboardAvoid_GridRowsOf_0124
     * @tc.desc      gridRowsOf(itemCount=-1, columns=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0124 begin`);
      const actual: number = gridRowsOf(-1, 30);
      logInfo(`gridRowsOf(itemCount=-1, columns=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0125
     * @tc.name      KeyboardAvoid_GridRowsOf_0125
     * @tc.desc      gridRowsOf(itemCount=-1, columns=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0125 begin`);
      const actual: number = gridRowsOf(-1, 35);
      logInfo(`gridRowsOf(itemCount=-1, columns=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0126
     * @tc.name      KeyboardAvoid_GridRowsOf_0126
     * @tc.desc      gridRowsOf(itemCount=-1, columns=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0126 begin`);
      const actual: number = gridRowsOf(-1, 40);
      logInfo(`gridRowsOf(itemCount=-1, columns=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0127
     * @tc.name      KeyboardAvoid_GridRowsOf_0127
     * @tc.desc      gridRowsOf(itemCount=-1, columns=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0127 begin`);
      const actual: number = gridRowsOf(-1, 45);
      logInfo(`gridRowsOf(itemCount=-1, columns=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0128
     * @tc.name      KeyboardAvoid_GridRowsOf_0128
     * @tc.desc      gridRowsOf(itemCount=-1, columns=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0128 begin`);
      const actual: number = gridRowsOf(-1, 50);
      logInfo(`gridRowsOf(itemCount=-1, columns=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0129
     * @tc.name      KeyboardAvoid_GridRowsOf_0129
     * @tc.desc      gridRowsOf(itemCount=-1, columns=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0129 begin`);
      const actual: number = gridRowsOf(-1, 55);
      logInfo(`gridRowsOf(itemCount=-1, columns=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0130
     * @tc.name      KeyboardAvoid_GridRowsOf_0130
     * @tc.desc      gridRowsOf(itemCount=-1, columns=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0130 begin`);
      const actual: number = gridRowsOf(-1, 60);
      logInfo(`gridRowsOf(itemCount=-1, columns=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0131
     * @tc.name      KeyboardAvoid_GridRowsOf_0131
     * @tc.desc      gridRowsOf(itemCount=-1, columns=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0131 begin`);
      const actual: number = gridRowsOf(-1, 65);
      logInfo(`gridRowsOf(itemCount=-1, columns=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0132
     * @tc.name      KeyboardAvoid_GridRowsOf_0132
     * @tc.desc      gridRowsOf(itemCount=-1, columns=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0132 begin`);
      const actual: number = gridRowsOf(-1, 70);
      logInfo(`gridRowsOf(itemCount=-1, columns=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0133
     * @tc.name      KeyboardAvoid_GridRowsOf_0133
     * @tc.desc      gridRowsOf(itemCount=-1, columns=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0133 begin`);
      const actual: number = gridRowsOf(-1, 75);
      logInfo(`gridRowsOf(itemCount=-1, columns=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0134
     * @tc.name      KeyboardAvoid_GridRowsOf_0134
     * @tc.desc      gridRowsOf(itemCount=-1, columns=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0134 begin`);
      const actual: number = gridRowsOf(-1, 80);
      logInfo(`gridRowsOf(itemCount=-1, columns=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0135
     * @tc.name      KeyboardAvoid_GridRowsOf_0135
     * @tc.desc      gridRowsOf(itemCount=-1, columns=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0135 begin`);
      const actual: number = gridRowsOf(-1, 85);
      logInfo(`gridRowsOf(itemCount=-1, columns=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0136
     * @tc.name      KeyboardAvoid_GridRowsOf_0136
     * @tc.desc      gridRowsOf(itemCount=-1, columns=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0136 begin`);
      const actual: number = gridRowsOf(-1, 90);
      logInfo(`gridRowsOf(itemCount=-1, columns=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0137
     * @tc.name      KeyboardAvoid_GridRowsOf_0137
     * @tc.desc      gridRowsOf(itemCount=-1, columns=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0137 begin`);
      const actual: number = gridRowsOf(-1, 95);
      logInfo(`gridRowsOf(itemCount=-1, columns=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0138
     * @tc.name      KeyboardAvoid_GridRowsOf_0138
     * @tc.desc      gridRowsOf(itemCount=-1, columns=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0138 begin`);
      const actual: number = gridRowsOf(-1, 105);
      logInfo(`gridRowsOf(itemCount=-1, columns=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0139
     * @tc.name      KeyboardAvoid_GridRowsOf_0139
     * @tc.desc      gridRowsOf(itemCount=-1, columns=110) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0139 begin`);
      const actual: number = gridRowsOf(-1, 110);
      logInfo(`gridRowsOf(itemCount=-1, columns=110): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0140
     * @tc.name      KeyboardAvoid_GridRowsOf_0140
     * @tc.desc      gridRowsOf(itemCount=-1, columns=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0140 begin`);
      const actual: number = gridRowsOf(-1, 115);
      logInfo(`gridRowsOf(itemCount=-1, columns=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0141
     * @tc.name      KeyboardAvoid_GridRowsOf_0141
     * @tc.desc      gridRowsOf(itemCount=-1, columns=42.3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0141 begin`);
      const actual: number = gridRowsOf(-1, 42.3);
      logInfo(`gridRowsOf(itemCount=-1, columns=42.3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0142
     * @tc.name      KeyboardAvoid_GridRowsOf_0142
     * @tc.desc      gridRowsOf(itemCount=-1, columns=22) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0142 begin`);
      const actual: number = gridRowsOf(-1, 22);
      logInfo(`gridRowsOf(itemCount=-1, columns=22): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0143
     * @tc.name      KeyboardAvoid_GridRowsOf_0143
     * @tc.desc      gridRowsOf(itemCount=2, columns=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0143 begin`);
      const actual: number = gridRowsOf(2, 0);
      logInfo(`gridRowsOf(itemCount=2, columns=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0144
     * @tc.name      KeyboardAvoid_GridRowsOf_0144
     * @tc.desc      gridRowsOf(itemCount=2, columns=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0144 begin`);
      const actual: number = gridRowsOf(2, -1);
      logInfo(`gridRowsOf(itemCount=2, columns=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0145
     * @tc.name      KeyboardAvoid_GridRowsOf_0145
     * @tc.desc      gridRowsOf(itemCount=2, columns=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0145 begin`);
      const actual: number = gridRowsOf(2, 2);
      logInfo(`gridRowsOf(itemCount=2, columns=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0146
     * @tc.name      KeyboardAvoid_GridRowsOf_0146
     * @tc.desc      gridRowsOf(itemCount=2, columns=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0146 begin`);
      const actual: number = gridRowsOf(2, 3);
      logInfo(`gridRowsOf(itemCount=2, columns=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0147
     * @tc.name      KeyboardAvoid_GridRowsOf_0147
     * @tc.desc      gridRowsOf(itemCount=2, columns=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0147 begin`);
      const actual: number = gridRowsOf(2, 10);
      logInfo(`gridRowsOf(itemCount=2, columns=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0148
     * @tc.name      KeyboardAvoid_GridRowsOf_0148
     * @tc.desc      gridRowsOf(itemCount=2, columns=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0148 begin`);
      const actual: number = gridRowsOf(2, 100);
      logInfo(`gridRowsOf(itemCount=2, columns=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0149
     * @tc.name      KeyboardAvoid_GridRowsOf_0149
     * @tc.desc      gridRowsOf(itemCount=2, columns=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0149 begin`);
      const actual: number = gridRowsOf(2, 5);
      logInfo(`gridRowsOf(itemCount=2, columns=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0149 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0150
     * @tc.name      KeyboardAvoid_GridRowsOf_0150
     * @tc.desc      gridRowsOf(itemCount=2, columns=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0150 begin`);
      const actual: number = gridRowsOf(2, 15);
      logInfo(`gridRowsOf(itemCount=2, columns=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0151
     * @tc.name      KeyboardAvoid_GridRowsOf_0151
     * @tc.desc      gridRowsOf(itemCount=2, columns=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0151 begin`);
      const actual: number = gridRowsOf(2, 20);
      logInfo(`gridRowsOf(itemCount=2, columns=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0152
     * @tc.name      KeyboardAvoid_GridRowsOf_0152
     * @tc.desc      gridRowsOf(itemCount=2, columns=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0152 begin`);
      const actual: number = gridRowsOf(2, 25);
      logInfo(`gridRowsOf(itemCount=2, columns=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0153
     * @tc.name      KeyboardAvoid_GridRowsOf_0153
     * @tc.desc      gridRowsOf(itemCount=2, columns=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0153 begin`);
      const actual: number = gridRowsOf(2, 30);
      logInfo(`gridRowsOf(itemCount=2, columns=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0154
     * @tc.name      KeyboardAvoid_GridRowsOf_0154
     * @tc.desc      gridRowsOf(itemCount=2, columns=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0154 begin`);
      const actual: number = gridRowsOf(2, 35);
      logInfo(`gridRowsOf(itemCount=2, columns=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0155
     * @tc.name      KeyboardAvoid_GridRowsOf_0155
     * @tc.desc      gridRowsOf(itemCount=2, columns=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0155 begin`);
      const actual: number = gridRowsOf(2, 40);
      logInfo(`gridRowsOf(itemCount=2, columns=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0156
     * @tc.name      KeyboardAvoid_GridRowsOf_0156
     * @tc.desc      gridRowsOf(itemCount=2, columns=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0156 begin`);
      const actual: number = gridRowsOf(2, 45);
      logInfo(`gridRowsOf(itemCount=2, columns=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0157
     * @tc.name      KeyboardAvoid_GridRowsOf_0157
     * @tc.desc      gridRowsOf(itemCount=2, columns=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0157 begin`);
      const actual: number = gridRowsOf(2, 50);
      logInfo(`gridRowsOf(itemCount=2, columns=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0158
     * @tc.name      KeyboardAvoid_GridRowsOf_0158
     * @tc.desc      gridRowsOf(itemCount=2, columns=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0158 begin`);
      const actual: number = gridRowsOf(2, 55);
      logInfo(`gridRowsOf(itemCount=2, columns=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0159
     * @tc.name      KeyboardAvoid_GridRowsOf_0159
     * @tc.desc      gridRowsOf(itemCount=2, columns=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0159 begin`);
      const actual: number = gridRowsOf(2, 60);
      logInfo(`gridRowsOf(itemCount=2, columns=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0160
     * @tc.name      KeyboardAvoid_GridRowsOf_0160
     * @tc.desc      gridRowsOf(itemCount=2, columns=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0160 begin`);
      const actual: number = gridRowsOf(2, 65);
      logInfo(`gridRowsOf(itemCount=2, columns=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0160 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0161
     * @tc.name      KeyboardAvoid_GridRowsOf_0161
     * @tc.desc      gridRowsOf(itemCount=2, columns=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0161 begin`);
      const actual: number = gridRowsOf(2, 70);
      logInfo(`gridRowsOf(itemCount=2, columns=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0162
     * @tc.name      KeyboardAvoid_GridRowsOf_0162
     * @tc.desc      gridRowsOf(itemCount=2, columns=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0162 begin`);
      const actual: number = gridRowsOf(2, 75);
      logInfo(`gridRowsOf(itemCount=2, columns=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0163
     * @tc.name      KeyboardAvoid_GridRowsOf_0163
     * @tc.desc      gridRowsOf(itemCount=2, columns=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0163 begin`);
      const actual: number = gridRowsOf(2, 80);
      logInfo(`gridRowsOf(itemCount=2, columns=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0164
     * @tc.name      KeyboardAvoid_GridRowsOf_0164
     * @tc.desc      gridRowsOf(itemCount=2, columns=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0164 begin`);
      const actual: number = gridRowsOf(2, 85);
      logInfo(`gridRowsOf(itemCount=2, columns=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0165
     * @tc.name      KeyboardAvoid_GridRowsOf_0165
     * @tc.desc      gridRowsOf(itemCount=2, columns=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0165 begin`);
      const actual: number = gridRowsOf(2, 90);
      logInfo(`gridRowsOf(itemCount=2, columns=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0166
     * @tc.name      KeyboardAvoid_GridRowsOf_0166
     * @tc.desc      gridRowsOf(itemCount=2, columns=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0166 begin`);
      const actual: number = gridRowsOf(2, 95);
      logInfo(`gridRowsOf(itemCount=2, columns=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0167
     * @tc.name      KeyboardAvoid_GridRowsOf_0167
     * @tc.desc      gridRowsOf(itemCount=2, columns=105) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0167 begin`);
      const actual: number = gridRowsOf(2, 105);
      logInfo(`gridRowsOf(itemCount=2, columns=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0168
     * @tc.name      KeyboardAvoid_GridRowsOf_0168
     * @tc.desc      gridRowsOf(itemCount=2, columns=110) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0168 begin`);
      const actual: number = gridRowsOf(2, 110);
      logInfo(`gridRowsOf(itemCount=2, columns=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0169
     * @tc.name      KeyboardAvoid_GridRowsOf_0169
     * @tc.desc      gridRowsOf(itemCount=2, columns=115) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0169 begin`);
      const actual: number = gridRowsOf(2, 115);
      logInfo(`gridRowsOf(itemCount=2, columns=115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0170
     * @tc.name      KeyboardAvoid_GridRowsOf_0170
     * @tc.desc      gridRowsOf(itemCount=2, columns=42.3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0170 begin`);
      const actual: number = gridRowsOf(2, 42.3);
      logInfo(`gridRowsOf(itemCount=2, columns=42.3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0171
     * @tc.name      KeyboardAvoid_GridRowsOf_0171
     * @tc.desc      gridRowsOf(itemCount=2, columns=22) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0171 begin`);
      const actual: number = gridRowsOf(2, 22);
      logInfo(`gridRowsOf(itemCount=2, columns=22): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0172
     * @tc.name      KeyboardAvoid_GridRowsOf_0172
     * @tc.desc      gridRowsOf(itemCount=5, columns=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0172 begin`);
      const actual: number = gridRowsOf(5, 0);
      logInfo(`gridRowsOf(itemCount=5, columns=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0173
     * @tc.name      KeyboardAvoid_GridRowsOf_0173
     * @tc.desc      gridRowsOf(itemCount=5, columns=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0173 begin`);
      const actual: number = gridRowsOf(5, -1);
      logInfo(`gridRowsOf(itemCount=5, columns=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0174
     * @tc.name      KeyboardAvoid_GridRowsOf_0174
     * @tc.desc      gridRowsOf(itemCount=5, columns=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0174 begin`);
      const actual: number = gridRowsOf(5, 3);
      logInfo(`gridRowsOf(itemCount=5, columns=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}GridRowsOf_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0175
     * @tc.name      KeyboardAvoid_GridRowsOf_0175
     * @tc.desc      gridRowsOf(itemCount=5, columns=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0175 begin`);
      const actual: number = gridRowsOf(5, 10);
      logInfo(`gridRowsOf(itemCount=5, columns=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0176
     * @tc.name      KeyboardAvoid_GridRowsOf_0176
     * @tc.desc      gridRowsOf(itemCount=5, columns=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0176 begin`);
      const actual: number = gridRowsOf(5, 100);
      logInfo(`gridRowsOf(itemCount=5, columns=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0177
     * @tc.name      KeyboardAvoid_GridRowsOf_0177
     * @tc.desc      gridRowsOf(itemCount=5, columns=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0177 begin`);
      const actual: number = gridRowsOf(5, 5);
      logInfo(`gridRowsOf(itemCount=5, columns=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0178
     * @tc.name      KeyboardAvoid_GridRowsOf_0178
     * @tc.desc      gridRowsOf(itemCount=5, columns=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0178 begin`);
      const actual: number = gridRowsOf(5, 15);
      logInfo(`gridRowsOf(itemCount=5, columns=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0179
     * @tc.name      KeyboardAvoid_GridRowsOf_0179
     * @tc.desc      gridRowsOf(itemCount=5, columns=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0179 begin`);
      const actual: number = gridRowsOf(5, 20);
      logInfo(`gridRowsOf(itemCount=5, columns=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0180
     * @tc.name      KeyboardAvoid_GridRowsOf_0180
     * @tc.desc      gridRowsOf(itemCount=5, columns=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0180 begin`);
      const actual: number = gridRowsOf(5, 25);
      logInfo(`gridRowsOf(itemCount=5, columns=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0181
     * @tc.name      KeyboardAvoid_GridRowsOf_0181
     * @tc.desc      gridRowsOf(itemCount=5, columns=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0181 begin`);
      const actual: number = gridRowsOf(5, 30);
      logInfo(`gridRowsOf(itemCount=5, columns=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0182
     * @tc.name      KeyboardAvoid_GridRowsOf_0182
     * @tc.desc      gridRowsOf(itemCount=5, columns=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0182 begin`);
      const actual: number = gridRowsOf(5, 35);
      logInfo(`gridRowsOf(itemCount=5, columns=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0183
     * @tc.name      KeyboardAvoid_GridRowsOf_0183
     * @tc.desc      gridRowsOf(itemCount=5, columns=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0183 begin`);
      const actual: number = gridRowsOf(5, 40);
      logInfo(`gridRowsOf(itemCount=5, columns=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0184
     * @tc.name      KeyboardAvoid_GridRowsOf_0184
     * @tc.desc      gridRowsOf(itemCount=5, columns=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0184 begin`);
      const actual: number = gridRowsOf(5, 45);
      logInfo(`gridRowsOf(itemCount=5, columns=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0185
     * @tc.name      KeyboardAvoid_GridRowsOf_0185
     * @tc.desc      gridRowsOf(itemCount=5, columns=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0185 begin`);
      const actual: number = gridRowsOf(5, 50);
      logInfo(`gridRowsOf(itemCount=5, columns=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0186
     * @tc.name      KeyboardAvoid_GridRowsOf_0186
     * @tc.desc      gridRowsOf(itemCount=5, columns=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0186 begin`);
      const actual: number = gridRowsOf(5, 55);
      logInfo(`gridRowsOf(itemCount=5, columns=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0187
     * @tc.name      KeyboardAvoid_GridRowsOf_0187
     * @tc.desc      gridRowsOf(itemCount=5, columns=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0187 begin`);
      const actual: number = gridRowsOf(5, 60);
      logInfo(`gridRowsOf(itemCount=5, columns=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0188
     * @tc.name      KeyboardAvoid_GridRowsOf_0188
     * @tc.desc      gridRowsOf(itemCount=5, columns=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0188 begin`);
      const actual: number = gridRowsOf(5, 65);
      logInfo(`gridRowsOf(itemCount=5, columns=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0189
     * @tc.name      KeyboardAvoid_GridRowsOf_0189
     * @tc.desc      gridRowsOf(itemCount=5, columns=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0189 begin`);
      const actual: number = gridRowsOf(5, 70);
      logInfo(`gridRowsOf(itemCount=5, columns=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0190
     * @tc.name      KeyboardAvoid_GridRowsOf_0190
     * @tc.desc      gridRowsOf(itemCount=5, columns=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0190 begin`);
      const actual: number = gridRowsOf(5, 75);
      logInfo(`gridRowsOf(itemCount=5, columns=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0191
     * @tc.name      KeyboardAvoid_GridRowsOf_0191
     * @tc.desc      gridRowsOf(itemCount=5, columns=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0191 begin`);
      const actual: number = gridRowsOf(5, 80);
      logInfo(`gridRowsOf(itemCount=5, columns=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0192
     * @tc.name      KeyboardAvoid_GridRowsOf_0192
     * @tc.desc      gridRowsOf(itemCount=5, columns=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0192 begin`);
      const actual: number = gridRowsOf(5, 85);
      logInfo(`gridRowsOf(itemCount=5, columns=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0192 end`);
    });
  });
}
