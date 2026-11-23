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
import { canvasCellOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for canvasCellOf (74 cases). */
export default function canvasCellOfTest(): void {
  describe('CanvasCellOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0001
     * @tc.name      TsDrawingSample_CanvasCellOf_0001
     * @tc.desc      canvasCellOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_CanvasCellOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0001 begin`);
      const actual: number = canvasCellOf(0);
      logInfo(`canvasCellOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CanvasCellOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0002
     * @tc.name      TsDrawingSample_CanvasCellOf_0002
     * @tc.desc      canvasCellOf(screenWidth=1) returns 0.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_CanvasCellOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0002 begin`);
      const actual: number = canvasCellOf(1);
      logInfo(`canvasCellOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0003
     * @tc.name      TsDrawingSample_CanvasCellOf_0003
     * @tc.desc      canvasCellOf(screenWidth=8) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasCellOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0003 begin`);
      const actual: number = canvasCellOf(8);
      logInfo(`canvasCellOf(screenWidth=8): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CanvasCellOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0004
     * @tc.name      TsDrawingSample_CanvasCellOf_0004
     * @tc.desc      canvasCellOf(screenWidth=7) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasCellOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0004 begin`);
      const actual: number = canvasCellOf(7);
      logInfo(`canvasCellOf(screenWidth=7): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0005
     * @tc.name      TsDrawingSample_CanvasCellOf_0005
     * @tc.desc      canvasCellOf(screenWidth=9) returns 1.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_CanvasCellOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0005 begin`);
      const actual: number = canvasCellOf(9);
      logInfo(`canvasCellOf(screenWidth=9): actual=${actual}`);
      expect(actual).assertClose(1.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0006
     * @tc.name      TsDrawingSample_CanvasCellOf_0006
     * @tc.desc      canvasCellOf(screenWidth=100) returns 12.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0006 begin`);
      const actual: number = canvasCellOf(100);
      logInfo(`canvasCellOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0007
     * @tc.name      TsDrawingSample_CanvasCellOf_0007
     * @tc.desc      canvasCellOf(screenWidth=360) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0007 begin`);
      const actual: number = canvasCellOf(360);
      logInfo(`canvasCellOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}CanvasCellOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0008
     * @tc.name      TsDrawingSample_CanvasCellOf_0008
     * @tc.desc      canvasCellOf(screenWidth=720) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0008 begin`);
      const actual: number = canvasCellOf(720);
      logInfo(`canvasCellOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CanvasCellOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0009
     * @tc.name      TsDrawingSample_CanvasCellOf_0009
     * @tc.desc      canvasCellOf(screenWidth=1080) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0009 begin`);
      const actual: number = canvasCellOf(1080);
      logInfo(`canvasCellOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}CanvasCellOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0010
     * @tc.name      TsDrawingSample_CanvasCellOf_0010
     * @tc.desc      canvasCellOf(screenWidth=1920) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0010 begin`);
      const actual: number = canvasCellOf(1920);
      logInfo(`canvasCellOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}CanvasCellOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0011
     * @tc.name      TsDrawingSample_CanvasCellOf_0011
     * @tc.desc      canvasCellOf(screenWidth=-1) returns -0.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCellOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0011 begin`);
      const actual: number = canvasCellOf(-1);
      logInfo(`canvasCellOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0012
     * @tc.name      TsDrawingSample_CanvasCellOf_0012
     * @tc.desc      canvasCellOf(screenWidth=2) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0012 begin`);
      const actual: number = canvasCellOf(2);
      logInfo(`canvasCellOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0013
     * @tc.name      TsDrawingSample_CanvasCellOf_0013
     * @tc.desc      canvasCellOf(screenWidth=3) returns 0.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0013 begin`);
      const actual: number = canvasCellOf(3);
      logInfo(`canvasCellOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(0.375, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0014
     * @tc.name      TsDrawingSample_CanvasCellOf_0014
     * @tc.desc      canvasCellOf(screenWidth=10) returns 1.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0014 begin`);
      const actual: number = canvasCellOf(10);
      logInfo(`canvasCellOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(1.25, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0015
     * @tc.name      TsDrawingSample_CanvasCellOf_0015
     * @tc.desc      canvasCellOf(screenWidth=96) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0015 begin`);
      const actual: number = canvasCellOf(96);
      logInfo(`canvasCellOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}CanvasCellOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0016
     * @tc.name      TsDrawingSample_CanvasCellOf_0016
     * @tc.desc      canvasCellOf(screenWidth=192) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0016 begin`);
      const actual: number = canvasCellOf(192);
      logInfo(`canvasCellOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}CanvasCellOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0017
     * @tc.name      TsDrawingSample_CanvasCellOf_0017
     * @tc.desc      canvasCellOf(screenWidth=288) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0017 begin`);
      const actual: number = canvasCellOf(288);
      logInfo(`canvasCellOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}CanvasCellOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0018
     * @tc.name      TsDrawingSample_CanvasCellOf_0018
     * @tc.desc      canvasCellOf(screenWidth=384) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0018 begin`);
      const actual: number = canvasCellOf(384);
      logInfo(`canvasCellOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}CanvasCellOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0019
     * @tc.name      TsDrawingSample_CanvasCellOf_0019
     * @tc.desc      canvasCellOf(screenWidth=480) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0019 begin`);
      const actual: number = canvasCellOf(480);
      logInfo(`canvasCellOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}CanvasCellOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0020
     * @tc.name      TsDrawingSample_CanvasCellOf_0020
     * @tc.desc      canvasCellOf(screenWidth=576) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0020 begin`);
      const actual: number = canvasCellOf(576);
      logInfo(`canvasCellOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}CanvasCellOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0021
     * @tc.name      TsDrawingSample_CanvasCellOf_0021
     * @tc.desc      canvasCellOf(screenWidth=672) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0021 begin`);
      const actual: number = canvasCellOf(672);
      logInfo(`canvasCellOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}CanvasCellOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0022
     * @tc.name      TsDrawingSample_CanvasCellOf_0022
     * @tc.desc      canvasCellOf(screenWidth=768) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0022 begin`);
      const actual: number = canvasCellOf(768);
      logInfo(`canvasCellOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}CanvasCellOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0023
     * @tc.name      TsDrawingSample_CanvasCellOf_0023
     * @tc.desc      canvasCellOf(screenWidth=864) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0023 begin`);
      const actual: number = canvasCellOf(864);
      logInfo(`canvasCellOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}CanvasCellOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0024
     * @tc.name      TsDrawingSample_CanvasCellOf_0024
     * @tc.desc      canvasCellOf(screenWidth=960) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0024 begin`);
      const actual: number = canvasCellOf(960);
      logInfo(`canvasCellOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}CanvasCellOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0025
     * @tc.name      TsDrawingSample_CanvasCellOf_0025
     * @tc.desc      canvasCellOf(screenWidth=1056) returns 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0025 begin`);
      const actual: number = canvasCellOf(1056);
      logInfo(`canvasCellOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(132);
      logInfo(`${BUNDLE}CanvasCellOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0026
     * @tc.name      TsDrawingSample_CanvasCellOf_0026
     * @tc.desc      canvasCellOf(screenWidth=1152) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0026 begin`);
      const actual: number = canvasCellOf(1152);
      logInfo(`canvasCellOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}CanvasCellOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0027
     * @tc.name      TsDrawingSample_CanvasCellOf_0027
     * @tc.desc      canvasCellOf(screenWidth=1248) returns 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0027 begin`);
      const actual: number = canvasCellOf(1248);
      logInfo(`canvasCellOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(156);
      logInfo(`${BUNDLE}CanvasCellOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0028
     * @tc.name      TsDrawingSample_CanvasCellOf_0028
     * @tc.desc      canvasCellOf(screenWidth=1344) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0028 begin`);
      const actual: number = canvasCellOf(1344);
      logInfo(`canvasCellOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}CanvasCellOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0029
     * @tc.name      TsDrawingSample_CanvasCellOf_0029
     * @tc.desc      canvasCellOf(screenWidth=1440) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0029 begin`);
      const actual: number = canvasCellOf(1440);
      logInfo(`canvasCellOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}CanvasCellOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0030
     * @tc.name      TsDrawingSample_CanvasCellOf_0030
     * @tc.desc      canvasCellOf(screenWidth=1536) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0030 begin`);
      const actual: number = canvasCellOf(1536);
      logInfo(`canvasCellOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}CanvasCellOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0031
     * @tc.name      TsDrawingSample_CanvasCellOf_0031
     * @tc.desc      canvasCellOf(screenWidth=1632) returns 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0031 begin`);
      const actual: number = canvasCellOf(1632);
      logInfo(`canvasCellOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(204);
      logInfo(`${BUNDLE}CanvasCellOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0032
     * @tc.name      TsDrawingSample_CanvasCellOf_0032
     * @tc.desc      canvasCellOf(screenWidth=1728) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0032 begin`);
      const actual: number = canvasCellOf(1728);
      logInfo(`canvasCellOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}CanvasCellOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0033
     * @tc.name      TsDrawingSample_CanvasCellOf_0033
     * @tc.desc      canvasCellOf(screenWidth=1824) returns 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0033 begin`);
      const actual: number = canvasCellOf(1824);
      logInfo(`canvasCellOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(228);
      logInfo(`${BUNDLE}CanvasCellOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0034
     * @tc.name      TsDrawingSample_CanvasCellOf_0034
     * @tc.desc      canvasCellOf(screenWidth=2016) returns 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0034 begin`);
      const actual: number = canvasCellOf(2016);
      logInfo(`canvasCellOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(252);
      logInfo(`${BUNDLE}CanvasCellOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0035
     * @tc.name      TsDrawingSample_CanvasCellOf_0035
     * @tc.desc      canvasCellOf(screenWidth=2112) returns 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0035 begin`);
      const actual: number = canvasCellOf(2112);
      logInfo(`canvasCellOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(264);
      logInfo(`${BUNDLE}CanvasCellOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0036
     * @tc.name      TsDrawingSample_CanvasCellOf_0036
     * @tc.desc      canvasCellOf(screenWidth=2208) returns 276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0036 begin`);
      const actual: number = canvasCellOf(2208);
      logInfo(`canvasCellOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(276);
      logInfo(`${BUNDLE}CanvasCellOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0037
     * @tc.name      TsDrawingSample_CanvasCellOf_0037
     * @tc.desc      canvasCellOf(screenWidth=2304) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0037 begin`);
      const actual: number = canvasCellOf(2304);
      logInfo(`canvasCellOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}CanvasCellOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0038
     * @tc.name      TsDrawingSample_CanvasCellOf_0038
     * @tc.desc      canvasCellOf(screenWidth=2400) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0038 begin`);
      const actual: number = canvasCellOf(2400);
      logInfo(`canvasCellOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}CanvasCellOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0039
     * @tc.name      TsDrawingSample_CanvasCellOf_0039
     * @tc.desc      canvasCellOf(screenWidth=2496) returns 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0039 begin`);
      const actual: number = canvasCellOf(2496);
      logInfo(`canvasCellOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(312);
      logInfo(`${BUNDLE}CanvasCellOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0040
     * @tc.name      TsDrawingSample_CanvasCellOf_0040
     * @tc.desc      canvasCellOf(screenWidth=2592) returns 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0040 begin`);
      const actual: number = canvasCellOf(2592);
      logInfo(`canvasCellOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(324);
      logInfo(`${BUNDLE}CanvasCellOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0041
     * @tc.name      TsDrawingSample_CanvasCellOf_0041
     * @tc.desc      canvasCellOf(screenWidth=2688) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0041 begin`);
      const actual: number = canvasCellOf(2688);
      logInfo(`canvasCellOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}CanvasCellOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0042
     * @tc.name      TsDrawingSample_CanvasCellOf_0042
     * @tc.desc      canvasCellOf(screenWidth=2784) returns 348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0042 begin`);
      const actual: number = canvasCellOf(2784);
      logInfo(`canvasCellOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(348);
      logInfo(`${BUNDLE}CanvasCellOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0043
     * @tc.name      TsDrawingSample_CanvasCellOf_0043
     * @tc.desc      canvasCellOf(screenWidth=2880) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0043 begin`);
      const actual: number = canvasCellOf(2880);
      logInfo(`canvasCellOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}CanvasCellOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0044
     * @tc.name      TsDrawingSample_CanvasCellOf_0044
     * @tc.desc      canvasCellOf(screenWidth=2976) returns 372
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0044 begin`);
      const actual: number = canvasCellOf(2976);
      logInfo(`canvasCellOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(372);
      logInfo(`${BUNDLE}CanvasCellOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0045
     * @tc.name      TsDrawingSample_CanvasCellOf_0045
     * @tc.desc      canvasCellOf(screenWidth=3072) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0045 begin`);
      const actual: number = canvasCellOf(3072);
      logInfo(`canvasCellOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}CanvasCellOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0046
     * @tc.name      TsDrawingSample_CanvasCellOf_0046
     * @tc.desc      canvasCellOf(screenWidth=3168) returns 396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0046 begin`);
      const actual: number = canvasCellOf(3168);
      logInfo(`canvasCellOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(396);
      logInfo(`${BUNDLE}CanvasCellOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0047
     * @tc.name      TsDrawingSample_CanvasCellOf_0047
     * @tc.desc      canvasCellOf(screenWidth=3264) returns 408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0047 begin`);
      const actual: number = canvasCellOf(3264);
      logInfo(`canvasCellOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(408);
      logInfo(`${BUNDLE}CanvasCellOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0048
     * @tc.name      TsDrawingSample_CanvasCellOf_0048
     * @tc.desc      canvasCellOf(screenWidth=3360) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0048 begin`);
      const actual: number = canvasCellOf(3360);
      logInfo(`canvasCellOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}CanvasCellOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0049
     * @tc.name      TsDrawingSample_CanvasCellOf_0049
     * @tc.desc      canvasCellOf(screenWidth=3456) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0049 begin`);
      const actual: number = canvasCellOf(3456);
      logInfo(`canvasCellOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}CanvasCellOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0050
     * @tc.name      TsDrawingSample_CanvasCellOf_0050
     * @tc.desc      canvasCellOf(screenWidth=3552) returns 444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0050 begin`);
      const actual: number = canvasCellOf(3552);
      logInfo(`canvasCellOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(444);
      logInfo(`${BUNDLE}CanvasCellOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0051
     * @tc.name      TsDrawingSample_CanvasCellOf_0051
     * @tc.desc      canvasCellOf(screenWidth=3648) returns 456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0051 begin`);
      const actual: number = canvasCellOf(3648);
      logInfo(`canvasCellOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(456);
      logInfo(`${BUNDLE}CanvasCellOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0052
     * @tc.name      TsDrawingSample_CanvasCellOf_0052
     * @tc.desc      canvasCellOf(screenWidth=3744) returns 468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0052 begin`);
      const actual: number = canvasCellOf(3744);
      logInfo(`canvasCellOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(468);
      logInfo(`${BUNDLE}CanvasCellOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0053
     * @tc.name      TsDrawingSample_CanvasCellOf_0053
     * @tc.desc      canvasCellOf(screenWidth=3840) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0053 begin`);
      const actual: number = canvasCellOf(3840);
      logInfo(`canvasCellOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}CanvasCellOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0054
     * @tc.name      TsDrawingSample_CanvasCellOf_0054
     * @tc.desc      canvasCellOf(screenWidth=-87) returns -10.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCellOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0054 begin`);
      const actual: number = canvasCellOf(-87);
      logInfo(`canvasCellOf(screenWidth=-87): actual=${actual}`);
      expect(actual).assertClose(-10.875, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0055
     * @tc.name      TsDrawingSample_CanvasCellOf_0055
     * @tc.desc      canvasCellOf(screenWidth=2461) returns 307.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0055 begin`);
      const actual: number = canvasCellOf(2461);
      logInfo(`canvasCellOf(screenWidth=2461): actual=${actual}`);
      expect(actual).assertClose(307.625, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0056
     * @tc.name      TsDrawingSample_CanvasCellOf_0056
     * @tc.desc      canvasCellOf(screenWidth=-166) returns -20.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCellOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0056 begin`);
      const actual: number = canvasCellOf(-166);
      logInfo(`canvasCellOf(screenWidth=-166): actual=${actual}`);
      expect(actual).assertClose(-20.75, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0057
     * @tc.name      TsDrawingSample_CanvasCellOf_0057
     * @tc.desc      canvasCellOf(screenWidth=3569) returns 446.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0057 begin`);
      const actual: number = canvasCellOf(3569);
      logInfo(`canvasCellOf(screenWidth=3569): actual=${actual}`);
      expect(actual).assertClose(446.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0058
     * @tc.name      TsDrawingSample_CanvasCellOf_0058
     * @tc.desc      canvasCellOf(screenWidth=375) returns 46.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0058 begin`);
      const actual: number = canvasCellOf(375);
      logInfo(`canvasCellOf(screenWidth=375): actual=${actual}`);
      expect(actual).assertClose(46.875, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0059
     * @tc.name      TsDrawingSample_CanvasCellOf_0059
     * @tc.desc      canvasCellOf(screenWidth=1524) returns 190.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0059 begin`);
      const actual: number = canvasCellOf(1524);
      logInfo(`canvasCellOf(screenWidth=1524): actual=${actual}`);
      expect(actual).assertClose(190.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0060
     * @tc.name      TsDrawingSample_CanvasCellOf_0060
     * @tc.desc      canvasCellOf(screenWidth=1794.3) returns 224.2875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0060 begin`);
      const actual: number = canvasCellOf(1794.3);
      logInfo(`canvasCellOf(screenWidth=1794.3): actual=${actual}`);
      expect(actual).assertClose(224.2875, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0061
     * @tc.name      TsDrawingSample_CanvasCellOf_0061
     * @tc.desc      canvasCellOf(screenWidth=1832) returns 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0061 begin`);
      const actual: number = canvasCellOf(1832);
      logInfo(`canvasCellOf(screenWidth=1832): actual=${actual}`);
      expect(actual).assertEqual(229);
      logInfo(`${BUNDLE}CanvasCellOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0062
     * @tc.name      TsDrawingSample_CanvasCellOf_0062
     * @tc.desc      canvasCellOf(screenWidth=1788) returns 223.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0062 begin`);
      const actual: number = canvasCellOf(1788);
      logInfo(`canvasCellOf(screenWidth=1788): actual=${actual}`);
      expect(actual).assertClose(223.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0063
     * @tc.name      TsDrawingSample_CanvasCellOf_0063
     * @tc.desc      canvasCellOf(screenWidth=1710) returns 213.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0063 begin`);
      const actual: number = canvasCellOf(1710);
      logInfo(`canvasCellOf(screenWidth=1710): actual=${actual}`);
      expect(actual).assertClose(213.75, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0064
     * @tc.name      TsDrawingSample_CanvasCellOf_0064
     * @tc.desc      canvasCellOf(screenWidth=-1451) returns -181.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCellOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0064 begin`);
      const actual: number = canvasCellOf(-1451);
      logInfo(`canvasCellOf(screenWidth=-1451): actual=${actual}`);
      expect(actual).assertClose(-181.375, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0065
     * @tc.name      TsDrawingSample_CanvasCellOf_0065
     * @tc.desc      canvasCellOf(screenWidth=-475) returns -59.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCellOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0065 begin`);
      const actual: number = canvasCellOf(-475);
      logInfo(`canvasCellOf(screenWidth=-475): actual=${actual}`);
      expect(actual).assertClose(-59.375, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0066
     * @tc.name      TsDrawingSample_CanvasCellOf_0066
     * @tc.desc      canvasCellOf(screenWidth=734) returns 91.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0066 begin`);
      const actual: number = canvasCellOf(734);
      logInfo(`canvasCellOf(screenWidth=734): actual=${actual}`);
      expect(actual).assertClose(91.75, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0067
     * @tc.name      TsDrawingSample_CanvasCellOf_0067
     * @tc.desc      canvasCellOf(screenWidth=842.83) returns 105.35375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0067 begin`);
      const actual: number = canvasCellOf(842.83);
      logInfo(`canvasCellOf(screenWidth=842.83): actual=${actual}`);
      expect(actual).assertClose(105.35375, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0068
     * @tc.name      TsDrawingSample_CanvasCellOf_0068
     * @tc.desc      canvasCellOf(screenWidth=1977) returns 247.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0068 begin`);
      const actual: number = canvasCellOf(1977);
      logInfo(`canvasCellOf(screenWidth=1977): actual=${actual}`);
      expect(actual).assertClose(247.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0069
     * @tc.name      TsDrawingSample_CanvasCellOf_0069
     * @tc.desc      canvasCellOf(screenWidth=2901) returns 362.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0069 begin`);
      const actual: number = canvasCellOf(2901);
      logInfo(`canvasCellOf(screenWidth=2901): actual=${actual}`);
      expect(actual).assertClose(362.625, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0070
     * @tc.name      TsDrawingSample_CanvasCellOf_0070
     * @tc.desc      canvasCellOf(screenWidth=880) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0070 begin`);
      const actual: number = canvasCellOf(880);
      logInfo(`canvasCellOf(screenWidth=880): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}CanvasCellOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0071
     * @tc.name      TsDrawingSample_CanvasCellOf_0071
     * @tc.desc      canvasCellOf(screenWidth=1876) returns 234.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0071 begin`);
      const actual: number = canvasCellOf(1876);
      logInfo(`canvasCellOf(screenWidth=1876): actual=${actual}`);
      expect(actual).assertClose(234.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0072
     * @tc.name      TsDrawingSample_CanvasCellOf_0072
     * @tc.desc      canvasCellOf(screenWidth=1776) returns 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0072 begin`);
      const actual: number = canvasCellOf(1776);
      logInfo(`canvasCellOf(screenWidth=1776): actual=${actual}`);
      expect(actual).assertEqual(222);
      logInfo(`${BUNDLE}CanvasCellOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0073
     * @tc.name      TsDrawingSample_CanvasCellOf_0073
     * @tc.desc      canvasCellOf(screenWidth=-21) returns -2.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCellOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0073 begin`);
      const actual: number = canvasCellOf(-21);
      logInfo(`canvasCellOf(screenWidth=-21): actual=${actual}`);
      expect(actual).assertClose(-2.625, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CELL_OF_0074
     * @tc.name      TsDrawingSample_CanvasCellOf_0074
     * @tc.desc      canvasCellOf(screenWidth=3462) returns 432.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCellOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCellOf_0074 begin`);
      const actual: number = canvasCellOf(3462);
      logInfo(`canvasCellOf(screenWidth=3462): actual=${actual}`);
      expect(actual).assertClose(432.75, PRECISION);
      logInfo(`${BUNDLE}CanvasCellOf_0074 end`);
    });
  });
}
