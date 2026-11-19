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
import { gridColumnOf } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridColumnOf (96 cases). */
export default function gridColumnOfTest(): void {
  describe('GridColumnOfTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0001
     * @tc.name      DragAndExchange_GridColumnOf_0001
     * @tc.desc      gridColumnOf(index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridColumnOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0001 begin`);
      const actual: number = gridColumnOf(0);
      logInfo(`gridColumnOf(index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridColumnOf_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0002
     * @tc.name      DragAndExchange_GridColumnOf_0002
     * @tc.desc      gridColumnOf(index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridColumnOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0002 begin`);
      const actual: number = gridColumnOf(1);
      logInfo(`gridColumnOf(index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridColumnOf_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0003
     * @tc.name      DragAndExchange_GridColumnOf_0003
     * @tc.desc      gridColumnOf(index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridColumnOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0003 begin`);
      const actual: number = gridColumnOf(-1);
      logInfo(`gridColumnOf(index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0004
     * @tc.name      DragAndExchange_GridColumnOf_0004
     * @tc.desc      gridColumnOf(index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0004 begin`);
      const actual: number = gridColumnOf(2);
      logInfo(`gridColumnOf(index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}GridColumnOf_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0005
     * @tc.name      DragAndExchange_GridColumnOf_0005
     * @tc.desc      gridColumnOf(index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0005 begin`);
      const actual: number = gridColumnOf(3);
      logInfo(`gridColumnOf(index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GridColumnOf_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0006
     * @tc.name      DragAndExchange_GridColumnOf_0006
     * @tc.desc      gridColumnOf(index=4) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0006 begin`);
      const actual: number = gridColumnOf(4);
      logInfo(`gridColumnOf(index=4): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}GridColumnOf_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0007
     * @tc.name      DragAndExchange_GridColumnOf_0007
     * @tc.desc      gridColumnOf(index=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridColumnOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0007 begin`);
      const actual: number = gridColumnOf(-2);
      logInfo(`gridColumnOf(index=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0008
     * @tc.name      DragAndExchange_GridColumnOf_0008
     * @tc.desc      gridColumnOf(index=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0008 begin`);
      const actual: number = gridColumnOf(5);
      logInfo(`gridColumnOf(index=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridColumnOf_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0009
     * @tc.name      DragAndExchange_GridColumnOf_0009
     * @tc.desc      gridColumnOf(index=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0009 begin`);
      const actual: number = gridColumnOf(10);
      logInfo(`gridColumnOf(index=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridColumnOf_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0010
     * @tc.name      DragAndExchange_GridColumnOf_0010
     * @tc.desc      gridColumnOf(index=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0010 begin`);
      const actual: number = gridColumnOf(100);
      logInfo(`gridColumnOf(index=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0011
     * @tc.name      DragAndExchange_GridColumnOf_0011
     * @tc.desc      gridColumnOf(index=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0011 begin`);
      const actual: number = gridColumnOf(15);
      logInfo(`gridColumnOf(index=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0012
     * @tc.name      DragAndExchange_GridColumnOf_0012
     * @tc.desc      gridColumnOf(index=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0012 begin`);
      const actual: number = gridColumnOf(20);
      logInfo(`gridColumnOf(index=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0013
     * @tc.name      DragAndExchange_GridColumnOf_0013
     * @tc.desc      gridColumnOf(index=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0013 begin`);
      const actual: number = gridColumnOf(25);
      logInfo(`gridColumnOf(index=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0014
     * @tc.name      DragAndExchange_GridColumnOf_0014
     * @tc.desc      gridColumnOf(index=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0014 begin`);
      const actual: number = gridColumnOf(30);
      logInfo(`gridColumnOf(index=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0015
     * @tc.name      DragAndExchange_GridColumnOf_0015
     * @tc.desc      gridColumnOf(index=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0015 begin`);
      const actual: number = gridColumnOf(35);
      logInfo(`gridColumnOf(index=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0016
     * @tc.name      DragAndExchange_GridColumnOf_0016
     * @tc.desc      gridColumnOf(index=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0016 begin`);
      const actual: number = gridColumnOf(40);
      logInfo(`gridColumnOf(index=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0017
     * @tc.name      DragAndExchange_GridColumnOf_0017
     * @tc.desc      gridColumnOf(index=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0017 begin`);
      const actual: number = gridColumnOf(45);
      logInfo(`gridColumnOf(index=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0018
     * @tc.name      DragAndExchange_GridColumnOf_0018
     * @tc.desc      gridColumnOf(index=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0018 begin`);
      const actual: number = gridColumnOf(50);
      logInfo(`gridColumnOf(index=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0019
     * @tc.name      DragAndExchange_GridColumnOf_0019
     * @tc.desc      gridColumnOf(index=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0019 begin`);
      const actual: number = gridColumnOf(55);
      logInfo(`gridColumnOf(index=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0020
     * @tc.name      DragAndExchange_GridColumnOf_0020
     * @tc.desc      gridColumnOf(index=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0020 begin`);
      const actual: number = gridColumnOf(60);
      logInfo(`gridColumnOf(index=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0021
     * @tc.name      DragAndExchange_GridColumnOf_0021
     * @tc.desc      gridColumnOf(index=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0021 begin`);
      const actual: number = gridColumnOf(65);
      logInfo(`gridColumnOf(index=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0022
     * @tc.name      DragAndExchange_GridColumnOf_0022
     * @tc.desc      gridColumnOf(index=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0022 begin`);
      const actual: number = gridColumnOf(70);
      logInfo(`gridColumnOf(index=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0023
     * @tc.name      DragAndExchange_GridColumnOf_0023
     * @tc.desc      gridColumnOf(index=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0023 begin`);
      const actual: number = gridColumnOf(75);
      logInfo(`gridColumnOf(index=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0024
     * @tc.name      DragAndExchange_GridColumnOf_0024
     * @tc.desc      gridColumnOf(index=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0024 begin`);
      const actual: number = gridColumnOf(80);
      logInfo(`gridColumnOf(index=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0025
     * @tc.name      DragAndExchange_GridColumnOf_0025
     * @tc.desc      gridColumnOf(index=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0025 begin`);
      const actual: number = gridColumnOf(85);
      logInfo(`gridColumnOf(index=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0026
     * @tc.name      DragAndExchange_GridColumnOf_0026
     * @tc.desc      gridColumnOf(index=90) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0026 begin`);
      const actual: number = gridColumnOf(90);
      logInfo(`gridColumnOf(index=90): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0027
     * @tc.name      DragAndExchange_GridColumnOf_0027
     * @tc.desc      gridColumnOf(index=95) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0027 begin`);
      const actual: number = gridColumnOf(95);
      logInfo(`gridColumnOf(index=95): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0028
     * @tc.name      DragAndExchange_GridColumnOf_0028
     * @tc.desc      gridColumnOf(index=105) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0028 begin`);
      const actual: number = gridColumnOf(105);
      logInfo(`gridColumnOf(index=105): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0029
     * @tc.name      DragAndExchange_GridColumnOf_0029
     * @tc.desc      gridColumnOf(index=110) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0029 begin`);
      const actual: number = gridColumnOf(110);
      logInfo(`gridColumnOf(index=110): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0030
     * @tc.name      DragAndExchange_GridColumnOf_0030
     * @tc.desc      gridColumnOf(index=115) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0030 begin`);
      const actual: number = gridColumnOf(115);
      logInfo(`gridColumnOf(index=115): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0031
     * @tc.name      DragAndExchange_GridColumnOf_0031
     * @tc.desc      gridColumnOf(index=120) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0031 begin`);
      const actual: number = gridColumnOf(120);
      logInfo(`gridColumnOf(index=120): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0032
     * @tc.name      DragAndExchange_GridColumnOf_0032
     * @tc.desc      gridColumnOf(index=125) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0032 begin`);
      const actual: number = gridColumnOf(125);
      logInfo(`gridColumnOf(index=125): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0033
     * @tc.name      DragAndExchange_GridColumnOf_0033
     * @tc.desc      gridColumnOf(index=130) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0033 begin`);
      const actual: number = gridColumnOf(130);
      logInfo(`gridColumnOf(index=130): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0034
     * @tc.name      DragAndExchange_GridColumnOf_0034
     * @tc.desc      gridColumnOf(index=135) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0034 begin`);
      const actual: number = gridColumnOf(135);
      logInfo(`gridColumnOf(index=135): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0035
     * @tc.name      DragAndExchange_GridColumnOf_0035
     * @tc.desc      gridColumnOf(index=140) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0035 begin`);
      const actual: number = gridColumnOf(140);
      logInfo(`gridColumnOf(index=140): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0036
     * @tc.name      DragAndExchange_GridColumnOf_0036
     * @tc.desc      gridColumnOf(index=145) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0036 begin`);
      const actual: number = gridColumnOf(145);
      logInfo(`gridColumnOf(index=145): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0037
     * @tc.name      DragAndExchange_GridColumnOf_0037
     * @tc.desc      gridColumnOf(index=150) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0037 begin`);
      const actual: number = gridColumnOf(150);
      logInfo(`gridColumnOf(index=150): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0038
     * @tc.name      DragAndExchange_GridColumnOf_0038
     * @tc.desc      gridColumnOf(index=155) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0038 begin`);
      const actual: number = gridColumnOf(155);
      logInfo(`gridColumnOf(index=155): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0039
     * @tc.name      DragAndExchange_GridColumnOf_0039
     * @tc.desc      gridColumnOf(index=160) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0039 begin`);
      const actual: number = gridColumnOf(160);
      logInfo(`gridColumnOf(index=160): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0040
     * @tc.name      DragAndExchange_GridColumnOf_0040
     * @tc.desc      gridColumnOf(index=165) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0040 begin`);
      const actual: number = gridColumnOf(165);
      logInfo(`gridColumnOf(index=165): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0041
     * @tc.name      DragAndExchange_GridColumnOf_0041
     * @tc.desc      gridColumnOf(index=170) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0041 begin`);
      const actual: number = gridColumnOf(170);
      logInfo(`gridColumnOf(index=170): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0042
     * @tc.name      DragAndExchange_GridColumnOf_0042
     * @tc.desc      gridColumnOf(index=175) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0042 begin`);
      const actual: number = gridColumnOf(175);
      logInfo(`gridColumnOf(index=175): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0043
     * @tc.name      DragAndExchange_GridColumnOf_0043
     * @tc.desc      gridColumnOf(index=180) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0043 begin`);
      const actual: number = gridColumnOf(180);
      logInfo(`gridColumnOf(index=180): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0044
     * @tc.name      DragAndExchange_GridColumnOf_0044
     * @tc.desc      gridColumnOf(index=185) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0044 begin`);
      const actual: number = gridColumnOf(185);
      logInfo(`gridColumnOf(index=185): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0045
     * @tc.name      DragAndExchange_GridColumnOf_0045
     * @tc.desc      gridColumnOf(index=190) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0045 begin`);
      const actual: number = gridColumnOf(190);
      logInfo(`gridColumnOf(index=190): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0046
     * @tc.name      DragAndExchange_GridColumnOf_0046
     * @tc.desc      gridColumnOf(index=195) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0046 begin`);
      const actual: number = gridColumnOf(195);
      logInfo(`gridColumnOf(index=195): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0047
     * @tc.name      DragAndExchange_GridColumnOf_0047
     * @tc.desc      gridColumnOf(index=200) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0047 begin`);
      const actual: number = gridColumnOf(200);
      logInfo(`gridColumnOf(index=200): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0048
     * @tc.name      DragAndExchange_GridColumnOf_0048
     * @tc.desc      gridColumnOf(index=7) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0048 begin`);
      const actual: number = gridColumnOf(7);
      logInfo(`gridColumnOf(index=7): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}GridColumnOf_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0049
     * @tc.name      DragAndExchange_GridColumnOf_0049
     * @tc.desc      gridColumnOf(index=178) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0049 begin`);
      const actual: number = gridColumnOf(178);
      logInfo(`gridColumnOf(index=178): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0050
     * @tc.name      DragAndExchange_GridColumnOf_0050
     * @tc.desc      gridColumnOf(index=27.57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0050 begin`);
      const actual: number = gridColumnOf(27.57);
      logInfo(`gridColumnOf(index=27.57): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0051
     * @tc.name      DragAndExchange_GridColumnOf_0051
     * @tc.desc      gridColumnOf(index=54.03) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0051 begin`);
      const actual: number = gridColumnOf(54.03);
      logInfo(`gridColumnOf(index=54.03): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0052
     * @tc.name      DragAndExchange_GridColumnOf_0052
     * @tc.desc      gridColumnOf(index=54) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0052 begin`);
      const actual: number = gridColumnOf(54);
      logInfo(`gridColumnOf(index=54): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0053
     * @tc.name      DragAndExchange_GridColumnOf_0053
     * @tc.desc      gridColumnOf(index=-93) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0053 begin`);
      const actual: number = gridColumnOf(-93);
      logInfo(`gridColumnOf(index=-93): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0054
     * @tc.name      DragAndExchange_GridColumnOf_0054
     * @tc.desc      gridColumnOf(index=94) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0054 begin`);
      const actual: number = gridColumnOf(94);
      logInfo(`gridColumnOf(index=94): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0055
     * @tc.name      DragAndExchange_GridColumnOf_0055
     * @tc.desc      gridColumnOf(index=144) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0055 begin`);
      const actual: number = gridColumnOf(144);
      logInfo(`gridColumnOf(index=144): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0056
     * @tc.name      DragAndExchange_GridColumnOf_0056
     * @tc.desc      gridColumnOf(index=116) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0056 begin`);
      const actual: number = gridColumnOf(116);
      logInfo(`gridColumnOf(index=116): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0057
     * @tc.name      DragAndExchange_GridColumnOf_0057
     * @tc.desc      gridColumnOf(index=-19) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0057 begin`);
      const actual: number = gridColumnOf(-19);
      logInfo(`gridColumnOf(index=-19): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0058
     * @tc.name      DragAndExchange_GridColumnOf_0058
     * @tc.desc      gridColumnOf(index=17.73) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0058 begin`);
      const actual: number = gridColumnOf(17.73);
      logInfo(`gridColumnOf(index=17.73): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0059
     * @tc.name      DragAndExchange_GridColumnOf_0059
     * @tc.desc      gridColumnOf(index=47) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0059 begin`);
      const actual: number = gridColumnOf(47);
      logInfo(`gridColumnOf(index=47): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0060
     * @tc.name      DragAndExchange_GridColumnOf_0060
     * @tc.desc      gridColumnOf(index=187) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0060 begin`);
      const actual: number = gridColumnOf(187);
      logInfo(`gridColumnOf(index=187): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0061
     * @tc.name      DragAndExchange_GridColumnOf_0061
     * @tc.desc      gridColumnOf(index=90.26) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0061 begin`);
      const actual: number = gridColumnOf(90.26);
      logInfo(`gridColumnOf(index=90.26): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0062
     * @tc.name      DragAndExchange_GridColumnOf_0062
     * @tc.desc      gridColumnOf(index=37) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0062 begin`);
      const actual: number = gridColumnOf(37);
      logInfo(`gridColumnOf(index=37): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0063
     * @tc.name      DragAndExchange_GridColumnOf_0063
     * @tc.desc      gridColumnOf(index=56.92) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0063 begin`);
      const actual: number = gridColumnOf(56.92);
      logInfo(`gridColumnOf(index=56.92): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0064
     * @tc.name      DragAndExchange_GridColumnOf_0064
     * @tc.desc      gridColumnOf(index=-3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0064 begin`);
      const actual: number = gridColumnOf(-3);
      logInfo(`gridColumnOf(index=-3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0065
     * @tc.name      DragAndExchange_GridColumnOf_0065
     * @tc.desc      gridColumnOf(index=162) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0065 begin`);
      const actual: number = gridColumnOf(162);
      logInfo(`gridColumnOf(index=162): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0066
     * @tc.name      DragAndExchange_GridColumnOf_0066
     * @tc.desc      gridColumnOf(index=89.11) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0066 begin`);
      const actual: number = gridColumnOf(89.11);
      logInfo(`gridColumnOf(index=89.11): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0067
     * @tc.name      DragAndExchange_GridColumnOf_0067
     * @tc.desc      gridColumnOf(index=51.48) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0067 begin`);
      const actual: number = gridColumnOf(51.48);
      logInfo(`gridColumnOf(index=51.48): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0068
     * @tc.name      DragAndExchange_GridColumnOf_0068
     * @tc.desc      gridColumnOf(index=-40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0068 begin`);
      const actual: number = gridColumnOf(-40);
      logInfo(`gridColumnOf(index=-40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0069
     * @tc.name      DragAndExchange_GridColumnOf_0069
     * @tc.desc      gridColumnOf(index=-49) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0069 begin`);
      const actual: number = gridColumnOf(-49);
      logInfo(`gridColumnOf(index=-49): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0070
     * @tc.name      DragAndExchange_GridColumnOf_0070
     * @tc.desc      gridColumnOf(index=34.62) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0070 begin`);
      const actual: number = gridColumnOf(34.62);
      logInfo(`gridColumnOf(index=34.62): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0071
     * @tc.name      DragAndExchange_GridColumnOf_0071
     * @tc.desc      gridColumnOf(index=-70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0071 begin`);
      const actual: number = gridColumnOf(-70);
      logInfo(`gridColumnOf(index=-70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0072
     * @tc.name      DragAndExchange_GridColumnOf_0072
     * @tc.desc      gridColumnOf(index=-91) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0072 begin`);
      const actual: number = gridColumnOf(-91);
      logInfo(`gridColumnOf(index=-91): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0073
     * @tc.name      DragAndExchange_GridColumnOf_0073
     * @tc.desc      gridColumnOf(index=43.17) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0073 begin`);
      const actual: number = gridColumnOf(43.17);
      logInfo(`gridColumnOf(index=43.17): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0074
     * @tc.name      DragAndExchange_GridColumnOf_0074
     * @tc.desc      gridColumnOf(index=146) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0074 begin`);
      const actual: number = gridColumnOf(146);
      logInfo(`gridColumnOf(index=146): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0075
     * @tc.name      DragAndExchange_GridColumnOf_0075
     * @tc.desc      gridColumnOf(index=12.64) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0075 begin`);
      const actual: number = gridColumnOf(12.64);
      logInfo(`gridColumnOf(index=12.64): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0076
     * @tc.name      DragAndExchange_GridColumnOf_0076
     * @tc.desc      gridColumnOf(index=17) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0076 begin`);
      const actual: number = gridColumnOf(17);
      logInfo(`gridColumnOf(index=17): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0077
     * @tc.name      DragAndExchange_GridColumnOf_0077
     * @tc.desc      gridColumnOf(index=118) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0077 begin`);
      const actual: number = gridColumnOf(118);
      logInfo(`gridColumnOf(index=118): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0078
     * @tc.name      DragAndExchange_GridColumnOf_0078
     * @tc.desc      gridColumnOf(index=84.65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0078 begin`);
      const actual: number = gridColumnOf(84.65);
      logInfo(`gridColumnOf(index=84.65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0079
     * @tc.name      DragAndExchange_GridColumnOf_0079
     * @tc.desc      gridColumnOf(index=142) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0079 begin`);
      const actual: number = gridColumnOf(142);
      logInfo(`gridColumnOf(index=142): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0080
     * @tc.name      DragAndExchange_GridColumnOf_0080
     * @tc.desc      gridColumnOf(index=78) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0080 begin`);
      const actual: number = gridColumnOf(78);
      logInfo(`gridColumnOf(index=78): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0081
     * @tc.name      DragAndExchange_GridColumnOf_0081
     * @tc.desc      gridColumnOf(index=96.23) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0081 begin`);
      const actual: number = gridColumnOf(96.23);
      logInfo(`gridColumnOf(index=96.23): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0082
     * @tc.name      DragAndExchange_GridColumnOf_0082
     * @tc.desc      gridColumnOf(index=132) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0082 begin`);
      const actual: number = gridColumnOf(132);
      logInfo(`gridColumnOf(index=132): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0083
     * @tc.name      DragAndExchange_GridColumnOf_0083
     * @tc.desc      gridColumnOf(index=-69) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0083 begin`);
      const actual: number = gridColumnOf(-69);
      logInfo(`gridColumnOf(index=-69): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0084
     * @tc.name      DragAndExchange_GridColumnOf_0084
     * @tc.desc      gridColumnOf(index=-79) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0084 begin`);
      const actual: number = gridColumnOf(-79);
      logInfo(`gridColumnOf(index=-79): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0085
     * @tc.name      DragAndExchange_GridColumnOf_0085
     * @tc.desc      gridColumnOf(index=65.63) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0085 begin`);
      const actual: number = gridColumnOf(65.63);
      logInfo(`gridColumnOf(index=65.63): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0086
     * @tc.name      DragAndExchange_GridColumnOf_0086
     * @tc.desc      gridColumnOf(index=97) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0086 begin`);
      const actual: number = gridColumnOf(97);
      logInfo(`gridColumnOf(index=97): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0087
     * @tc.name      DragAndExchange_GridColumnOf_0087
     * @tc.desc      gridColumnOf(index=-12) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0087 begin`);
      const actual: number = gridColumnOf(-12);
      logInfo(`gridColumnOf(index=-12): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0088
     * @tc.name      DragAndExchange_GridColumnOf_0088
     * @tc.desc      gridColumnOf(index=48.92) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0088 begin`);
      const actual: number = gridColumnOf(48.92);
      logInfo(`gridColumnOf(index=48.92): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0089
     * @tc.name      DragAndExchange_GridColumnOf_0089
     * @tc.desc      gridColumnOf(index=-16) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0089 begin`);
      const actual: number = gridColumnOf(-16);
      logInfo(`gridColumnOf(index=-16): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0090
     * @tc.name      DragAndExchange_GridColumnOf_0090
     * @tc.desc      gridColumnOf(index=7.13) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0090 begin`);
      const actual: number = gridColumnOf(7.13);
      logInfo(`gridColumnOf(index=7.13): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0091
     * @tc.name      DragAndExchange_GridColumnOf_0091
     * @tc.desc      gridColumnOf(index=21) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0091 begin`);
      const actual: number = gridColumnOf(21);
      logInfo(`gridColumnOf(index=21): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0092
     * @tc.name      DragAndExchange_GridColumnOf_0092
     * @tc.desc      gridColumnOf(index=-10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0092 begin`);
      const actual: number = gridColumnOf(-10);
      logInfo(`gridColumnOf(index=-10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0093
     * @tc.name      DragAndExchange_GridColumnOf_0093
     * @tc.desc      gridColumnOf(index=82) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0093 begin`);
      const actual: number = gridColumnOf(82);
      logInfo(`gridColumnOf(index=82): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0094
     * @tc.name      DragAndExchange_GridColumnOf_0094
     * @tc.desc      gridColumnOf(index=26) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0094 begin`);
      const actual: number = gridColumnOf(26);
      logInfo(`gridColumnOf(index=26): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0095
     * @tc.name      DragAndExchange_GridColumnOf_0095
     * @tc.desc      gridColumnOf(index=91.39) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0095 begin`);
      const actual: number = gridColumnOf(91.39);
      logInfo(`gridColumnOf(index=91.39): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0096
     * @tc.name      DragAndExchange_GridColumnOf_0096
     * @tc.desc      gridColumnOf(index=57.79) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0096 begin`);
      const actual: number = gridColumnOf(57.79);
      logInfo(`gridColumnOf(index=57.79): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0096 end`);
    });
  });
}
