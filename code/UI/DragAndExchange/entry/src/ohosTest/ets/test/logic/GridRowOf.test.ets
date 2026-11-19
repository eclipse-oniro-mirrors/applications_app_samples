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
import { gridRowOf } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridRowOf (96 cases). */
export default function gridRowOfTest(): void {
  describe('GridRowOfTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0001
     * @tc.name      DragAndExchange_GridRowOf_0001
     * @tc.desc      gridRowOf(index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridRowOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0001 begin`);
      const actual: number = gridRowOf(0);
      logInfo(`gridRowOf(index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowOf_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0002
     * @tc.name      DragAndExchange_GridRowOf_0002
     * @tc.desc      gridRowOf(index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridRowOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0002 begin`);
      const actual: number = gridRowOf(-1);
      logInfo(`gridRowOf(index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0003
     * @tc.name      DragAndExchange_GridRowOf_0003
     * @tc.desc      gridRowOf(index=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0003 begin`);
      const actual: number = gridRowOf(5);
      logInfo(`gridRowOf(index=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}GridRowOf_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0004
     * @tc.name      DragAndExchange_GridRowOf_0004
     * @tc.desc      gridRowOf(index=10) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0004 begin`);
      const actual: number = gridRowOf(10);
      logInfo(`gridRowOf(index=10): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}GridRowOf_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0005
     * @tc.name      DragAndExchange_GridRowOf_0005
     * @tc.desc      gridRowOf(index=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0005 begin`);
      const actual: number = gridRowOf(1);
      logInfo(`gridRowOf(index=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowOf_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0006
     * @tc.name      DragAndExchange_GridRowOf_0006
     * @tc.desc      gridRowOf(index=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridRowOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0006 begin`);
      const actual: number = gridRowOf(-2);
      logInfo(`gridRowOf(index=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0007
     * @tc.name      DragAndExchange_GridRowOf_0007
     * @tc.desc      gridRowOf(index=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0007 begin`);
      const actual: number = gridRowOf(2);
      logInfo(`gridRowOf(index=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowOf_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0008
     * @tc.name      DragAndExchange_GridRowOf_0008
     * @tc.desc      gridRowOf(index=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0008 begin`);
      const actual: number = gridRowOf(3);
      logInfo(`gridRowOf(index=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GridRowOf_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0009
     * @tc.name      DragAndExchange_GridRowOf_0009
     * @tc.desc      gridRowOf(index=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0009 begin`);
      const actual: number = gridRowOf(100);
      logInfo(`gridRowOf(index=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0010
     * @tc.name      DragAndExchange_GridRowOf_0010
     * @tc.desc      gridRowOf(index=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0010 begin`);
      const actual: number = gridRowOf(15);
      logInfo(`gridRowOf(index=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0011
     * @tc.name      DragAndExchange_GridRowOf_0011
     * @tc.desc      gridRowOf(index=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0011 begin`);
      const actual: number = gridRowOf(20);
      logInfo(`gridRowOf(index=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0012
     * @tc.name      DragAndExchange_GridRowOf_0012
     * @tc.desc      gridRowOf(index=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0012 begin`);
      const actual: number = gridRowOf(25);
      logInfo(`gridRowOf(index=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0013
     * @tc.name      DragAndExchange_GridRowOf_0013
     * @tc.desc      gridRowOf(index=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0013 begin`);
      const actual: number = gridRowOf(30);
      logInfo(`gridRowOf(index=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0014
     * @tc.name      DragAndExchange_GridRowOf_0014
     * @tc.desc      gridRowOf(index=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0014 begin`);
      const actual: number = gridRowOf(35);
      logInfo(`gridRowOf(index=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0015
     * @tc.name      DragAndExchange_GridRowOf_0015
     * @tc.desc      gridRowOf(index=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0015 begin`);
      const actual: number = gridRowOf(40);
      logInfo(`gridRowOf(index=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0016
     * @tc.name      DragAndExchange_GridRowOf_0016
     * @tc.desc      gridRowOf(index=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0016 begin`);
      const actual: number = gridRowOf(45);
      logInfo(`gridRowOf(index=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0017
     * @tc.name      DragAndExchange_GridRowOf_0017
     * @tc.desc      gridRowOf(index=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0017 begin`);
      const actual: number = gridRowOf(50);
      logInfo(`gridRowOf(index=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0018
     * @tc.name      DragAndExchange_GridRowOf_0018
     * @tc.desc      gridRowOf(index=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0018 begin`);
      const actual: number = gridRowOf(55);
      logInfo(`gridRowOf(index=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0019
     * @tc.name      DragAndExchange_GridRowOf_0019
     * @tc.desc      gridRowOf(index=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0019 begin`);
      const actual: number = gridRowOf(60);
      logInfo(`gridRowOf(index=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0020
     * @tc.name      DragAndExchange_GridRowOf_0020
     * @tc.desc      gridRowOf(index=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0020 begin`);
      const actual: number = gridRowOf(65);
      logInfo(`gridRowOf(index=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0021
     * @tc.name      DragAndExchange_GridRowOf_0021
     * @tc.desc      gridRowOf(index=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0021 begin`);
      const actual: number = gridRowOf(70);
      logInfo(`gridRowOf(index=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0022
     * @tc.name      DragAndExchange_GridRowOf_0022
     * @tc.desc      gridRowOf(index=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0022 begin`);
      const actual: number = gridRowOf(75);
      logInfo(`gridRowOf(index=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0023
     * @tc.name      DragAndExchange_GridRowOf_0023
     * @tc.desc      gridRowOf(index=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0023 begin`);
      const actual: number = gridRowOf(80);
      logInfo(`gridRowOf(index=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0024
     * @tc.name      DragAndExchange_GridRowOf_0024
     * @tc.desc      gridRowOf(index=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0024 begin`);
      const actual: number = gridRowOf(85);
      logInfo(`gridRowOf(index=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0025
     * @tc.name      DragAndExchange_GridRowOf_0025
     * @tc.desc      gridRowOf(index=90) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0025 begin`);
      const actual: number = gridRowOf(90);
      logInfo(`gridRowOf(index=90): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0026
     * @tc.name      DragAndExchange_GridRowOf_0026
     * @tc.desc      gridRowOf(index=95) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0026 begin`);
      const actual: number = gridRowOf(95);
      logInfo(`gridRowOf(index=95): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0027
     * @tc.name      DragAndExchange_GridRowOf_0027
     * @tc.desc      gridRowOf(index=105) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0027 begin`);
      const actual: number = gridRowOf(105);
      logInfo(`gridRowOf(index=105): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0028
     * @tc.name      DragAndExchange_GridRowOf_0028
     * @tc.desc      gridRowOf(index=110) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0028 begin`);
      const actual: number = gridRowOf(110);
      logInfo(`gridRowOf(index=110): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0029
     * @tc.name      DragAndExchange_GridRowOf_0029
     * @tc.desc      gridRowOf(index=115) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0029 begin`);
      const actual: number = gridRowOf(115);
      logInfo(`gridRowOf(index=115): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0030
     * @tc.name      DragAndExchange_GridRowOf_0030
     * @tc.desc      gridRowOf(index=120) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0030 begin`);
      const actual: number = gridRowOf(120);
      logInfo(`gridRowOf(index=120): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0031
     * @tc.name      DragAndExchange_GridRowOf_0031
     * @tc.desc      gridRowOf(index=125) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0031 begin`);
      const actual: number = gridRowOf(125);
      logInfo(`gridRowOf(index=125): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0032
     * @tc.name      DragAndExchange_GridRowOf_0032
     * @tc.desc      gridRowOf(index=130) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0032 begin`);
      const actual: number = gridRowOf(130);
      logInfo(`gridRowOf(index=130): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0033
     * @tc.name      DragAndExchange_GridRowOf_0033
     * @tc.desc      gridRowOf(index=135) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0033 begin`);
      const actual: number = gridRowOf(135);
      logInfo(`gridRowOf(index=135): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0034
     * @tc.name      DragAndExchange_GridRowOf_0034
     * @tc.desc      gridRowOf(index=140) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0034 begin`);
      const actual: number = gridRowOf(140);
      logInfo(`gridRowOf(index=140): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0035
     * @tc.name      DragAndExchange_GridRowOf_0035
     * @tc.desc      gridRowOf(index=145) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0035 begin`);
      const actual: number = gridRowOf(145);
      logInfo(`gridRowOf(index=145): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0036
     * @tc.name      DragAndExchange_GridRowOf_0036
     * @tc.desc      gridRowOf(index=150) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0036 begin`);
      const actual: number = gridRowOf(150);
      logInfo(`gridRowOf(index=150): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0037
     * @tc.name      DragAndExchange_GridRowOf_0037
     * @tc.desc      gridRowOf(index=155) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0037 begin`);
      const actual: number = gridRowOf(155);
      logInfo(`gridRowOf(index=155): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0038
     * @tc.name      DragAndExchange_GridRowOf_0038
     * @tc.desc      gridRowOf(index=160) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0038 begin`);
      const actual: number = gridRowOf(160);
      logInfo(`gridRowOf(index=160): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0039
     * @tc.name      DragAndExchange_GridRowOf_0039
     * @tc.desc      gridRowOf(index=165) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0039 begin`);
      const actual: number = gridRowOf(165);
      logInfo(`gridRowOf(index=165): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0040
     * @tc.name      DragAndExchange_GridRowOf_0040
     * @tc.desc      gridRowOf(index=170) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0040 begin`);
      const actual: number = gridRowOf(170);
      logInfo(`gridRowOf(index=170): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0041
     * @tc.name      DragAndExchange_GridRowOf_0041
     * @tc.desc      gridRowOf(index=175) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0041 begin`);
      const actual: number = gridRowOf(175);
      logInfo(`gridRowOf(index=175): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0042
     * @tc.name      DragAndExchange_GridRowOf_0042
     * @tc.desc      gridRowOf(index=180) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0042 begin`);
      const actual: number = gridRowOf(180);
      logInfo(`gridRowOf(index=180): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0043
     * @tc.name      DragAndExchange_GridRowOf_0043
     * @tc.desc      gridRowOf(index=185) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0043 begin`);
      const actual: number = gridRowOf(185);
      logInfo(`gridRowOf(index=185): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0044
     * @tc.name      DragAndExchange_GridRowOf_0044
     * @tc.desc      gridRowOf(index=190) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0044 begin`);
      const actual: number = gridRowOf(190);
      logInfo(`gridRowOf(index=190): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0045
     * @tc.name      DragAndExchange_GridRowOf_0045
     * @tc.desc      gridRowOf(index=195) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0045 begin`);
      const actual: number = gridRowOf(195);
      logInfo(`gridRowOf(index=195): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0046
     * @tc.name      DragAndExchange_GridRowOf_0046
     * @tc.desc      gridRowOf(index=200) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0046 begin`);
      const actual: number = gridRowOf(200);
      logInfo(`gridRowOf(index=200): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0047
     * @tc.name      DragAndExchange_GridRowOf_0047
     * @tc.desc      gridRowOf(index=-92) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0047 begin`);
      const actual: number = gridRowOf(-92);
      logInfo(`gridRowOf(index=-92): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0048
     * @tc.name      DragAndExchange_GridRowOf_0048
     * @tc.desc      gridRowOf(index=-41) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0048 begin`);
      const actual: number = gridRowOf(-41);
      logInfo(`gridRowOf(index=-41): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0049
     * @tc.name      DragAndExchange_GridRowOf_0049
     * @tc.desc      gridRowOf(index=122) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0049 begin`);
      const actual: number = gridRowOf(122);
      logInfo(`gridRowOf(index=122): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0050
     * @tc.name      DragAndExchange_GridRowOf_0050
     * @tc.desc      gridRowOf(index=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0050 begin`);
      const actual: number = gridRowOf(-35);
      logInfo(`gridRowOf(index=-35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0051
     * @tc.name      DragAndExchange_GridRowOf_0051
     * @tc.desc      gridRowOf(index=159) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0051 begin`);
      const actual: number = gridRowOf(159);
      logInfo(`gridRowOf(index=159): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0052
     * @tc.name      DragAndExchange_GridRowOf_0052
     * @tc.desc      gridRowOf(index=62) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0052 begin`);
      const actual: number = gridRowOf(62);
      logInfo(`gridRowOf(index=62): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0053
     * @tc.name      DragAndExchange_GridRowOf_0053
     * @tc.desc      gridRowOf(index=62.56) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0053 begin`);
      const actual: number = gridRowOf(62.56);
      logInfo(`gridRowOf(index=62.56): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0054
     * @tc.name      DragAndExchange_GridRowOf_0054
     * @tc.desc      gridRowOf(index=6.9) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0054 begin`);
      const actual: number = gridRowOf(6.9);
      logInfo(`gridRowOf(index=6.9): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0055
     * @tc.name      DragAndExchange_GridRowOf_0055
     * @tc.desc      gridRowOf(index=73) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0055 begin`);
      const actual: number = gridRowOf(73);
      logInfo(`gridRowOf(index=73): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0056
     * @tc.name      DragAndExchange_GridRowOf_0056
     * @tc.desc      gridRowOf(index=66) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0056 begin`);
      const actual: number = gridRowOf(66);
      logInfo(`gridRowOf(index=66): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0057
     * @tc.name      DragAndExchange_GridRowOf_0057
     * @tc.desc      gridRowOf(index=106) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0057 begin`);
      const actual: number = gridRowOf(106);
      logInfo(`gridRowOf(index=106): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0058
     * @tc.name      DragAndExchange_GridRowOf_0058
     * @tc.desc      gridRowOf(index=76.8) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0058 begin`);
      const actual: number = gridRowOf(76.8);
      logInfo(`gridRowOf(index=76.8): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0059
     * @tc.name      DragAndExchange_GridRowOf_0059
     * @tc.desc      gridRowOf(index=88.3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0059 begin`);
      const actual: number = gridRowOf(88.3);
      logInfo(`gridRowOf(index=88.3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0060
     * @tc.name      DragAndExchange_GridRowOf_0060
     * @tc.desc      gridRowOf(index=123) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0060 begin`);
      const actual: number = gridRowOf(123);
      logInfo(`gridRowOf(index=123): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0061
     * @tc.name      DragAndExchange_GridRowOf_0061
     * @tc.desc      gridRowOf(index=37.87) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0061 begin`);
      const actual: number = gridRowOf(37.87);
      logInfo(`gridRowOf(index=37.87): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0062
     * @tc.name      DragAndExchange_GridRowOf_0062
     * @tc.desc      gridRowOf(index=99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0062 begin`);
      const actual: number = gridRowOf(99);
      logInfo(`gridRowOf(index=99): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0063
     * @tc.name      DragAndExchange_GridRowOf_0063
     * @tc.desc      gridRowOf(index=22) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0063 begin`);
      const actual: number = gridRowOf(22);
      logInfo(`gridRowOf(index=22): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0064
     * @tc.name      DragAndExchange_GridRowOf_0064
     * @tc.desc      gridRowOf(index=-48) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0064 begin`);
      const actual: number = gridRowOf(-48);
      logInfo(`gridRowOf(index=-48): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0065
     * @tc.name      DragAndExchange_GridRowOf_0065
     * @tc.desc      gridRowOf(index=-39) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0065 begin`);
      const actual: number = gridRowOf(-39);
      logInfo(`gridRowOf(index=-39): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0066
     * @tc.name      DragAndExchange_GridRowOf_0066
     * @tc.desc      gridRowOf(index=-56) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0066 begin`);
      const actual: number = gridRowOf(-56);
      logInfo(`gridRowOf(index=-56): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0067
     * @tc.name      DragAndExchange_GridRowOf_0067
     * @tc.desc      gridRowOf(index=13.2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0067 begin`);
      const actual: number = gridRowOf(13.2);
      logInfo(`gridRowOf(index=13.2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0068
     * @tc.name      DragAndExchange_GridRowOf_0068
     * @tc.desc      gridRowOf(index=-99) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0068 begin`);
      const actual: number = gridRowOf(-99);
      logInfo(`gridRowOf(index=-99): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0069
     * @tc.name      DragAndExchange_GridRowOf_0069
     * @tc.desc      gridRowOf(index=-53) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0069 begin`);
      const actual: number = gridRowOf(-53);
      logInfo(`gridRowOf(index=-53): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0070
     * @tc.name      DragAndExchange_GridRowOf_0070
     * @tc.desc      gridRowOf(index=21) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0070 begin`);
      const actual: number = gridRowOf(21);
      logInfo(`gridRowOf(index=21): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0071
     * @tc.name      DragAndExchange_GridRowOf_0071
     * @tc.desc      gridRowOf(index=-31) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0071 begin`);
      const actual: number = gridRowOf(-31);
      logInfo(`gridRowOf(index=-31): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0072
     * @tc.name      DragAndExchange_GridRowOf_0072
     * @tc.desc      gridRowOf(index=-20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0072 begin`);
      const actual: number = gridRowOf(-20);
      logInfo(`gridRowOf(index=-20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0073
     * @tc.name      DragAndExchange_GridRowOf_0073
     * @tc.desc      gridRowOf(index=183) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0073 begin`);
      const actual: number = gridRowOf(183);
      logInfo(`gridRowOf(index=183): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0074
     * @tc.name      DragAndExchange_GridRowOf_0074
     * @tc.desc      gridRowOf(index=-28) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0074 begin`);
      const actual: number = gridRowOf(-28);
      logInfo(`gridRowOf(index=-28): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0075
     * @tc.name      DragAndExchange_GridRowOf_0075
     * @tc.desc      gridRowOf(index=37.76) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0075 begin`);
      const actual: number = gridRowOf(37.76);
      logInfo(`gridRowOf(index=37.76): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0076
     * @tc.name      DragAndExchange_GridRowOf_0076
     * @tc.desc      gridRowOf(index=37.82) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0076 begin`);
      const actual: number = gridRowOf(37.82);
      logInfo(`gridRowOf(index=37.82): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0077
     * @tc.name      DragAndExchange_GridRowOf_0077
     * @tc.desc      gridRowOf(index=50.46) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0077 begin`);
      const actual: number = gridRowOf(50.46);
      logInfo(`gridRowOf(index=50.46): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0078
     * @tc.name      DragAndExchange_GridRowOf_0078
     * @tc.desc      gridRowOf(index=24.47) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0078 begin`);
      const actual: number = gridRowOf(24.47);
      logInfo(`gridRowOf(index=24.47): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0079
     * @tc.name      DragAndExchange_GridRowOf_0079
     * @tc.desc      gridRowOf(index=29) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0079 begin`);
      const actual: number = gridRowOf(29);
      logInfo(`gridRowOf(index=29): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0080
     * @tc.name      DragAndExchange_GridRowOf_0080
     * @tc.desc      gridRowOf(index=32) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0080 begin`);
      const actual: number = gridRowOf(32);
      logInfo(`gridRowOf(index=32): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0081
     * @tc.name      DragAndExchange_GridRowOf_0081
     * @tc.desc      gridRowOf(index=151) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0081 begin`);
      const actual: number = gridRowOf(151);
      logInfo(`gridRowOf(index=151): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0082
     * @tc.name      DragAndExchange_GridRowOf_0082
     * @tc.desc      gridRowOf(index=-14) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0082 begin`);
      const actual: number = gridRowOf(-14);
      logInfo(`gridRowOf(index=-14): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0083
     * @tc.name      DragAndExchange_GridRowOf_0083
     * @tc.desc      gridRowOf(index=76) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0083 begin`);
      const actual: number = gridRowOf(76);
      logInfo(`gridRowOf(index=76): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0084
     * @tc.name      DragAndExchange_GridRowOf_0084
     * @tc.desc      gridRowOf(index=28) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0084 begin`);
      const actual: number = gridRowOf(28);
      logInfo(`gridRowOf(index=28): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0085
     * @tc.name      DragAndExchange_GridRowOf_0085
     * @tc.desc      gridRowOf(index=-77) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0085 begin`);
      const actual: number = gridRowOf(-77);
      logInfo(`gridRowOf(index=-77): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0086
     * @tc.name      DragAndExchange_GridRowOf_0086
     * @tc.desc      gridRowOf(index=-49) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0086 begin`);
      const actual: number = gridRowOf(-49);
      logInfo(`gridRowOf(index=-49): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0087
     * @tc.name      DragAndExchange_GridRowOf_0087
     * @tc.desc      gridRowOf(index=-81) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0087 begin`);
      const actual: number = gridRowOf(-81);
      logInfo(`gridRowOf(index=-81): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0088
     * @tc.name      DragAndExchange_GridRowOf_0088
     * @tc.desc      gridRowOf(index=-46) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0088 begin`);
      const actual: number = gridRowOf(-46);
      logInfo(`gridRowOf(index=-46): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0089
     * @tc.name      DragAndExchange_GridRowOf_0089
     * @tc.desc      gridRowOf(index=33.48) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0089 begin`);
      const actual: number = gridRowOf(33.48);
      logInfo(`gridRowOf(index=33.48): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0090
     * @tc.name      DragAndExchange_GridRowOf_0090
     * @tc.desc      gridRowOf(index=26.05) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0090 begin`);
      const actual: number = gridRowOf(26.05);
      logInfo(`gridRowOf(index=26.05): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0091
     * @tc.name      DragAndExchange_GridRowOf_0091
     * @tc.desc      gridRowOf(index=-68) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0091 begin`);
      const actual: number = gridRowOf(-68);
      logInfo(`gridRowOf(index=-68): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0092
     * @tc.name      DragAndExchange_GridRowOf_0092
     * @tc.desc      gridRowOf(index=-51) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0092 begin`);
      const actual: number = gridRowOf(-51);
      logInfo(`gridRowOf(index=-51): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0093
     * @tc.name      DragAndExchange_GridRowOf_0093
     * @tc.desc      gridRowOf(index=-17) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0093 begin`);
      const actual: number = gridRowOf(-17);
      logInfo(`gridRowOf(index=-17): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0094
     * @tc.name      DragAndExchange_GridRowOf_0094
     * @tc.desc      gridRowOf(index=68) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0094 begin`);
      const actual: number = gridRowOf(68);
      logInfo(`gridRowOf(index=68): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0095
     * @tc.name      DragAndExchange_GridRowOf_0095
     * @tc.desc      gridRowOf(index=37) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridRowOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0095 begin`);
      const actual: number = gridRowOf(37);
      logInfo(`gridRowOf(index=37): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ROW_OF_0096
     * @tc.name      DragAndExchange_GridRowOf_0096
     * @tc.desc      gridRowOf(index=-97) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridRowOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridRowOf_0096 begin`);
      const actual: number = gridRowOf(-97);
      logInfo(`gridRowOf(index=-97): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridRowOf_0096 end`);
    });
  });
}
