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
import { shapePointXOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for shapePointXOf (74 cases). */
export default function shapePointXOfTest(): void {
  describe('ShapePointXOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0001
     * @tc.name      TsDrawingSample_ShapePointXOf_0001
     * @tc.desc      shapePointXOf(screenWidth=0) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePointXOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0001 begin`);
      const actual: number = shapePointXOf(0);
      logInfo(`shapePointXOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}ShapePointXOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0002
     * @tc.name      TsDrawingSample_ShapePointXOf_0002
     * @tc.desc      shapePointXOf(screenWidth=1) returns 80.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePointXOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0002 begin`);
      const actual: number = shapePointXOf(1);
      logInfo(`shapePointXOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(80.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0003
     * @tc.name      TsDrawingSample_ShapePointXOf_0003
     * @tc.desc      shapePointXOf(screenWidth=80) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePointXOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0003 begin`);
      const actual: number = shapePointXOf(80);
      logInfo(`shapePointXOf(screenWidth=80): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ShapePointXOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0004
     * @tc.name      TsDrawingSample_ShapePointXOf_0004
     * @tc.desc      shapePointXOf(screenWidth=79) returns 99.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePointXOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0004 begin`);
      const actual: number = shapePointXOf(79);
      logInfo(`shapePointXOf(screenWidth=79): actual=${actual}`);
      expect(actual).assertClose(99.75, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0005
     * @tc.name      TsDrawingSample_ShapePointXOf_0005
     * @tc.desc      shapePointXOf(screenWidth=81) returns 100.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePointXOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0005 begin`);
      const actual: number = shapePointXOf(81);
      logInfo(`shapePointXOf(screenWidth=81): actual=${actual}`);
      expect(actual).assertClose(100.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0006
     * @tc.name      TsDrawingSample_ShapePointXOf_0006
     * @tc.desc      shapePointXOf(screenWidth=160) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0006 begin`);
      const actual: number = shapePointXOf(160);
      logInfo(`shapePointXOf(screenWidth=160): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ShapePointXOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0007
     * @tc.name      TsDrawingSample_ShapePointXOf_0007
     * @tc.desc      shapePointXOf(screenWidth=40) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0007 begin`);
      const actual: number = shapePointXOf(40);
      logInfo(`shapePointXOf(screenWidth=40): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}ShapePointXOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0008
     * @tc.name      TsDrawingSample_ShapePointXOf_0008
     * @tc.desc      shapePointXOf(screenWidth=100) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0008 begin`);
      const actual: number = shapePointXOf(100);
      logInfo(`shapePointXOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}ShapePointXOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0009
     * @tc.name      TsDrawingSample_ShapePointXOf_0009
     * @tc.desc      shapePointXOf(screenWidth=360) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0009 begin`);
      const actual: number = shapePointXOf(360);
      logInfo(`shapePointXOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}ShapePointXOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0010
     * @tc.name      TsDrawingSample_ShapePointXOf_0010
     * @tc.desc      shapePointXOf(screenWidth=720) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0010 begin`);
      const actual: number = shapePointXOf(720);
      logInfo(`shapePointXOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}ShapePointXOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0011
     * @tc.name      TsDrawingSample_ShapePointXOf_0011
     * @tc.desc      shapePointXOf(screenWidth=1080) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0011 begin`);
      const actual: number = shapePointXOf(1080);
      logInfo(`shapePointXOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}ShapePointXOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0012
     * @tc.name      TsDrawingSample_ShapePointXOf_0012
     * @tc.desc      shapePointXOf(screenWidth=1920) returns 560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0012 begin`);
      const actual: number = shapePointXOf(1920);
      logInfo(`shapePointXOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(560);
      logInfo(`${BUNDLE}ShapePointXOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0013
     * @tc.name      TsDrawingSample_ShapePointXOf_0013
     * @tc.desc      shapePointXOf(screenWidth=-1) returns 79.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePointXOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0013 begin`);
      const actual: number = shapePointXOf(-1);
      logInfo(`shapePointXOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(79.75, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0014
     * @tc.name      TsDrawingSample_ShapePointXOf_0014
     * @tc.desc      shapePointXOf(screenWidth=2) returns 80.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0014 begin`);
      const actual: number = shapePointXOf(2);
      logInfo(`shapePointXOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(80.5, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0015
     * @tc.name      TsDrawingSample_ShapePointXOf_0015
     * @tc.desc      shapePointXOf(screenWidth=3) returns 80.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0015 begin`);
      const actual: number = shapePointXOf(3);
      logInfo(`shapePointXOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(80.75, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0016
     * @tc.name      TsDrawingSample_ShapePointXOf_0016
     * @tc.desc      shapePointXOf(screenWidth=10) returns 82.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0016 begin`);
      const actual: number = shapePointXOf(10);
      logInfo(`shapePointXOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(82.5, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0017
     * @tc.name      TsDrawingSample_ShapePointXOf_0017
     * @tc.desc      shapePointXOf(screenWidth=96) returns 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0017 begin`);
      const actual: number = shapePointXOf(96);
      logInfo(`shapePointXOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(104);
      logInfo(`${BUNDLE}ShapePointXOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0018
     * @tc.name      TsDrawingSample_ShapePointXOf_0018
     * @tc.desc      shapePointXOf(screenWidth=192) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0018 begin`);
      const actual: number = shapePointXOf(192);
      logInfo(`shapePointXOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}ShapePointXOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0019
     * @tc.name      TsDrawingSample_ShapePointXOf_0019
     * @tc.desc      shapePointXOf(screenWidth=288) returns 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0019 begin`);
      const actual: number = shapePointXOf(288);
      logInfo(`shapePointXOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(152);
      logInfo(`${BUNDLE}ShapePointXOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0020
     * @tc.name      TsDrawingSample_ShapePointXOf_0020
     * @tc.desc      shapePointXOf(screenWidth=384) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0020 begin`);
      const actual: number = shapePointXOf(384);
      logInfo(`shapePointXOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}ShapePointXOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0021
     * @tc.name      TsDrawingSample_ShapePointXOf_0021
     * @tc.desc      shapePointXOf(screenWidth=480) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0021 begin`);
      const actual: number = shapePointXOf(480);
      logInfo(`shapePointXOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}ShapePointXOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0022
     * @tc.name      TsDrawingSample_ShapePointXOf_0022
     * @tc.desc      shapePointXOf(screenWidth=576) returns 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0022 begin`);
      const actual: number = shapePointXOf(576);
      logInfo(`shapePointXOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(224);
      logInfo(`${BUNDLE}ShapePointXOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0023
     * @tc.name      TsDrawingSample_ShapePointXOf_0023
     * @tc.desc      shapePointXOf(screenWidth=672) returns 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0023 begin`);
      const actual: number = shapePointXOf(672);
      logInfo(`shapePointXOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(248);
      logInfo(`${BUNDLE}ShapePointXOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0024
     * @tc.name      TsDrawingSample_ShapePointXOf_0024
     * @tc.desc      shapePointXOf(screenWidth=768) returns 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0024 begin`);
      const actual: number = shapePointXOf(768);
      logInfo(`shapePointXOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(272);
      logInfo(`${BUNDLE}ShapePointXOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0025
     * @tc.name      TsDrawingSample_ShapePointXOf_0025
     * @tc.desc      shapePointXOf(screenWidth=864) returns 296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0025 begin`);
      const actual: number = shapePointXOf(864);
      logInfo(`shapePointXOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(296);
      logInfo(`${BUNDLE}ShapePointXOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0026
     * @tc.name      TsDrawingSample_ShapePointXOf_0026
     * @tc.desc      shapePointXOf(screenWidth=960) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0026 begin`);
      const actual: number = shapePointXOf(960);
      logInfo(`shapePointXOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}ShapePointXOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0027
     * @tc.name      TsDrawingSample_ShapePointXOf_0027
     * @tc.desc      shapePointXOf(screenWidth=1056) returns 344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0027 begin`);
      const actual: number = shapePointXOf(1056);
      logInfo(`shapePointXOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(344);
      logInfo(`${BUNDLE}ShapePointXOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0028
     * @tc.name      TsDrawingSample_ShapePointXOf_0028
     * @tc.desc      shapePointXOf(screenWidth=1152) returns 368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0028 begin`);
      const actual: number = shapePointXOf(1152);
      logInfo(`shapePointXOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(368);
      logInfo(`${BUNDLE}ShapePointXOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0029
     * @tc.name      TsDrawingSample_ShapePointXOf_0029
     * @tc.desc      shapePointXOf(screenWidth=1248) returns 392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0029 begin`);
      const actual: number = shapePointXOf(1248);
      logInfo(`shapePointXOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(392);
      logInfo(`${BUNDLE}ShapePointXOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0030
     * @tc.name      TsDrawingSample_ShapePointXOf_0030
     * @tc.desc      shapePointXOf(screenWidth=1344) returns 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0030 begin`);
      const actual: number = shapePointXOf(1344);
      logInfo(`shapePointXOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(416);
      logInfo(`${BUNDLE}ShapePointXOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0031
     * @tc.name      TsDrawingSample_ShapePointXOf_0031
     * @tc.desc      shapePointXOf(screenWidth=1440) returns 440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0031 begin`);
      const actual: number = shapePointXOf(1440);
      logInfo(`shapePointXOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(440);
      logInfo(`${BUNDLE}ShapePointXOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0032
     * @tc.name      TsDrawingSample_ShapePointXOf_0032
     * @tc.desc      shapePointXOf(screenWidth=1536) returns 464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0032 begin`);
      const actual: number = shapePointXOf(1536);
      logInfo(`shapePointXOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(464);
      logInfo(`${BUNDLE}ShapePointXOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0033
     * @tc.name      TsDrawingSample_ShapePointXOf_0033
     * @tc.desc      shapePointXOf(screenWidth=1632) returns 488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0033 begin`);
      const actual: number = shapePointXOf(1632);
      logInfo(`shapePointXOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(488);
      logInfo(`${BUNDLE}ShapePointXOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0034
     * @tc.name      TsDrawingSample_ShapePointXOf_0034
     * @tc.desc      shapePointXOf(screenWidth=1728) returns 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0034 begin`);
      const actual: number = shapePointXOf(1728);
      logInfo(`shapePointXOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(512);
      logInfo(`${BUNDLE}ShapePointXOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0035
     * @tc.name      TsDrawingSample_ShapePointXOf_0035
     * @tc.desc      shapePointXOf(screenWidth=1824) returns 536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0035 begin`);
      const actual: number = shapePointXOf(1824);
      logInfo(`shapePointXOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(536);
      logInfo(`${BUNDLE}ShapePointXOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0036
     * @tc.name      TsDrawingSample_ShapePointXOf_0036
     * @tc.desc      shapePointXOf(screenWidth=2016) returns 584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0036 begin`);
      const actual: number = shapePointXOf(2016);
      logInfo(`shapePointXOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(584);
      logInfo(`${BUNDLE}ShapePointXOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0037
     * @tc.name      TsDrawingSample_ShapePointXOf_0037
     * @tc.desc      shapePointXOf(screenWidth=2112) returns 608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0037 begin`);
      const actual: number = shapePointXOf(2112);
      logInfo(`shapePointXOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(608);
      logInfo(`${BUNDLE}ShapePointXOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0038
     * @tc.name      TsDrawingSample_ShapePointXOf_0038
     * @tc.desc      shapePointXOf(screenWidth=2208) returns 632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0038 begin`);
      const actual: number = shapePointXOf(2208);
      logInfo(`shapePointXOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(632);
      logInfo(`${BUNDLE}ShapePointXOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0039
     * @tc.name      TsDrawingSample_ShapePointXOf_0039
     * @tc.desc      shapePointXOf(screenWidth=2304) returns 656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0039 begin`);
      const actual: number = shapePointXOf(2304);
      logInfo(`shapePointXOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(656);
      logInfo(`${BUNDLE}ShapePointXOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0040
     * @tc.name      TsDrawingSample_ShapePointXOf_0040
     * @tc.desc      shapePointXOf(screenWidth=2400) returns 680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0040 begin`);
      const actual: number = shapePointXOf(2400);
      logInfo(`shapePointXOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(680);
      logInfo(`${BUNDLE}ShapePointXOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0041
     * @tc.name      TsDrawingSample_ShapePointXOf_0041
     * @tc.desc      shapePointXOf(screenWidth=2496) returns 704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0041 begin`);
      const actual: number = shapePointXOf(2496);
      logInfo(`shapePointXOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(704);
      logInfo(`${BUNDLE}ShapePointXOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0042
     * @tc.name      TsDrawingSample_ShapePointXOf_0042
     * @tc.desc      shapePointXOf(screenWidth=2592) returns 728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0042 begin`);
      const actual: number = shapePointXOf(2592);
      logInfo(`shapePointXOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(728);
      logInfo(`${BUNDLE}ShapePointXOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0043
     * @tc.name      TsDrawingSample_ShapePointXOf_0043
     * @tc.desc      shapePointXOf(screenWidth=2688) returns 752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0043 begin`);
      const actual: number = shapePointXOf(2688);
      logInfo(`shapePointXOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(752);
      logInfo(`${BUNDLE}ShapePointXOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0044
     * @tc.name      TsDrawingSample_ShapePointXOf_0044
     * @tc.desc      shapePointXOf(screenWidth=2784) returns 776
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0044 begin`);
      const actual: number = shapePointXOf(2784);
      logInfo(`shapePointXOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(776);
      logInfo(`${BUNDLE}ShapePointXOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0045
     * @tc.name      TsDrawingSample_ShapePointXOf_0045
     * @tc.desc      shapePointXOf(screenWidth=2880) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0045 begin`);
      const actual: number = shapePointXOf(2880);
      logInfo(`shapePointXOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}ShapePointXOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0046
     * @tc.name      TsDrawingSample_ShapePointXOf_0046
     * @tc.desc      shapePointXOf(screenWidth=2976) returns 824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0046 begin`);
      const actual: number = shapePointXOf(2976);
      logInfo(`shapePointXOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(824);
      logInfo(`${BUNDLE}ShapePointXOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0047
     * @tc.name      TsDrawingSample_ShapePointXOf_0047
     * @tc.desc      shapePointXOf(screenWidth=3072) returns 848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0047 begin`);
      const actual: number = shapePointXOf(3072);
      logInfo(`shapePointXOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(848);
      logInfo(`${BUNDLE}ShapePointXOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0048
     * @tc.name      TsDrawingSample_ShapePointXOf_0048
     * @tc.desc      shapePointXOf(screenWidth=3168) returns 872
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0048 begin`);
      const actual: number = shapePointXOf(3168);
      logInfo(`shapePointXOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(872);
      logInfo(`${BUNDLE}ShapePointXOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0049
     * @tc.name      TsDrawingSample_ShapePointXOf_0049
     * @tc.desc      shapePointXOf(screenWidth=3264) returns 896
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0049 begin`);
      const actual: number = shapePointXOf(3264);
      logInfo(`shapePointXOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(896);
      logInfo(`${BUNDLE}ShapePointXOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0050
     * @tc.name      TsDrawingSample_ShapePointXOf_0050
     * @tc.desc      shapePointXOf(screenWidth=3360) returns 920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0050 begin`);
      const actual: number = shapePointXOf(3360);
      logInfo(`shapePointXOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(920);
      logInfo(`${BUNDLE}ShapePointXOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0051
     * @tc.name      TsDrawingSample_ShapePointXOf_0051
     * @tc.desc      shapePointXOf(screenWidth=3456) returns 944
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0051 begin`);
      const actual: number = shapePointXOf(3456);
      logInfo(`shapePointXOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(944);
      logInfo(`${BUNDLE}ShapePointXOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0052
     * @tc.name      TsDrawingSample_ShapePointXOf_0052
     * @tc.desc      shapePointXOf(screenWidth=3552) returns 968
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0052 begin`);
      const actual: number = shapePointXOf(3552);
      logInfo(`shapePointXOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(968);
      logInfo(`${BUNDLE}ShapePointXOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0053
     * @tc.name      TsDrawingSample_ShapePointXOf_0053
     * @tc.desc      shapePointXOf(screenWidth=3648) returns 992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0053 begin`);
      const actual: number = shapePointXOf(3648);
      logInfo(`shapePointXOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(992);
      logInfo(`${BUNDLE}ShapePointXOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0054
     * @tc.name      TsDrawingSample_ShapePointXOf_0054
     * @tc.desc      shapePointXOf(screenWidth=3744) returns 1016
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0054 begin`);
      const actual: number = shapePointXOf(3744);
      logInfo(`shapePointXOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(1016);
      logInfo(`${BUNDLE}ShapePointXOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0055
     * @tc.name      TsDrawingSample_ShapePointXOf_0055
     * @tc.desc      shapePointXOf(screenWidth=3840) returns 1040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0055 begin`);
      const actual: number = shapePointXOf(3840);
      logInfo(`shapePointXOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(1040);
      logInfo(`${BUNDLE}ShapePointXOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0056
     * @tc.name      TsDrawingSample_ShapePointXOf_0056
     * @tc.desc      shapePointXOf(screenWidth=487.83) returns 201.95749999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0056 begin`);
      const actual: number = shapePointXOf(487.83);
      logInfo(`shapePointXOf(screenWidth=487.83): actual=${actual}`);
      expect(actual).assertClose(201.95749999999998, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0057
     * @tc.name      TsDrawingSample_ShapePointXOf_0057
     * @tc.desc      shapePointXOf(screenWidth=1269.37) returns 397.3425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0057 begin`);
      const actual: number = shapePointXOf(1269.37);
      logInfo(`shapePointXOf(screenWidth=1269.37): actual=${actual}`);
      expect(actual).assertClose(397.3425, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0058
     * @tc.name      TsDrawingSample_ShapePointXOf_0058
     * @tc.desc      shapePointXOf(screenWidth=2821) returns 785.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0058 begin`);
      const actual: number = shapePointXOf(2821);
      logInfo(`shapePointXOf(screenWidth=2821): actual=${actual}`);
      expect(actual).assertClose(785.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0059
     * @tc.name      TsDrawingSample_ShapePointXOf_0059
     * @tc.desc      shapePointXOf(screenWidth=-1057) returns -184.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePointXOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0059 begin`);
      const actual: number = shapePointXOf(-1057);
      logInfo(`shapePointXOf(screenWidth=-1057): actual=${actual}`);
      expect(actual).assertClose(-184.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0060
     * @tc.name      TsDrawingSample_ShapePointXOf_0060
     * @tc.desc      shapePointXOf(screenWidth=3661) returns 995.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0060 begin`);
      const actual: number = shapePointXOf(3661);
      logInfo(`shapePointXOf(screenWidth=3661): actual=${actual}`);
      expect(actual).assertClose(995.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0061
     * @tc.name      TsDrawingSample_ShapePointXOf_0061
     * @tc.desc      shapePointXOf(screenWidth=1621) returns 485.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0061 begin`);
      const actual: number = shapePointXOf(1621);
      logInfo(`shapePointXOf(screenWidth=1621): actual=${actual}`);
      expect(actual).assertClose(485.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0062
     * @tc.name      TsDrawingSample_ShapePointXOf_0062
     * @tc.desc      shapePointXOf(screenWidth=268) returns 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0062 begin`);
      const actual: number = shapePointXOf(268);
      logInfo(`shapePointXOf(screenWidth=268): actual=${actual}`);
      expect(actual).assertEqual(147);
      logInfo(`${BUNDLE}ShapePointXOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0063
     * @tc.name      TsDrawingSample_ShapePointXOf_0063
     * @tc.desc      shapePointXOf(screenWidth=1977) returns 574.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0063 begin`);
      const actual: number = shapePointXOf(1977);
      logInfo(`shapePointXOf(screenWidth=1977): actual=${actual}`);
      expect(actual).assertClose(574.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0064
     * @tc.name      TsDrawingSample_ShapePointXOf_0064
     * @tc.desc      shapePointXOf(screenWidth=-1002) returns -170.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePointXOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0064 begin`);
      const actual: number = shapePointXOf(-1002);
      logInfo(`shapePointXOf(screenWidth=-1002): actual=${actual}`);
      expect(actual).assertClose(-170.5, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0065
     * @tc.name      TsDrawingSample_ShapePointXOf_0065
     * @tc.desc      shapePointXOf(screenWidth=1072.51) returns 348.1275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0065 begin`);
      const actual: number = shapePointXOf(1072.51);
      logInfo(`shapePointXOf(screenWidth=1072.51): actual=${actual}`);
      expect(actual).assertClose(348.1275, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0066
     * @tc.name      TsDrawingSample_ShapePointXOf_0066
     * @tc.desc      shapePointXOf(screenWidth=-174) returns 36.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePointXOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0066 begin`);
      const actual: number = shapePointXOf(-174);
      logInfo(`shapePointXOf(screenWidth=-174): actual=${actual}`);
      expect(actual).assertClose(36.5, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0067
     * @tc.name      TsDrawingSample_ShapePointXOf_0067
     * @tc.desc      shapePointXOf(screenWidth=2011) returns 582.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0067 begin`);
      const actual: number = shapePointXOf(2011);
      logInfo(`shapePointXOf(screenWidth=2011): actual=${actual}`);
      expect(actual).assertClose(582.75, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0068
     * @tc.name      TsDrawingSample_ShapePointXOf_0068
     * @tc.desc      shapePointXOf(screenWidth=-165) returns 38.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePointXOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0068 begin`);
      const actual: number = shapePointXOf(-165);
      logInfo(`shapePointXOf(screenWidth=-165): actual=${actual}`);
      expect(actual).assertClose(38.75, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0069
     * @tc.name      TsDrawingSample_ShapePointXOf_0069
     * @tc.desc      shapePointXOf(screenWidth=2061) returns 595.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0069 begin`);
      const actual: number = shapePointXOf(2061);
      logInfo(`shapePointXOf(screenWidth=2061): actual=${actual}`);
      expect(actual).assertClose(595.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0070
     * @tc.name      TsDrawingSample_ShapePointXOf_0070
     * @tc.desc      shapePointXOf(screenWidth=1532.04) returns 463.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0070 begin`);
      const actual: number = shapePointXOf(1532.04);
      logInfo(`shapePointXOf(screenWidth=1532.04): actual=${actual}`);
      expect(actual).assertClose(463.01, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0071
     * @tc.name      TsDrawingSample_ShapePointXOf_0071
     * @tc.desc      shapePointXOf(screenWidth=-1290) returns -242.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePointXOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0071 begin`);
      const actual: number = shapePointXOf(-1290);
      logInfo(`shapePointXOf(screenWidth=-1290): actual=${actual}`);
      expect(actual).assertClose(-242.5, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0072
     * @tc.name      TsDrawingSample_ShapePointXOf_0072
     * @tc.desc      shapePointXOf(screenWidth=986.94) returns 326.735
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0072 begin`);
      const actual: number = shapePointXOf(986.94);
      logInfo(`shapePointXOf(screenWidth=986.94): actual=${actual}`);
      expect(actual).assertClose(326.735, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0073
     * @tc.name      TsDrawingSample_ShapePointXOf_0073
     * @tc.desc      shapePointXOf(screenWidth=477) returns 199.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0073 begin`);
      const actual: number = shapePointXOf(477);
      logInfo(`shapePointXOf(screenWidth=477): actual=${actual}`);
      expect(actual).assertClose(199.25, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_POINT_XOF_0074
     * @tc.name      TsDrawingSample_ShapePointXOf_0074
     * @tc.desc      shapePointXOf(screenWidth=1013.35) returns 333.3375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePointXOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePointXOf_0074 begin`);
      const actual: number = shapePointXOf(1013.35);
      logInfo(`shapePointXOf(screenWidth=1013.35): actual=${actual}`);
      expect(actual).assertClose(333.3375, PRECISION);
      logInfo(`${BUNDLE}ShapePointXOf_0074 end`);
    });
  });
}
