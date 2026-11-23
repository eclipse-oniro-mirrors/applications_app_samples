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
import { polygonVertexX } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for polygonVertexX (75 cases). */
export default function polygonVertexXTest(): void {
  describe('PolygonVertexXTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0001
     * @tc.name      TsDrawingSample_PolygonVertexX_0001
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=60) returns 136.1930384332126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonVertexX_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0001 begin`);
      const actual: number = polygonVertexX(60, 60, 60);
      logInfo(`polygonVertexX(i=60, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(136.1930384332126, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0002
     * @tc.name      TsDrawingSample_PolygonVertexX_0002
     * @tc.desc      polygonVertexX(i=59, centerX=60, points=60) returns 89.01180860563782
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonVertexX_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0002 begin`);
      const actual: number = polygonVertexX(59, 60, 60);
      logInfo(`polygonVertexX(i=59, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(89.01180860563782, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0003
     * @tc.name      TsDrawingSample_PolygonVertexX_0003
     * @tc.desc      polygonVertexX(i=61, centerX=60, points=60) returns 88.05465528593447
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0003 begin`);
      const actual: number = polygonVertexX(61, 60, 60);
      logInfo(`polygonVertexX(i=61, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(88.05465528593447, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0004
     * @tc.name      TsDrawingSample_PolygonVertexX_0004
     * @tc.desc      polygonVertexX(i=120, centerX=60, points=60) returns -16.193038433212678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0004 begin`);
      const actual: number = polygonVertexX(120, 60, 60);
      logInfo(`polygonVertexX(i=120, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(-16.193038433212678, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0005
     * @tc.name      TsDrawingSample_PolygonVertexX_0005
     * @tc.desc      polygonVertexX(i=30, centerX=60, points=60) returns 84.38484968817747
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0005 begin`);
      const actual: number = polygonVertexX(30, 60, 60);
      logInfo(`polygonVertexX(i=30, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(84.38484968817747, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0006
     * @tc.name      TsDrawingSample_PolygonVertexX_0006
     * @tc.desc      polygonVertexX(i=0, centerX=60, points=60) returns -16.193038433212507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0006 begin`);
      const actual: number = polygonVertexX(0, 60, 60);
      logInfo(`polygonVertexX(i=0, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(-16.193038433212507, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0007
     * @tc.name      TsDrawingSample_PolygonVertexX_0007
     * @tc.desc      polygonVertexX(i=1, centerX=60, points=60) returns 31.945344714065566
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0007 begin`);
      const actual: number = polygonVertexX(1, 60, 60);
      logInfo(`polygonVertexX(i=1, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(31.945344714065566, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0008
     * @tc.name      TsDrawingSample_PolygonVertexX_0008
     * @tc.desc      polygonVertexX(i=-1, centerX=60, points=60) returns 30.988191394362158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0008 begin`);
      const actual: number = polygonVertexX(-1, 60, 60);
      logInfo(`polygonVertexX(i=-1, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(30.988191394362158, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0009
     * @tc.name      TsDrawingSample_PolygonVertexX_0009
     * @tc.desc      polygonVertexX(i=2, centerX=60, points=60) returns -13.226734131548284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0009 begin`);
      const actual: number = polygonVertexX(2, 60, 60);
      logInfo(`polygonVertexX(i=2, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(-13.226734131548284, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0010
     * @tc.name      TsDrawingSample_PolygonVertexX_0010
     * @tc.desc      polygonVertexX(i=3, centerX=60, points=60) returns 33.20987070789573
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0010 begin`);
      const actual: number = polygonVertexX(3, 60, 60);
      logInfo(`polygonVertexX(i=3, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(33.20987070789573, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0011
     * @tc.name      TsDrawingSample_PolygonVertexX_0011
     * @tc.desc      polygonVertexX(i=10, centerX=60, points=60) returns 6.20731796940273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0011 begin`);
      const actual: number = polygonVertexX(10, 60, 60);
      logInfo(`polygonVertexX(i=10, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(6.20731796940273, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0012
     * @tc.name      TsDrawingSample_PolygonVertexX_0012
     * @tc.desc      polygonVertexX(i=100, centerX=60, points=60) returns 0.7855814859670716
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0012 begin`);
      const actual: number = polygonVertexX(100, 60, 60);
      logInfo(`polygonVertexX(i=100, centerX=60, points=60): actual=${actual}`);
      expect(actual).assertClose(0.7855814859670716, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0013
     * @tc.name      TsDrawingSample_PolygonVertexX_0013
     * @tc.desc      polygonVertexX(i=60, centerX=59, points=60) returns 135.1930384332126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0013 begin`);
      const actual: number = polygonVertexX(60, 59, 60);
      logInfo(`polygonVertexX(i=60, centerX=59, points=60): actual=${actual}`);
      expect(actual).assertClose(135.1930384332126, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0014
     * @tc.name      TsDrawingSample_PolygonVertexX_0014
     * @tc.desc      polygonVertexX(i=60, centerX=61, points=60) returns 137.1930384332126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0014 begin`);
      const actual: number = polygonVertexX(60, 61, 60);
      logInfo(`polygonVertexX(i=60, centerX=61, points=60): actual=${actual}`);
      expect(actual).assertClose(137.1930384332126, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0015
     * @tc.name      TsDrawingSample_PolygonVertexX_0015
     * @tc.desc      polygonVertexX(i=60, centerX=120, points=60) returns 196.1930384332126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0015 begin`);
      const actual: number = polygonVertexX(60, 120, 60);
      logInfo(`polygonVertexX(i=60, centerX=120, points=60): actual=${actual}`);
      expect(actual).assertClose(196.1930384332126, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0016
     * @tc.name      TsDrawingSample_PolygonVertexX_0016
     * @tc.desc      polygonVertexX(i=60, centerX=30, points=60) returns 106.19303843321259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0016 begin`);
      const actual: number = polygonVertexX(60, 30, 60);
      logInfo(`polygonVertexX(i=60, centerX=30, points=60): actual=${actual}`);
      expect(actual).assertClose(106.19303843321259, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0017
     * @tc.name      TsDrawingSample_PolygonVertexX_0017
     * @tc.desc      polygonVertexX(i=60, centerX=0, points=60) returns 76.19303843321259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0017 begin`);
      const actual: number = polygonVertexX(60, 0, 60);
      logInfo(`polygonVertexX(i=60, centerX=0, points=60): actual=${actual}`);
      expect(actual).assertClose(76.19303843321259, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0018
     * @tc.name      TsDrawingSample_PolygonVertexX_0018
     * @tc.desc      polygonVertexX(i=60, centerX=1, points=60) returns 77.19303843321259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0018 begin`);
      const actual: number = polygonVertexX(60, 1, 60);
      logInfo(`polygonVertexX(i=60, centerX=1, points=60): actual=${actual}`);
      expect(actual).assertClose(77.19303843321259, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0019
     * @tc.name      TsDrawingSample_PolygonVertexX_0019
     * @tc.desc      polygonVertexX(i=60, centerX=-1, points=60) returns 75.19303843321259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0019 begin`);
      const actual: number = polygonVertexX(60, -1, 60);
      logInfo(`polygonVertexX(i=60, centerX=-1, points=60): actual=${actual}`);
      expect(actual).assertClose(75.19303843321259, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0020
     * @tc.name      TsDrawingSample_PolygonVertexX_0020
     * @tc.desc      polygonVertexX(i=60, centerX=2, points=60) returns 78.19303843321259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0020 begin`);
      const actual: number = polygonVertexX(60, 2, 60);
      logInfo(`polygonVertexX(i=60, centerX=2, points=60): actual=${actual}`);
      expect(actual).assertClose(78.19303843321259, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0021
     * @tc.name      TsDrawingSample_PolygonVertexX_0021
     * @tc.desc      polygonVertexX(i=60, centerX=3, points=60) returns 79.19303843321259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0021 begin`);
      const actual: number = polygonVertexX(60, 3, 60);
      logInfo(`polygonVertexX(i=60, centerX=3, points=60): actual=${actual}`);
      expect(actual).assertClose(79.19303843321259, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0022
     * @tc.name      TsDrawingSample_PolygonVertexX_0022
     * @tc.desc      polygonVertexX(i=60, centerX=10, points=60) returns 86.19303843321259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0022 begin`);
      const actual: number = polygonVertexX(60, 10, 60);
      logInfo(`polygonVertexX(i=60, centerX=10, points=60): actual=${actual}`);
      expect(actual).assertClose(86.19303843321259, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0023
     * @tc.name      TsDrawingSample_PolygonVertexX_0023
     * @tc.desc      polygonVertexX(i=60, centerX=100, points=60) returns 176.1930384332126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0023 begin`);
      const actual: number = polygonVertexX(60, 100, 60);
      logInfo(`polygonVertexX(i=60, centerX=100, points=60): actual=${actual}`);
      expect(actual).assertClose(176.1930384332126, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0024
     * @tc.name      TsDrawingSample_PolygonVertexX_0024
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=59) returns 134.78723497683615
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0024 begin`);
      const actual: number = polygonVertexX(60, 60, 59);
      logInfo(`polygonVertexX(i=60, centerX=60, points=59): actual=${actual}`);
      expect(actual).assertClose(134.78723497683615, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0025
     * @tc.name      TsDrawingSample_PolygonVertexX_0025
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=61) returns 137.3473150100578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0025 begin`);
      const actual: number = polygonVertexX(60, 60, 61);
      logInfo(`polygonVertexX(i=60, centerX=60, points=61): actual=${actual}`);
      expect(actual).assertClose(137.3473150100578, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0026
     * @tc.name      TsDrawingSample_PolygonVertexX_0026
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0026 begin`);
      const actual: number = polygonVertexX(60, 60, 0);
      logInfo(`polygonVertexX(i=60, centerX=60, points=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}PolygonVertexX_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0027
     * @tc.name      TsDrawingSample_PolygonVertexX_0027
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=1) returns -16.193038433213033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0027 begin`);
      const actual: number = polygonVertexX(60, 60, 1);
      logInfo(`polygonVertexX(i=60, centerX=60, points=1): actual=${actual}`);
      expect(actual).assertClose(-16.193038433213033, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0028
     * @tc.name      TsDrawingSample_PolygonVertexX_0028
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=-1) returns -16.19303843321198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0028 begin`);
      const actual: number = polygonVertexX(60, 60, -1);
      logInfo(`polygonVertexX(i=60, centerX=60, points=-1): actual=${actual}`);
      expect(actual).assertClose(-16.19303843321198, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0029
     * @tc.name      TsDrawingSample_PolygonVertexX_0029
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=2) returns -16.193038433212763
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0029 begin`);
      const actual: number = polygonVertexX(60, 60, 2);
      logInfo(`polygonVertexX(i=60, centerX=60, points=2): actual=${actual}`);
      expect(actual).assertClose(-16.193038433212763, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0030
     * @tc.name      TsDrawingSample_PolygonVertexX_0030
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=3) returns -16.19303843321292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0030 begin`);
      const actual: number = polygonVertexX(60, 60, 3);
      logInfo(`polygonVertexX(i=60, centerX=60, points=3): actual=${actual}`);
      expect(actual).assertClose(-16.19303843321292, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0031
     * @tc.name      TsDrawingSample_PolygonVertexX_0031
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=10) returns -16.193038433212692
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0031 begin`);
      const actual: number = polygonVertexX(60, 60, 10);
      logInfo(`polygonVertexX(i=60, centerX=60, points=10): actual=${actual}`);
      expect(actual).assertClose(-16.193038433212692, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0032
     * @tc.name      TsDrawingSample_PolygonVertexX_0032
     * @tc.desc      polygonVertexX(i=60, centerX=60, points=100) returns 106.73631392374485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0032 begin`);
      const actual: number = polygonVertexX(60, 60, 100);
      logInfo(`polygonVertexX(i=60, centerX=60, points=100): actual=${actual}`);
      expect(actual).assertClose(106.73631392374485, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0033
     * @tc.name      TsDrawingSample_PolygonVertexX_0033
     * @tc.desc      polygonVertexX(i=61, centerX=100, points=30) returns 72.5399747006693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0033 begin`);
      const actual: number = polygonVertexX(61, 100, 30);
      logInfo(`polygonVertexX(i=61, centerX=100, points=30): actual=${actual}`);
      expect(actual).assertClose(72.5399747006693, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0034
     * @tc.name      TsDrawingSample_PolygonVertexX_0034
     * @tc.desc      polygonVertexX(i=2, centerX=30, points=1) returns -46.19303843321234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0034 begin`);
      const actual: number = polygonVertexX(2, 30, 1);
      logInfo(`polygonVertexX(i=2, centerX=30, points=1): actual=${actual}`);
      expect(actual).assertClose(-46.19303843321234, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0035
     * @tc.name      TsDrawingSample_PolygonVertexX_0035
     * @tc.desc      polygonVertexX(i=30, centerX=3, points=100) returns -22.05738651538195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0035 begin`);
      const actual: number = polygonVertexX(30, 3, 100);
      logInfo(`polygonVertexX(i=30, centerX=3, points=100): actual=${actual}`);
      expect(actual).assertClose(-22.05738651538195, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0036
     * @tc.name      TsDrawingSample_PolygonVertexX_0036
     * @tc.desc      polygonVertexX(i=30, centerX=3, points=60) returns 27.384849688177468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0036 begin`);
      const actual: number = polygonVertexX(30, 3, 60);
      logInfo(`polygonVertexX(i=30, centerX=3, points=60): actual=${actual}`);
      expect(actual).assertClose(27.384849688177468, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0037
     * @tc.name      TsDrawingSample_PolygonVertexX_0037
     * @tc.desc      polygonVertexX(i=100, centerX=61, points=30) returns 77.97861991917948
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0037 begin`);
      const actual: number = polygonVertexX(100, 61, 30);
      logInfo(`polygonVertexX(i=100, centerX=61, points=30): actual=${actual}`);
      expect(actual).assertClose(77.97861991917948, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0038
     * @tc.name      TsDrawingSample_PolygonVertexX_0038
     * @tc.desc      polygonVertexX(i=10, centerX=2, points=-1) returns -74.19303843321246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0038 begin`);
      const actual: number = polygonVertexX(10, 2, -1);
      logInfo(`polygonVertexX(i=10, centerX=2, points=-1): actual=${actual}`);
      expect(actual).assertClose(-74.19303843321246, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0039
     * @tc.name      TsDrawingSample_PolygonVertexX_0039
     * @tc.desc      polygonVertexX(i=0, centerX=61, points=120) returns -15.193038433212507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0039 begin`);
      const actual: number = polygonVertexX(0, 61, 120);
      logInfo(`polygonVertexX(i=0, centerX=61, points=120): actual=${actual}`);
      expect(actual).assertClose(-15.193038433212507, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0040
     * @tc.name      TsDrawingSample_PolygonVertexX_0040
     * @tc.desc      polygonVertexX(i=100, centerX=60, points=1) returns -16.19303843321245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0040 begin`);
      const actual: number = polygonVertexX(100, 60, 1);
      logInfo(`polygonVertexX(i=100, centerX=60, points=1): actual=${actual}`);
      expect(actual).assertClose(-16.19303843321245, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0041
     * @tc.name      TsDrawingSample_PolygonVertexX_0041
     * @tc.desc      polygonVertexX(i=-1, centerX=0, points=2) returns -9.144318633066453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0041 begin`);
      const actual: number = polygonVertexX(-1, 0, 2);
      logInfo(`polygonVertexX(i=-1, centerX=0, points=2): actual=${actual}`);
      expect(actual).assertClose(-9.144318633066453, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0042
     * @tc.name      TsDrawingSample_PolygonVertexX_0042
     * @tc.desc      polygonVertexX(i=2, centerX=10, points=100) returns -64.51155149594368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0042 begin`);
      const actual: number = polygonVertexX(2, 10, 100);
      logInfo(`polygonVertexX(i=2, centerX=10, points=100): actual=${actual}`);
      expect(actual).assertClose(-64.51155149594368, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0043
     * @tc.name      TsDrawingSample_PolygonVertexX_0043
     * @tc.desc      polygonVertexX(i=0, centerX=120, points=-1) returns 43.80696156678749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0043 begin`);
      const actual: number = polygonVertexX(0, 120, -1);
      logInfo(`polygonVertexX(i=0, centerX=120, points=-1): actual=${actual}`);
      expect(actual).assertClose(43.80696156678749, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0044
     * @tc.name      TsDrawingSample_PolygonVertexX_0044
     * @tc.desc      polygonVertexX(i=60, centerX=2, points=2) returns -74.19303843321276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0044 begin`);
      const actual: number = polygonVertexX(60, 2, 2);
      logInfo(`polygonVertexX(i=60, centerX=2, points=2): actual=${actual}`);
      expect(actual).assertClose(-74.19303843321276, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0045
     * @tc.name      TsDrawingSample_PolygonVertexX_0045
     * @tc.desc      polygonVertexX(i=120, centerX=-1, points=60) returns -77.19303843321268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0045 begin`);
      const actual: number = polygonVertexX(120, -1, 60);
      logInfo(`polygonVertexX(i=120, centerX=-1, points=60): actual=${actual}`);
      expect(actual).assertClose(-77.19303843321268, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0046
     * @tc.name      TsDrawingSample_PolygonVertexX_0046
     * @tc.desc      polygonVertexX(i=0, centerX=3, points=-1) returns -73.19303843321251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0046 begin`);
      const actual: number = polygonVertexX(0, 3, -1);
      logInfo(`polygonVertexX(i=0, centerX=3, points=-1): actual=${actual}`);
      expect(actual).assertClose(-73.19303843321251, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0047
     * @tc.name      TsDrawingSample_PolygonVertexX_0047
     * @tc.desc      polygonVertexX(i=59, centerX=-1, points=10) returns -30.999706996434725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0047 begin`);
      const actual: number = polygonVertexX(59, -1, 10);
      logInfo(`polygonVertexX(i=59, centerX=-1, points=10): actual=${actual}`);
      expect(actual).assertClose(-30.999706996434725, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0048
     * @tc.name      TsDrawingSample_PolygonVertexX_0048
     * @tc.desc      polygonVertexX(i=0, centerX=100, points=120) returns 23.806961566787493
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0048 begin`);
      const actual: number = polygonVertexX(0, 100, 120);
      logInfo(`polygonVertexX(i=0, centerX=100, points=120): actual=${actual}`);
      expect(actual).assertClose(23.806961566787493, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0049
     * @tc.name      TsDrawingSample_PolygonVertexX_0049
     * @tc.desc      polygonVertexX(i=59, centerX=3, points=2) returns -6.144318633066348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0049 begin`);
      const actual: number = polygonVertexX(59, 3, 2);
      logInfo(`polygonVertexX(i=59, centerX=3, points=2): actual=${actual}`);
      expect(actual).assertClose(-6.144318633066348, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0050
     * @tc.name      TsDrawingSample_PolygonVertexX_0050
     * @tc.desc      polygonVertexX(i=3, centerX=-1, points=100) returns -28.58502773386271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0050 begin`);
      const actual: number = polygonVertexX(3, -1, 100);
      logInfo(`polygonVertexX(i=3, centerX=-1, points=100): actual=${actual}`);
      expect(actual).assertClose(-28.58502773386271, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0051
     * @tc.name      TsDrawingSample_PolygonVertexX_0051
     * @tc.desc      polygonVertexX(i=3, centerX=120, points=120) returns 92.23314469954866
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0051 begin`);
      const actual: number = polygonVertexX(3, 120, 120);
      logInfo(`polygonVertexX(i=3, centerX=120, points=120): actual=${actual}`);
      expect(actual).assertClose(92.23314469954866, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0052
     * @tc.name      TsDrawingSample_PolygonVertexX_0052
     * @tc.desc      polygonVertexX(i=1, centerX=61, points=-1) returns 89.57238941245473
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0052 begin`);
      const actual: number = polygonVertexX(1, 61, -1);
      logInfo(`polygonVertexX(i=1, centerX=61, points=-1): actual=${actual}`);
      expect(actual).assertClose(89.57238941245473, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0053
     * @tc.name      TsDrawingSample_PolygonVertexX_0053
     * @tc.desc      polygonVertexX(i=100, centerX=2, points=30) returns 18.97861991917948
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0053 begin`);
      const actual: number = polygonVertexX(100, 2, 30);
      logInfo(`polygonVertexX(i=100, centerX=2, points=30): actual=${actual}`);
      expect(actual).assertClose(18.97861991917948, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0054
     * @tc.name      TsDrawingSample_PolygonVertexX_0054
     * @tc.desc      polygonVertexX(i=10, centerX=10, points=10) returns 86.19303843321242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0054 begin`);
      const actual: number = polygonVertexX(10, 10, 10);
      logInfo(`polygonVertexX(i=10, centerX=10, points=10): actual=${actual}`);
      expect(actual).assertClose(86.19303843321242, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0055
     * @tc.name      TsDrawingSample_PolygonVertexX_0055
     * @tc.desc      polygonVertexX(i=120, centerX=60, points=1) returns -16.19303843321356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0055 begin`);
      const actual: number = polygonVertexX(120, 60, 1);
      logInfo(`polygonVertexX(i=120, centerX=60, points=1): actual=${actual}`);
      expect(actual).assertClose(-16.19303843321356, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0056
     * @tc.name      TsDrawingSample_PolygonVertexX_0056
     * @tc.desc      polygonVertexX(i=2, centerX=10, points=61) returns -63.28193129223101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0056 begin`);
      const actual: number = polygonVertexX(2, 10, 61);
      logInfo(`polygonVertexX(i=2, centerX=10, points=61): actual=${actual}`);
      expect(actual).assertClose(-63.28193129223101, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0057
     * @tc.name      TsDrawingSample_PolygonVertexX_0057
     * @tc.desc      polygonVertexX(i=1, centerX=3, points=120) returns -25.32322801204592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0057 begin`);
      const actual: number = polygonVertexX(1, 3, 120);
      logInfo(`polygonVertexX(i=1, centerX=3, points=120): actual=${actual}`);
      expect(actual).assertClose(-25.32322801204592, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0058
     * @tc.name      TsDrawingSample_PolygonVertexX_0058
     * @tc.desc      polygonVertexX(i=61, centerX=-1, points=60) returns 27.05465528593447
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0058 begin`);
      const actual: number = polygonVertexX(61, -1, 60);
      logInfo(`polygonVertexX(i=61, centerX=-1, points=60): actual=${actual}`);
      expect(actual).assertClose(27.05465528593447, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0059
     * @tc.name      TsDrawingSample_PolygonVertexX_0059
     * @tc.desc      polygonVertexX(i=59, centerX=30, points=120) returns 38.3932471427731
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0059 begin`);
      const actual: number = polygonVertexX(59, 30, 120);
      logInfo(`polygonVertexX(i=59, centerX=30, points=120): actual=${actual}`);
      expect(actual).assertClose(38.3932471427731, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0060
     * @tc.name      TsDrawingSample_PolygonVertexX_0060
     * @tc.desc      polygonVertexX(i=2, centerX=2, points=100) returns -72.51155149594368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0060 begin`);
      const actual: number = polygonVertexX(2, 2, 100);
      logInfo(`polygonVertexX(i=2, centerX=2, points=100): actual=${actual}`);
      expect(actual).assertClose(-72.51155149594368, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0061
     * @tc.name      TsDrawingSample_PolygonVertexX_0061
     * @tc.desc      polygonVertexX(i=3, centerX=10, points=-1) returns 38.572389412454655
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0061 begin`);
      const actual: number = polygonVertexX(3, 10, -1);
      logInfo(`polygonVertexX(i=3, centerX=10, points=-1): actual=${actual}`);
      expect(actual).assertClose(38.572389412454655, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0062
     * @tc.name      TsDrawingSample_PolygonVertexX_0062
     * @tc.desc      polygonVertexX(i=60, centerX=0, points=1) returns -76.19303843321303
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0062 begin`);
      const actual: number = polygonVertexX(60, 0, 1);
      logInfo(`polygonVertexX(i=60, centerX=0, points=1): actual=${actual}`);
      expect(actual).assertClose(-76.19303843321303, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0063
     * @tc.name      TsDrawingSample_PolygonVertexX_0063
     * @tc.desc      polygonVertexX(i=61, centerX=100, points=120) returns 109.8891230641376
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0063 begin`);
      const actual: number = polygonVertexX(61, 100, 120);
      logInfo(`polygonVertexX(i=61, centerX=100, points=...: actual=${actual}`);
      expect(actual).assertClose(109.8891230641376, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0064
     * @tc.name      TsDrawingSample_PolygonVertexX_0064
     * @tc.desc      polygonVertexX(i=61, centerX=100, points=2) returns 109.14431863306686
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0064 begin`);
      const actual: number = polygonVertexX(61, 100, 2);
      logInfo(`polygonVertexX(i=61, centerX=100, points=2): actual=${actual}`);
      expect(actual).assertClose(109.14431863306686, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0065
     * @tc.name      TsDrawingSample_PolygonVertexX_0065
     * @tc.desc      polygonVertexX(i=100, centerX=59, points=60) returns -0.21441851403292844
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0065 begin`);
      const actual: number = polygonVertexX(100, 59, 60);
      logInfo(`polygonVertexX(i=100, centerX=59, points=60): actual=${actual}`);
      expect(actual).assertClose(-0.21441851403292844, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0066
     * @tc.name      TsDrawingSample_PolygonVertexX_0066
     * @tc.desc      polygonVertexX(i=59, centerX=2, points=2) returns -7.144318633066348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0066 begin`);
      const actual: number = polygonVertexX(59, 2, 2);
      logInfo(`polygonVertexX(i=59, centerX=2, points=2): actual=${actual}`);
      expect(actual).assertClose(-7.144318633066348, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0067
     * @tc.name      TsDrawingSample_PolygonVertexX_0067
     * @tc.desc      polygonVertexX(i=0, centerX=30, points=-1) returns -46.19303843321251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0067 begin`);
      const actual: number = polygonVertexX(0, 30, -1);
      logInfo(`polygonVertexX(i=0, centerX=30, points=-1): actual=${actual}`);
      expect(actual).assertClose(-46.19303843321251, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0068
     * @tc.name      TsDrawingSample_PolygonVertexX_0068
     * @tc.desc      polygonVertexX(i=59, centerX=59, points=61) returns 88.3611801545739
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0068 begin`);
      const actual: number = polygonVertexX(59, 59, 61);
      logInfo(`polygonVertexX(i=59, centerX=59, points=61): actual=${actual}`);
      expect(actual).assertClose(88.3611801545739, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0069
     * @tc.name      TsDrawingSample_PolygonVertexX_0069
     * @tc.desc      polygonVertexX(i=100, centerX=61, points=3) returns 77.9786199191781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0069 begin`);
      const actual: number = polygonVertexX(100, 61, 3);
      logInfo(`polygonVertexX(i=100, centerX=61, points=3): actual=${actual}`);
      expect(actual).assertClose(77.9786199191781, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0070
     * @tc.name      TsDrawingSample_PolygonVertexX_0070
     * @tc.desc      polygonVertexX(i=2, centerX=60, points=120) returns -14.812414095825147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0070 begin`);
      const actual: number = polygonVertexX(2, 60, 120);
      logInfo(`polygonVertexX(i=2, centerX=60, points=120): actual=${actual}`);
      expect(actual).assertClose(-14.812414095825147, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0071
     * @tc.name      TsDrawingSample_PolygonVertexX_0071
     * @tc.desc      polygonVertexX(i=100, centerX=100, points=59) returns 36.25101057266808
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0071 begin`);
      const actual: number = polygonVertexX(100, 100, 59);
      logInfo(`polygonVertexX(i=100, centerX=100, points...: actual=${actual}`);
      expect(actual).assertClose(36.25101057266808, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0072
     * @tc.name      TsDrawingSample_PolygonVertexX_0072
     * @tc.desc      polygonVertexX(i=59, centerX=-1, points=59) returns 27.572389412454655
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0072 begin`);
      const actual: number = polygonVertexX(59, -1, 59);
      logInfo(`polygonVertexX(i=59, centerX=-1, points=59): actual=${actual}`);
      expect(actual).assertClose(27.572389412454655, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0073
     * @tc.name      TsDrawingSample_PolygonVertexX_0073
     * @tc.desc      polygonVertexX(i=100, centerX=1, points=30) returns 17.97861991917948
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexX_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0073 begin`);
      const actual: number = polygonVertexX(100, 1, 30);
      logInfo(`polygonVertexX(i=100, centerX=1, points=30): actual=${actual}`);
      expect(actual).assertClose(17.97861991917948, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0074
     * @tc.name      TsDrawingSample_PolygonVertexX_0074
     * @tc.desc      polygonVertexX(i=3, centerX=60, points=-1) returns 88.57238941245465
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexX_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0074 begin`);
      const actual: number = polygonVertexX(3, 60, -1);
      logInfo(`polygonVertexX(i=3, centerX=60, points=-1): actual=${actual}`);
      expect(actual).assertClose(88.57238941245465, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0074 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_X_0075
     * @tc.name      TsDrawingSample_PolygonVertexX_0075
     * @tc.desc      polygonVertexX(i=60, centerX=59, points=1) returns -17.193038433213033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexX_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexX_0075 begin`);
      const actual: number = polygonVertexX(60, 59, 1);
      logInfo(`polygonVertexX(i=60, centerX=59, points=1): actual=${actual}`);
      expect(actual).assertClose(-17.193038433213033, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexX_0075 end`);
    });
  });
}
