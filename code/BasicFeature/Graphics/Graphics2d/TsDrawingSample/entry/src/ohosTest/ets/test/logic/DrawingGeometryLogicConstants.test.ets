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
import {
  CANVAS_START_X, CANVAS_START_Y, PENTAGON_CENTER_X, PENTAGON_CENTER_Y, PENTAGON_SIDE, POLY_CENTER_X, POLY_CENTER_Y,
  POLY_INNER_RADIUS, POLY_OUTER_RADIUS, POLY_POINTS, ROUND_RADIUS, SHAPE_BOTTOM, SHAPE_TOP, STAR_A_X, STAR_A_Y,
  STAR_LENGTH
} from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for DrawingGeometryLogic (16 cases). */
export default function drawingGeometryLogicConstantsTest(): void {
  describe('DrawingGeometryLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0001
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0001
     * @tc.desc      STAR_LENGTH keeps value 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0001 begin`);
      const actual: number = STAR_LENGTH;
      logInfo(`STAR_LENGTH: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0002
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0002
     * @tc.desc      STAR_A_X keeps value 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0002 begin`);
      const actual: number = STAR_A_X;
      logInfo(`STAR_A_X: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0003
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0003
     * @tc.desc      STAR_A_Y keeps value 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0003 begin`);
      const actual: number = STAR_A_Y;
      logInfo(`STAR_A_Y: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0004
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0004
     * @tc.desc      POLY_CENTER_X keeps value 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0004 begin`);
      const actual: number = POLY_CENTER_X;
      logInfo(`POLY_CENTER_X: actual=${actual}`);
      expect(actual).assertEqual(450);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0005
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0005
     * @tc.desc      POLY_CENTER_Y keeps value 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0005 begin`);
      const actual: number = POLY_CENTER_Y;
      logInfo(`POLY_CENTER_Y: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0006
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0006
     * @tc.desc      POLY_INNER_RADIUS keeps value 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0006 begin`);
      const actual: number = POLY_INNER_RADIUS;
      logInfo(`POLY_INNER_RADIUS: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0007
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0007
     * @tc.desc      POLY_POINTS keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0007 begin`);
      const actual: number = POLY_POINTS;
      logInfo(`POLY_POINTS: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0008
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0008
     * @tc.desc      PENTAGON_CENTER_X keeps value 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0008 begin`);
      const actual: number = PENTAGON_CENTER_X;
      logInfo(`PENTAGON_CENTER_X: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0009
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0009
     * @tc.desc      PENTAGON_CENTER_Y keeps value 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0009 begin`);
      const actual: number = PENTAGON_CENTER_Y;
      logInfo(`PENTAGON_CENTER_Y: actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0010
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0010
     * @tc.desc      PENTAGON_SIDE keeps value 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0010 begin`);
      const actual: number = PENTAGON_SIDE;
      logInfo(`PENTAGON_SIDE: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0011
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0011
     * @tc.desc      SHAPE_BOTTOM keeps value 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0011 begin`);
      const actual: number = SHAPE_BOTTOM;
      logInfo(`SHAPE_BOTTOM: actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0012
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0012
     * @tc.desc      ROUND_RADIUS keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0012 begin`);
      const actual: number = ROUND_RADIUS;
      logInfo(`ROUND_RADIUS: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0013
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0013
     * @tc.desc      CANVAS_START_X keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0013 begin`);
      const actual: number = CANVAS_START_X;
      logInfo(`CANVAS_START_X: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0014
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0014
     * @tc.desc      POLY_OUTER_RADIUS keeps value 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0014 begin`);
      const actual: number = POLY_OUTER_RADIUS;
      logInfo(`POLY_OUTER_RADIUS: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0015
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0015
     * @tc.desc      SHAPE_TOP keeps value 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0015 begin`);
      const actual: number = SHAPE_TOP;
      logInfo(`SHAPE_TOP: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_DRAWING_GEOMETRY_LOGIC_CONSTANTS_0016
     * @tc.name      TsDrawingSample_DrawingGeometryLogicConstants_0016
     * @tc.desc      CANVAS_START_Y keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_DrawingGeometryLogicConstants_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0016 begin`);
      const actual: number = CANVAS_START_Y;
      logInfo(`CANVAS_START_Y: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}DrawingGeometryLogicConstants_0016 end`);
    });
  });
}
