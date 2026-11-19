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
export default function gridRowsOfTest(): void {
  describe('GridRowsOfTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0001
     * @tc.name      KeyboardAvoid_GridRowsOf_0001
     * @tc.desc      gridRowsOf(itemCount=0, columns=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_GridRowsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0001 begin`);
      const actual: number = gridRowsOf(0, 0);
      logInfo(`gridRowsOf(itemCount=0, columns=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0002
     * @tc.name      KeyboardAvoid_GridRowsOf_0002
     * @tc.desc      gridRowsOf(itemCount=1, columns=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_GridRowsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0002 begin`);
      const actual: number = gridRowsOf(1, 1);
      logInfo(`gridRowsOf(itemCount=1, columns=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0003
     * @tc.name      KeyboardAvoid_GridRowsOf_0003
     * @tc.desc      gridRowsOf(itemCount=-1, columns=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0003 begin`);
      const actual: number = gridRowsOf(-1, 1);
      logInfo(`gridRowsOf(itemCount=-1, columns=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0004
     * @tc.name      KeyboardAvoid_GridRowsOf_0004
     * @tc.desc      gridRowsOf(itemCount=2, columns=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0004 begin`);
      const actual: number = gridRowsOf(2, 1);
      logInfo(`gridRowsOf(itemCount=2, columns=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}GridRowsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0005
     * @tc.name      KeyboardAvoid_GridRowsOf_0005
     * @tc.desc      gridRowsOf(itemCount=5, columns=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0005 begin`);
      const actual: number = gridRowsOf(5, 1);
      logInfo(`gridRowsOf(itemCount=5, columns=1): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}GridRowsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0006
     * @tc.name      KeyboardAvoid_GridRowsOf_0006
     * @tc.desc      gridRowsOf(itemCount=5, columns=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0006 begin`);
      const actual: number = gridRowsOf(5, 2);
      logInfo(`gridRowsOf(itemCount=5, columns=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GridRowsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0007
     * @tc.name      KeyboardAvoid_GridRowsOf_0007
     * @tc.desc      gridRowsOf(itemCount=10, columns=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0007 begin`);
      const actual: number = gridRowsOf(10, 1);
      logInfo(`gridRowsOf(itemCount=10, columns=1): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}GridRowsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0008
     * @tc.name      KeyboardAvoid_GridRowsOf_0008
     * @tc.desc      gridRowsOf(itemCount=10, columns=3) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0008 begin`);
      const actual: number = gridRowsOf(10, 3);
      logInfo(`gridRowsOf(itemCount=10, columns=3): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}GridRowsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0009
     * @tc.name      KeyboardAvoid_GridRowsOf_0009
     * @tc.desc      gridRowsOf(itemCount=100, columns=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0009 begin`);
      const actual: number = gridRowsOf(100, 1);
      logInfo(`gridRowsOf(itemCount=100, columns=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}GridRowsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0010
     * @tc.name      KeyboardAvoid_GridRowsOf_0010
     * @tc.desc      gridRowsOf(itemCount=100, columns=2) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0010 begin`);
      const actual: number = gridRowsOf(100, 2);
      logInfo(`gridRowsOf(itemCount=100, columns=2): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}GridRowsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0011
     * @tc.name      KeyboardAvoid_GridRowsOf_0011
     * @tc.desc      gridRowsOf(itemCount=100, columns=3) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0011 begin`);
      const actual: number = gridRowsOf(100, 3);
      logInfo(`gridRowsOf(itemCount=100, columns=3): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}GridRowsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0012
     * @tc.name      KeyboardAvoid_GridRowsOf_0012
     * @tc.desc      gridRowsOf(itemCount=100, columns=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0012 begin`);
      const actual: number = gridRowsOf(100, 5);
      logInfo(`gridRowsOf(itemCount=100, columns=5): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}GridRowsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0013
     * @tc.name      KeyboardAvoid_GridRowsOf_0013
     * @tc.desc      gridRowsOf(itemCount=100, columns=15) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0013 begin`);
      const actual: number = gridRowsOf(100, 15);
      logInfo(`gridRowsOf(itemCount=100, columns=15): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}GridRowsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0014
     * @tc.name      KeyboardAvoid_GridRowsOf_0014
     * @tc.desc      gridRowsOf(itemCount=15, columns=1) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0014 begin`);
      const actual: number = gridRowsOf(15, 1);
      logInfo(`gridRowsOf(itemCount=15, columns=1): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}GridRowsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0015
     * @tc.name      KeyboardAvoid_GridRowsOf_0015
     * @tc.desc      gridRowsOf(itemCount=15, columns=2) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0015 begin`);
      const actual: number = gridRowsOf(15, 2);
      logInfo(`gridRowsOf(itemCount=15, columns=2): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GridRowsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0016
     * @tc.name      KeyboardAvoid_GridRowsOf_0016
     * @tc.desc      gridRowsOf(itemCount=25, columns=1) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0016 begin`);
      const actual: number = gridRowsOf(25, 1);
      logInfo(`gridRowsOf(itemCount=25, columns=1): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}GridRowsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0017
     * @tc.name      KeyboardAvoid_GridRowsOf_0017
     * @tc.desc      gridRowsOf(itemCount=25, columns=2) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0017 begin`);
      const actual: number = gridRowsOf(25, 2);
      logInfo(`gridRowsOf(itemCount=25, columns=2): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GridRowsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0018
     * @tc.name      KeyboardAvoid_GridRowsOf_0018
     * @tc.desc      gridRowsOf(itemCount=25, columns=3) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0018 begin`);
      const actual: number = gridRowsOf(25, 3);
      logInfo(`gridRowsOf(itemCount=25, columns=3): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}GridRowsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0019
     * @tc.name      KeyboardAvoid_GridRowsOf_0019
     * @tc.desc      gridRowsOf(itemCount=30, columns=1) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0019 begin`);
      const actual: number = gridRowsOf(30, 1);
      logInfo(`gridRowsOf(itemCount=30, columns=1): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}GridRowsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0020
     * @tc.name      KeyboardAvoid_GridRowsOf_0020
     * @tc.desc      gridRowsOf(itemCount=30, columns=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0020 begin`);
      const actual: number = gridRowsOf(30, 5);
      logInfo(`gridRowsOf(itemCount=30, columns=5): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}GridRowsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0021
     * @tc.name      KeyboardAvoid_GridRowsOf_0021
     * @tc.desc      gridRowsOf(itemCount=35, columns=1) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0021 begin`);
      const actual: number = gridRowsOf(35, 1);
      logInfo(`gridRowsOf(itemCount=35, columns=1): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}GridRowsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0022
     * @tc.name      KeyboardAvoid_GridRowsOf_0022
     * @tc.desc      gridRowsOf(itemCount=35, columns=2) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0022 begin`);
      const actual: number = gridRowsOf(35, 2);
      logInfo(`gridRowsOf(itemCount=35, columns=2): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}GridRowsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0023
     * @tc.name      KeyboardAvoid_GridRowsOf_0023
     * @tc.desc      gridRowsOf(itemCount=35, columns=3) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0023 begin`);
      const actual: number = gridRowsOf(35, 3);
      logInfo(`gridRowsOf(itemCount=35, columns=3): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridRowsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0024
     * @tc.name      KeyboardAvoid_GridRowsOf_0024
     * @tc.desc      gridRowsOf(itemCount=40, columns=1) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0024 begin`);
      const actual: number = gridRowsOf(40, 1);
      logInfo(`gridRowsOf(itemCount=40, columns=1): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}GridRowsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0025
     * @tc.name      KeyboardAvoid_GridRowsOf_0025
     * @tc.desc      gridRowsOf(itemCount=40, columns=3) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0025 begin`);
      const actual: number = gridRowsOf(40, 3);
      logInfo(`gridRowsOf(itemCount=40, columns=3): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}GridRowsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0026
     * @tc.name      KeyboardAvoid_GridRowsOf_0026
     * @tc.desc      gridRowsOf(itemCount=45, columns=1) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0026 begin`);
      const actual: number = gridRowsOf(45, 1);
      logInfo(`gridRowsOf(itemCount=45, columns=1): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}GridRowsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0027
     * @tc.name      KeyboardAvoid_GridRowsOf_0027
     * @tc.desc      gridRowsOf(itemCount=45, columns=2) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0027 begin`);
      const actual: number = gridRowsOf(45, 2);
      logInfo(`gridRowsOf(itemCount=45, columns=2): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}GridRowsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0028
     * @tc.name      KeyboardAvoid_GridRowsOf_0028
     * @tc.desc      gridRowsOf(itemCount=50, columns=3) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0028 begin`);
      const actual: number = gridRowsOf(50, 3);
      logInfo(`gridRowsOf(itemCount=50, columns=3): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}GridRowsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0029
     * @tc.name      KeyboardAvoid_GridRowsOf_0029
     * @tc.desc      gridRowsOf(itemCount=55, columns=1) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0029 begin`);
      const actual: number = gridRowsOf(55, 1);
      logInfo(`gridRowsOf(itemCount=55, columns=1): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}GridRowsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0030
     * @tc.name      KeyboardAvoid_GridRowsOf_0030
     * @tc.desc      gridRowsOf(itemCount=55, columns=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0030 begin`);
      const actual: number = gridRowsOf(55, 2);
      logInfo(`gridRowsOf(itemCount=55, columns=2): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}GridRowsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0031
     * @tc.name      KeyboardAvoid_GridRowsOf_0031
     * @tc.desc      gridRowsOf(itemCount=55, columns=3) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0031 begin`);
      const actual: number = gridRowsOf(55, 3);
      logInfo(`gridRowsOf(itemCount=55, columns=3): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}GridRowsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0032
     * @tc.name      KeyboardAvoid_GridRowsOf_0032
     * @tc.desc      gridRowsOf(itemCount=55, columns=5) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0032 begin`);
      const actual: number = gridRowsOf(55, 5);
      logInfo(`gridRowsOf(itemCount=55, columns=5): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}GridRowsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0033
     * @tc.name      KeyboardAvoid_GridRowsOf_0033
     * @tc.desc      gridRowsOf(itemCount=60, columns=1) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0033 begin`);
      const actual: number = gridRowsOf(60, 1);
      logInfo(`gridRowsOf(itemCount=60, columns=1): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}GridRowsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0034
     * @tc.name      KeyboardAvoid_GridRowsOf_0034
     * @tc.desc      gridRowsOf(itemCount=65, columns=1) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0034 begin`);
      const actual: number = gridRowsOf(65, 1);
      logInfo(`gridRowsOf(itemCount=65, columns=1): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}GridRowsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0035
     * @tc.name      KeyboardAvoid_GridRowsOf_0035
     * @tc.desc      gridRowsOf(itemCount=65, columns=2) returns 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0035 begin`);
      const actual: number = gridRowsOf(65, 2);
      logInfo(`gridRowsOf(itemCount=65, columns=2): actual=${actual}`);
      expect(actual).assertEqual(33);
      logInfo(`${BUNDLE}GridRowsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0036
     * @tc.name      KeyboardAvoid_GridRowsOf_0036
     * @tc.desc      gridRowsOf(itemCount=65, columns=3) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0036 begin`);
      const actual: number = gridRowsOf(65, 3);
      logInfo(`gridRowsOf(itemCount=65, columns=3): actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}GridRowsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0037
     * @tc.name      KeyboardAvoid_GridRowsOf_0037
     * @tc.desc      gridRowsOf(itemCount=70, columns=1) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0037 begin`);
      const actual: number = gridRowsOf(70, 1);
      logInfo(`gridRowsOf(itemCount=70, columns=1): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}GridRowsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0038
     * @tc.name      KeyboardAvoid_GridRowsOf_0038
     * @tc.desc      gridRowsOf(itemCount=70, columns=3) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0038 begin`);
      const actual: number = gridRowsOf(70, 3);
      logInfo(`gridRowsOf(itemCount=70, columns=3): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}GridRowsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0039
     * @tc.name      KeyboardAvoid_GridRowsOf_0039
     * @tc.desc      gridRowsOf(itemCount=75, columns=1) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0039 begin`);
      const actual: number = gridRowsOf(75, 1);
      logInfo(`gridRowsOf(itemCount=75, columns=1): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}GridRowsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0040
     * @tc.name      KeyboardAvoid_GridRowsOf_0040
     * @tc.desc      gridRowsOf(itemCount=75, columns=2) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0040 begin`);
      const actual: number = gridRowsOf(75, 2);
      logInfo(`gridRowsOf(itemCount=75, columns=2): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}GridRowsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0041
     * @tc.name      KeyboardAvoid_GridRowsOf_0041
     * @tc.desc      gridRowsOf(itemCount=80, columns=1) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0041 begin`);
      const actual: number = gridRowsOf(80, 1);
      logInfo(`gridRowsOf(itemCount=80, columns=1): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}GridRowsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0042
     * @tc.name      KeyboardAvoid_GridRowsOf_0042
     * @tc.desc      gridRowsOf(itemCount=80, columns=3) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0042 begin`);
      const actual: number = gridRowsOf(80, 3);
      logInfo(`gridRowsOf(itemCount=80, columns=3): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}GridRowsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0043
     * @tc.name      KeyboardAvoid_GridRowsOf_0043
     * @tc.desc      gridRowsOf(itemCount=80, columns=5) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0043 begin`);
      const actual: number = gridRowsOf(80, 5);
      logInfo(`gridRowsOf(itemCount=80, columns=5): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}GridRowsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0044
     * @tc.name      KeyboardAvoid_GridRowsOf_0044
     * @tc.desc      gridRowsOf(itemCount=85, columns=1) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0044 begin`);
      const actual: number = gridRowsOf(85, 1);
      logInfo(`gridRowsOf(itemCount=85, columns=1): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}GridRowsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0045
     * @tc.name      KeyboardAvoid_GridRowsOf_0045
     * @tc.desc      gridRowsOf(itemCount=85, columns=2) returns 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0045 begin`);
      const actual: number = gridRowsOf(85, 2);
      logInfo(`gridRowsOf(itemCount=85, columns=2): actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}GridRowsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0046
     * @tc.name      KeyboardAvoid_GridRowsOf_0046
     * @tc.desc      gridRowsOf(itemCount=85, columns=3) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0046 begin`);
      const actual: number = gridRowsOf(85, 3);
      logInfo(`gridRowsOf(itemCount=85, columns=3): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}GridRowsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0047
     * @tc.name      KeyboardAvoid_GridRowsOf_0047
     * @tc.desc      gridRowsOf(itemCount=90, columns=1) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0047 begin`);
      const actual: number = gridRowsOf(90, 1);
      logInfo(`gridRowsOf(itemCount=90, columns=1): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}GridRowsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0048
     * @tc.name      KeyboardAvoid_GridRowsOf_0048
     * @tc.desc      gridRowsOf(itemCount=95, columns=1) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0048 begin`);
      const actual: number = gridRowsOf(95, 1);
      logInfo(`gridRowsOf(itemCount=95, columns=1): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}GridRowsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0049
     * @tc.name      KeyboardAvoid_GridRowsOf_0049
     * @tc.desc      gridRowsOf(itemCount=95, columns=2) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0049 begin`);
      const actual: number = gridRowsOf(95, 2);
      logInfo(`gridRowsOf(itemCount=95, columns=2): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}GridRowsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0050
     * @tc.name      KeyboardAvoid_GridRowsOf_0050
     * @tc.desc      gridRowsOf(itemCount=95, columns=3) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0050 begin`);
      const actual: number = gridRowsOf(95, 3);
      logInfo(`gridRowsOf(itemCount=95, columns=3): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}GridRowsOf_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0051
     * @tc.name      KeyboardAvoid_GridRowsOf_0051
     * @tc.desc      gridRowsOf(itemCount=105, columns=1) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0051 begin`);
      const actual: number = gridRowsOf(105, 1);
      logInfo(`gridRowsOf(itemCount=105, columns=1): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}GridRowsOf_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0052
     * @tc.name      KeyboardAvoid_GridRowsOf_0052
     * @tc.desc      gridRowsOf(itemCount=105, columns=2) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0052 begin`);
      const actual: number = gridRowsOf(105, 2);
      logInfo(`gridRowsOf(itemCount=105, columns=2): actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}GridRowsOf_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0053
     * @tc.name      KeyboardAvoid_GridRowsOf_0053
     * @tc.desc      gridRowsOf(itemCount=105, columns=5) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0053 begin`);
      const actual: number = gridRowsOf(105, 5);
      logInfo(`gridRowsOf(itemCount=105, columns=5): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}GridRowsOf_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0054
     * @tc.name      KeyboardAvoid_GridRowsOf_0054
     * @tc.desc      gridRowsOf(itemCount=110, columns=1) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0054 begin`);
      const actual: number = gridRowsOf(110, 1);
      logInfo(`gridRowsOf(itemCount=110, columns=1): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}GridRowsOf_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0055
     * @tc.name      KeyboardAvoid_GridRowsOf_0055
     * @tc.desc      gridRowsOf(itemCount=110, columns=3) returns 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0055 begin`);
      const actual: number = gridRowsOf(110, 3);
      logInfo(`gridRowsOf(itemCount=110, columns=3): actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}GridRowsOf_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0056
     * @tc.name      KeyboardAvoid_GridRowsOf_0056
     * @tc.desc      gridRowsOf(itemCount=0, columns=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0056 begin`);
      const actual: number = gridRowsOf(0, -1);
      logInfo(`gridRowsOf(itemCount=0, columns=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0057
     * @tc.name      KeyboardAvoid_GridRowsOf_0057
     * @tc.desc      gridRowsOf(itemCount=0, columns=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0057 begin`);
      const actual: number = gridRowsOf(0, 1);
      logInfo(`gridRowsOf(itemCount=0, columns=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0058
     * @tc.name      KeyboardAvoid_GridRowsOf_0058
     * @tc.desc      gridRowsOf(itemCount=0, columns=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0058 begin`);
      const actual: number = gridRowsOf(0, 2);
      logInfo(`gridRowsOf(itemCount=0, columns=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0059
     * @tc.name      KeyboardAvoid_GridRowsOf_0059
     * @tc.desc      gridRowsOf(itemCount=0, columns=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0059 begin`);
      const actual: number = gridRowsOf(0, 3);
      logInfo(`gridRowsOf(itemCount=0, columns=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0060
     * @tc.name      KeyboardAvoid_GridRowsOf_0060
     * @tc.desc      gridRowsOf(itemCount=0, columns=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0060 begin`);
      const actual: number = gridRowsOf(0, 10);
      logInfo(`gridRowsOf(itemCount=0, columns=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0061
     * @tc.name      KeyboardAvoid_GridRowsOf_0061
     * @tc.desc      gridRowsOf(itemCount=0, columns=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0061 begin`);
      const actual: number = gridRowsOf(0, 100);
      logInfo(`gridRowsOf(itemCount=0, columns=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0062
     * @tc.name      KeyboardAvoid_GridRowsOf_0062
     * @tc.desc      gridRowsOf(itemCount=0, columns=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0062 begin`);
      const actual: number = gridRowsOf(0, 5);
      logInfo(`gridRowsOf(itemCount=0, columns=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0063
     * @tc.name      KeyboardAvoid_GridRowsOf_0063
     * @tc.desc      gridRowsOf(itemCount=0, columns=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0063 begin`);
      const actual: number = gridRowsOf(0, 15);
      logInfo(`gridRowsOf(itemCount=0, columns=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0064
     * @tc.name      KeyboardAvoid_GridRowsOf_0064
     * @tc.desc      gridRowsOf(itemCount=0, columns=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0064 begin`);
      const actual: number = gridRowsOf(0, 20);
      logInfo(`gridRowsOf(itemCount=0, columns=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0065
     * @tc.name      KeyboardAvoid_GridRowsOf_0065
     * @tc.desc      gridRowsOf(itemCount=0, columns=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0065 begin`);
      const actual: number = gridRowsOf(0, 25);
      logInfo(`gridRowsOf(itemCount=0, columns=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0066
     * @tc.name      KeyboardAvoid_GridRowsOf_0066
     * @tc.desc      gridRowsOf(itemCount=0, columns=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0066 begin`);
      const actual: number = gridRowsOf(0, 30);
      logInfo(`gridRowsOf(itemCount=0, columns=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0067
     * @tc.name      KeyboardAvoid_GridRowsOf_0067
     * @tc.desc      gridRowsOf(itemCount=0, columns=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0067 begin`);
      const actual: number = gridRowsOf(0, 35);
      logInfo(`gridRowsOf(itemCount=0, columns=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0068
     * @tc.name      KeyboardAvoid_GridRowsOf_0068
     * @tc.desc      gridRowsOf(itemCount=0, columns=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0068 begin`);
      const actual: number = gridRowsOf(0, 40);
      logInfo(`gridRowsOf(itemCount=0, columns=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0069
     * @tc.name      KeyboardAvoid_GridRowsOf_0069
     * @tc.desc      gridRowsOf(itemCount=0, columns=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0069 begin`);
      const actual: number = gridRowsOf(0, 45);
      logInfo(`gridRowsOf(itemCount=0, columns=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0070
     * @tc.name      KeyboardAvoid_GridRowsOf_0070
     * @tc.desc      gridRowsOf(itemCount=0, columns=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0070 begin`);
      const actual: number = gridRowsOf(0, 50);
      logInfo(`gridRowsOf(itemCount=0, columns=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0071
     * @tc.name      KeyboardAvoid_GridRowsOf_0071
     * @tc.desc      gridRowsOf(itemCount=0, columns=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0071 begin`);
      const actual: number = gridRowsOf(0, 55);
      logInfo(`gridRowsOf(itemCount=0, columns=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0072
     * @tc.name      KeyboardAvoid_GridRowsOf_0072
     * @tc.desc      gridRowsOf(itemCount=0, columns=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0072 begin`);
      const actual: number = gridRowsOf(0, 60);
      logInfo(`gridRowsOf(itemCount=0, columns=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0073
     * @tc.name      KeyboardAvoid_GridRowsOf_0073
     * @tc.desc      gridRowsOf(itemCount=0, columns=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0073 begin`);
      const actual: number = gridRowsOf(0, 65);
      logInfo(`gridRowsOf(itemCount=0, columns=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0074
     * @tc.name      KeyboardAvoid_GridRowsOf_0074
     * @tc.desc      gridRowsOf(itemCount=0, columns=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0074 begin`);
      const actual: number = gridRowsOf(0, 70);
      logInfo(`gridRowsOf(itemCount=0, columns=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0075
     * @tc.name      KeyboardAvoid_GridRowsOf_0075
     * @tc.desc      gridRowsOf(itemCount=0, columns=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0075 begin`);
      const actual: number = gridRowsOf(0, 75);
      logInfo(`gridRowsOf(itemCount=0, columns=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0076
     * @tc.name      KeyboardAvoid_GridRowsOf_0076
     * @tc.desc      gridRowsOf(itemCount=0, columns=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0076 begin`);
      const actual: number = gridRowsOf(0, 80);
      logInfo(`gridRowsOf(itemCount=0, columns=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0077
     * @tc.name      KeyboardAvoid_GridRowsOf_0077
     * @tc.desc      gridRowsOf(itemCount=0, columns=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0077 begin`);
      const actual: number = gridRowsOf(0, 85);
      logInfo(`gridRowsOf(itemCount=0, columns=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0078
     * @tc.name      KeyboardAvoid_GridRowsOf_0078
     * @tc.desc      gridRowsOf(itemCount=0, columns=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0078 begin`);
      const actual: number = gridRowsOf(0, 90);
      logInfo(`gridRowsOf(itemCount=0, columns=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0079
     * @tc.name      KeyboardAvoid_GridRowsOf_0079
     * @tc.desc      gridRowsOf(itemCount=0, columns=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0079 begin`);
      const actual: number = gridRowsOf(0, 95);
      logInfo(`gridRowsOf(itemCount=0, columns=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0080
     * @tc.name      KeyboardAvoid_GridRowsOf_0080
     * @tc.desc      gridRowsOf(itemCount=0, columns=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0080 begin`);
      const actual: number = gridRowsOf(0, 105);
      logInfo(`gridRowsOf(itemCount=0, columns=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0081
     * @tc.name      KeyboardAvoid_GridRowsOf_0081
     * @tc.desc      gridRowsOf(itemCount=0, columns=110) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0081 begin`);
      const actual: number = gridRowsOf(0, 110);
      logInfo(`gridRowsOf(itemCount=0, columns=110): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0082
     * @tc.name      KeyboardAvoid_GridRowsOf_0082
     * @tc.desc      gridRowsOf(itemCount=0, columns=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0082 begin`);
      const actual: number = gridRowsOf(0, 115);
      logInfo(`gridRowsOf(itemCount=0, columns=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0083
     * @tc.name      KeyboardAvoid_GridRowsOf_0083
     * @tc.desc      gridRowsOf(itemCount=0, columns=42.3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0083 begin`);
      const actual: number = gridRowsOf(0, 42.3);
      logInfo(`gridRowsOf(itemCount=0, columns=42.3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0084
     * @tc.name      KeyboardAvoid_GridRowsOf_0084
     * @tc.desc      gridRowsOf(itemCount=0, columns=22) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0084 begin`);
      const actual: number = gridRowsOf(0, 22);
      logInfo(`gridRowsOf(itemCount=0, columns=22): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0085
     * @tc.name      KeyboardAvoid_GridRowsOf_0085
     * @tc.desc      gridRowsOf(itemCount=1, columns=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0085 begin`);
      const actual: number = gridRowsOf(1, 0);
      logInfo(`gridRowsOf(itemCount=1, columns=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0086
     * @tc.name      KeyboardAvoid_GridRowsOf_0086
     * @tc.desc      gridRowsOf(itemCount=1, columns=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_GridRowsOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0086 begin`);
      const actual: number = gridRowsOf(1, -1);
      logInfo(`gridRowsOf(itemCount=1, columns=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowsOf_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0087
     * @tc.name      KeyboardAvoid_GridRowsOf_0087
     * @tc.desc      gridRowsOf(itemCount=1, columns=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0087 begin`);
      const actual: number = gridRowsOf(1, 2);
      logInfo(`gridRowsOf(itemCount=1, columns=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0088
     * @tc.name      KeyboardAvoid_GridRowsOf_0088
     * @tc.desc      gridRowsOf(itemCount=1, columns=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0088 begin`);
      const actual: number = gridRowsOf(1, 3);
      logInfo(`gridRowsOf(itemCount=1, columns=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0089
     * @tc.name      KeyboardAvoid_GridRowsOf_0089
     * @tc.desc      gridRowsOf(itemCount=1, columns=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0089 begin`);
      const actual: number = gridRowsOf(1, 10);
      logInfo(`gridRowsOf(itemCount=1, columns=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0090
     * @tc.name      KeyboardAvoid_GridRowsOf_0090
     * @tc.desc      gridRowsOf(itemCount=1, columns=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0090 begin`);
      const actual: number = gridRowsOf(1, 100);
      logInfo(`gridRowsOf(itemCount=1, columns=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0091
     * @tc.name      KeyboardAvoid_GridRowsOf_0091
     * @tc.desc      gridRowsOf(itemCount=1, columns=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0091 begin`);
      const actual: number = gridRowsOf(1, 5);
      logInfo(`gridRowsOf(itemCount=1, columns=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0092
     * @tc.name      KeyboardAvoid_GridRowsOf_0092
     * @tc.desc      gridRowsOf(itemCount=1, columns=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0092 begin`);
      const actual: number = gridRowsOf(1, 15);
      logInfo(`gridRowsOf(itemCount=1, columns=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0093
     * @tc.name      KeyboardAvoid_GridRowsOf_0093
     * @tc.desc      gridRowsOf(itemCount=1, columns=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0093 begin`);
      const actual: number = gridRowsOf(1, 20);
      logInfo(`gridRowsOf(itemCount=1, columns=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0094
     * @tc.name      KeyboardAvoid_GridRowsOf_0094
     * @tc.desc      gridRowsOf(itemCount=1, columns=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0094 begin`);
      const actual: number = gridRowsOf(1, 25);
      logInfo(`gridRowsOf(itemCount=1, columns=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0095
     * @tc.name      KeyboardAvoid_GridRowsOf_0095
     * @tc.desc      gridRowsOf(itemCount=1, columns=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0095 begin`);
      const actual: number = gridRowsOf(1, 30);
      logInfo(`gridRowsOf(itemCount=1, columns=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_GRID_ROWS_OF_0096
     * @tc.name      KeyboardAvoid_GridRowsOf_0096
     * @tc.desc      gridRowsOf(itemCount=1, columns=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_GridRowsOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowsOf_0096 begin`);
      const actual: number = gridRowsOf(1, 35);
      logInfo(`gridRowsOf(itemCount=1, columns=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowsOf_0096 end`);
    });
  });
}
