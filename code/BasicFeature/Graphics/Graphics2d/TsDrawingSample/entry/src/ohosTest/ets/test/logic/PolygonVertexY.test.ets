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
import { polygonVertexY } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for polygonVertexY (74 cases). */
export default function polygonVertexYTest(): void {
  describe('PolygonVertexYTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0001
     * @tc.name      TsDrawingSample_PolygonVertexY_0001
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=60) returns 84.38484968817706
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonVertexY_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0001 begin`);
      const actual: number = polygonVertexY(60, 60, 60);
      logInfo(`polygonVertexY(i=60, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(84.38484968817706, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0002
     * @tc.name      TsDrawingSample_PolygonVertexY_0002
     * @tc.desc      polygonVertexY(i=59, centerY=60, points=60) returns 67.6364233401403
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonVertexY_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0002 begin`);
      const actual: number = polygonVertexY(59, 60, 60);
      logInfo(`polygonVertexY(i=59, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(67.6364233401403, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0003
     * @tc.name      TsDrawingSample_PolygonVertexY_0003
     * @tc.desc      polygonVertexY(i=61, centerY=60, points=60) returns 70.62714998423327
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0003 begin`);
      const actual: number = polygonVertexY(61, 60, 60);
      logInfo(`polygonVertexY(i=61, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(70.62714998423327, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0004
     * @tc.name      TsDrawingSample_PolygonVertexY_0004
     * @tc.desc      polygonVertexY(i=120, centerY=60, points=60) returns 35.61515031182323
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0004 begin`);
      const actual: number = polygonVertexY(120, 60, 60);
      logInfo(`polygonVertexY(i=120, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(35.61515031182323, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0005
     * @tc.name      TsDrawingSample_PolygonVertexY_0005
     * @tc.desc      polygonVertexY(i=30, centerY=60, points=60) returns -16.193038433212465
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0005 begin`);
      const actual: number = polygonVertexY(30, 60, 60);
      logInfo(`polygonVertexY(i=30, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(-16.193038433212465, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0006
     * @tc.name      TsDrawingSample_PolygonVertexY_0006
     * @tc.desc      polygonVertexY(i=0, centerY=60, points=60) returns 35.61515031182267
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0006 begin`);
      const actual: number = polygonVertexY(0, 60, 60);
      logInfo(`polygonVertexY(i=0, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(35.61515031182267, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0007
     * @tc.name      TsDrawingSample_PolygonVertexY_0007
     * @tc.desc      polygonVertexY(i=1, centerY=60, points=60) returns 49.37285001576663
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0007 begin`);
      const actual: number = polygonVertexY(1, 60, 60);
      logInfo(`polygonVertexY(i=1, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(49.37285001576663, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0008
     * @tc.name      TsDrawingSample_PolygonVertexY_0008
     * @tc.desc      polygonVertexY(i=-1, centerY=60, points=60) returns 52.36357665985981
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0008 begin`);
      const actual: number = polygonVertexY(-1, 60, 60);
      logInfo(`polygonVertexY(i=-1, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(52.36357665985981, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0009
     * @tc.name      TsDrawingSample_PolygonVertexY_0009
     * @tc.desc      polygonVertexY(i=2, centerY=60, points=60) returns 27.784391850726422
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0009 begin`);
      const actual: number = polygonVertexY(2, 60, 60);
      logInfo(`polygonVertexY(i=2, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(27.784391850726422, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0010
     * @tc.name      TsDrawingSample_PolygonVertexY_0010
     * @tc.desc      polygonVertexY(i=3, centerY=60, points=60) returns 46.498556650774816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0010 begin`);
      const actual: number = polygonVertexY(3, 60, 60);
      logInfo(`polygonVertexY(i=3, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(46.498556650774816, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0011
     * @tc.name      TsDrawingSample_PolygonVertexY_0011
     * @tc.desc      polygonVertexY(i=10, centerY=60, points=60) returns 0.7855814859669721
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0011 begin`);
      const actual: number = polygonVertexY(10, 60, 60);
      logInfo(`polygonVertexY(i=10, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(0.7855814859669721, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0012
     * @tc.name      TsDrawingSample_PolygonVertexY_0012
     * @tc.desc      polygonVertexY(i=100, centerY=60, points=60) returns 113.79268203059738
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0012 begin`);
      const actual: number = polygonVertexY(100, 60, 60);
      logInfo(`polygonVertexY(i=100, centerY=60, points=60): actual=${actual}`);
      expect(actual).assertClose(113.79268203059738, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0013
     * @tc.name      TsDrawingSample_PolygonVertexY_0013
     * @tc.desc      polygonVertexY(i=60, centerY=59, points=60) returns 83.38484968817706
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0013 begin`);
      const actual: number = polygonVertexY(60, 59, 60);
      logInfo(`polygonVertexY(i=60, centerY=59, points=60): actual=${actual}`);
      expect(actual).assertClose(83.38484968817706, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0014
     * @tc.name      TsDrawingSample_PolygonVertexY_0014
     * @tc.desc      polygonVertexY(i=60, centerY=61, points=60) returns 85.38484968817706
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0014 begin`);
      const actual: number = polygonVertexY(60, 61, 60);
      logInfo(`polygonVertexY(i=60, centerY=61, points=60): actual=${actual}`);
      expect(actual).assertClose(85.38484968817706, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0015
     * @tc.name      TsDrawingSample_PolygonVertexY_0015
     * @tc.desc      polygonVertexY(i=60, centerY=120, points=60) returns 144.38484968817704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0015 begin`);
      const actual: number = polygonVertexY(60, 120, 60);
      logInfo(`polygonVertexY(i=60, centerY=120, points=60): actual=${actual}`);
      expect(actual).assertClose(144.38484968817704, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0016
     * @tc.name      TsDrawingSample_PolygonVertexY_0016
     * @tc.desc      polygonVertexY(i=60, centerY=30, points=60) returns 54.384849688177056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0016 begin`);
      const actual: number = polygonVertexY(60, 30, 60);
      logInfo(`polygonVertexY(i=60, centerY=30, points=60): actual=${actual}`);
      expect(actual).assertClose(54.384849688177056, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0017
     * @tc.name      TsDrawingSample_PolygonVertexY_0017
     * @tc.desc      polygonVertexY(i=60, centerY=0, points=60) returns 24.384849688177056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0017 begin`);
      const actual: number = polygonVertexY(60, 0, 60);
      logInfo(`polygonVertexY(i=60, centerY=0, points=60): actual=${actual}`);
      expect(actual).assertClose(24.384849688177056, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0018
     * @tc.name      TsDrawingSample_PolygonVertexY_0018
     * @tc.desc      polygonVertexY(i=60, centerY=1, points=60) returns 25.384849688177056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0018 begin`);
      const actual: number = polygonVertexY(60, 1, 60);
      logInfo(`polygonVertexY(i=60, centerY=1, points=60): actual=${actual}`);
      expect(actual).assertClose(25.384849688177056, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0019
     * @tc.name      TsDrawingSample_PolygonVertexY_0019
     * @tc.desc      polygonVertexY(i=60, centerY=-1, points=60) returns 23.384849688177056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0019 begin`);
      const actual: number = polygonVertexY(60, -1, 60);
      logInfo(`polygonVertexY(i=60, centerY=-1, points=60): actual=${actual}`);
      expect(actual).assertClose(23.384849688177056, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0020
     * @tc.name      TsDrawingSample_PolygonVertexY_0020
     * @tc.desc      polygonVertexY(i=60, centerY=2, points=60) returns 26.384849688177056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0020 begin`);
      const actual: number = polygonVertexY(60, 2, 60);
      logInfo(`polygonVertexY(i=60, centerY=2, points=60): actual=${actual}`);
      expect(actual).assertClose(26.384849688177056, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0021
     * @tc.name      TsDrawingSample_PolygonVertexY_0021
     * @tc.desc      polygonVertexY(i=60, centerY=3, points=60) returns 27.384849688177056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0021 begin`);
      const actual: number = polygonVertexY(60, 3, 60);
      logInfo(`polygonVertexY(i=60, centerY=3, points=60): actual=${actual}`);
      expect(actual).assertClose(27.384849688177056, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0022
     * @tc.name      TsDrawingSample_PolygonVertexY_0022
     * @tc.desc      polygonVertexY(i=60, centerY=10, points=60) returns 34.384849688177056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0022 begin`);
      const actual: number = polygonVertexY(60, 10, 60);
      logInfo(`polygonVertexY(i=60, centerY=10, points=60): actual=${actual}`);
      expect(actual).assertClose(34.384849688177056, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0023
     * @tc.name      TsDrawingSample_PolygonVertexY_0023
     * @tc.desc      polygonVertexY(i=60, centerY=100, points=60) returns 124.38484968817706
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0023 begin`);
      const actual: number = polygonVertexY(60, 100, 60);
      logInfo(`polygonVertexY(i=60, centerY=100, points=60): actual=${actual}`);
      expect(actual).assertClose(124.38484968817706, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0024
     * @tc.name      TsDrawingSample_PolygonVertexY_0024
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=59) returns 88.40544814854181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0024 begin`);
      const actual: number = polygonVertexY(60, 60, 59);
      logInfo(`polygonVertexY(i=60, centerY=60, points=59): actual=${actual}`);
      expect(actual).assertClose(88.40544814854181, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0025
     * @tc.name      TsDrawingSample_PolygonVertexY_0025
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=61) returns 80.4301948286082
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0025 begin`);
      const actual: number = polygonVertexY(60, 60, 61);
      logInfo(`polygonVertexY(i=60, centerY=60, points=61): actual=${actual}`);
      expect(actual).assertClose(80.4301948286082, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0026
     * @tc.name      TsDrawingSample_PolygonVertexY_0026
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0026 begin`);
      const actual: number = polygonVertexY(60, 60, 0);
      logInfo(`polygonVertexY(i=60, centerY=60, points=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}PolygonVertexY_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0027
     * @tc.name      TsDrawingSample_PolygonVertexY_0027
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=1) returns 35.61515031182431
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0027 begin`);
      const actual: number = polygonVertexY(60, 60, 1);
      logInfo(`polygonVertexY(i=60, centerY=60, points=1): actual=${actual}`);
      expect(actual).assertClose(35.61515031182431, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0028
     * @tc.name      TsDrawingSample_PolygonVertexY_0028
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=-1) returns 35.615150311821026
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0028 begin`);
      const actual: number = polygonVertexY(60, 60, -1);
      logInfo(`polygonVertexY(i=60, centerY=60, points=-1): actual=${actual}`);
      expect(actual).assertClose(35.615150311821026, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0029
     * @tc.name      TsDrawingSample_PolygonVertexY_0029
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=2) returns 35.615150311823484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0029 begin`);
      const actual: number = polygonVertexY(60, 60, 2);
      logInfo(`polygonVertexY(i=60, centerY=60, points=2): actual=${actual}`);
      expect(actual).assertClose(35.615150311823484, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0030
     * @tc.name      TsDrawingSample_PolygonVertexY_0030
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=3) returns 35.61515031182393
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0030 begin`);
      const actual: number = polygonVertexY(60, 60, 3);
      logInfo(`polygonVertexY(i=60, centerY=60, points=3): actual=${actual}`);
      expect(actual).assertClose(35.61515031182393, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0031
     * @tc.name      TsDrawingSample_PolygonVertexY_0031
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=10) returns 35.61515031182326
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0031 begin`);
      const actual: number = polygonVertexY(60, 60, 10);
      logInfo(`polygonVertexY(i=60, centerY=60, points=10): actual=${actual}`);
      expect(actual).assertClose(35.61515031182326, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0032
     * @tc.name      TsDrawingSample_PolygonVertexY_0032
     * @tc.desc      polygonVertexY(i=60, centerY=60, points=100) returns -4.928552739308557
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0032 begin`);
      const actual: number = polygonVertexY(60, 60, 100);
      logInfo(`polygonVertexY(i=60, centerY=60, points=100): actual=${actual}`);
      expect(actual).assertClose(-4.928552739308557, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0033
     * @tc.name      TsDrawingSample_PolygonVertexY_0033
     * @tc.desc      polygonVertexY(i=3, centerY=10, points=120) returns -1.3578935865677764
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0033 begin`);
      const actual: number = polygonVertexY(3, 10, 120);
      logInfo(`polygonVertexY(i=3, centerY=10, points=120): actual=${actual}`);
      expect(actual).assertClose(-1.3578935865677764, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0034
     * @tc.name      TsDrawingSample_PolygonVertexY_0034
     * @tc.desc      polygonVertexY(i=10, centerY=1, points=30) returns -77.17753171877476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0034 begin`);
      const actual: number = polygonVertexY(10, 1, 30);
      logInfo(`polygonVertexY(i=10, centerY=1, points=30): actual=${actual}`);
      expect(actual).assertClose(-77.17753171877476, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0035
     * @tc.name      TsDrawingSample_PolygonVertexY_0035
     * @tc.desc      polygonVertexY(i=120, centerY=100, points=30) returns 75.6151503118227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0035 begin`);
      const actual: number = polygonVertexY(120, 100, 30);
      logInfo(`polygonVertexY(i=120, centerY=100, points...: actual=${actual}`);
      expect(actual).assertClose(75.6151503118227, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0036
     * @tc.name      TsDrawingSample_PolygonVertexY_0036
     * @tc.desc      polygonVertexY(i=120, centerY=59, points=59) returns 26.654471720022606
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0036 begin`);
      const actual: number = polygonVertexY(120, 59, 59);
      logInfo(`polygonVertexY(i=120, centerY=59, points=59): actual=${actual}`);
      expect(actual).assertClose(26.654471720022606, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0037
     * @tc.name      TsDrawingSample_PolygonVertexY_0037
     * @tc.desc      polygonVertexY(i=0, centerY=-1, points=-1) returns -25.384849688177333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0037 begin`);
      const actual: number = polygonVertexY(0, -1, -1);
      logInfo(`polygonVertexY(i=0, centerY=-1, points=-1): actual=${actual}`);
      expect(actual).assertClose(-25.384849688177333, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0038
     * @tc.name      TsDrawingSample_PolygonVertexY_0038
     * @tc.desc      polygonVertexY(i=1, centerY=0, points=-1) returns 9.144318633066405
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0038 begin`);
      const actual: number = polygonVertexY(1, 0, -1);
      logInfo(`polygonVertexY(i=1, centerY=0, points=-1): actual=${actual}`);
      expect(actual).assertClose(9.144318633066405, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0039
     * @tc.name      TsDrawingSample_PolygonVertexY_0039
     * @tc.desc      polygonVertexY(i=120, centerY=100, points=1) returns 75.61515031182594
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0039 begin`);
      const actual: number = polygonVertexY(120, 100, 1);
      logInfo(`polygonVertexY(i=120, centerY=100, points=1): actual=${actual}`);
      expect(actual).assertClose(75.61515031182594, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0040
     * @tc.name      TsDrawingSample_PolygonVertexY_0040
     * @tc.desc      polygonVertexY(i=100, centerY=10, points=2) returns -14.384849688177411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0040 begin`);
      const actual: number = polygonVertexY(100, 10, 2);
      logInfo(`polygonVertexY(i=100, centerY=10, points=2): actual=${actual}`);
      expect(actual).assertClose(-14.384849688177411, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0041
     * @tc.name      TsDrawingSample_PolygonVertexY_0041
     * @tc.desc      polygonVertexY(i=61, centerY=120, points=61) returns 129.1443186330666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0041 begin`);
      const actual: number = polygonVertexY(61, 120, 61);
      logInfo(`polygonVertexY(i=61, centerY=120, points=61): actual=${actual}`);
      expect(actual).assertClose(129.1443186330666, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0042
     * @tc.name      TsDrawingSample_PolygonVertexY_0042
     * @tc.desc      polygonVertexY(i=59, centerY=120, points=61) returns 126.15801103690593
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0042 begin`);
      const actual: number = polygonVertexY(59, 120, 61);
      logInfo(`polygonVertexY(i=59, centerY=120, points=61): actual=${actual}`);
      expect(actual).assertClose(126.15801103690593, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0043
     * @tc.name      TsDrawingSample_PolygonVertexY_0043
     * @tc.desc      polygonVertexY(i=10, centerY=61, points=100) returns 14.2636860762548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0043 begin`);
      const actual: number = polygonVertexY(10, 61, 100);
      logInfo(`polygonVertexY(i=10, centerY=61, points=100): actual=${actual}`);
      expect(actual).assertClose(14.2636860762548, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0044
     * @tc.name      TsDrawingSample_PolygonVertexY_0044
     * @tc.desc      polygonVertexY(i=61, centerY=61, points=60) returns 71.62714998423327
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0044 begin`);
      const actual: number = polygonVertexY(61, 61, 60);
      logInfo(`polygonVertexY(i=61, centerY=61, points=60): actual=${actual}`);
      expect(actual).assertClose(71.62714998423327, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0045
     * @tc.name      TsDrawingSample_PolygonVertexY_0045
     * @tc.desc      polygonVertexY(i=60, centerY=59, points=61) returns 79.4301948286082
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0045 begin`);
      const actual: number = polygonVertexY(60, 59, 61);
      logInfo(`polygonVertexY(i=60, centerY=59, points=61): actual=${actual}`);
      expect(actual).assertClose(79.4301948286082, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0046
     * @tc.name      TsDrawingSample_PolygonVertexY_0046
     * @tc.desc      polygonVertexY(i=1, centerY=61, points=59) returns 50.34795694429672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0046 begin`);
      const actual: number = polygonVertexY(1, 61, 59);
      logInfo(`polygonVertexY(i=1, centerY=61, points=59): actual=${actual}`);
      expect(actual).assertClose(50.34795694429672, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0047
     * @tc.name      TsDrawingSample_PolygonVertexY_0047
     * @tc.desc      polygonVertexY(i=10, centerY=100, points=3) returns 178.17753171877482
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0047 begin`);
      const actual: number = polygonVertexY(10, 100, 3);
      logInfo(`polygonVertexY(i=10, centerY=100, points=3): actual=${actual}`);
      expect(actual).assertClose(178.17753171877482, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0048
     * @tc.name      TsDrawingSample_PolygonVertexY_0048
     * @tc.desc      polygonVertexY(i=30, centerY=2, points=100) returns -73.97451797161173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0048 begin`);
      const actual: number = polygonVertexY(30, 2, 100);
      logInfo(`polygonVertexY(i=30, centerY=2, points=100): actual=${actual}`);
      expect(actual).assertClose(-73.97451797161173, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0049
     * @tc.name      TsDrawingSample_PolygonVertexY_0049
     * @tc.desc      polygonVertexY(i=61, centerY=3, points=100) returns -20.78568424542476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0049 begin`);
      const actual: number = polygonVertexY(61, 3, 100);
      logInfo(`polygonVertexY(i=61, centerY=3, points=100): actual=${actual}`);
      expect(actual).assertClose(-20.78568424542476, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0050
     * @tc.name      TsDrawingSample_PolygonVertexY_0050
     * @tc.desc      polygonVertexY(i=30, centerY=60, points=2) returns 84.38484968817693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0050 begin`);
      const actual: number = polygonVertexY(30, 60, 2);
      logInfo(`polygonVertexY(i=30, centerY=60, points=2): actual=${actual}`);
      expect(actual).assertClose(84.38484968817693, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0051
     * @tc.name      TsDrawingSample_PolygonVertexY_0051
     * @tc.desc      polygonVertexY(i=3, centerY=59, points=-1) returns 68.14431863306662
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0051 begin`);
      const actual: number = polygonVertexY(3, 59, -1);
      logInfo(`polygonVertexY(i=3, centerY=59, points=-1): actual=${actual}`);
      expect(actual).assertClose(68.14431863306662, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0052
     * @tc.name      TsDrawingSample_PolygonVertexY_0052
     * @tc.desc      polygonVertexY(i=-1, centerY=30, points=100) returns 21.75767397629656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0052 begin`);
      const actual: number = polygonVertexY(-1, 30, 100);
      logInfo(`polygonVertexY(i=-1, centerY=30, points=100): actual=${actual}`);
      expect(actual).assertClose(21.75767397629656, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0053
     * @tc.name      TsDrawingSample_PolygonVertexY_0053
     * @tc.desc      polygonVertexY(i=30, centerY=61, points=2) returns 85.38484968817693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0053 begin`);
      const actual: number = polygonVertexY(30, 61, 2);
      logInfo(`polygonVertexY(i=30, centerY=61, points=2): actual=${actual}`);
      expect(actual).assertClose(85.38484968817693, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0054
     * @tc.name      TsDrawingSample_PolygonVertexY_0054
     * @tc.desc      polygonVertexY(i=10, centerY=61, points=30) returns -17.17753171877476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0054 begin`);
      const actual: number = polygonVertexY(10, 61, 30);
      logInfo(`polygonVertexY(i=10, centerY=61, points=30): actual=${actual}`);
      expect(actual).assertClose(-17.17753171877476, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0055
     * @tc.name      TsDrawingSample_PolygonVertexY_0055
     * @tc.desc      polygonVertexY(i=3, centerY=0, points=1) returns 9.144318633066389
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0055 begin`);
      const actual: number = polygonVertexY(3, 0, 1);
      logInfo(`polygonVertexY(i=3, centerY=0, points=1): actual=${actual}`);
      expect(actual).assertClose(9.144318633066389, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0056
     * @tc.name      TsDrawingSample_PolygonVertexY_0056
     * @tc.desc      polygonVertexY(i=-1, centerY=10, points=120) returns 1.6067528572267467
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0056 begin`);
      const actual: number = polygonVertexY(-1, 10, 120);
      logInfo(`polygonVertexY(i=-1, centerY=10, points=120): actual=${actual}`);
      expect(actual).assertClose(1.6067528572267467, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0057
     * @tc.name      TsDrawingSample_PolygonVertexY_0057
     * @tc.desc      polygonVertexY(i=10, centerY=10, points=59) returns -49.689466609468326
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0057 begin`);
      const actual: number = polygonVertexY(10, 10, 59);
      logInfo(`polygonVertexY(i=10, centerY=10, points=59): actual=${actual}`);
      expect(actual).assertClose(-49.689466609468326, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0058
     * @tc.name      TsDrawingSample_PolygonVertexY_0058
     * @tc.desc      polygonVertexY(i=3, centerY=3, points=60) returns -10.50144334922518
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0058 begin`);
      const actual: number = polygonVertexY(3, 3, 60);
      logInfo(`polygonVertexY(i=3, centerY=3, points=60): actual=${actual}`);
      expect(actual).assertClose(-10.50144334922518, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0059
     * @tc.name      TsDrawingSample_PolygonVertexY_0059
     * @tc.desc      polygonVertexY(i=1, centerY=3, points=60) returns -7.62714998423337
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0059 begin`);
      const actual: number = polygonVertexY(1, 3, 60);
      logInfo(`polygonVertexY(i=1, centerY=3, points=60): actual=${actual}`);
      expect(actual).assertClose(-7.62714998423337, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0060
     * @tc.name      TsDrawingSample_PolygonVertexY_0060
     * @tc.desc      polygonVertexY(i=30, centerY=59, points=100) returns -16.974517971611732
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0060 begin`);
      const actual: number = polygonVertexY(30, 59, 100);
      logInfo(`polygonVertexY(i=30, centerY=59, points=100): actual=${actual}`);
      expect(actual).assertClose(-16.974517971611732, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0061
     * @tc.name      TsDrawingSample_PolygonVertexY_0061
     * @tc.desc      polygonVertexY(i=2, centerY=59, points=120) returns 30.66093337537768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0061 begin`);
      const actual: number = polygonVertexY(2, 59, 120);
      logInfo(`polygonVertexY(i=2, centerY=59, points=120): actual=${actual}`);
      expect(actual).assertClose(30.66093337537768, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0062
     * @tc.name      TsDrawingSample_PolygonVertexY_0062
     * @tc.desc      polygonVertexY(i=2, centerY=3, points=100) returns -26.12093222524538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0062 begin`);
      const actual: number = polygonVertexY(2, 3, 100);
      logInfo(`polygonVertexY(i=2, centerY=3, points=100): actual=${actual}`);
      expect(actual).assertClose(-26.12093222524538, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0063
     * @tc.name      TsDrawingSample_PolygonVertexY_0063
     * @tc.desc      polygonVertexY(i=60, centerY=30, points=120) returns -46.193038433212465
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0063 begin`);
      const actual: number = polygonVertexY(60, 30, 120);
      logInfo(`polygonVertexY(i=60, centerY=30, points=120): actual=${actual}`);
      expect(actual).assertClose(-46.193038433212465, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0064
     * @tc.name      TsDrawingSample_PolygonVertexY_0064
     * @tc.desc      polygonVertexY(i=0, centerY=100, points=100) returns 75.61515031182267
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0064 begin`);
      const actual: number = polygonVertexY(0, 100, 100);
      logInfo(`polygonVertexY(i=0, centerY=100, points=100): actual=${actual}`);
      expect(actual).assertClose(75.61515031182267, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0065
     * @tc.name      TsDrawingSample_PolygonVertexY_0065
     * @tc.desc      polygonVertexY(i=2, centerY=120, points=1) returns 95.61515031182213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0065 begin`);
      const actual: number = polygonVertexY(2, 120, 1);
      logInfo(`polygonVertexY(i=2, centerY=120, points=1): actual=${actual}`);
      expect(actual).assertClose(95.61515031182213, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0066
     * @tc.name      TsDrawingSample_PolygonVertexY_0066
     * @tc.desc      polygonVertexY(i=1, centerY=-1, points=-1) returns 8.144318633066405
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexY_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0066 begin`);
      const actual: number = polygonVertexY(1, -1, -1);
      logInfo(`polygonVertexY(i=1, centerY=-1, points=-1): actual=${actual}`);
      expect(actual).assertClose(8.144318633066405, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0067
     * @tc.name      TsDrawingSample_PolygonVertexY_0067
     * @tc.desc      polygonVertexY(i=120, centerY=61, points=100) returns 125.51290212141001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0067 begin`);
      const actual: number = polygonVertexY(120, 61, 100);
      logInfo(`polygonVertexY(i=120, centerY=61, points=...: actual=${actual}`);
      expect(actual).assertClose(125.51290212141001, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0068
     * @tc.name      TsDrawingSample_PolygonVertexY_0068
     * @tc.desc      polygonVertexY(i=2, centerY=0, points=3) returns -53.79268203059759
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0068 begin`);
      const actual: number = polygonVertexY(2, 0, 3);
      logInfo(`polygonVertexY(i=2, centerY=0, points=3): actual=${actual}`);
      expect(actual).assertClose(-53.79268203059759, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0069
     * @tc.name      TsDrawingSample_PolygonVertexY_0069
     * @tc.desc      polygonVertexY(i=3, centerY=2, points=30) returns -15.52611772140445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0069 begin`);
      const actual: number = polygonVertexY(3, 2, 30);
      logInfo(`polygonVertexY(i=3, centerY=2, points=30): actual=${actual}`);
      expect(actual).assertClose(-15.52611772140445, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0070
     * @tc.name      TsDrawingSample_PolygonVertexY_0070
     * @tc.desc      polygonVertexY(i=1, centerY=2, points=2) returns -26.572389412454672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0070 begin`);
      const actual: number = polygonVertexY(1, 2, 2);
      logInfo(`polygonVertexY(i=1, centerY=2, points=2): actual=${actual}`);
      expect(actual).assertClose(-26.572389412454672, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0071
     * @tc.name      TsDrawingSample_PolygonVertexY_0071
     * @tc.desc      polygonVertexY(i=10, centerY=60, points=120) returns 16.725834465268754
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0071 begin`);
      const actual: number = polygonVertexY(10, 60, 120);
      logInfo(`polygonVertexY(i=10, centerY=60, points=120): actual=${actual}`);
      expect(actual).assertClose(16.725834465268754, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0072
     * @tc.name      TsDrawingSample_PolygonVertexY_0072
     * @tc.desc      polygonVertexY(i=100, centerY=1, points=10) returns -23.384849688177784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0072 begin`);
      const actual: number = polygonVertexY(100, 1, 10);
      logInfo(`polygonVertexY(i=100, centerY=1, points=10): actual=${actual}`);
      expect(actual).assertClose(-23.384849688177784, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0073
     * @tc.name      TsDrawingSample_PolygonVertexY_0073
     * @tc.desc      polygonVertexY(i=30, centerY=61, points=1) returns 36.615150311823484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexY_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0073 begin`);
      const actual: number = polygonVertexY(30, 61, 1);
      logInfo(`polygonVertexY(i=30, centerY=61, points=1): actual=${actual}`);
      expect(actual).assertClose(36.615150311823484, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_Y_0074
     * @tc.name      TsDrawingSample_PolygonVertexY_0074
     * @tc.desc      polygonVertexY(i=0, centerY=3, points=1) returns -21.384849688177333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexY_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexY_0074 begin`);
      const actual: number = polygonVertexY(0, 3, 1);
      logInfo(`polygonVertexY(i=0, centerY=3, points=1): actual=${actual}`);
      expect(actual).assertClose(-21.384849688177333, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexY_0074 end`);
    });
  });
}
