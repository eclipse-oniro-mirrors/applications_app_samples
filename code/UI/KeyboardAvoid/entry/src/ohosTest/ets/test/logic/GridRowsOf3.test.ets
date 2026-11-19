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

/** Logic checks for gridRowsOf (20 cases). */
export default function gridRowsOf3Test(): void {
  describe('GridRowsOf3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0193
     * @tc.name      KeyboardAvoid_GridRowsOf_0193
     * @tc.desc      gridRowsOf(itemCount=5, columns=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0193 begin`);
      const actual: number = gridRowsOf(5, 90);
      logInfo(`gridRowsOf(itemCount=5, columns=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0194
     * @tc.name      KeyboardAvoid_GridRowsOf_0194
     * @tc.desc      gridRowsOf(itemCount=5, columns=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0194 begin`);
      const actual: number = gridRowsOf(5, 95);
      logInfo(`gridRowsOf(itemCount=5, columns=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0195
     * @tc.name      KeyboardAvoid_GridRowsOf_0195
     * @tc.desc      gridRowsOf(itemCount=5, columns=105) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0195 begin`);
      const actual: number = gridRowsOf(5, 105);
      logInfo(`gridRowsOf(itemCount=5, columns=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0196
     * @tc.name      KeyboardAvoid_GridRowsOf_0196
     * @tc.desc      gridRowsOf(itemCount=5, columns=110) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0196 begin`);
      const actual: number = gridRowsOf(5, 110);
      logInfo(`gridRowsOf(itemCount=5, columns=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0197
     * @tc.name      KeyboardAvoid_GridRowsOf_0197
     * @tc.desc      gridRowsOf(itemCount=5, columns=115) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0197 begin`);
      const actual: number = gridRowsOf(5, 115);
      logInfo(`gridRowsOf(itemCount=5, columns=115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0198
     * @tc.name      KeyboardAvoid_GridRowsOf_0198
     * @tc.desc      gridRowsOf(itemCount=5, columns=42.3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0198 begin`);
      const actual: number = gridRowsOf(5, 42.3);
      logInfo(`gridRowsOf(itemCount=5, columns=42.3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0199
     * @tc.name      KeyboardAvoid_GridRowsOf_0199
     * @tc.desc      gridRowsOf(itemCount=5, columns=22) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0199 begin`);
      const actual: number = gridRowsOf(5, 22);
      logInfo(`gridRowsOf(itemCount=5, columns=22): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0200
     * @tc.name      KeyboardAvoid_GridRowsOf_0200
     * @tc.desc      gridRowsOf(itemCount=10, columns=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0200 begin`);
      const actual: number = gridRowsOf(10, 0);
      logInfo(`gridRowsOf(itemCount=10, columns=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0201
     * @tc.name      KeyboardAvoid_GridRowsOf_0201
     * @tc.desc      gridRowsOf(itemCount=10, columns=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0201 begin`);
      const actual: number = gridRowsOf(10, -1);
      logInfo(`gridRowsOf(itemCount=10, columns=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0202
     * @tc.name      KeyboardAvoid_GridRowsOf_0202
     * @tc.desc      gridRowsOf(itemCount=10, columns=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0202 begin`);
      const actual: number = gridRowsOf(10, 2);
      logInfo(`gridRowsOf(itemCount=10, columns=2): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}GridRowsOf_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0203
     * @tc.name      KeyboardAvoid_GridRowsOf_0203
     * @tc.desc      gridRowsOf(itemCount=10, columns=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0203 begin`);
      const actual: number = gridRowsOf(10, 10);
      logInfo(`gridRowsOf(itemCount=10, columns=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0204
     * @tc.name      KeyboardAvoid_GridRowsOf_0204
     * @tc.desc      gridRowsOf(itemCount=10, columns=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0204 begin`);
      const actual: number = gridRowsOf(10, 100);
      logInfo(`gridRowsOf(itemCount=10, columns=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0205
     * @tc.name      KeyboardAvoid_GridRowsOf_0205
     * @tc.desc      gridRowsOf(itemCount=10, columns=5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0205 begin`);
      const actual: number = gridRowsOf(10, 5);
      logInfo(`gridRowsOf(itemCount=10, columns=5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}GridRowsOf_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0206
     * @tc.name      KeyboardAvoid_GridRowsOf_0206
     * @tc.desc      gridRowsOf(itemCount=10, columns=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0206 begin`);
      const actual: number = gridRowsOf(10, 15);
      logInfo(`gridRowsOf(itemCount=10, columns=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0207
     * @tc.name      KeyboardAvoid_GridRowsOf_0207
     * @tc.desc      gridRowsOf(itemCount=10, columns=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0207 begin`);
      const actual: number = gridRowsOf(10, 20);
      logInfo(`gridRowsOf(itemCount=10, columns=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0208
     * @tc.name      KeyboardAvoid_GridRowsOf_0208
     * @tc.desc      gridRowsOf(itemCount=10, columns=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0208 begin`);
      const actual: number = gridRowsOf(10, 25);
      logInfo(`gridRowsOf(itemCount=10, columns=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0209
     * @tc.name      KeyboardAvoid_GridRowsOf_0209
     * @tc.desc      gridRowsOf(itemCount=10, columns=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0209 begin`);
      const actual: number = gridRowsOf(10, 30);
      logInfo(`gridRowsOf(itemCount=10, columns=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0210
     * @tc.name      KeyboardAvoid_GridRowsOf_0210
     * @tc.desc      gridRowsOf(itemCount=10, columns=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0210 begin`);
      const actual: number = gridRowsOf(10, 35);
      logInfo(`gridRowsOf(itemCount=10, columns=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0211
     * @tc.name      KeyboardAvoid_GridRowsOf_0211
     * @tc.desc      gridRowsOf(itemCount=10, columns=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0211 begin`);
      const actual: number = gridRowsOf(10, 40);
      logInfo(`gridRowsOf(itemCount=10, columns=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0211 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0212
     * @tc.name      KeyboardAvoid_GridRowsOf_0212
     * @tc.desc      gridRowsOf(itemCount=10, columns=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0212 begin`);
      const actual: number = gridRowsOf(10, 45);
      logInfo(`gridRowsOf(itemCount=10, columns=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0212 end`);
    });
  });
}
