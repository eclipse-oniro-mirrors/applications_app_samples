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
import { polygonAngleOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for polygonAngleOf (75 cases). */
export default function polygonAngleOfTest(): void {
  describe('PolygonAngleOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0001
     * @tc.name      TsDrawingSample_PolygonAngleOf_0001
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=3.141592653589793) returns 3.141592653589793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonAngleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0001 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 3.141592653589793);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(3.141592653589793, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0002
     * @tc.name      TsDrawingSample_PolygonAngleOf_0002
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=6.283185307179586) returns 1.5707963267948966
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonAngleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0002 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 6.283185307179586);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(1.5707963267948966, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0003
     * @tc.name      TsDrawingSample_PolygonAngleOf_0003
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=1.5707963267948966) returns 6.283185307179586
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0003 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 1.5707963267948966);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(6.283185307179586, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0004
     * @tc.name      TsDrawingSample_PolygonAngleOf_0004
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=0) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0004 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 0);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}PolygonAngleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0005
     * @tc.name      TsDrawingSample_PolygonAngleOf_0005
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=1) returns 9.869604401089358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0005 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 1);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(9.869604401089358, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0006
     * @tc.name      TsDrawingSample_PolygonAngleOf_0006
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=-1) returns -9.869604401089358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonAngleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0006 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, -1);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(-9.869604401089358, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0007
     * @tc.name      TsDrawingSample_PolygonAngleOf_0007
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=2) returns 4.934802200544679
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0007 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 2);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(4.934802200544679, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0008
     * @tc.name      TsDrawingSample_PolygonAngleOf_0008
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=3) returns 3.289868133696453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0008 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 3);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(3.289868133696453, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0009
     * @tc.name      TsDrawingSample_PolygonAngleOf_0009
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=10) returns 0.9869604401089358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0009 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 10);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.9869604401089358, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0010
     * @tc.name      TsDrawingSample_PolygonAngleOf_0010
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=100) returns 0.09869604401089357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0010 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 100);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.09869604401089357, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0011
     * @tc.name      TsDrawingSample_PolygonAngleOf_0011
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=5) returns 1.9739208802178716
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0011 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 5);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(1.9739208802178716, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0012
     * @tc.name      TsDrawingSample_PolygonAngleOf_0012
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=15) returns 0.6579736267392905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0012 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 15);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.6579736267392905, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0013
     * @tc.name      TsDrawingSample_PolygonAngleOf_0013
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=20) returns 0.4934802200544679
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0013 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 20);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.4934802200544679, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0014
     * @tc.name      TsDrawingSample_PolygonAngleOf_0014
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=25) returns 0.3947841760435743
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0014 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 25);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.3947841760435743, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0015
     * @tc.name      TsDrawingSample_PolygonAngleOf_0015
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=30) returns 0.32898681336964525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0015 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 30);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.32898681336964525, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0016
     * @tc.name      TsDrawingSample_PolygonAngleOf_0016
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=35) returns 0.2819886971739817
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0016 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 35);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.2819886971739817, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0017
     * @tc.name      TsDrawingSample_PolygonAngleOf_0017
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=40) returns 0.24674011002723395
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0017 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 40);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.24674011002723395, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0018
     * @tc.name      TsDrawingSample_PolygonAngleOf_0018
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=45) returns 0.21932454224643017
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0018 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 45);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.21932454224643017, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0019
     * @tc.name      TsDrawingSample_PolygonAngleOf_0019
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=50) returns 0.19739208802178715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0019 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 50);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.19739208802178715, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0020
     * @tc.name      TsDrawingSample_PolygonAngleOf_0020
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=55) returns 0.17944735274707924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0020 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 55);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.17944735274707924, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0021
     * @tc.name      TsDrawingSample_PolygonAngleOf_0021
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=60) returns 0.16449340668482262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0021 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 60);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.16449340668482262, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0022
     * @tc.name      TsDrawingSample_PolygonAngleOf_0022
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=65) returns 0.15184006770906705
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0022 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 65);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.15184006770906705, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0023
     * @tc.name      TsDrawingSample_PolygonAngleOf_0023
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=70) returns 0.14099434858699084
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0023 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 70);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.14099434858699084, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0024
     * @tc.name      TsDrawingSample_PolygonAngleOf_0024
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=75) returns 0.1315947253478581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0024 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 75);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.1315947253478581, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0025
     * @tc.name      TsDrawingSample_PolygonAngleOf_0025
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=80) returns 0.12337005501361697
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0025 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 80);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.12337005501361697, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0026
     * @tc.name      TsDrawingSample_PolygonAngleOf_0026
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=85) returns 0.11611299295399245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0026 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 85);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.11611299295399245, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0027
     * @tc.name      TsDrawingSample_PolygonAngleOf_0027
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=90) returns 0.10966227112321508
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0027 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 90);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.10966227112321508, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0028
     * @tc.name      TsDrawingSample_PolygonAngleOf_0028
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=95) returns 0.10389057264304587
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0028 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 95);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.10389057264304587, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0029
     * @tc.name      TsDrawingSample_PolygonAngleOf_0029
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=105) returns 0.09399623239132722
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0029 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 105);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.09399623239132722, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0030
     * @tc.name      TsDrawingSample_PolygonAngleOf_0030
     * @tc.desc      polygonAngleOf(i=3.141592653589793, points=110) returns 0.08972367637353962
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0030 begin`);
      const actual: number = polygonAngleOf(3.141592653589793, 110);
      logInfo(`polygonAngleOf(i=3.141592653589793, point...: actual=${actual}`);
      expect(actual).assertClose(0.08972367637353962, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0031
     * @tc.name      TsDrawingSample_PolygonAngleOf_0031
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=1.5707963267948966) returns 12.566370614359172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0031 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 1.5707963267948966);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(12.566370614359172, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0032
     * @tc.name      TsDrawingSample_PolygonAngleOf_0032
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=1) returns 19.739208802178716
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0032 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 1);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(19.739208802178716, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0033
     * @tc.name      TsDrawingSample_PolygonAngleOf_0033
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=-1) returns -19.739208802178716
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonAngleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0033 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, -1);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(-19.739208802178716, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0034
     * @tc.name      TsDrawingSample_PolygonAngleOf_0034
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=3) returns 6.579736267392906
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0034 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 3);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(6.579736267392906, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0035
     * @tc.name      TsDrawingSample_PolygonAngleOf_0035
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=5) returns 3.947841760435743
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0035 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 5);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(3.947841760435743, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0036
     * @tc.name      TsDrawingSample_PolygonAngleOf_0036
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=15) returns 1.315947253478581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0036 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 15);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(1.315947253478581, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0037
     * @tc.name      TsDrawingSample_PolygonAngleOf_0037
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=25) returns 0.7895683520871486
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0037 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 25);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.7895683520871486, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0038
     * @tc.name      TsDrawingSample_PolygonAngleOf_0038
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=35) returns 0.5639773943479633
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0038 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 35);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.5639773943479633, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0039
     * @tc.name      TsDrawingSample_PolygonAngleOf_0039
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=45) returns 0.43864908449286033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0039 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 45);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.43864908449286033, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0040
     * @tc.name      TsDrawingSample_PolygonAngleOf_0040
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=55) returns 0.3588947054941585
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0040 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 55);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.3588947054941585, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0041
     * @tc.name      TsDrawingSample_PolygonAngleOf_0041
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=65) returns 0.3036801354181341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0041 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 65);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.3036801354181341, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0042
     * @tc.name      TsDrawingSample_PolygonAngleOf_0042
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=75) returns 0.2631894506957162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0042 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 75);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.2631894506957162, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0043
     * @tc.name      TsDrawingSample_PolygonAngleOf_0043
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=85) returns 0.2322259859079849
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0043 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 85);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.2322259859079849, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0044
     * @tc.name      TsDrawingSample_PolygonAngleOf_0044
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=95) returns 0.20778114528609173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0044 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 95);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.20778114528609173, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0045
     * @tc.name      TsDrawingSample_PolygonAngleOf_0045
     * @tc.desc      polygonAngleOf(i=6.283185307179586, points=105) returns 0.18799246478265444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0045 begin`);
      const actual: number = polygonAngleOf(6.283185307179586, 105);
      logInfo(`polygonAngleOf(i=6.283185307179586, point...: actual=${actual}`);
      expect(actual).assertClose(0.18799246478265444, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0046
     * @tc.name      TsDrawingSample_PolygonAngleOf_0046
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=6.283185307179586) returns 0.7853981633974483
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0046 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 6.283185307179586);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.7853981633974483, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0047
     * @tc.name      TsDrawingSample_PolygonAngleOf_0047
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=-1) returns -4.934802200544679
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonAngleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0047 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, -1);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(-4.934802200544679, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0048
     * @tc.name      TsDrawingSample_PolygonAngleOf_0048
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=2) returns 2.4674011002723395
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0048 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 2);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(2.4674011002723395, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0049
     * @tc.name      TsDrawingSample_PolygonAngleOf_0049
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=3) returns 1.6449340668482264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0049 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 3);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(1.6449340668482264, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0050
     * @tc.name      TsDrawingSample_PolygonAngleOf_0050
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=100) returns 0.04934802200544679
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0050 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 100);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.04934802200544679, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0051
     * @tc.name      TsDrawingSample_PolygonAngleOf_0051
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=60) returns 0.08224670334241131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0051 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 60);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.08224670334241131, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0052
     * @tc.name      TsDrawingSample_PolygonAngleOf_0052
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=65) returns 0.07592003385453353
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0052 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 65);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.07592003385453353, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0053
     * @tc.name      TsDrawingSample_PolygonAngleOf_0053
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=70) returns 0.07049717429349542
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0053 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 70);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.07049717429349542, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0054
     * @tc.name      TsDrawingSample_PolygonAngleOf_0054
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=75) returns 0.06579736267392905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0054 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 75);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.06579736267392905, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0055
     * @tc.name      TsDrawingSample_PolygonAngleOf_0055
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=80) returns 0.06168502750680849
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0055 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 80);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.06168502750680849, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0056
     * @tc.name      TsDrawingSample_PolygonAngleOf_0056
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=85) returns 0.058056496476996226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0056 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 85);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.058056496476996226, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0057
     * @tc.name      TsDrawingSample_PolygonAngleOf_0057
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=90) returns 0.05483113556160754
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0057 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 90);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.05483113556160754, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0058
     * @tc.name      TsDrawingSample_PolygonAngleOf_0058
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=95) returns 0.051945286321522934
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0058 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 95);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.051945286321522934, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0059
     * @tc.name      TsDrawingSample_PolygonAngleOf_0059
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=105) returns 0.04699811619566361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0059 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 105);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.04699811619566361, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0060
     * @tc.name      TsDrawingSample_PolygonAngleOf_0060
     * @tc.desc      polygonAngleOf(i=1.5707963267948966, points=110) returns 0.04486183818676981
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0060 begin`);
      const actual: number = polygonAngleOf(1.5707963267948966, 110);
      logInfo(`polygonAngleOf(i=1.5707963267948966, poin...: actual=${actual}`);
      expect(actual).assertClose(0.04486183818676981, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0061
     * @tc.name      TsDrawingSample_PolygonAngleOf_0061
     * @tc.desc      polygonAngleOf(i=0, points=3.141592653589793) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0061 begin`);
      const actual: number = polygonAngleOf(0, 3.141592653589793);
      logInfo(`polygonAngleOf(i=0, points=3.141592653589...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonAngleOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0062
     * @tc.name      TsDrawingSample_PolygonAngleOf_0062
     * @tc.desc      polygonAngleOf(i=0, points=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0062 begin`);
      const actual: number = polygonAngleOf(0, 0);
      logInfo(`polygonAngleOf(i=0, points=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}PolygonAngleOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0063
     * @tc.name      TsDrawingSample_PolygonAngleOf_0063
     * @tc.desc      polygonAngleOf(i=1, points=3.141592653589793) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonAngleOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0063 begin`);
      const actual: number = polygonAngleOf(1, 3.141592653589793);
      logInfo(`polygonAngleOf(i=1, points=3.141592653589...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PolygonAngleOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0064
     * @tc.name      TsDrawingSample_PolygonAngleOf_0064
     * @tc.desc      polygonAngleOf(i=1, points=6.283185307179586) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0064 begin`);
      const actual: number = polygonAngleOf(1, 6.283185307179586);
      logInfo(`polygonAngleOf(i=1, points=6.283185307179...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0065
     * @tc.name      TsDrawingSample_PolygonAngleOf_0065
     * @tc.desc      polygonAngleOf(i=1, points=1.5707963267948966) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0065 begin`);
      const actual: number = polygonAngleOf(1, 1.5707963267948966);
      logInfo(`polygonAngleOf(i=1, points=1.570796326794...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PolygonAngleOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0066
     * @tc.name      TsDrawingSample_PolygonAngleOf_0066
     * @tc.desc      polygonAngleOf(i=1, points=-1) returns -3.141592653589793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonAngleOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0066 begin`);
      const actual: number = polygonAngleOf(1, -1);
      logInfo(`polygonAngleOf(i=1, points=-1): actual=${actual}`);
      expect(actual).assertClose(-3.141592653589793, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0067
     * @tc.name      TsDrawingSample_PolygonAngleOf_0067
     * @tc.desc      polygonAngleOf(i=1, points=3) returns 1.0471975511965976
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0067 begin`);
      const actual: number = polygonAngleOf(1, 3);
      logInfo(`polygonAngleOf(i=1, points=3): actual=${actual}`);
      expect(actual).assertClose(1.0471975511965976, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0068
     * @tc.name      TsDrawingSample_PolygonAngleOf_0068
     * @tc.desc      polygonAngleOf(i=1, points=10) returns 0.3141592653589793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0068 begin`);
      const actual: number = polygonAngleOf(1, 10);
      logInfo(`polygonAngleOf(i=1, points=10): actual=${actual}`);
      expect(actual).assertClose(0.3141592653589793, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0069
     * @tc.name      TsDrawingSample_PolygonAngleOf_0069
     * @tc.desc      polygonAngleOf(i=1, points=100) returns 0.031415926535897934
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0069 begin`);
      const actual: number = polygonAngleOf(1, 100);
      logInfo(`polygonAngleOf(i=1, points=100): actual=${actual}`);
      expect(actual).assertClose(0.031415926535897934, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0070
     * @tc.name      TsDrawingSample_PolygonAngleOf_0070
     * @tc.desc      polygonAngleOf(i=1, points=5) returns 0.6283185307179586
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0070 begin`);
      const actual: number = polygonAngleOf(1, 5);
      logInfo(`polygonAngleOf(i=1, points=5): actual=${actual}`);
      expect(actual).assertClose(0.6283185307179586, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0071
     * @tc.name      TsDrawingSample_PolygonAngleOf_0071
     * @tc.desc      polygonAngleOf(i=1, points=15) returns 0.20943951023931953
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0071 begin`);
      const actual: number = polygonAngleOf(1, 15);
      logInfo(`polygonAngleOf(i=1, points=15): actual=${actual}`);
      expect(actual).assertClose(0.20943951023931953, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0072
     * @tc.name      TsDrawingSample_PolygonAngleOf_0072
     * @tc.desc      polygonAngleOf(i=1, points=20) returns 0.15707963267948966
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0072 begin`);
      const actual: number = polygonAngleOf(1, 20);
      logInfo(`polygonAngleOf(i=1, points=20): actual=${actual}`);
      expect(actual).assertClose(0.15707963267948966, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0073
     * @tc.name      TsDrawingSample_PolygonAngleOf_0073
     * @tc.desc      polygonAngleOf(i=1, points=25) returns 0.12566370614359174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0073 begin`);
      const actual: number = polygonAngleOf(1, 25);
      logInfo(`polygonAngleOf(i=1, points=25): actual=${actual}`);
      expect(actual).assertClose(0.12566370614359174, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0074
     * @tc.name      TsDrawingSample_PolygonAngleOf_0074
     * @tc.desc      polygonAngleOf(i=1, points=30) returns 0.10471975511965977
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0074 begin`);
      const actual: number = polygonAngleOf(1, 30);
      logInfo(`polygonAngleOf(i=1, points=30): actual=${actual}`);
      expect(actual).assertClose(0.10471975511965977, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_ANGLE_OF_0075
     * @tc.name      TsDrawingSample_PolygonAngleOf_0075
     * @tc.desc      polygonAngleOf(i=1, points=35) returns 0.08975979010256552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonAngleOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonAngleOf_0075 begin`);
      const actual: number = polygonAngleOf(1, 35);
      logInfo(`polygonAngleOf(i=1, points=35): actual=${actual}`);
      expect(actual).assertClose(0.08975979010256552, PRECISION);
      logInfo(`${BUNDLE}PolygonAngleOf_0075 end`);
    });
  });
}
