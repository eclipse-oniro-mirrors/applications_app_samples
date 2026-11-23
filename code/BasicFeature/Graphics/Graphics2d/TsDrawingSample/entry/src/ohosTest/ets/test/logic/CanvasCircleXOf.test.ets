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
import { canvasCircleXOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for canvasCircleXOf (74 cases). */
export default function canvasCircleXOfTest(): void {
  describe('CanvasCircleXOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0001
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0001
     * @tc.desc      canvasCircleXOf(screenWidth=0, k=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_CanvasCircleXOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0001 begin`);
      const actual: number = canvasCircleXOf(0, 0);
      logInfo(`canvasCircleXOf(screenWidth=0, k=0): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CanvasCircleXOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0002
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0002
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=1) returns 100.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_CanvasCircleXOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0002 begin`);
      const actual: number = canvasCircleXOf(1, 1);
      logInfo(`canvasCircleXOf(screenWidth=1, k=1): actual=${actual}`);
      expect(actual).assertClose(100.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0003
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0003
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=-1) returns 99.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCircleXOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0003 begin`);
      const actual: number = canvasCircleXOf(1, -1);
      logInfo(`canvasCircleXOf(screenWidth=1, k=-1): actual=${actual}`);
      expect(actual).assertClose(99.875, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0004
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0004
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=2) returns 100.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0004 begin`);
      const actual: number = canvasCircleXOf(1, 2);
      logInfo(`canvasCircleXOf(screenWidth=1, k=2): actual=${actual}`);
      expect(actual).assertClose(100.25, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0005
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0005
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=3) returns 100.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0005 begin`);
      const actual: number = canvasCircleXOf(1, 3);
      logInfo(`canvasCircleXOf(screenWidth=1, k=3): actual=${actual}`);
      expect(actual).assertClose(100.375, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0006
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0006
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=10) returns 101.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0006 begin`);
      const actual: number = canvasCircleXOf(1, 10);
      logInfo(`canvasCircleXOf(screenWidth=1, k=10): actual=${actual}`);
      expect(actual).assertClose(101.25, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0007
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0007
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=100) returns 112.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0007 begin`);
      const actual: number = canvasCircleXOf(1, 100);
      logInfo(`canvasCircleXOf(screenWidth=1, k=100): actual=${actual}`);
      expect(actual).assertClose(112.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0008
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0008
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=5) returns 100.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0008 begin`);
      const actual: number = canvasCircleXOf(1, 5);
      logInfo(`canvasCircleXOf(screenWidth=1, k=5): actual=${actual}`);
      expect(actual).assertClose(100.625, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0009
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0009
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=15) returns 101.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0009 begin`);
      const actual: number = canvasCircleXOf(1, 15);
      logInfo(`canvasCircleXOf(screenWidth=1, k=15): actual=${actual}`);
      expect(actual).assertClose(101.875, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0010
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0010
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=20) returns 102.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0010 begin`);
      const actual: number = canvasCircleXOf(1, 20);
      logInfo(`canvasCircleXOf(screenWidth=1, k=20): actual=${actual}`);
      expect(actual).assertClose(102.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0011
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0011
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=25) returns 103.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0011 begin`);
      const actual: number = canvasCircleXOf(1, 25);
      logInfo(`canvasCircleXOf(screenWidth=1, k=25): actual=${actual}`);
      expect(actual).assertClose(103.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0012
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0012
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=30) returns 103.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0012 begin`);
      const actual: number = canvasCircleXOf(1, 30);
      logInfo(`canvasCircleXOf(screenWidth=1, k=30): actual=${actual}`);
      expect(actual).assertClose(103.75, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0013
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0013
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=35) returns 104.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0013 begin`);
      const actual: number = canvasCircleXOf(1, 35);
      logInfo(`canvasCircleXOf(screenWidth=1, k=35): actual=${actual}`);
      expect(actual).assertClose(104.375, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0014
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0014
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=40) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0014 begin`);
      const actual: number = canvasCircleXOf(1, 40);
      logInfo(`canvasCircleXOf(screenWidth=1, k=40): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}CanvasCircleXOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0015
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0015
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=45) returns 105.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0015 begin`);
      const actual: number = canvasCircleXOf(1, 45);
      logInfo(`canvasCircleXOf(screenWidth=1, k=45): actual=${actual}`);
      expect(actual).assertClose(105.625, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0016
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0016
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=50) returns 106.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0016 begin`);
      const actual: number = canvasCircleXOf(1, 50);
      logInfo(`canvasCircleXOf(screenWidth=1, k=50): actual=${actual}`);
      expect(actual).assertClose(106.25, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0017
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0017
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=55) returns 106.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0017 begin`);
      const actual: number = canvasCircleXOf(1, 55);
      logInfo(`canvasCircleXOf(screenWidth=1, k=55): actual=${actual}`);
      expect(actual).assertClose(106.875, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0018
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0018
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=60) returns 107.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0018 begin`);
      const actual: number = canvasCircleXOf(1, 60);
      logInfo(`canvasCircleXOf(screenWidth=1, k=60): actual=${actual}`);
      expect(actual).assertClose(107.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0019
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0019
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=65) returns 108.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0019 begin`);
      const actual: number = canvasCircleXOf(1, 65);
      logInfo(`canvasCircleXOf(screenWidth=1, k=65): actual=${actual}`);
      expect(actual).assertClose(108.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0020
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0020
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=70) returns 108.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0020 begin`);
      const actual: number = canvasCircleXOf(1, 70);
      logInfo(`canvasCircleXOf(screenWidth=1, k=70): actual=${actual}`);
      expect(actual).assertClose(108.75, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0021
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0021
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=75) returns 109.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0021 begin`);
      const actual: number = canvasCircleXOf(1, 75);
      logInfo(`canvasCircleXOf(screenWidth=1, k=75): actual=${actual}`);
      expect(actual).assertClose(109.375, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0022
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0022
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=80) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0022 begin`);
      const actual: number = canvasCircleXOf(1, 80);
      logInfo(`canvasCircleXOf(screenWidth=1, k=80): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}CanvasCircleXOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0023
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0023
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=85) returns 110.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0023 begin`);
      const actual: number = canvasCircleXOf(1, 85);
      logInfo(`canvasCircleXOf(screenWidth=1, k=85): actual=${actual}`);
      expect(actual).assertClose(110.625, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0024
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0024
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=90) returns 111.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0024 begin`);
      const actual: number = canvasCircleXOf(1, 90);
      logInfo(`canvasCircleXOf(screenWidth=1, k=90): actual=${actual}`);
      expect(actual).assertClose(111.25, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0025
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0025
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=95) returns 111.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0025 begin`);
      const actual: number = canvasCircleXOf(1, 95);
      logInfo(`canvasCircleXOf(screenWidth=1, k=95): actual=${actual}`);
      expect(actual).assertClose(111.875, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0026
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0026
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=105) returns 113.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0026 begin`);
      const actual: number = canvasCircleXOf(1, 105);
      logInfo(`canvasCircleXOf(screenWidth=1, k=105): actual=${actual}`);
      expect(actual).assertClose(113.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0027
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0027
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=110) returns 113.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0027 begin`);
      const actual: number = canvasCircleXOf(1, 110);
      logInfo(`canvasCircleXOf(screenWidth=1, k=110): actual=${actual}`);
      expect(actual).assertClose(113.75, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0028
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0028
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=115) returns 114.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0028 begin`);
      const actual: number = canvasCircleXOf(1, 115);
      logInfo(`canvasCircleXOf(screenWidth=1, k=115): actual=${actual}`);
      expect(actual).assertClose(114.375, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0029
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0029
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=97) returns 112.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0029 begin`);
      const actual: number = canvasCircleXOf(1, 97);
      logInfo(`canvasCircleXOf(screenWidth=1, k=97): actual=${actual}`);
      expect(actual).assertClose(112.125, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0030
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0030
     * @tc.desc      canvasCircleXOf(screenWidth=1, k=168) returns 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0030 begin`);
      const actual: number = canvasCircleXOf(1, 168);
      logInfo(`canvasCircleXOf(screenWidth=1, k=168): actual=${actual}`);
      expect(actual).assertEqual(121);
      logInfo(`${BUNDLE}CanvasCircleXOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0031
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0031
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=-1) returns 87.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCircleXOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0031 begin`);
      const actual: number = canvasCircleXOf(100, -1);
      logInfo(`canvasCircleXOf(screenWidth=100, k=-1): actual=${actual}`);
      expect(actual).assertClose(87.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0032
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0032
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=2) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0032 begin`);
      const actual: number = canvasCircleXOf(100, 2);
      logInfo(`canvasCircleXOf(screenWidth=100, k=2): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}CanvasCircleXOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0033
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0033
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=3) returns 137.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0033 begin`);
      const actual: number = canvasCircleXOf(100, 3);
      logInfo(`canvasCircleXOf(screenWidth=100, k=3): actual=${actual}`);
      expect(actual).assertClose(137.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0034
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0034
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=10) returns 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0034 begin`);
      const actual: number = canvasCircleXOf(100, 10);
      logInfo(`canvasCircleXOf(screenWidth=100, k=10): actual=${actual}`);
      expect(actual).assertEqual(225);
      logInfo(`${BUNDLE}CanvasCircleXOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0035
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0035
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=100) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0035 begin`);
      const actual: number = canvasCircleXOf(100, 100);
      logInfo(`canvasCircleXOf(screenWidth=100, k=100): actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}CanvasCircleXOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0036
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0036
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=5) returns 162.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0036 begin`);
      const actual: number = canvasCircleXOf(100, 5);
      logInfo(`canvasCircleXOf(screenWidth=100, k=5): actual=${actual}`);
      expect(actual).assertClose(162.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0037
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0037
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=15) returns 287.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0037 begin`);
      const actual: number = canvasCircleXOf(100, 15);
      logInfo(`canvasCircleXOf(screenWidth=100, k=15): actual=${actual}`);
      expect(actual).assertClose(287.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0038
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0038
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=20) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0038 begin`);
      const actual: number = canvasCircleXOf(100, 20);
      logInfo(`canvasCircleXOf(screenWidth=100, k=20): actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}CanvasCircleXOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0039
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0039
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=25) returns 412.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0039 begin`);
      const actual: number = canvasCircleXOf(100, 25);
      logInfo(`canvasCircleXOf(screenWidth=100, k=25): actual=${actual}`);
      expect(actual).assertClose(412.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0040
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0040
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=30) returns 475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0040 begin`);
      const actual: number = canvasCircleXOf(100, 30);
      logInfo(`canvasCircleXOf(screenWidth=100, k=30): actual=${actual}`);
      expect(actual).assertEqual(475);
      logInfo(`${BUNDLE}CanvasCircleXOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0041
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0041
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=35) returns 537.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0041 begin`);
      const actual: number = canvasCircleXOf(100, 35);
      logInfo(`canvasCircleXOf(screenWidth=100, k=35): actual=${actual}`);
      expect(actual).assertClose(537.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0042
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0042
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=40) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0042 begin`);
      const actual: number = canvasCircleXOf(100, 40);
      logInfo(`canvasCircleXOf(screenWidth=100, k=40): actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}CanvasCircleXOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0043
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0043
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=45) returns 662.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0043 begin`);
      const actual: number = canvasCircleXOf(100, 45);
      logInfo(`canvasCircleXOf(screenWidth=100, k=45): actual=${actual}`);
      expect(actual).assertClose(662.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0044
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0044
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=50) returns 725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0044 begin`);
      const actual: number = canvasCircleXOf(100, 50);
      logInfo(`canvasCircleXOf(screenWidth=100, k=50): actual=${actual}`);
      expect(actual).assertEqual(725);
      logInfo(`${BUNDLE}CanvasCircleXOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0045
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0045
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=55) returns 787.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0045 begin`);
      const actual: number = canvasCircleXOf(100, 55);
      logInfo(`canvasCircleXOf(screenWidth=100, k=55): actual=${actual}`);
      expect(actual).assertClose(787.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0046
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0046
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=60) returns 850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0046 begin`);
      const actual: number = canvasCircleXOf(100, 60);
      logInfo(`canvasCircleXOf(screenWidth=100, k=60): actual=${actual}`);
      expect(actual).assertEqual(850);
      logInfo(`${BUNDLE}CanvasCircleXOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0047
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0047
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=65) returns 912.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0047 begin`);
      const actual: number = canvasCircleXOf(100, 65);
      logInfo(`canvasCircleXOf(screenWidth=100, k=65): actual=${actual}`);
      expect(actual).assertClose(912.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0048
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0048
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=70) returns 975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0048 begin`);
      const actual: number = canvasCircleXOf(100, 70);
      logInfo(`canvasCircleXOf(screenWidth=100, k=70): actual=${actual}`);
      expect(actual).assertEqual(975);
      logInfo(`${BUNDLE}CanvasCircleXOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0049
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0049
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=75) returns 1037.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0049 begin`);
      const actual: number = canvasCircleXOf(100, 75);
      logInfo(`canvasCircleXOf(screenWidth=100, k=75): actual=${actual}`);
      expect(actual).assertClose(1037.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0050
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0050
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=80) returns 1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0050 begin`);
      const actual: number = canvasCircleXOf(100, 80);
      logInfo(`canvasCircleXOf(screenWidth=100, k=80): actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}CanvasCircleXOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0051
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0051
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=85) returns 1162.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0051 begin`);
      const actual: number = canvasCircleXOf(100, 85);
      logInfo(`canvasCircleXOf(screenWidth=100, k=85): actual=${actual}`);
      expect(actual).assertClose(1162.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0052
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0052
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=90) returns 1225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0052 begin`);
      const actual: number = canvasCircleXOf(100, 90);
      logInfo(`canvasCircleXOf(screenWidth=100, k=90): actual=${actual}`);
      expect(actual).assertEqual(1225);
      logInfo(`${BUNDLE}CanvasCircleXOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0053
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0053
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=95) returns 1287.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0053 begin`);
      const actual: number = canvasCircleXOf(100, 95);
      logInfo(`canvasCircleXOf(screenWidth=100, k=95): actual=${actual}`);
      expect(actual).assertClose(1287.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0054
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0054
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=105) returns 1412.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0054 begin`);
      const actual: number = canvasCircleXOf(100, 105);
      logInfo(`canvasCircleXOf(screenWidth=100, k=105): actual=${actual}`);
      expect(actual).assertClose(1412.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0055
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0055
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=110) returns 1475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0055 begin`);
      const actual: number = canvasCircleXOf(100, 110);
      logInfo(`canvasCircleXOf(screenWidth=100, k=110): actual=${actual}`);
      expect(actual).assertEqual(1475);
      logInfo(`${BUNDLE}CanvasCircleXOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0056
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0056
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=115) returns 1537.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0056 begin`);
      const actual: number = canvasCircleXOf(100, 115);
      logInfo(`canvasCircleXOf(screenWidth=100, k=115): actual=${actual}`);
      expect(actual).assertClose(1537.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0057
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0057
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=97) returns 1312.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0057 begin`);
      const actual: number = canvasCircleXOf(100, 97);
      logInfo(`canvasCircleXOf(screenWidth=100, k=97): actual=${actual}`);
      expect(actual).assertClose(1312.5, PRECISION);
      logInfo(`${BUNDLE}CanvasCircleXOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0058
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0058
     * @tc.desc      canvasCircleXOf(screenWidth=100, k=168) returns 2200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0058 begin`);
      const actual: number = canvasCircleXOf(100, 168);
      logInfo(`canvasCircleXOf(screenWidth=100, k=168): actual=${actual}`);
      expect(actual).assertEqual(2200);
      logInfo(`${BUNDLE}CanvasCircleXOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0059
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0059
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=1) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0059 begin`);
      const actual: number = canvasCircleXOf(360, 1);
      logInfo(`canvasCircleXOf(screenWidth=360, k=1): actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}CanvasCircleXOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0060
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0060
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=-1) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_CanvasCircleXOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0060 begin`);
      const actual: number = canvasCircleXOf(360, -1);
      logInfo(`canvasCircleXOf(screenWidth=360, k=-1): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}CanvasCircleXOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0061
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0061
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=2) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0061 begin`);
      const actual: number = canvasCircleXOf(360, 2);
      logInfo(`canvasCircleXOf(screenWidth=360, k=2): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}CanvasCircleXOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0062
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0062
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=3) returns 235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0062 begin`);
      const actual: number = canvasCircleXOf(360, 3);
      logInfo(`canvasCircleXOf(screenWidth=360, k=3): actual=${actual}`);
      expect(actual).assertEqual(235);
      logInfo(`${BUNDLE}CanvasCircleXOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0063
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0063
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=10) returns 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0063 begin`);
      const actual: number = canvasCircleXOf(360, 10);
      logInfo(`canvasCircleXOf(screenWidth=360, k=10): actual=${actual}`);
      expect(actual).assertEqual(550);
      logInfo(`${BUNDLE}CanvasCircleXOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0064
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0064
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=100) returns 4600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0064 begin`);
      const actual: number = canvasCircleXOf(360, 100);
      logInfo(`canvasCircleXOf(screenWidth=360, k=100): actual=${actual}`);
      expect(actual).assertEqual(4600);
      logInfo(`${BUNDLE}CanvasCircleXOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0065
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0065
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=5) returns 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0065 begin`);
      const actual: number = canvasCircleXOf(360, 5);
      logInfo(`canvasCircleXOf(screenWidth=360, k=5): actual=${actual}`);
      expect(actual).assertEqual(325);
      logInfo(`${BUNDLE}CanvasCircleXOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0066
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0066
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=15) returns 775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0066 begin`);
      const actual: number = canvasCircleXOf(360, 15);
      logInfo(`canvasCircleXOf(screenWidth=360, k=15): actual=${actual}`);
      expect(actual).assertEqual(775);
      logInfo(`${BUNDLE}CanvasCircleXOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0067
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0067
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=20) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0067 begin`);
      const actual: number = canvasCircleXOf(360, 20);
      logInfo(`canvasCircleXOf(screenWidth=360, k=20): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}CanvasCircleXOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0068
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0068
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=30) returns 1450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0068 begin`);
      const actual: number = canvasCircleXOf(360, 30);
      logInfo(`canvasCircleXOf(screenWidth=360, k=30): actual=${actual}`);
      expect(actual).assertEqual(1450);
      logInfo(`${BUNDLE}CanvasCircleXOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0069
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0069
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=35) returns 1675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0069 begin`);
      const actual: number = canvasCircleXOf(360, 35);
      logInfo(`canvasCircleXOf(screenWidth=360, k=35): actual=${actual}`);
      expect(actual).assertEqual(1675);
      logInfo(`${BUNDLE}CanvasCircleXOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0070
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0070
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=40) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0070 begin`);
      const actual: number = canvasCircleXOf(360, 40);
      logInfo(`canvasCircleXOf(screenWidth=360, k=40): actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}CanvasCircleXOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0071
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0071
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=45) returns 2125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0071 begin`);
      const actual: number = canvasCircleXOf(360, 45);
      logInfo(`canvasCircleXOf(screenWidth=360, k=45): actual=${actual}`);
      expect(actual).assertEqual(2125);
      logInfo(`${BUNDLE}CanvasCircleXOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0072
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0072
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=50) returns 2350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0072 begin`);
      const actual: number = canvasCircleXOf(360, 50);
      logInfo(`canvasCircleXOf(screenWidth=360, k=50): actual=${actual}`);
      expect(actual).assertEqual(2350);
      logInfo(`${BUNDLE}CanvasCircleXOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0073
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0073
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=55) returns 2575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0073 begin`);
      const actual: number = canvasCircleXOf(360, 55);
      logInfo(`canvasCircleXOf(screenWidth=360, k=55): actual=${actual}`);
      expect(actual).assertEqual(2575);
      logInfo(`${BUNDLE}CanvasCircleXOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CANVAS_CIRCLE_XOF_0074
     * @tc.name      TsDrawingSample_CanvasCircleXOf_0074
     * @tc.desc      canvasCircleXOf(screenWidth=360, k=60) returns 2800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_CanvasCircleXOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanvasCircleXOf_0074 begin`);
      const actual: number = canvasCircleXOf(360, 60);
      logInfo(`canvasCircleXOf(screenWidth=360, k=60): actual=${actual}`);
      expect(actual).assertEqual(2800);
      logInfo(`${BUNDLE}CanvasCircleXOf_0074 end`);
    });
  });
}
