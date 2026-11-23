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
import { shapeLineLengthOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for shapeLineLengthOf (74 cases). */
export default function shapeLineLengthOfTest(): void {
  describe('ShapeLineLengthOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0001
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0001
     * @tc.desc      shapeLineLengthOf(screenWidth=0) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapeLineLengthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0001 begin`);
      const actual: number = shapeLineLengthOf(0);
      logInfo(`shapeLineLengthOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0002
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0002
     * @tc.desc      shapeLineLengthOf(screenWidth=1) returns -39.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapeLineLengthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0002 begin`);
      const actual: number = shapeLineLengthOf(1);
      logInfo(`shapeLineLengthOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0003
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0003
     * @tc.desc      shapeLineLengthOf(screenWidth=3) returns -39.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeLineLengthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0003 begin`);
      const actual: number = shapeLineLengthOf(3);
      logInfo(`shapeLineLengthOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(-39.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0004
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0004
     * @tc.desc      shapeLineLengthOf(screenWidth=2) returns -39.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeLineLengthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0004 begin`);
      const actual: number = shapeLineLengthOf(2);
      logInfo(`shapeLineLengthOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(-39.5, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0005
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0005
     * @tc.desc      shapeLineLengthOf(screenWidth=4) returns -39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeLineLengthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0005 begin`);
      const actual: number = shapeLineLengthOf(4);
      logInfo(`shapeLineLengthOf(screenWidth=4): actual=${actual}`);
      expect(actual).assertEqual(-39);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0006
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0006
     * @tc.desc      shapeLineLengthOf(screenWidth=20) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeLineLengthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0006 begin`);
      const actual: number = shapeLineLengthOf(20);
      logInfo(`shapeLineLengthOf(screenWidth=20): actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0007
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0007
     * @tc.desc      shapeLineLengthOf(screenWidth=19) returns -35.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeLineLengthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0007 begin`);
      const actual: number = shapeLineLengthOf(19);
      logInfo(`shapeLineLengthOf(screenWidth=19): actual=${actual}`);
      expect(actual).assertClose(-35.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0008
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0008
     * @tc.desc      shapeLineLengthOf(screenWidth=21) returns -34.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapeLineLengthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0008 begin`);
      const actual: number = shapeLineLengthOf(21);
      logInfo(`shapeLineLengthOf(screenWidth=21): actual=${actual}`);
      expect(actual).assertClose(-34.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0009
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0009
     * @tc.desc      shapeLineLengthOf(screenWidth=40) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0009 begin`);
      const actual: number = shapeLineLengthOf(40);
      logInfo(`shapeLineLengthOf(screenWidth=40): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0010
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0010
     * @tc.desc      shapeLineLengthOf(screenWidth=10) returns -37.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0010 begin`);
      const actual: number = shapeLineLengthOf(10);
      logInfo(`shapeLineLengthOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(-37.5, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0011
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0011
     * @tc.desc      shapeLineLengthOf(screenWidth=100) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0011 begin`);
      const actual: number = shapeLineLengthOf(100);
      logInfo(`shapeLineLengthOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0012
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0012
     * @tc.desc      shapeLineLengthOf(screenWidth=360) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0012 begin`);
      const actual: number = shapeLineLengthOf(360);
      logInfo(`shapeLineLengthOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0013
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0013
     * @tc.desc      shapeLineLengthOf(screenWidth=720) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0013 begin`);
      const actual: number = shapeLineLengthOf(720);
      logInfo(`shapeLineLengthOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0014
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0014
     * @tc.desc      shapeLineLengthOf(screenWidth=1080) returns 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0014 begin`);
      const actual: number = shapeLineLengthOf(1080);
      logInfo(`shapeLineLengthOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(230);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0015
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0015
     * @tc.desc      shapeLineLengthOf(screenWidth=1920) returns 440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0015 begin`);
      const actual: number = shapeLineLengthOf(1920);
      logInfo(`shapeLineLengthOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(440);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0016
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0016
     * @tc.desc      shapeLineLengthOf(screenWidth=-1) returns -40.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0016 begin`);
      const actual: number = shapeLineLengthOf(-1);
      logInfo(`shapeLineLengthOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-40.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0017
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0017
     * @tc.desc      shapeLineLengthOf(screenWidth=96) returns -16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0017 begin`);
      const actual: number = shapeLineLengthOf(96);
      logInfo(`shapeLineLengthOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(-16);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0018
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0018
     * @tc.desc      shapeLineLengthOf(screenWidth=192) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0018 begin`);
      const actual: number = shapeLineLengthOf(192);
      logInfo(`shapeLineLengthOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0019
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0019
     * @tc.desc      shapeLineLengthOf(screenWidth=288) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0019 begin`);
      const actual: number = shapeLineLengthOf(288);
      logInfo(`shapeLineLengthOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0020
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0020
     * @tc.desc      shapeLineLengthOf(screenWidth=384) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0020 begin`);
      const actual: number = shapeLineLengthOf(384);
      logInfo(`shapeLineLengthOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0021
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0021
     * @tc.desc      shapeLineLengthOf(screenWidth=480) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0021 begin`);
      const actual: number = shapeLineLengthOf(480);
      logInfo(`shapeLineLengthOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0022
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0022
     * @tc.desc      shapeLineLengthOf(screenWidth=576) returns 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0022 begin`);
      const actual: number = shapeLineLengthOf(576);
      logInfo(`shapeLineLengthOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(104);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0023
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0023
     * @tc.desc      shapeLineLengthOf(screenWidth=672) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0023 begin`);
      const actual: number = shapeLineLengthOf(672);
      logInfo(`shapeLineLengthOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0024
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0024
     * @tc.desc      shapeLineLengthOf(screenWidth=768) returns 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0024 begin`);
      const actual: number = shapeLineLengthOf(768);
      logInfo(`shapeLineLengthOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(152);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0025
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0025
     * @tc.desc      shapeLineLengthOf(screenWidth=864) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0025 begin`);
      const actual: number = shapeLineLengthOf(864);
      logInfo(`shapeLineLengthOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0026
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0026
     * @tc.desc      shapeLineLengthOf(screenWidth=960) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0026 begin`);
      const actual: number = shapeLineLengthOf(960);
      logInfo(`shapeLineLengthOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0027
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0027
     * @tc.desc      shapeLineLengthOf(screenWidth=1056) returns 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0027 begin`);
      const actual: number = shapeLineLengthOf(1056);
      logInfo(`shapeLineLengthOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(224);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0028
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0028
     * @tc.desc      shapeLineLengthOf(screenWidth=1152) returns 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0028 begin`);
      const actual: number = shapeLineLengthOf(1152);
      logInfo(`shapeLineLengthOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(248);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0029
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0029
     * @tc.desc      shapeLineLengthOf(screenWidth=1248) returns 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0029 begin`);
      const actual: number = shapeLineLengthOf(1248);
      logInfo(`shapeLineLengthOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(272);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0030
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0030
     * @tc.desc      shapeLineLengthOf(screenWidth=1344) returns 296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0030 begin`);
      const actual: number = shapeLineLengthOf(1344);
      logInfo(`shapeLineLengthOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(296);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0031
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0031
     * @tc.desc      shapeLineLengthOf(screenWidth=1440) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0031 begin`);
      const actual: number = shapeLineLengthOf(1440);
      logInfo(`shapeLineLengthOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0032
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0032
     * @tc.desc      shapeLineLengthOf(screenWidth=1536) returns 344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0032 begin`);
      const actual: number = shapeLineLengthOf(1536);
      logInfo(`shapeLineLengthOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(344);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0033
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0033
     * @tc.desc      shapeLineLengthOf(screenWidth=1632) returns 368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0033 begin`);
      const actual: number = shapeLineLengthOf(1632);
      logInfo(`shapeLineLengthOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(368);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0034
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0034
     * @tc.desc      shapeLineLengthOf(screenWidth=1728) returns 392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0034 begin`);
      const actual: number = shapeLineLengthOf(1728);
      logInfo(`shapeLineLengthOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(392);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0035
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0035
     * @tc.desc      shapeLineLengthOf(screenWidth=1824) returns 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0035 begin`);
      const actual: number = shapeLineLengthOf(1824);
      logInfo(`shapeLineLengthOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(416);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0036
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0036
     * @tc.desc      shapeLineLengthOf(screenWidth=2016) returns 464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0036 begin`);
      const actual: number = shapeLineLengthOf(2016);
      logInfo(`shapeLineLengthOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(464);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0037
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0037
     * @tc.desc      shapeLineLengthOf(screenWidth=2112) returns 488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0037 begin`);
      const actual: number = shapeLineLengthOf(2112);
      logInfo(`shapeLineLengthOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(488);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0038
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0038
     * @tc.desc      shapeLineLengthOf(screenWidth=2208) returns 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0038 begin`);
      const actual: number = shapeLineLengthOf(2208);
      logInfo(`shapeLineLengthOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(512);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0039
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0039
     * @tc.desc      shapeLineLengthOf(screenWidth=2304) returns 536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0039 begin`);
      const actual: number = shapeLineLengthOf(2304);
      logInfo(`shapeLineLengthOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(536);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0040
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0040
     * @tc.desc      shapeLineLengthOf(screenWidth=2400) returns 560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0040 begin`);
      const actual: number = shapeLineLengthOf(2400);
      logInfo(`shapeLineLengthOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(560);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0041
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0041
     * @tc.desc      shapeLineLengthOf(screenWidth=2496) returns 584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0041 begin`);
      const actual: number = shapeLineLengthOf(2496);
      logInfo(`shapeLineLengthOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(584);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0042
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0042
     * @tc.desc      shapeLineLengthOf(screenWidth=2592) returns 608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0042 begin`);
      const actual: number = shapeLineLengthOf(2592);
      logInfo(`shapeLineLengthOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(608);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0043
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0043
     * @tc.desc      shapeLineLengthOf(screenWidth=2688) returns 632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0043 begin`);
      const actual: number = shapeLineLengthOf(2688);
      logInfo(`shapeLineLengthOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(632);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0044
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0044
     * @tc.desc      shapeLineLengthOf(screenWidth=2784) returns 656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0044 begin`);
      const actual: number = shapeLineLengthOf(2784);
      logInfo(`shapeLineLengthOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(656);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0045
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0045
     * @tc.desc      shapeLineLengthOf(screenWidth=2880) returns 680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0045 begin`);
      const actual: number = shapeLineLengthOf(2880);
      logInfo(`shapeLineLengthOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(680);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0046
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0046
     * @tc.desc      shapeLineLengthOf(screenWidth=2976) returns 704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0046 begin`);
      const actual: number = shapeLineLengthOf(2976);
      logInfo(`shapeLineLengthOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(704);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0047
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0047
     * @tc.desc      shapeLineLengthOf(screenWidth=3072) returns 728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0047 begin`);
      const actual: number = shapeLineLengthOf(3072);
      logInfo(`shapeLineLengthOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(728);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0048
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0048
     * @tc.desc      shapeLineLengthOf(screenWidth=3168) returns 752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0048 begin`);
      const actual: number = shapeLineLengthOf(3168);
      logInfo(`shapeLineLengthOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(752);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0049
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0049
     * @tc.desc      shapeLineLengthOf(screenWidth=3264) returns 776
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0049 begin`);
      const actual: number = shapeLineLengthOf(3264);
      logInfo(`shapeLineLengthOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(776);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0050
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0050
     * @tc.desc      shapeLineLengthOf(screenWidth=3360) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0050 begin`);
      const actual: number = shapeLineLengthOf(3360);
      logInfo(`shapeLineLengthOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0051
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0051
     * @tc.desc      shapeLineLengthOf(screenWidth=3456) returns 824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0051 begin`);
      const actual: number = shapeLineLengthOf(3456);
      logInfo(`shapeLineLengthOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(824);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0052
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0052
     * @tc.desc      shapeLineLengthOf(screenWidth=3552) returns 848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0052 begin`);
      const actual: number = shapeLineLengthOf(3552);
      logInfo(`shapeLineLengthOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(848);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0053
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0053
     * @tc.desc      shapeLineLengthOf(screenWidth=3648) returns 872
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0053 begin`);
      const actual: number = shapeLineLengthOf(3648);
      logInfo(`shapeLineLengthOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(872);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0054
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0054
     * @tc.desc      shapeLineLengthOf(screenWidth=3744) returns 896
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0054 begin`);
      const actual: number = shapeLineLengthOf(3744);
      logInfo(`shapeLineLengthOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(896);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0055
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0055
     * @tc.desc      shapeLineLengthOf(screenWidth=3840) returns 920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0055 begin`);
      const actual: number = shapeLineLengthOf(3840);
      logInfo(`shapeLineLengthOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(920);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0056
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0056
     * @tc.desc      shapeLineLengthOf(screenWidth=1767.73) returns 401.9325000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0056 begin`);
      const actual: number = shapeLineLengthOf(1767.73);
      logInfo(`shapeLineLengthOf(screenWidth=1767.73): actual=${actual}`);
      expect(actual).assertClose(401.9325000000001, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0057
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0057
     * @tc.desc      shapeLineLengthOf(screenWidth=62) returns -24.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0057 begin`);
      const actual: number = shapeLineLengthOf(62);
      logInfo(`shapeLineLengthOf(screenWidth=62): actual=${actual}`);
      expect(actual).assertClose(-24.5, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0058
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0058
     * @tc.desc      shapeLineLengthOf(screenWidth=-631) returns -197.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0058 begin`);
      const actual: number = shapeLineLengthOf(-631);
      logInfo(`shapeLineLengthOf(screenWidth=-631): actual=${actual}`);
      expect(actual).assertClose(-197.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0059
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0059
     * @tc.desc      shapeLineLengthOf(screenWidth=1481.67) returns 330.4175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0059 begin`);
      const actual: number = shapeLineLengthOf(1481.67);
      logInfo(`shapeLineLengthOf(screenWidth=1481.67): actual=${actual}`);
      expect(actual).assertClose(330.4175, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0060
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0060
     * @tc.desc      shapeLineLengthOf(screenWidth=-1415) returns -393.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0060 begin`);
      const actual: number = shapeLineLengthOf(-1415);
      logInfo(`shapeLineLengthOf(screenWidth=-1415): actual=${actual}`);
      expect(actual).assertClose(-393.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0061
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0061
     * @tc.desc      shapeLineLengthOf(screenWidth=1096) returns 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0061 begin`);
      const actual: number = shapeLineLengthOf(1096);
      logInfo(`shapeLineLengthOf(screenWidth=1096): actual=${actual}`);
      expect(actual).assertEqual(234);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0062
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0062
     * @tc.desc      shapeLineLengthOf(screenWidth=1299.9) returns 284.975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0062 begin`);
      const actual: number = shapeLineLengthOf(1299.9);
      logInfo(`shapeLineLengthOf(screenWidth=1299.9): actual=${actual}`);
      expect(actual).assertClose(284.975, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0063
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0063
     * @tc.desc      shapeLineLengthOf(screenWidth=-1125) returns -321.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0063 begin`);
      const actual: number = shapeLineLengthOf(-1125);
      logInfo(`shapeLineLengthOf(screenWidth=-1125): actual=${actual}`);
      expect(actual).assertClose(-321.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0064
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0064
     * @tc.desc      shapeLineLengthOf(screenWidth=2321) returns 540.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0064 begin`);
      const actual: number = shapeLineLengthOf(2321);
      logInfo(`shapeLineLengthOf(screenWidth=2321): actual=${actual}`);
      expect(actual).assertClose(540.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0065
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0065
     * @tc.desc      shapeLineLengthOf(screenWidth=1260) returns 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0065 begin`);
      const actual: number = shapeLineLengthOf(1260);
      logInfo(`shapeLineLengthOf(screenWidth=1260): actual=${actual}`);
      expect(actual).assertEqual(275);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0066
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0066
     * @tc.desc      shapeLineLengthOf(screenWidth=-1373) returns -383.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0066 begin`);
      const actual: number = shapeLineLengthOf(-1373);
      logInfo(`shapeLineLengthOf(screenWidth=-1373): actual=${actual}`);
      expect(actual).assertClose(-383.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0067
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0067
     * @tc.desc      shapeLineLengthOf(screenWidth=-383) returns -135.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0067 begin`);
      const actual: number = shapeLineLengthOf(-383);
      logInfo(`shapeLineLengthOf(screenWidth=-383): actual=${actual}`);
      expect(actual).assertClose(-135.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0068
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0068
     * @tc.desc      shapeLineLengthOf(screenWidth=-916) returns -269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0068 begin`);
      const actual: number = shapeLineLengthOf(-916);
      logInfo(`shapeLineLengthOf(screenWidth=-916): actual=${actual}`);
      expect(actual).assertEqual(-269);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0069
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0069
     * @tc.desc      shapeLineLengthOf(screenWidth=-1888) returns -512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0069 begin`);
      const actual: number = shapeLineLengthOf(-1888);
      logInfo(`shapeLineLengthOf(screenWidth=-1888): actual=${actual}`);
      expect(actual).assertEqual(-512);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0070
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0070
     * @tc.desc      shapeLineLengthOf(screenWidth=-1465) returns -406.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0070 begin`);
      const actual: number = shapeLineLengthOf(-1465);
      logInfo(`shapeLineLengthOf(screenWidth=-1465): actual=${actual}`);
      expect(actual).assertClose(-406.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0071
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0071
     * @tc.desc      shapeLineLengthOf(screenWidth=-275) returns -108.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0071 begin`);
      const actual: number = shapeLineLengthOf(-275);
      logInfo(`shapeLineLengthOf(screenWidth=-275): actual=${actual}`);
      expect(actual).assertClose(-108.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0072
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0072
     * @tc.desc      shapeLineLengthOf(screenWidth=-235) returns -98.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapeLineLengthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0072 begin`);
      const actual: number = shapeLineLengthOf(-235);
      logInfo(`shapeLineLengthOf(screenWidth=-235): actual=${actual}`);
      expect(actual).assertClose(-98.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0073
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0073
     * @tc.desc      shapeLineLengthOf(screenWidth=2277) returns 529.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0073 begin`);
      const actual: number = shapeLineLengthOf(2277);
      logInfo(`shapeLineLengthOf(screenWidth=2277): actual=${actual}`);
      expect(actual).assertClose(529.25, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_LINE_LENGTH_OF_0074
     * @tc.name      TsDrawingSample_ShapeLineLengthOf_0074
     * @tc.desc      shapeLineLengthOf(screenWidth=1235) returns 268.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapeLineLengthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapeLineLengthOf_0074 begin`);
      const actual: number = shapeLineLengthOf(1235);
      logInfo(`shapeLineLengthOf(screenWidth=1235): actual=${actual}`);
      expect(actual).assertClose(268.75, PRECISION);
      logInfo(`${BUNDLE}ShapeLineLengthOf_0074 end`);
    });
  });
}
