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

/** Logic checks for gridIndexOf (96 cases). */
export default function gridIndexOfTest(): void {
  describe('GridIndexOfTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0001
     * @tc.name      DragAndExchange_GridIndexOf_0001
     * @tc.desc      gridIndexOf(row=0, column=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridIndexOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0001 begin`);
      const actual: number = gridIndexOf(0, 0);
      logInfo(`gridIndexOf(row=0, column=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridIndexOf_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0002
     * @tc.name      DragAndExchange_GridIndexOf_0002
     * @tc.desc      gridIndexOf(row=0, column=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridIndexOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0002 begin`);
      const actual: number = gridIndexOf(0, -1);
      logInfo(`gridIndexOf(row=0, column=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0003
     * @tc.name      DragAndExchange_GridIndexOf_0003
     * @tc.desc      gridIndexOf(row=0, column=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0003 begin`);
      const actual: number = gridIndexOf(0, 1);
      logInfo(`gridIndexOf(row=0, column=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridIndexOf_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0004
     * @tc.name      DragAndExchange_GridIndexOf_0004
     * @tc.desc      gridIndexOf(row=0, column=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0004 begin`);
      const actual: number = gridIndexOf(0, 2);
      logInfo(`gridIndexOf(row=0, column=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}GridIndexOf_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0005
     * @tc.name      DragAndExchange_GridIndexOf_0005
     * @tc.desc      gridIndexOf(row=0, column=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0005 begin`);
      const actual: number = gridIndexOf(0, 3);
      logInfo(`gridIndexOf(row=0, column=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GridIndexOf_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0006
     * @tc.name      DragAndExchange_GridIndexOf_0006
     * @tc.desc      gridIndexOf(row=1, column=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0006 begin`);
      const actual: number = gridIndexOf(1, 0);
      logInfo(`gridIndexOf(row=1, column=0): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}GridIndexOf_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0007
     * @tc.name      DragAndExchange_GridIndexOf_0007
     * @tc.desc      gridIndexOf(row=1, column=1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0007 begin`);
      const actual: number = gridIndexOf(1, 1);
      logInfo(`gridIndexOf(row=1, column=1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}GridIndexOf_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0008
     * @tc.name      DragAndExchange_GridIndexOf_0008
     * @tc.desc      gridIndexOf(row=1, column=2) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0008 begin`);
      const actual: number = gridIndexOf(1, 2);
      logInfo(`gridIndexOf(row=1, column=2): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}GridIndexOf_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0009
     * @tc.name      DragAndExchange_GridIndexOf_0009
     * @tc.desc      gridIndexOf(row=1, column=3) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0009 begin`);
      const actual: number = gridIndexOf(1, 3);
      logInfo(`gridIndexOf(row=1, column=3): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GridIndexOf_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0010
     * @tc.name      DragAndExchange_GridIndexOf_0010
     * @tc.desc      gridIndexOf(row=2, column=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0010 begin`);
      const actual: number = gridIndexOf(2, 0);
      logInfo(`gridIndexOf(row=2, column=0): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}GridIndexOf_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0011
     * @tc.name      DragAndExchange_GridIndexOf_0011
     * @tc.desc      gridIndexOf(row=2, column=1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0011 begin`);
      const actual: number = gridIndexOf(2, 1);
      logInfo(`gridIndexOf(row=2, column=1): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}GridIndexOf_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0012
     * @tc.name      DragAndExchange_GridIndexOf_0012
     * @tc.desc      gridIndexOf(row=2, column=2) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0012 begin`);
      const actual: number = gridIndexOf(2, 2);
      logInfo(`gridIndexOf(row=2, column=2): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridIndexOf_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0013
     * @tc.name      DragAndExchange_GridIndexOf_0013
     * @tc.desc      gridIndexOf(row=2, column=3) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIndexOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0013 begin`);
      const actual: number = gridIndexOf(2, 3);
      logInfo(`gridIndexOf(row=2, column=3): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GridIndexOf_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0014
     * @tc.name      DragAndExchange_GridIndexOf_0014
     * @tc.desc      gridIndexOf(row=0, column=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0014 begin`);
      const actual: number = gridIndexOf(0, -2);
      logInfo(`gridIndexOf(row=0, column=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0015
     * @tc.name      DragAndExchange_GridIndexOf_0015
     * @tc.desc      gridIndexOf(row=0, column=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0015 begin`);
      const actual: number = gridIndexOf(0, 10);
      logInfo(`gridIndexOf(row=0, column=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0016
     * @tc.name      DragAndExchange_GridIndexOf_0016
     * @tc.desc      gridIndexOf(row=0, column=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0016 begin`);
      const actual: number = gridIndexOf(0, 100);
      logInfo(`gridIndexOf(row=0, column=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0017
     * @tc.name      DragAndExchange_GridIndexOf_0017
     * @tc.desc      gridIndexOf(row=0, column=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0017 begin`);
      const actual: number = gridIndexOf(0, 5);
      logInfo(`gridIndexOf(row=0, column=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0018
     * @tc.name      DragAndExchange_GridIndexOf_0018
     * @tc.desc      gridIndexOf(row=0, column=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0018 begin`);
      const actual: number = gridIndexOf(0, 15);
      logInfo(`gridIndexOf(row=0, column=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0019
     * @tc.name      DragAndExchange_GridIndexOf_0019
     * @tc.desc      gridIndexOf(row=0, column=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0019 begin`);
      const actual: number = gridIndexOf(0, 20);
      logInfo(`gridIndexOf(row=0, column=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0020
     * @tc.name      DragAndExchange_GridIndexOf_0020
     * @tc.desc      gridIndexOf(row=0, column=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0020 begin`);
      const actual: number = gridIndexOf(0, 25);
      logInfo(`gridIndexOf(row=0, column=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0021
     * @tc.name      DragAndExchange_GridIndexOf_0021
     * @tc.desc      gridIndexOf(row=0, column=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0021 begin`);
      const actual: number = gridIndexOf(0, 30);
      logInfo(`gridIndexOf(row=0, column=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0022
     * @tc.name      DragAndExchange_GridIndexOf_0022
     * @tc.desc      gridIndexOf(row=0, column=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0022 begin`);
      const actual: number = gridIndexOf(0, 35);
      logInfo(`gridIndexOf(row=0, column=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0023
     * @tc.name      DragAndExchange_GridIndexOf_0023
     * @tc.desc      gridIndexOf(row=0, column=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0023 begin`);
      const actual: number = gridIndexOf(0, 40);
      logInfo(`gridIndexOf(row=0, column=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0024
     * @tc.name      DragAndExchange_GridIndexOf_0024
     * @tc.desc      gridIndexOf(row=0, column=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0024 begin`);
      const actual: number = gridIndexOf(0, 45);
      logInfo(`gridIndexOf(row=0, column=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0025
     * @tc.name      DragAndExchange_GridIndexOf_0025
     * @tc.desc      gridIndexOf(row=0, column=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0025 begin`);
      const actual: number = gridIndexOf(0, 50);
      logInfo(`gridIndexOf(row=0, column=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0026
     * @tc.name      DragAndExchange_GridIndexOf_0026
     * @tc.desc      gridIndexOf(row=0, column=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0026 begin`);
      const actual: number = gridIndexOf(0, 55);
      logInfo(`gridIndexOf(row=0, column=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0027
     * @tc.name      DragAndExchange_GridIndexOf_0027
     * @tc.desc      gridIndexOf(row=0, column=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0027 begin`);
      const actual: number = gridIndexOf(0, 60);
      logInfo(`gridIndexOf(row=0, column=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0028
     * @tc.name      DragAndExchange_GridIndexOf_0028
     * @tc.desc      gridIndexOf(row=0, column=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0028 begin`);
      const actual: number = gridIndexOf(0, 65);
      logInfo(`gridIndexOf(row=0, column=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0029
     * @tc.name      DragAndExchange_GridIndexOf_0029
     * @tc.desc      gridIndexOf(row=0, column=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0029 begin`);
      const actual: number = gridIndexOf(0, 70);
      logInfo(`gridIndexOf(row=0, column=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0030
     * @tc.name      DragAndExchange_GridIndexOf_0030
     * @tc.desc      gridIndexOf(row=0, column=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0030 begin`);
      const actual: number = gridIndexOf(0, 75);
      logInfo(`gridIndexOf(row=0, column=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0031
     * @tc.name      DragAndExchange_GridIndexOf_0031
     * @tc.desc      gridIndexOf(row=0, column=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0031 begin`);
      const actual: number = gridIndexOf(0, 80);
      logInfo(`gridIndexOf(row=0, column=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0032
     * @tc.name      DragAndExchange_GridIndexOf_0032
     * @tc.desc      gridIndexOf(row=0, column=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0032 begin`);
      const actual: number = gridIndexOf(0, 85);
      logInfo(`gridIndexOf(row=0, column=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0033
     * @tc.name      DragAndExchange_GridIndexOf_0033
     * @tc.desc      gridIndexOf(row=0, column=90) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0033 begin`);
      const actual: number = gridIndexOf(0, 90);
      logInfo(`gridIndexOf(row=0, column=90): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0034
     * @tc.name      DragAndExchange_GridIndexOf_0034
     * @tc.desc      gridIndexOf(row=0, column=95) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0034 begin`);
      const actual: number = gridIndexOf(0, 95);
      logInfo(`gridIndexOf(row=0, column=95): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0035
     * @tc.name      DragAndExchange_GridIndexOf_0035
     * @tc.desc      gridIndexOf(row=0, column=105) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0035 begin`);
      const actual: number = gridIndexOf(0, 105);
      logInfo(`gridIndexOf(row=0, column=105): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0036
     * @tc.name      DragAndExchange_GridIndexOf_0036
     * @tc.desc      gridIndexOf(row=0, column=110) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0036 begin`);
      const actual: number = gridIndexOf(0, 110);
      logInfo(`gridIndexOf(row=0, column=110): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0037
     * @tc.name      DragAndExchange_GridIndexOf_0037
     * @tc.desc      gridIndexOf(row=0, column=78) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0037 begin`);
      const actual: number = gridIndexOf(0, 78);
      logInfo(`gridIndexOf(row=0, column=78): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0038
     * @tc.name      DragAndExchange_GridIndexOf_0038
     * @tc.desc      gridIndexOf(row=0, column=34) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0038 begin`);
      const actual: number = gridIndexOf(0, 34);
      logInfo(`gridIndexOf(row=0, column=34): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0039
     * @tc.name      DragAndExchange_GridIndexOf_0039
     * @tc.desc      gridIndexOf(row=-1, column=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0039 begin`);
      const actual: number = gridIndexOf(-1, 0);
      logInfo(`gridIndexOf(row=-1, column=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0040
     * @tc.name      DragAndExchange_GridIndexOf_0040
     * @tc.desc      gridIndexOf(row=-1, column=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0040 begin`);
      const actual: number = gridIndexOf(-1, -1);
      logInfo(`gridIndexOf(row=-1, column=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0041
     * @tc.name      DragAndExchange_GridIndexOf_0041
     * @tc.desc      gridIndexOf(row=-1, column=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0041 begin`);
      const actual: number = gridIndexOf(-1, 1);
      logInfo(`gridIndexOf(row=-1, column=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0042
     * @tc.name      DragAndExchange_GridIndexOf_0042
     * @tc.desc      gridIndexOf(row=-1, column=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0042 begin`);
      const actual: number = gridIndexOf(-1, -2);
      logInfo(`gridIndexOf(row=-1, column=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0043
     * @tc.name      DragAndExchange_GridIndexOf_0043
     * @tc.desc      gridIndexOf(row=-1, column=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0043 begin`);
      const actual: number = gridIndexOf(-1, 2);
      logInfo(`gridIndexOf(row=-1, column=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0044
     * @tc.name      DragAndExchange_GridIndexOf_0044
     * @tc.desc      gridIndexOf(row=-1, column=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0044 begin`);
      const actual: number = gridIndexOf(-1, 3);
      logInfo(`gridIndexOf(row=-1, column=3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0045
     * @tc.name      DragAndExchange_GridIndexOf_0045
     * @tc.desc      gridIndexOf(row=-1, column=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0045 begin`);
      const actual: number = gridIndexOf(-1, 10);
      logInfo(`gridIndexOf(row=-1, column=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0046
     * @tc.name      DragAndExchange_GridIndexOf_0046
     * @tc.desc      gridIndexOf(row=-1, column=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0046 begin`);
      const actual: number = gridIndexOf(-1, 100);
      logInfo(`gridIndexOf(row=-1, column=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0047
     * @tc.name      DragAndExchange_GridIndexOf_0047
     * @tc.desc      gridIndexOf(row=-1, column=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0047 begin`);
      const actual: number = gridIndexOf(-1, 5);
      logInfo(`gridIndexOf(row=-1, column=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0048
     * @tc.name      DragAndExchange_GridIndexOf_0048
     * @tc.desc      gridIndexOf(row=-1, column=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0048 begin`);
      const actual: number = gridIndexOf(-1, 15);
      logInfo(`gridIndexOf(row=-1, column=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0049
     * @tc.name      DragAndExchange_GridIndexOf_0049
     * @tc.desc      gridIndexOf(row=-1, column=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0049 begin`);
      const actual: number = gridIndexOf(-1, 20);
      logInfo(`gridIndexOf(row=-1, column=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0050
     * @tc.name      DragAndExchange_GridIndexOf_0050
     * @tc.desc      gridIndexOf(row=-1, column=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0050 begin`);
      const actual: number = gridIndexOf(-1, 25);
      logInfo(`gridIndexOf(row=-1, column=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0051
     * @tc.name      DragAndExchange_GridIndexOf_0051
     * @tc.desc      gridIndexOf(row=-1, column=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0051 begin`);
      const actual: number = gridIndexOf(-1, 30);
      logInfo(`gridIndexOf(row=-1, column=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0052
     * @tc.name      DragAndExchange_GridIndexOf_0052
     * @tc.desc      gridIndexOf(row=-1, column=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0052 begin`);
      const actual: number = gridIndexOf(-1, 35);
      logInfo(`gridIndexOf(row=-1, column=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0053
     * @tc.name      DragAndExchange_GridIndexOf_0053
     * @tc.desc      gridIndexOf(row=-1, column=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0053 begin`);
      const actual: number = gridIndexOf(-1, 40);
      logInfo(`gridIndexOf(row=-1, column=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0054
     * @tc.name      DragAndExchange_GridIndexOf_0054
     * @tc.desc      gridIndexOf(row=-1, column=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0054 begin`);
      const actual: number = gridIndexOf(-1, 45);
      logInfo(`gridIndexOf(row=-1, column=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0055
     * @tc.name      DragAndExchange_GridIndexOf_0055
     * @tc.desc      gridIndexOf(row=-1, column=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0055 begin`);
      const actual: number = gridIndexOf(-1, 50);
      logInfo(`gridIndexOf(row=-1, column=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0056
     * @tc.name      DragAndExchange_GridIndexOf_0056
     * @tc.desc      gridIndexOf(row=-1, column=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0056 begin`);
      const actual: number = gridIndexOf(-1, 55);
      logInfo(`gridIndexOf(row=-1, column=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0057
     * @tc.name      DragAndExchange_GridIndexOf_0057
     * @tc.desc      gridIndexOf(row=-1, column=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0057 begin`);
      const actual: number = gridIndexOf(-1, 60);
      logInfo(`gridIndexOf(row=-1, column=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0058
     * @tc.name      DragAndExchange_GridIndexOf_0058
     * @tc.desc      gridIndexOf(row=-1, column=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0058 begin`);
      const actual: number = gridIndexOf(-1, 65);
      logInfo(`gridIndexOf(row=-1, column=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0059
     * @tc.name      DragAndExchange_GridIndexOf_0059
     * @tc.desc      gridIndexOf(row=-1, column=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0059 begin`);
      const actual: number = gridIndexOf(-1, 70);
      logInfo(`gridIndexOf(row=-1, column=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0060
     * @tc.name      DragAndExchange_GridIndexOf_0060
     * @tc.desc      gridIndexOf(row=-1, column=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0060 begin`);
      const actual: number = gridIndexOf(-1, 75);
      logInfo(`gridIndexOf(row=-1, column=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0061
     * @tc.name      DragAndExchange_GridIndexOf_0061
     * @tc.desc      gridIndexOf(row=-1, column=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0061 begin`);
      const actual: number = gridIndexOf(-1, 80);
      logInfo(`gridIndexOf(row=-1, column=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0062
     * @tc.name      DragAndExchange_GridIndexOf_0062
     * @tc.desc      gridIndexOf(row=-1, column=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0062 begin`);
      const actual: number = gridIndexOf(-1, 85);
      logInfo(`gridIndexOf(row=-1, column=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0063
     * @tc.name      DragAndExchange_GridIndexOf_0063
     * @tc.desc      gridIndexOf(row=-1, column=90) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0063 begin`);
      const actual: number = gridIndexOf(-1, 90);
      logInfo(`gridIndexOf(row=-1, column=90): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0064
     * @tc.name      DragAndExchange_GridIndexOf_0064
     * @tc.desc      gridIndexOf(row=-1, column=95) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0064 begin`);
      const actual: number = gridIndexOf(-1, 95);
      logInfo(`gridIndexOf(row=-1, column=95): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0065
     * @tc.name      DragAndExchange_GridIndexOf_0065
     * @tc.desc      gridIndexOf(row=-1, column=105) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0065 begin`);
      const actual: number = gridIndexOf(-1, 105);
      logInfo(`gridIndexOf(row=-1, column=105): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0066
     * @tc.name      DragAndExchange_GridIndexOf_0066
     * @tc.desc      gridIndexOf(row=-1, column=110) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0066 begin`);
      const actual: number = gridIndexOf(-1, 110);
      logInfo(`gridIndexOf(row=-1, column=110): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0067
     * @tc.name      DragAndExchange_GridIndexOf_0067
     * @tc.desc      gridIndexOf(row=-1, column=78) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0067 begin`);
      const actual: number = gridIndexOf(-1, 78);
      logInfo(`gridIndexOf(row=-1, column=78): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0068
     * @tc.name      DragAndExchange_GridIndexOf_0068
     * @tc.desc      gridIndexOf(row=-1, column=34) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0068 begin`);
      const actual: number = gridIndexOf(-1, 34);
      logInfo(`gridIndexOf(row=-1, column=34): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0069
     * @tc.name      DragAndExchange_GridIndexOf_0069
     * @tc.desc      gridIndexOf(row=1, column=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0069 begin`);
      const actual: number = gridIndexOf(1, -1);
      logInfo(`gridIndexOf(row=1, column=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0070
     * @tc.name      DragAndExchange_GridIndexOf_0070
     * @tc.desc      gridIndexOf(row=1, column=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0070 begin`);
      const actual: number = gridIndexOf(1, -2);
      logInfo(`gridIndexOf(row=1, column=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0071
     * @tc.name      DragAndExchange_GridIndexOf_0071
     * @tc.desc      gridIndexOf(row=1, column=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0071 begin`);
      const actual: number = gridIndexOf(1, 10);
      logInfo(`gridIndexOf(row=1, column=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0072
     * @tc.name      DragAndExchange_GridIndexOf_0072
     * @tc.desc      gridIndexOf(row=1, column=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0072 begin`);
      const actual: number = gridIndexOf(1, 100);
      logInfo(`gridIndexOf(row=1, column=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0073
     * @tc.name      DragAndExchange_GridIndexOf_0073
     * @tc.desc      gridIndexOf(row=1, column=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0073 begin`);
      const actual: number = gridIndexOf(1, 5);
      logInfo(`gridIndexOf(row=1, column=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0074
     * @tc.name      DragAndExchange_GridIndexOf_0074
     * @tc.desc      gridIndexOf(row=1, column=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0074 begin`);
      const actual: number = gridIndexOf(1, 15);
      logInfo(`gridIndexOf(row=1, column=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0075
     * @tc.name      DragAndExchange_GridIndexOf_0075
     * @tc.desc      gridIndexOf(row=1, column=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0075 begin`);
      const actual: number = gridIndexOf(1, 20);
      logInfo(`gridIndexOf(row=1, column=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0076
     * @tc.name      DragAndExchange_GridIndexOf_0076
     * @tc.desc      gridIndexOf(row=1, column=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0076 begin`);
      const actual: number = gridIndexOf(1, 25);
      logInfo(`gridIndexOf(row=1, column=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0077
     * @tc.name      DragAndExchange_GridIndexOf_0077
     * @tc.desc      gridIndexOf(row=1, column=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0077 begin`);
      const actual: number = gridIndexOf(1, 30);
      logInfo(`gridIndexOf(row=1, column=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0078
     * @tc.name      DragAndExchange_GridIndexOf_0078
     * @tc.desc      gridIndexOf(row=1, column=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0078 begin`);
      const actual: number = gridIndexOf(1, 35);
      logInfo(`gridIndexOf(row=1, column=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0079
     * @tc.name      DragAndExchange_GridIndexOf_0079
     * @tc.desc      gridIndexOf(row=1, column=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0079 begin`);
      const actual: number = gridIndexOf(1, 40);
      logInfo(`gridIndexOf(row=1, column=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0080
     * @tc.name      DragAndExchange_GridIndexOf_0080
     * @tc.desc      gridIndexOf(row=1, column=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0080 begin`);
      const actual: number = gridIndexOf(1, 45);
      logInfo(`gridIndexOf(row=1, column=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0081
     * @tc.name      DragAndExchange_GridIndexOf_0081
     * @tc.desc      gridIndexOf(row=1, column=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0081 begin`);
      const actual: number = gridIndexOf(1, 50);
      logInfo(`gridIndexOf(row=1, column=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0082
     * @tc.name      DragAndExchange_GridIndexOf_0082
     * @tc.desc      gridIndexOf(row=1, column=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0082 begin`);
      const actual: number = gridIndexOf(1, 55);
      logInfo(`gridIndexOf(row=1, column=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0083
     * @tc.name      DragAndExchange_GridIndexOf_0083
     * @tc.desc      gridIndexOf(row=1, column=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0083 begin`);
      const actual: number = gridIndexOf(1, 60);
      logInfo(`gridIndexOf(row=1, column=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0084
     * @tc.name      DragAndExchange_GridIndexOf_0084
     * @tc.desc      gridIndexOf(row=1, column=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0084 begin`);
      const actual: number = gridIndexOf(1, 65);
      logInfo(`gridIndexOf(row=1, column=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0085
     * @tc.name      DragAndExchange_GridIndexOf_0085
     * @tc.desc      gridIndexOf(row=1, column=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0085 begin`);
      const actual: number = gridIndexOf(1, 70);
      logInfo(`gridIndexOf(row=1, column=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0086
     * @tc.name      DragAndExchange_GridIndexOf_0086
     * @tc.desc      gridIndexOf(row=1, column=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0086 begin`);
      const actual: number = gridIndexOf(1, 75);
      logInfo(`gridIndexOf(row=1, column=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0087
     * @tc.name      DragAndExchange_GridIndexOf_0087
     * @tc.desc      gridIndexOf(row=1, column=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0087 begin`);
      const actual: number = gridIndexOf(1, 80);
      logInfo(`gridIndexOf(row=1, column=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0088
     * @tc.name      DragAndExchange_GridIndexOf_0088
     * @tc.desc      gridIndexOf(row=1, column=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0088 begin`);
      const actual: number = gridIndexOf(1, 85);
      logInfo(`gridIndexOf(row=1, column=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0089
     * @tc.name      DragAndExchange_GridIndexOf_0089
     * @tc.desc      gridIndexOf(row=1, column=90) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0089 begin`);
      const actual: number = gridIndexOf(1, 90);
      logInfo(`gridIndexOf(row=1, column=90): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0090
     * @tc.name      DragAndExchange_GridIndexOf_0090
     * @tc.desc      gridIndexOf(row=1, column=95) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0090 begin`);
      const actual: number = gridIndexOf(1, 95);
      logInfo(`gridIndexOf(row=1, column=95): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0091
     * @tc.name      DragAndExchange_GridIndexOf_0091
     * @tc.desc      gridIndexOf(row=1, column=105) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0091 begin`);
      const actual: number = gridIndexOf(1, 105);
      logInfo(`gridIndexOf(row=1, column=105): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0092
     * @tc.name      DragAndExchange_GridIndexOf_0092
     * @tc.desc      gridIndexOf(row=1, column=110) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0092 begin`);
      const actual: number = gridIndexOf(1, 110);
      logInfo(`gridIndexOf(row=1, column=110): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0093
     * @tc.name      DragAndExchange_GridIndexOf_0093
     * @tc.desc      gridIndexOf(row=1, column=78) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0093 begin`);
      const actual: number = gridIndexOf(1, 78);
      logInfo(`gridIndexOf(row=1, column=78): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0094
     * @tc.name      DragAndExchange_GridIndexOf_0094
     * @tc.desc      gridIndexOf(row=1, column=34) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0094 begin`);
      const actual: number = gridIndexOf(1, 34);
      logInfo(`gridIndexOf(row=1, column=34): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0095
     * @tc.name      DragAndExchange_GridIndexOf_0095
     * @tc.desc      gridIndexOf(row=-2, column=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0095 begin`);
      const actual: number = gridIndexOf(-2, 0);
      logInfo(`gridIndexOf(row=-2, column=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_INDEX_OF_0096
     * @tc.name      DragAndExchange_GridIndexOf_0096
     * @tc.desc      gridIndexOf(row=-2, column=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridIndexOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridIndexOf_0096 begin`);
      const actual: number = gridIndexOf(-2, -1);
      logInfo(`gridIndexOf(row=-2, column=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridIndexOf_0096 end`);
    });
  });
}
