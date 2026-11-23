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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { canvasRowStartYOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for canvasRowStartYOf (74 cases). */
export default function canvasRowStartYOfTest(): void {
  describe('CanvasRowStartYOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0001
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0001
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_CanvasRowStartYOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0001 begin`);
      const actual: number = canvasRowStartYOf(0, 0);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=0): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0002
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0002
     * @tc.desc      canvasRowStartYOf(screenWidth=1, row=-1) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_CanvasRowStartYOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0002 begin`);
      const actual: number = canvasRowStartYOf(1, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1, row=-1): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0003
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0003
     * @tc.desc      canvasRowStartYOf(screenWidth=1, row=1) returns 100.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0003 begin`);
      const actual: number = canvasRowStartYOf(1, 1);
      logInfo(`canvasRowStartYOf(screenWidth=1, row=1): actual=${actual}`);
      expect(actual).assertClose(100.33333333333333, PRECISION);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0004
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0004
     * @tc.desc      canvasRowStartYOf(screenWidth=-1, row=-1) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0004 begin`);
      const actual: number = canvasRowStartYOf(-1, -1);
      logInfo(`canvasRowStartYOf(screenWidth=-1, row=-1): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0005
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0005
     * @tc.desc      canvasRowStartYOf(screenWidth=-1, row=1) returns 99.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0005 begin`);
      const actual: number = canvasRowStartYOf(-1, 1);
      logInfo(`canvasRowStartYOf(screenWidth=-1, row=1): actual=${actual}`);
      expect(actual).assertClose(99.66666666666667, PRECISION);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0006
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0006
     * @tc.desc      canvasRowStartYOf(screenWidth=2, row=-1) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0006 begin`);
      const actual: number = canvasRowStartYOf(2, -1);
      logInfo(`canvasRowStartYOf(screenWidth=2, row=-1): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0007
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0007
     * @tc.desc      canvasRowStartYOf(screenWidth=2, row=1) returns 100.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0007 begin`);
      const actual: number = canvasRowStartYOf(2, 1);
      logInfo(`canvasRowStartYOf(screenWidth=2, row=1): actual=${actual}`);
      expect(actual).assertClose(100.66666666666667, PRECISION);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0008
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0008
     * @tc.desc      canvasRowStartYOf(screenWidth=3, row=-1) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0008 begin`);
      const actual: number = canvasRowStartYOf(3, -1);
      logInfo(`canvasRowStartYOf(screenWidth=3, row=-1): actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0009
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0009
     * @tc.desc      canvasRowStartYOf(screenWidth=4, row=-1) returns 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0009 begin`);
      const actual: number = canvasRowStartYOf(4, -1);
      logInfo(`canvasRowStartYOf(screenWidth=4, row=-1): actual=${actual}`);
      expect(actual).assertEqual(104);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0010
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0010
     * @tc.desc      canvasRowStartYOf(screenWidth=4, row=1) returns 101.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0010 begin`);
      const actual: number = canvasRowStartYOf(4, 1);
      logInfo(`canvasRowStartYOf(screenWidth=4, row=1): actual=${actual}`);
      expect(actual).assertClose(101.33333333333333, PRECISION);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0011
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0011
     * @tc.desc      canvasRowStartYOf(screenWidth=100, row=-1) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0011 begin`);
      const actual: number = canvasRowStartYOf(100, -1);
      logInfo(`canvasRowStartYOf(screenWidth=100, row=-1): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0012
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0012
     * @tc.desc      canvasRowStartYOf(screenWidth=100, row=1) returns 133.33333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0012 begin`);
      const actual: number = canvasRowStartYOf(100, 1);
      logInfo(`canvasRowStartYOf(screenWidth=100, row=1): actual=${actual}`);
      expect(actual).assertClose(133.33333333333334, PRECISION);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0013
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0013
     * @tc.desc      canvasRowStartYOf(screenWidth=360, row=-1) returns 460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0013 begin`);
      const actual: number = canvasRowStartYOf(360, -1);
      logInfo(`canvasRowStartYOf(screenWidth=360, row=-1): actual=${actual}`);
      expect(actual).assertEqual(460);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0014
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0014
     * @tc.desc      canvasRowStartYOf(screenWidth=360, row=1) returns 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0014 begin`);
      const actual: number = canvasRowStartYOf(360, 1);
      logInfo(`canvasRowStartYOf(screenWidth=360, row=1): actual=${actual}`);
      expect(actual).assertEqual(220);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0015
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0015
     * @tc.desc      canvasRowStartYOf(screenWidth=720, row=-1) returns 820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0015 begin`);
      const actual: number = canvasRowStartYOf(720, -1);
      logInfo(`canvasRowStartYOf(screenWidth=720, row=-1): actual=${actual}`);
      expect(actual).assertEqual(820);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0016
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0016
     * @tc.desc      canvasRowStartYOf(screenWidth=720, row=1) returns 340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0016 begin`);
      const actual: number = canvasRowStartYOf(720, 1);
      logInfo(`canvasRowStartYOf(screenWidth=720, row=1): actual=${actual}`);
      expect(actual).assertEqual(340);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0017
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0017
     * @tc.desc      canvasRowStartYOf(screenWidth=1080, row=-1) returns 1180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0017 begin`);
      const actual: number = canvasRowStartYOf(1080, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1080, row=-1): actual=${actual}`);
      expect(actual).assertEqual(1180);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0018
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0018
     * @tc.desc      canvasRowStartYOf(screenWidth=1920, row=-1) returns 2020
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0018 begin`);
      const actual: number = canvasRowStartYOf(1920, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1920, row=-1): actual=${actual}`);
      expect(actual).assertEqual(2020);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0019
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0019
     * @tc.desc      canvasRowStartYOf(screenWidth=1920, row=1) returns 740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0019 begin`);
      const actual: number = canvasRowStartYOf(1920, 1);
      logInfo(`canvasRowStartYOf(screenWidth=1920, row=1): actual=${actual}`);
      expect(actual).assertEqual(740);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0020
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0020
     * @tc.desc      canvasRowStartYOf(screenWidth=10, row=-1) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0020 begin`);
      const actual: number = canvasRowStartYOf(10, -1);
      logInfo(`canvasRowStartYOf(screenWidth=10, row=-1): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0021
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0021
     * @tc.desc      canvasRowStartYOf(screenWidth=10, row=1) returns 103.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0021 begin`);
      const actual: number = canvasRowStartYOf(10, 1);
      logInfo(`canvasRowStartYOf(screenWidth=10, row=1): actual=${actual}`);
      expect(actual).assertClose(103.33333333333333, PRECISION);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0022
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0022
     * @tc.desc      canvasRowStartYOf(screenWidth=96, row=-1) returns 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0022 begin`);
      const actual: number = canvasRowStartYOf(96, -1);
      logInfo(`canvasRowStartYOf(screenWidth=96, row=-1): actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0023
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0023
     * @tc.desc      canvasRowStartYOf(screenWidth=96, row=1) returns 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0023 begin`);
      const actual: number = canvasRowStartYOf(96, 1);
      logInfo(`canvasRowStartYOf(screenWidth=96, row=1): actual=${actual}`);
      expect(actual).assertEqual(132);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0024
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0024
     * @tc.desc      canvasRowStartYOf(screenWidth=192, row=-1) returns 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0024 begin`);
      const actual: number = canvasRowStartYOf(192, -1);
      logInfo(`canvasRowStartYOf(screenWidth=192, row=-1): actual=${actual}`);
      expect(actual).assertEqual(292);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0025
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0025
     * @tc.desc      canvasRowStartYOf(screenWidth=192, row=1) returns 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0025 begin`);
      const actual: number = canvasRowStartYOf(192, 1);
      logInfo(`canvasRowStartYOf(screenWidth=192, row=1): actual=${actual}`);
      expect(actual).assertEqual(164);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0026
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0026
     * @tc.desc      canvasRowStartYOf(screenWidth=288, row=-1) returns 388
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0026 begin`);
      const actual: number = canvasRowStartYOf(288, -1);
      logInfo(`canvasRowStartYOf(screenWidth=288, row=-1): actual=${actual}`);
      expect(actual).assertEqual(388);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0027
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0027
     * @tc.desc      canvasRowStartYOf(screenWidth=384, row=-1) returns 484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0027 begin`);
      const actual: number = canvasRowStartYOf(384, -1);
      logInfo(`canvasRowStartYOf(screenWidth=384, row=-1): actual=${actual}`);
      expect(actual).assertEqual(484);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0028
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0028
     * @tc.desc      canvasRowStartYOf(screenWidth=384, row=1) returns 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0028 begin`);
      const actual: number = canvasRowStartYOf(384, 1);
      logInfo(`canvasRowStartYOf(screenWidth=384, row=1): actual=${actual}`);
      expect(actual).assertEqual(228);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0029
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0029
     * @tc.desc      canvasRowStartYOf(screenWidth=480, row=-1) returns 580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0029 begin`);
      const actual: number = canvasRowStartYOf(480, -1);
      logInfo(`canvasRowStartYOf(screenWidth=480, row=-1): actual=${actual}`);
      expect(actual).assertEqual(580);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0030
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0030
     * @tc.desc      canvasRowStartYOf(screenWidth=480, row=1) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0030 begin`);
      const actual: number = canvasRowStartYOf(480, 1);
      logInfo(`canvasRowStartYOf(screenWidth=480, row=1): actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0031
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0031
     * @tc.desc      canvasRowStartYOf(screenWidth=576, row=-1) returns 676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0031 begin`);
      const actual: number = canvasRowStartYOf(576, -1);
      logInfo(`canvasRowStartYOf(screenWidth=576, row=-1): actual=${actual}`);
      expect(actual).assertEqual(676);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0032
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0032
     * @tc.desc      canvasRowStartYOf(screenWidth=672, row=-1) returns 772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0032 begin`);
      const actual: number = canvasRowStartYOf(672, -1);
      logInfo(`canvasRowStartYOf(screenWidth=672, row=-1): actual=${actual}`);
      expect(actual).assertEqual(772);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0033
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0033
     * @tc.desc      canvasRowStartYOf(screenWidth=672, row=1) returns 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0033 begin`);
      const actual: number = canvasRowStartYOf(672, 1);
      logInfo(`canvasRowStartYOf(screenWidth=672, row=1): actual=${actual}`);
      expect(actual).assertEqual(324);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0034
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0034
     * @tc.desc      canvasRowStartYOf(screenWidth=768, row=-1) returns 868
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0034 begin`);
      const actual: number = canvasRowStartYOf(768, -1);
      logInfo(`canvasRowStartYOf(screenWidth=768, row=-1): actual=${actual}`);
      expect(actual).assertEqual(868);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0035
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0035
     * @tc.desc      canvasRowStartYOf(screenWidth=768, row=1) returns 356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0035 begin`);
      const actual: number = canvasRowStartYOf(768, 1);
      logInfo(`canvasRowStartYOf(screenWidth=768, row=1): actual=${actual}`);
      expect(actual).assertEqual(356);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0036
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0036
     * @tc.desc      canvasRowStartYOf(screenWidth=864, row=-1) returns 964
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0036 begin`);
      const actual: number = canvasRowStartYOf(864, -1);
      logInfo(`canvasRowStartYOf(screenWidth=864, row=-1): actual=${actual}`);
      expect(actual).assertEqual(964);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0037
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0037
     * @tc.desc      canvasRowStartYOf(screenWidth=960, row=-1) returns 1060
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0037 begin`);
      const actual: number = canvasRowStartYOf(960, -1);
      logInfo(`canvasRowStartYOf(screenWidth=960, row=-1): actual=${actual}`);
      expect(actual).assertEqual(1060);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0038
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0038
     * @tc.desc      canvasRowStartYOf(screenWidth=960, row=1) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0038 begin`);
      const actual: number = canvasRowStartYOf(960, 1);
      logInfo(`canvasRowStartYOf(screenWidth=960, row=1): actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0039
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0039
     * @tc.desc      canvasRowStartYOf(screenWidth=1056, row=-1) returns 1156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0039 begin`);
      const actual: number = canvasRowStartYOf(1056, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1056, row=-1): actual=${actual}`);
      expect(actual).assertEqual(1156);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0040
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0040
     * @tc.desc      canvasRowStartYOf(screenWidth=1056, row=1) returns 452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0040 begin`);
      const actual: number = canvasRowStartYOf(1056, 1);
      logInfo(`canvasRowStartYOf(screenWidth=1056, row=1): actual=${actual}`);
      expect(actual).assertEqual(452);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0041
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0041
     * @tc.desc      canvasRowStartYOf(screenWidth=1152, row=-1) returns 1252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0041 begin`);
      const actual: number = canvasRowStartYOf(1152, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1152, row=-1): actual=${actual}`);
      expect(actual).assertEqual(1252);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0042
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0042
     * @tc.desc      canvasRowStartYOf(screenWidth=1248, row=-1) returns 1348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0042 begin`);
      const actual: number = canvasRowStartYOf(1248, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1248, row=-1): actual=${actual}`);
      expect(actual).assertEqual(1348);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0043
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0043
     * @tc.desc      canvasRowStartYOf(screenWidth=1248, row=1) returns 516
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0043 begin`);
      const actual: number = canvasRowStartYOf(1248, 1);
      logInfo(`canvasRowStartYOf(screenWidth=1248, row=1): actual=${actual}`);
      expect(actual).assertEqual(516);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0044
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0044
     * @tc.desc      canvasRowStartYOf(screenWidth=1344, row=-1) returns 1444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0044 begin`);
      const actual: number = canvasRowStartYOf(1344, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1344, row=-1): actual=${actual}`);
      expect(actual).assertEqual(1444);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0045
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0045
     * @tc.desc      canvasRowStartYOf(screenWidth=1344, row=1) returns 548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0045 begin`);
      const actual: number = canvasRowStartYOf(1344, 1);
      logInfo(`canvasRowStartYOf(screenWidth=1344, row=1): actual=${actual}`);
      expect(actual).assertEqual(548);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0046
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0046
     * @tc.desc      canvasRowStartYOf(screenWidth=1440, row=-1) returns 1540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0046 begin`);
      const actual: number = canvasRowStartYOf(1440, -1);
      logInfo(`canvasRowStartYOf(screenWidth=1440, row=-1): actual=${actual}`);
      expect(actual).assertEqual(1540);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0047
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0047
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=-1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0047 begin`);
      const actual: number = canvasRowStartYOf(0, -1);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=-1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0048
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0048
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0048 begin`);
      const actual: number = canvasRowStartYOf(0, 1);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0049
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0049
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=2) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0049 begin`);
      const actual: number = canvasRowStartYOf(0, 2);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=2): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0050
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0050
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=3) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0050 begin`);
      const actual: number = canvasRowStartYOf(0, 3);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=3): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0051
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0051
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=4) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasRowStartYOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0051 begin`);
      const actual: number = canvasRowStartYOf(0, 4);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=4): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0052
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0052
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=10) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0052 begin`);
      const actual: number = canvasRowStartYOf(0, 10);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=10): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0053
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0053
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0053 begin`);
      const actual: number = canvasRowStartYOf(0, 100);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0054
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0054
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=5) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0054 begin`);
      const actual: number = canvasRowStartYOf(0, 5);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=5): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0055
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0055
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=15) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0055 begin`);
      const actual: number = canvasRowStartYOf(0, 15);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=15): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0056
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0056
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=20) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0056 begin`);
      const actual: number = canvasRowStartYOf(0, 20);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=20): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0057
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0057
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=25) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0057 begin`);
      const actual: number = canvasRowStartYOf(0, 25);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=25): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0058
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0058
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=30) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0058 begin`);
      const actual: number = canvasRowStartYOf(0, 30);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=30): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0059
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0059
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=35) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0059 begin`);
      const actual: number = canvasRowStartYOf(0, 35);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=35): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0060
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0060
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=40) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0060 begin`);
      const actual: number = canvasRowStartYOf(0, 40);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=40): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0061
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0061
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=45) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0061 begin`);
      const actual: number = canvasRowStartYOf(0, 45);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=45): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0062
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0062
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=50) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0062 begin`);
      const actual: number = canvasRowStartYOf(0, 50);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=50): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0063
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0063
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=55) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0063 begin`);
      const actual: number = canvasRowStartYOf(0, 55);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=55): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0064
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0064
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=60) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0064 begin`);
      const actual: number = canvasRowStartYOf(0, 60);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=60): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0065
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0065
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=65) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0065 begin`);
      const actual: number = canvasRowStartYOf(0, 65);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=65): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0066
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0066
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=70) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0066 begin`);
      const actual: number = canvasRowStartYOf(0, 70);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=70): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0067
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0067
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=75) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0067 begin`);
      const actual: number = canvasRowStartYOf(0, 75);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=75): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0068
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0068
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=80) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0068 begin`);
      const actual: number = canvasRowStartYOf(0, 80);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=80): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0069
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0069
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=85) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0069 begin`);
      const actual: number = canvasRowStartYOf(0, 85);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=85): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0070
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0070
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=90) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0070 begin`);
      const actual: number = canvasRowStartYOf(0, 90);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=90): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0071
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0071
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=95) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0071 begin`);
      const actual: number = canvasRowStartYOf(0, 95);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=95): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0072
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0072
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=105) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0072 begin`);
      const actual: number = canvasRowStartYOf(0, 105);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=105): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0073
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0073
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=110) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0073 begin`);
      const actual: number = canvasRowStartYOf(0, 110);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=110): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_ROW_START_YOF_0074
     * @tc.name      TsDrawingSample_CanvasRowStartYOf_0074
     * @tc.desc      canvasRowStartYOf(screenWidth=0, row=72) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasRowStartYOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasRowStartYOf_0074 begin`);
      const actual: number = canvasRowStartYOf(0, 72);
      logInfo(`canvasRowStartYOf(screenWidth=0, row=72): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasRowStartYOf_0074 end`);
    });
  });
}
