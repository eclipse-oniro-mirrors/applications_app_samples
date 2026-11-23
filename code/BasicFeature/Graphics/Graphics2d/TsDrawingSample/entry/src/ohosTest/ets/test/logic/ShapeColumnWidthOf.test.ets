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
import { shapeColumnWidthOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for shapeColumnWidthOf (74 cases). */
export default function shapeColumnWidthOfTest(): void {
  describe('ShapeColumnWidthOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0001
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0001
     * @tc.desc      shapeColumnWidthOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0001 begin`);
      const actual: number = shapeColumnWidthOf(0);
      logInfo(`shapeColumnWidthOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0002
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0002
     * @tc.desc      shapeColumnWidthOf(screenWidth=1) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0002 begin`);
      const actual: number = shapeColumnWidthOf(1);
      logInfo(`shapeColumnWidthOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0003
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0003
     * @tc.desc      shapeColumnWidthOf(screenWidth=4) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0003 begin`);
      const actual: number = shapeColumnWidthOf(4);
      logInfo(`shapeColumnWidthOf(screenWidth=4): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0004
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0004
     * @tc.desc      shapeColumnWidthOf(screenWidth=3) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0004 begin`);
      const actual: number = shapeColumnWidthOf(3);
      logInfo(`shapeColumnWidthOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0005
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0005
     * @tc.desc      shapeColumnWidthOf(screenWidth=5) returns 1.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0005 begin`);
      const actual: number = shapeColumnWidthOf(5);
      logInfo(`shapeColumnWidthOf(screenWidth=5): actual=${actual}`);
      expect(actual).assertClose(1.25, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0006
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0006
     * @tc.desc      shapeColumnWidthOf(screenWidth=100) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0006 begin`);
      const actual: number = shapeColumnWidthOf(100);
      logInfo(`shapeColumnWidthOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0007
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0007
     * @tc.desc      shapeColumnWidthOf(screenWidth=360) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0007 begin`);
      const actual: number = shapeColumnWidthOf(360);
      logInfo(`shapeColumnWidthOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0008
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0008
     * @tc.desc      shapeColumnWidthOf(screenWidth=720) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0008 begin`);
      const actual: number = shapeColumnWidthOf(720);
      logInfo(`shapeColumnWidthOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0009
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0009
     * @tc.desc      shapeColumnWidthOf(screenWidth=1080) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0009 begin`);
      const actual: number = shapeColumnWidthOf(1080);
      logInfo(`shapeColumnWidthOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0010
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0010
     * @tc.desc      shapeColumnWidthOf(screenWidth=1920) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0010 begin`);
      const actual: number = shapeColumnWidthOf(1920);
      logInfo(`shapeColumnWidthOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0011
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0011
     * @tc.desc      shapeColumnWidthOf(screenWidth=-1) returns -0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0011 begin`);
      const actual: number = shapeColumnWidthOf(-1);
      logInfo(`shapeColumnWidthOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.25, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0012
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0012
     * @tc.desc      shapeColumnWidthOf(screenWidth=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0012 begin`);
      const actual: number = shapeColumnWidthOf(2);
      logInfo(`shapeColumnWidthOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0013
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0013
     * @tc.desc      shapeColumnWidthOf(screenWidth=10) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0013 begin`);
      const actual: number = shapeColumnWidthOf(10);
      logInfo(`shapeColumnWidthOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0014
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0014
     * @tc.desc      shapeColumnWidthOf(screenWidth=96) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0014 begin`);
      const actual: number = shapeColumnWidthOf(96);
      logInfo(`shapeColumnWidthOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0015
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0015
     * @tc.desc      shapeColumnWidthOf(screenWidth=192) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0015 begin`);
      const actual: number = shapeColumnWidthOf(192);
      logInfo(`shapeColumnWidthOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0016
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0016
     * @tc.desc      shapeColumnWidthOf(screenWidth=288) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0016 begin`);
      const actual: number = shapeColumnWidthOf(288);
      logInfo(`shapeColumnWidthOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0017
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0017
     * @tc.desc      shapeColumnWidthOf(screenWidth=384) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0017 begin`);
      const actual: number = shapeColumnWidthOf(384);
      logInfo(`shapeColumnWidthOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0018
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0018
     * @tc.desc      shapeColumnWidthOf(screenWidth=480) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0018 begin`);
      const actual: number = shapeColumnWidthOf(480);
      logInfo(`shapeColumnWidthOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0019
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0019
     * @tc.desc      shapeColumnWidthOf(screenWidth=576) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0019 begin`);
      const actual: number = shapeColumnWidthOf(576);
      logInfo(`shapeColumnWidthOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0020
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0020
     * @tc.desc      shapeColumnWidthOf(screenWidth=672) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0020 begin`);
      const actual: number = shapeColumnWidthOf(672);
      logInfo(`shapeColumnWidthOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0021
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0021
     * @tc.desc      shapeColumnWidthOf(screenWidth=768) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0021 begin`);
      const actual: number = shapeColumnWidthOf(768);
      logInfo(`shapeColumnWidthOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0022
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0022
     * @tc.desc      shapeColumnWidthOf(screenWidth=864) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0022 begin`);
      const actual: number = shapeColumnWidthOf(864);
      logInfo(`shapeColumnWidthOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0023
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0023
     * @tc.desc      shapeColumnWidthOf(screenWidth=960) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0023 begin`);
      const actual: number = shapeColumnWidthOf(960);
      logInfo(`shapeColumnWidthOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0024
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0024
     * @tc.desc      shapeColumnWidthOf(screenWidth=1056) returns 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0024 begin`);
      const actual: number = shapeColumnWidthOf(1056);
      logInfo(`shapeColumnWidthOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(264);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0025
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0025
     * @tc.desc      shapeColumnWidthOf(screenWidth=1152) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0025 begin`);
      const actual: number = shapeColumnWidthOf(1152);
      logInfo(`shapeColumnWidthOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0026
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0026
     * @tc.desc      shapeColumnWidthOf(screenWidth=1248) returns 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0026 begin`);
      const actual: number = shapeColumnWidthOf(1248);
      logInfo(`shapeColumnWidthOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(312);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0027
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0027
     * @tc.desc      shapeColumnWidthOf(screenWidth=1344) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0027 begin`);
      const actual: number = shapeColumnWidthOf(1344);
      logInfo(`shapeColumnWidthOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0028
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0028
     * @tc.desc      shapeColumnWidthOf(screenWidth=1440) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0028 begin`);
      const actual: number = shapeColumnWidthOf(1440);
      logInfo(`shapeColumnWidthOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0029
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0029
     * @tc.desc      shapeColumnWidthOf(screenWidth=1536) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0029 begin`);
      const actual: number = shapeColumnWidthOf(1536);
      logInfo(`shapeColumnWidthOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0030
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0030
     * @tc.desc      shapeColumnWidthOf(screenWidth=1632) returns 408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0030 begin`);
      const actual: number = shapeColumnWidthOf(1632);
      logInfo(`shapeColumnWidthOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(408);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0031
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0031
     * @tc.desc      shapeColumnWidthOf(screenWidth=1728) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0031 begin`);
      const actual: number = shapeColumnWidthOf(1728);
      logInfo(`shapeColumnWidthOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0032
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0032
     * @tc.desc      shapeColumnWidthOf(screenWidth=1824) returns 456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0032 begin`);
      const actual: number = shapeColumnWidthOf(1824);
      logInfo(`shapeColumnWidthOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(456);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0033
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0033
     * @tc.desc      shapeColumnWidthOf(screenWidth=2016) returns 504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0033 begin`);
      const actual: number = shapeColumnWidthOf(2016);
      logInfo(`shapeColumnWidthOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(504);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0034
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0034
     * @tc.desc      shapeColumnWidthOf(screenWidth=2112) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0034 begin`);
      const actual: number = shapeColumnWidthOf(2112);
      logInfo(`shapeColumnWidthOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0035
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0035
     * @tc.desc      shapeColumnWidthOf(screenWidth=2208) returns 552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0035 begin`);
      const actual: number = shapeColumnWidthOf(2208);
      logInfo(`shapeColumnWidthOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(552);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0036
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0036
     * @tc.desc      shapeColumnWidthOf(screenWidth=2304) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0036 begin`);
      const actual: number = shapeColumnWidthOf(2304);
      logInfo(`shapeColumnWidthOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0037
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0037
     * @tc.desc      shapeColumnWidthOf(screenWidth=2400) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0037 begin`);
      const actual: number = shapeColumnWidthOf(2400);
      logInfo(`shapeColumnWidthOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0038
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0038
     * @tc.desc      shapeColumnWidthOf(screenWidth=2496) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0038 begin`);
      const actual: number = shapeColumnWidthOf(2496);
      logInfo(`shapeColumnWidthOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0039
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0039
     * @tc.desc      shapeColumnWidthOf(screenWidth=2592) returns 648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0039 begin`);
      const actual: number = shapeColumnWidthOf(2592);
      logInfo(`shapeColumnWidthOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(648);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0040
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0040
     * @tc.desc      shapeColumnWidthOf(screenWidth=2688) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0040 begin`);
      const actual: number = shapeColumnWidthOf(2688);
      logInfo(`shapeColumnWidthOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0041
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0041
     * @tc.desc      shapeColumnWidthOf(screenWidth=2784) returns 696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0041 begin`);
      const actual: number = shapeColumnWidthOf(2784);
      logInfo(`shapeColumnWidthOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(696);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0042
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0042
     * @tc.desc      shapeColumnWidthOf(screenWidth=2880) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0042 begin`);
      const actual: number = shapeColumnWidthOf(2880);
      logInfo(`shapeColumnWidthOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0043
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0043
     * @tc.desc      shapeColumnWidthOf(screenWidth=2976) returns 744
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0043 begin`);
      const actual: number = shapeColumnWidthOf(2976);
      logInfo(`shapeColumnWidthOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(744);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0044
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0044
     * @tc.desc      shapeColumnWidthOf(screenWidth=3072) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0044 begin`);
      const actual: number = shapeColumnWidthOf(3072);
      logInfo(`shapeColumnWidthOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0045
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0045
     * @tc.desc      shapeColumnWidthOf(screenWidth=3168) returns 792
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0045 begin`);
      const actual: number = shapeColumnWidthOf(3168);
      logInfo(`shapeColumnWidthOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(792);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0046
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0046
     * @tc.desc      shapeColumnWidthOf(screenWidth=3264) returns 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0046 begin`);
      const actual: number = shapeColumnWidthOf(3264);
      logInfo(`shapeColumnWidthOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0047
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0047
     * @tc.desc      shapeColumnWidthOf(screenWidth=3360) returns 840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0047 begin`);
      const actual: number = shapeColumnWidthOf(3360);
      logInfo(`shapeColumnWidthOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0048
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0048
     * @tc.desc      shapeColumnWidthOf(screenWidth=3456) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0048 begin`);
      const actual: number = shapeColumnWidthOf(3456);
      logInfo(`shapeColumnWidthOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0049
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0049
     * @tc.desc      shapeColumnWidthOf(screenWidth=3552) returns 888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0049 begin`);
      const actual: number = shapeColumnWidthOf(3552);
      logInfo(`shapeColumnWidthOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(888);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0050
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0050
     * @tc.desc      shapeColumnWidthOf(screenWidth=3648) returns 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0050 begin`);
      const actual: number = shapeColumnWidthOf(3648);
      logInfo(`shapeColumnWidthOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0051
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0051
     * @tc.desc      shapeColumnWidthOf(screenWidth=3744) returns 936
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0051 begin`);
      const actual: number = shapeColumnWidthOf(3744);
      logInfo(`shapeColumnWidthOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(936);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0052
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0052
     * @tc.desc      shapeColumnWidthOf(screenWidth=3840) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0052 begin`);
      const actual: number = shapeColumnWidthOf(3840);
      logInfo(`shapeColumnWidthOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0053
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0053
     * @tc.desc      shapeColumnWidthOf(screenWidth=-263) returns -65.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0053 begin`);
      const actual: number = shapeColumnWidthOf(-263);
      logInfo(`shapeColumnWidthOf(screenWidth=-263): actual=${actual}`);
      expect(actual).assertClose(-65.75, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0054
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0054
     * @tc.desc      shapeColumnWidthOf(screenWidth=2618) returns 654.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0054 begin`);
      const actual: number = shapeColumnWidthOf(2618);
      logInfo(`shapeColumnWidthOf(screenWidth=2618): actual=${actual}`);
      expect(actual).assertClose(654.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0055
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0055
     * @tc.desc      shapeColumnWidthOf(screenWidth=-177) returns -44.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0055 begin`);
      const actual: number = shapeColumnWidthOf(-177);
      logInfo(`shapeColumnWidthOf(screenWidth=-177): actual=${actual}`);
      expect(actual).assertClose(-44.25, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0056
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0056
     * @tc.desc      shapeColumnWidthOf(screenWidth=1613) returns 403.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0056 begin`);
      const actual: number = shapeColumnWidthOf(1613);
      logInfo(`shapeColumnWidthOf(screenWidth=1613): actual=${actual}`);
      expect(actual).assertClose(403.25, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0057
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0057
     * @tc.desc      shapeColumnWidthOf(screenWidth=-1424) returns -356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0057 begin`);
      const actual: number = shapeColumnWidthOf(-1424);
      logInfo(`shapeColumnWidthOf(screenWidth=-1424): actual=${actual}`);
      expect(actual).assertEqual(-356);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0058
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0058
     * @tc.desc      shapeColumnWidthOf(screenWidth=3242) returns 810.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0058 begin`);
      const actual: number = shapeColumnWidthOf(3242);
      logInfo(`shapeColumnWidthOf(screenWidth=3242): actual=${actual}`);
      expect(actual).assertClose(810.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0059
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0059
     * @tc.desc      shapeColumnWidthOf(screenWidth=783.13) returns 195.7825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0059 begin`);
      const actual: number = shapeColumnWidthOf(783.13);
      logInfo(`shapeColumnWidthOf(screenWidth=783.13): actual=${actual}`);
      expect(actual).assertClose(195.7825, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0060
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0060
     * @tc.desc      shapeColumnWidthOf(screenWidth=-1390) returns -347.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0060 begin`);
      const actual: number = shapeColumnWidthOf(-1390);
      logInfo(`shapeColumnWidthOf(screenWidth=-1390): actual=${actual}`);
      expect(actual).assertClose(-347.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0061
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0061
     * @tc.desc      shapeColumnWidthOf(screenWidth=3157) returns 789.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0061 begin`);
      const actual: number = shapeColumnWidthOf(3157);
      logInfo(`shapeColumnWidthOf(screenWidth=3157): actual=${actual}`);
      expect(actual).assertClose(789.25, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0062
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0062
     * @tc.desc      shapeColumnWidthOf(screenWidth=-10) returns -2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0062 begin`);
      const actual: number = shapeColumnWidthOf(-10);
      logInfo(`shapeColumnWidthOf(screenWidth=-10): actual=${actual}`);
      expect(actual).assertClose(-2.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0063
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0063
     * @tc.desc      shapeColumnWidthOf(screenWidth=3612) returns 903
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0063 begin`);
      const actual: number = shapeColumnWidthOf(3612);
      logInfo(`shapeColumnWidthOf(screenWidth=3612): actual=${actual}`);
      expect(actual).assertEqual(903);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0064
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0064
     * @tc.desc      shapeColumnWidthOf(screenWidth=1127.13) returns 281.7825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0064 begin`);
      const actual: number = shapeColumnWidthOf(1127.13);
      logInfo(`shapeColumnWidthOf(screenWidth=1127.13): actual=${actual}`);
      expect(actual).assertClose(281.7825, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0065
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0065
     * @tc.desc      shapeColumnWidthOf(screenWidth=-705) returns -176.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0065 begin`);
      const actual: number = shapeColumnWidthOf(-705);
      logInfo(`shapeColumnWidthOf(screenWidth=-705): actual=${actual}`);
      expect(actual).assertClose(-176.25, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0066
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0066
     * @tc.desc      shapeColumnWidthOf(screenWidth=3819) returns 954.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0066 begin`);
      const actual: number = shapeColumnWidthOf(3819);
      logInfo(`shapeColumnWidthOf(screenWidth=3819): actual=${actual}`);
      expect(actual).assertClose(954.75, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0067
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0067
     * @tc.desc      shapeColumnWidthOf(screenWidth=838) returns 209.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0067 begin`);
      const actual: number = shapeColumnWidthOf(838);
      logInfo(`shapeColumnWidthOf(screenWidth=838): actual=${actual}`);
      expect(actual).assertClose(209.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0068
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0068
     * @tc.desc      shapeColumnWidthOf(screenWidth=3587) returns 896.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0068 begin`);
      const actual: number = shapeColumnWidthOf(3587);
      logInfo(`shapeColumnWidthOf(screenWidth=3587): actual=${actual}`);
      expect(actual).assertClose(896.75, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0069
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0069
     * @tc.desc      shapeColumnWidthOf(screenWidth=2879) returns 719.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0069 begin`);
      const actual: number = shapeColumnWidthOf(2879);
      logInfo(`shapeColumnWidthOf(screenWidth=2879): actual=${actual}`);
      expect(actual).assertClose(719.75, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0070
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0070
     * @tc.desc      shapeColumnWidthOf(screenWidth=1994) returns 498.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0070 begin`);
      const actual: number = shapeColumnWidthOf(1994);
      logInfo(`shapeColumnWidthOf(screenWidth=1994): actual=${actual}`);
      expect(actual).assertClose(498.5, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0071
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0071
     * @tc.desc      shapeColumnWidthOf(screenWidth=-184) returns -46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0071 begin`);
      const actual: number = shapeColumnWidthOf(-184);
      logInfo(`shapeColumnWidthOf(screenWidth=-184): actual=${actual}`);
      expect(actual).assertEqual(-46);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0072
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0072
     * @tc.desc      shapeColumnWidthOf(screenWidth=1057.71) returns 264.4275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0072 begin`);
      const actual: number = shapeColumnWidthOf(1057.71);
      logInfo(`shapeColumnWidthOf(screenWidth=1057.71): actual=${actual}`);
      expect(actual).assertClose(264.4275, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0073
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0073
     * @tc.desc      shapeColumnWidthOf(screenWidth=-287) returns -71.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0073 begin`);
      const actual: number = shapeColumnWidthOf(-287);
      logInfo(`shapeColumnWidthOf(screenWidth=-287): actual=${actual}`);
      expect(actual).assertClose(-71.75, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_COLUMN_WIDTH_OF_0074
     * @tc.name      TsDrawingSample_ShapeColumnWidthOf_0074
     * @tc.desc      shapeColumnWidthOf(screenWidth=-87) returns -21.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeColumnWidthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0074 begin`);
      const actual: number = shapeColumnWidthOf(-87);
      logInfo(`shapeColumnWidthOf(screenWidth=-87): actual=${actual}`);
      expect(actual).assertClose(-21.75, PRECISION);
      logInfo(`${BUNDLE}ShapeColumnWidthOf_0074 end`);
    });
  });
}
