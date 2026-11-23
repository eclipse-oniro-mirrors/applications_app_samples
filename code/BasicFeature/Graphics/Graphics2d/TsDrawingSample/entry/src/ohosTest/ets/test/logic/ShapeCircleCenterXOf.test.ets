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
import { shapeCircleCenterXOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for shapeCircleCenterXOf (74 cases). */
export default function shapeCircleCenterXOfTest(): void {
  describe('ShapeCircleCenterXOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0001
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0001
     * @tc.desc      shapeCircleCenterXOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0001 begin`);
      const actual: number = shapeCircleCenterXOf(0);
      logInfo(`shapeCircleCenterXOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0002
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0002
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1) returns 0.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0002 begin`);
      const actual: number = shapeCircleCenterXOf(1);
      logInfo(`shapeCircleCenterXOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.375, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0003
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0003
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3) returns 1.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0003 begin`);
      const actual: number = shapeCircleCenterXOf(3);
      logInfo(`shapeCircleCenterXOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(1.125, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0004
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0004
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0004 begin`);
      const actual: number = shapeCircleCenterXOf(2);
      logInfo(`shapeCircleCenterXOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0005
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0005
     * @tc.desc      shapeCircleCenterXOf(screenWidth=4) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0005 begin`);
      const actual: number = shapeCircleCenterXOf(4);
      logInfo(`shapeCircleCenterXOf(screenWidth=4): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0006
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0006
     * @tc.desc      shapeCircleCenterXOf(screenWidth=100) returns 37.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0006 begin`);
      const actual: number = shapeCircleCenterXOf(100);
      logInfo(`shapeCircleCenterXOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0007
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0007
     * @tc.desc      shapeCircleCenterXOf(screenWidth=360) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0007 begin`);
      const actual: number = shapeCircleCenterXOf(360);
      logInfo(`shapeCircleCenterXOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0008
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0008
     * @tc.desc      shapeCircleCenterXOf(screenWidth=720) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0008 begin`);
      const actual: number = shapeCircleCenterXOf(720);
      logInfo(`shapeCircleCenterXOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0009
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0009
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1080) returns 405
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0009 begin`);
      const actual: number = shapeCircleCenterXOf(1080);
      logInfo(`shapeCircleCenterXOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(405);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0010
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0010
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1920) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0010 begin`);
      const actual: number = shapeCircleCenterXOf(1920);
      logInfo(`shapeCircleCenterXOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0011
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0011
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-1) returns -0.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0011 begin`);
      const actual: number = shapeCircleCenterXOf(-1);
      logInfo(`shapeCircleCenterXOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.375, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0012
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0012
     * @tc.desc      shapeCircleCenterXOf(screenWidth=10) returns 3.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0012 begin`);
      const actual: number = shapeCircleCenterXOf(10);
      logInfo(`shapeCircleCenterXOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(3.75, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0013
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0013
     * @tc.desc      shapeCircleCenterXOf(screenWidth=96) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0013 begin`);
      const actual: number = shapeCircleCenterXOf(96);
      logInfo(`shapeCircleCenterXOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0014
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0014
     * @tc.desc      shapeCircleCenterXOf(screenWidth=192) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0014 begin`);
      const actual: number = shapeCircleCenterXOf(192);
      logInfo(`shapeCircleCenterXOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0015
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0015
     * @tc.desc      shapeCircleCenterXOf(screenWidth=288) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0015 begin`);
      const actual: number = shapeCircleCenterXOf(288);
      logInfo(`shapeCircleCenterXOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0016
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0016
     * @tc.desc      shapeCircleCenterXOf(screenWidth=384) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0016 begin`);
      const actual: number = shapeCircleCenterXOf(384);
      logInfo(`shapeCircleCenterXOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0017
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0017
     * @tc.desc      shapeCircleCenterXOf(screenWidth=480) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0017 begin`);
      const actual: number = shapeCircleCenterXOf(480);
      logInfo(`shapeCircleCenterXOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0018
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0018
     * @tc.desc      shapeCircleCenterXOf(screenWidth=576) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0018 begin`);
      const actual: number = shapeCircleCenterXOf(576);
      logInfo(`shapeCircleCenterXOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0019
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0019
     * @tc.desc      shapeCircleCenterXOf(screenWidth=672) returns 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0019 begin`);
      const actual: number = shapeCircleCenterXOf(672);
      logInfo(`shapeCircleCenterXOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(252);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0020
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0020
     * @tc.desc      shapeCircleCenterXOf(screenWidth=768) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0020 begin`);
      const actual: number = shapeCircleCenterXOf(768);
      logInfo(`shapeCircleCenterXOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0021
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0021
     * @tc.desc      shapeCircleCenterXOf(screenWidth=864) returns 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0021 begin`);
      const actual: number = shapeCircleCenterXOf(864);
      logInfo(`shapeCircleCenterXOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(324);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0022
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0022
     * @tc.desc      shapeCircleCenterXOf(screenWidth=960) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0022 begin`);
      const actual: number = shapeCircleCenterXOf(960);
      logInfo(`shapeCircleCenterXOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0023
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0023
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1056) returns 396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0023 begin`);
      const actual: number = shapeCircleCenterXOf(1056);
      logInfo(`shapeCircleCenterXOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(396);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0024
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0024
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1152) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0024 begin`);
      const actual: number = shapeCircleCenterXOf(1152);
      logInfo(`shapeCircleCenterXOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0025
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0025
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1248) returns 468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0025 begin`);
      const actual: number = shapeCircleCenterXOf(1248);
      logInfo(`shapeCircleCenterXOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(468);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0026
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0026
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1344) returns 504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0026 begin`);
      const actual: number = shapeCircleCenterXOf(1344);
      logInfo(`shapeCircleCenterXOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(504);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0027
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0027
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1440) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0027 begin`);
      const actual: number = shapeCircleCenterXOf(1440);
      logInfo(`shapeCircleCenterXOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0028
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0028
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1536) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0028 begin`);
      const actual: number = shapeCircleCenterXOf(1536);
      logInfo(`shapeCircleCenterXOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0029
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0029
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1632) returns 612
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0029 begin`);
      const actual: number = shapeCircleCenterXOf(1632);
      logInfo(`shapeCircleCenterXOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(612);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0030
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0030
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1728) returns 648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0030 begin`);
      const actual: number = shapeCircleCenterXOf(1728);
      logInfo(`shapeCircleCenterXOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(648);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0031
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0031
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1824) returns 684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0031 begin`);
      const actual: number = shapeCircleCenterXOf(1824);
      logInfo(`shapeCircleCenterXOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(684);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0032
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0032
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2016) returns 756
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0032 begin`);
      const actual: number = shapeCircleCenterXOf(2016);
      logInfo(`shapeCircleCenterXOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(756);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0033
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0033
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2112) returns 792
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0033 begin`);
      const actual: number = shapeCircleCenterXOf(2112);
      logInfo(`shapeCircleCenterXOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(792);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0034
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0034
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2208) returns 828
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0034 begin`);
      const actual: number = shapeCircleCenterXOf(2208);
      logInfo(`shapeCircleCenterXOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(828);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0035
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0035
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2304) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0035 begin`);
      const actual: number = shapeCircleCenterXOf(2304);
      logInfo(`shapeCircleCenterXOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0036
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0036
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2400) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0036 begin`);
      const actual: number = shapeCircleCenterXOf(2400);
      logInfo(`shapeCircleCenterXOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0037
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0037
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2496) returns 936
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0037 begin`);
      const actual: number = shapeCircleCenterXOf(2496);
      logInfo(`shapeCircleCenterXOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(936);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0038
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0038
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2592) returns 972
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0038 begin`);
      const actual: number = shapeCircleCenterXOf(2592);
      logInfo(`shapeCircleCenterXOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(972);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0039
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0039
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2688) returns 1008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0039 begin`);
      const actual: number = shapeCircleCenterXOf(2688);
      logInfo(`shapeCircleCenterXOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(1008);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0040
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0040
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2784) returns 1044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0040 begin`);
      const actual: number = shapeCircleCenterXOf(2784);
      logInfo(`shapeCircleCenterXOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(1044);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0041
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0041
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2880) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0041 begin`);
      const actual: number = shapeCircleCenterXOf(2880);
      logInfo(`shapeCircleCenterXOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0042
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0042
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2976) returns 1116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0042 begin`);
      const actual: number = shapeCircleCenterXOf(2976);
      logInfo(`shapeCircleCenterXOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(1116);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0043
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0043
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3072) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0043 begin`);
      const actual: number = shapeCircleCenterXOf(3072);
      logInfo(`shapeCircleCenterXOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0044
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0044
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3168) returns 1188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0044 begin`);
      const actual: number = shapeCircleCenterXOf(3168);
      logInfo(`shapeCircleCenterXOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(1188);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0045
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0045
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3264) returns 1224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0045 begin`);
      const actual: number = shapeCircleCenterXOf(3264);
      logInfo(`shapeCircleCenterXOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(1224);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0046
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0046
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3360) returns 1260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0046 begin`);
      const actual: number = shapeCircleCenterXOf(3360);
      logInfo(`shapeCircleCenterXOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(1260);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0047
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0047
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3456) returns 1296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0047 begin`);
      const actual: number = shapeCircleCenterXOf(3456);
      logInfo(`shapeCircleCenterXOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(1296);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0048
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0048
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3552) returns 1332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0048 begin`);
      const actual: number = shapeCircleCenterXOf(3552);
      logInfo(`shapeCircleCenterXOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(1332);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0049
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0049
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3648) returns 1368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0049 begin`);
      const actual: number = shapeCircleCenterXOf(3648);
      logInfo(`shapeCircleCenterXOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(1368);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0050
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0050
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3744) returns 1404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0050 begin`);
      const actual: number = shapeCircleCenterXOf(3744);
      logInfo(`shapeCircleCenterXOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(1404);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0051
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0051
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3840) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0051 begin`);
      const actual: number = shapeCircleCenterXOf(3840);
      logInfo(`shapeCircleCenterXOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0052
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0052
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-695) returns -260.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0052 begin`);
      const actual: number = shapeCircleCenterXOf(-695);
      logInfo(`shapeCircleCenterXOf(screenWidth=-695): actual=${actual}`);
      expect(actual).assertClose(-260.625, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0053
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0053
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1691.02) returns 634.1324999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0053 begin`);
      const actual: number = shapeCircleCenterXOf(1691.02);
      logInfo(`shapeCircleCenterXOf(screenWidth=1691.02): actual=${actual}`);
      expect(actual).assertClose(634.1324999999999, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0054
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0054
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3298) returns 1236.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0054 begin`);
      const actual: number = shapeCircleCenterXOf(3298);
      logInfo(`shapeCircleCenterXOf(screenWidth=3298): actual=${actual}`);
      expect(actual).assertClose(1236.75, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0055
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0055
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-1909) returns -715.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0055 begin`);
      const actual: number = shapeCircleCenterXOf(-1909);
      logInfo(`shapeCircleCenterXOf(screenWidth=-1909): actual=${actual}`);
      expect(actual).assertClose(-715.875, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0056
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0056
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2216) returns 831
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0056 begin`);
      const actual: number = shapeCircleCenterXOf(2216);
      logInfo(`shapeCircleCenterXOf(screenWidth=2216): actual=${actual}`);
      expect(actual).assertEqual(831);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0057
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0057
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3729) returns 1398.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0057 begin`);
      const actual: number = shapeCircleCenterXOf(3729);
      logInfo(`shapeCircleCenterXOf(screenWidth=3729): actual=${actual}`);
      expect(actual).assertClose(1398.375, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0058
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0058
     * @tc.desc      shapeCircleCenterXOf(screenWidth=881.63) returns 330.61125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0058 begin`);
      const actual: number = shapeCircleCenterXOf(881.63);
      logInfo(`shapeCircleCenterXOf(screenWidth=881.63): actual=${actual}`);
      expect(actual).assertClose(330.61125, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0059
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0059
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2782) returns 1043.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0059 begin`);
      const actual: number = shapeCircleCenterXOf(2782);
      logInfo(`shapeCircleCenterXOf(screenWidth=2782): actual=${actual}`);
      expect(actual).assertClose(1043.25, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0060
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0060
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-1797) returns -673.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0060 begin`);
      const actual: number = shapeCircleCenterXOf(-1797);
      logInfo(`shapeCircleCenterXOf(screenWidth=-1797): actual=${actual}`);
      expect(actual).assertClose(-673.875, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0061
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0061
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-1004) returns -376.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0061 begin`);
      const actual: number = shapeCircleCenterXOf(-1004);
      logInfo(`shapeCircleCenterXOf(screenWidth=-1004): actual=${actual}`);
      expect(actual).assertClose(-376.5, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0062
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0062
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2134) returns 800.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0062 begin`);
      const actual: number = shapeCircleCenterXOf(2134);
      logInfo(`shapeCircleCenterXOf(screenWidth=2134): actual=${actual}`);
      expect(actual).assertClose(800.25, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0063
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0063
     * @tc.desc      shapeCircleCenterXOf(screenWidth=943.82) returns 353.9325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0063 begin`);
      const actual: number = shapeCircleCenterXOf(943.82);
      logInfo(`shapeCircleCenterXOf(screenWidth=943.82): actual=${actual}`);
      expect(actual).assertClose(353.9325, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0064
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0064
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-367) returns -137.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0064 begin`);
      const actual: number = shapeCircleCenterXOf(-367);
      logInfo(`shapeCircleCenterXOf(screenWidth=-367): actual=${actual}`);
      expect(actual).assertClose(-137.625, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0065
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0065
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-212) returns -79.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0065 begin`);
      const actual: number = shapeCircleCenterXOf(-212);
      logInfo(`shapeCircleCenterXOf(screenWidth=-212): actual=${actual}`);
      expect(actual).assertClose(-79.5, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0066
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0066
     * @tc.desc      shapeCircleCenterXOf(screenWidth=926.24) returns 347.34000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0066 begin`);
      const actual: number = shapeCircleCenterXOf(926.24);
      logInfo(`shapeCircleCenterXOf(screenWidth=926.24): actual=${actual}`);
      expect(actual).assertClose(347.34000000000003, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0067
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0067
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1024.64) returns 384.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0067 begin`);
      const actual: number = shapeCircleCenterXOf(1024.64);
      logInfo(`shapeCircleCenterXOf(screenWidth=1024.64): actual=${actual}`);
      expect(actual).assertClose(384.24, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0068
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0068
     * @tc.desc      shapeCircleCenterXOf(screenWidth=3791) returns 1421.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0068 begin`);
      const actual: number = shapeCircleCenterXOf(3791);
      logInfo(`shapeCircleCenterXOf(screenWidth=3791): actual=${actual}`);
      expect(actual).assertClose(1421.625, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0069
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0069
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1326) returns 497.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0069 begin`);
      const actual: number = shapeCircleCenterXOf(1326);
      logInfo(`shapeCircleCenterXOf(screenWidth=1326): actual=${actual}`);
      expect(actual).assertClose(497.25, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0070
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0070
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2383) returns 893.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0070 begin`);
      const actual: number = shapeCircleCenterXOf(2383);
      logInfo(`shapeCircleCenterXOf(screenWidth=2383): actual=${actual}`);
      expect(actual).assertClose(893.625, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0071
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0071
     * @tc.desc      shapeCircleCenterXOf(screenWidth=2249) returns 843.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0071 begin`);
      const actual: number = shapeCircleCenterXOf(2249);
      logInfo(`shapeCircleCenterXOf(screenWidth=2249): actual=${actual}`);
      expect(actual).assertClose(843.375, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0072
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0072
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1679.94) returns 629.9775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0072 begin`);
      const actual: number = shapeCircleCenterXOf(1679.94);
      logInfo(`shapeCircleCenterXOf(screenWidth=1679.94): actual=${actual}`);
      expect(actual).assertClose(629.9775, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0073
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0073
     * @tc.desc      shapeCircleCenterXOf(screenWidth=-309) returns -115.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0073 begin`);
      const actual: number = shapeCircleCenterXOf(-309);
      logInfo(`shapeCircleCenterXOf(screenWidth=-309): actual=${actual}`);
      expect(actual).assertClose(-115.875, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_CIRCLE_CENTER_XOF_0074
     * @tc.name      TsDrawingSample_ShapeCircleCenterXOf_0074
     * @tc.desc      shapeCircleCenterXOf(screenWidth=1389) returns 520.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeCircleCenterXOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0074 begin`);
      const actual: number = shapeCircleCenterXOf(1389);
      logInfo(`shapeCircleCenterXOf(screenWidth=1389): actual=${actual}`);
      expect(actual).assertClose(520.875, PRECISION);
      logInfo(`${BUNDLE}ShapeCircleCenterXOf_0074 end`);
    });
  });
}
