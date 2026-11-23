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
import { polygonRadiusOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for polygonRadiusOf (75 cases). */
export default function polygonRadiusOfTest(): void {
  describe('PolygonRadiusOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0001
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0001
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonRadiusOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0001 begin`);
      const actual: number = polygonRadiusOf(2, 0, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0002
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0002
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=200, innerRadius=0) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonRadiusOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0002 begin`);
      const actual: number = polygonRadiusOf(2, 200, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=200, inn...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}PolygonRadiusOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0003
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0003
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=2, innerRadius=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0003 begin`);
      const actual: number = polygonRadiusOf(2, 2, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=2, inner...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PolygonRadiusOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0004
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0004
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=1, innerRadius=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0004 begin`);
      const actual: number = polygonRadiusOf(2, 1, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=1, inner...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0005
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0005
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=3, innerRadius=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0005 begin`);
      const actual: number = polygonRadiusOf(2, 3, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=3, inner...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PolygonRadiusOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0006
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0006
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=-1, innerRadius=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0006 begin`);
      const actual: number = polygonRadiusOf(2, -1, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=-1, inne...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0007
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0007
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=401, innerRadius=0) returns 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0007 begin`);
      const actual: number = polygonRadiusOf(2, 401, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=401, inn...: actual=${actual}`);
      expect(actual).assertEqual(401);
      logInfo(`${BUNDLE}PolygonRadiusOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0008
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0008
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=404, innerRadius=0) returns 404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0008 begin`);
      const actual: number = polygonRadiusOf(2, 404, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=404, inn...: actual=${actual}`);
      expect(actual).assertEqual(404);
      logInfo(`${BUNDLE}PolygonRadiusOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0009
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0009
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=500, innerRadius=0) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0009 begin`);
      const actual: number = polygonRadiusOf(2, 500, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=500, inn...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}PolygonRadiusOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0010
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0010
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=10, innerRadius=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0010 begin`);
      const actual: number = polygonRadiusOf(2, 10, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=10, inne...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PolygonRadiusOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0011
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0011
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=100, innerRadius=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0011 begin`);
      const actual: number = polygonRadiusOf(2, 100, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=100, inn...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PolygonRadiusOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0012
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0012
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=25, innerRadius=0) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0012 begin`);
      const actual: number = polygonRadiusOf(2, 25, 0);
      logInfo(`polygonRadiusOf(i=2, outerRadius=25, inne...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0013
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0013
     * @tc.desc      polygonRadiusOf(i=1, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0013 begin`);
      const actual: number = polygonRadiusOf(1, 0, 0);
      logInfo(`polygonRadiusOf(i=1, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0014
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0014
     * @tc.desc      polygonRadiusOf(i=3, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0014 begin`);
      const actual: number = polygonRadiusOf(3, 0, 0);
      logInfo(`polygonRadiusOf(i=3, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0015
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0015
     * @tc.desc      polygonRadiusOf(i=0, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0015 begin`);
      const actual: number = polygonRadiusOf(0, 0, 0);
      logInfo(`polygonRadiusOf(i=0, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0016
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0016
     * @tc.desc      polygonRadiusOf(i=-1, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0016 begin`);
      const actual: number = polygonRadiusOf(-1, 0, 0);
      logInfo(`polygonRadiusOf(i=-1, outerRadius=0, inne...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0017
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0017
     * @tc.desc      polygonRadiusOf(i=10, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0017 begin`);
      const actual: number = polygonRadiusOf(10, 0, 0);
      logInfo(`polygonRadiusOf(i=10, outerRadius=0, inne...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0018
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0018
     * @tc.desc      polygonRadiusOf(i=100, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0018 begin`);
      const actual: number = polygonRadiusOf(100, 0, 0);
      logInfo(`polygonRadiusOf(i=100, outerRadius=0, inn...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0019
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0019
     * @tc.desc      polygonRadiusOf(i=5, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0019 begin`);
      const actual: number = polygonRadiusOf(5, 0, 0);
      logInfo(`polygonRadiusOf(i=5, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0020
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0020
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0020 begin`);
      const actual: number = polygonRadiusOf(15, 0, 0);
      logInfo(`polygonRadiusOf(i=15, outerRadius=0, inne...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0021
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0021
     * @tc.desc      polygonRadiusOf(i=20, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0021 begin`);
      const actual: number = polygonRadiusOf(20, 0, 0);
      logInfo(`polygonRadiusOf(i=20, outerRadius=0, inne...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0022
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0022
     * @tc.desc      polygonRadiusOf(i=25, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0022 begin`);
      const actual: number = polygonRadiusOf(25, 0, 0);
      logInfo(`polygonRadiusOf(i=25, outerRadius=0, inne...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0023
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0023
     * @tc.desc      polygonRadiusOf(i=135, outerRadius=0, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0023 begin`);
      const actual: number = polygonRadiusOf(135, 0, 0);
      logInfo(`polygonRadiusOf(i=135, outerRadius=0, inn...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0024
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0024
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=200) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0024 begin`);
      const actual: number = polygonRadiusOf(2, 0, 200);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0025
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0025
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0025 begin`);
      const actual: number = polygonRadiusOf(2, 0, 2);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0026
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0026
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0026 begin`);
      const actual: number = polygonRadiusOf(2, 0, 1);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0027
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0027
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0027 begin`);
      const actual: number = polygonRadiusOf(2, 0, 3);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0028
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0028
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0028 begin`);
      const actual: number = polygonRadiusOf(2, 0, -1);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0029
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0029
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=401) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0029 begin`);
      const actual: number = polygonRadiusOf(2, 0, 401);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0030
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0030
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=404) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0030 begin`);
      const actual: number = polygonRadiusOf(2, 0, 404);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0031
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0031
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=500) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0031 begin`);
      const actual: number = polygonRadiusOf(2, 0, 500);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0032
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0032
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0032 begin`);
      const actual: number = polygonRadiusOf(2, 0, 10);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0033
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0033
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0033 begin`);
      const actual: number = polygonRadiusOf(2, 0, 100);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0034
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0034
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=0, innerRadius=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0034 begin`);
      const actual: number = polygonRadiusOf(2, 0, 25);
      logInfo(`polygonRadiusOf(i=2, outerRadius=0, inner...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0035
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0035
     * @tc.desc      polygonRadiusOf(i=1, outerRadius=401, innerRadius=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0035 begin`);
      const actual: number = polygonRadiusOf(1, 401, 1);
      logInfo(`polygonRadiusOf(i=1, outerRadius=401, inn...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0036
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0036
     * @tc.desc      polygonRadiusOf(i=20, outerRadius=3, innerRadius=200) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0036 begin`);
      const actual: number = polygonRadiusOf(20, 3, 200);
      logInfo(`polygonRadiusOf(i=20, outerRadius=3, inne...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PolygonRadiusOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0037
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0037
     * @tc.desc      polygonRadiusOf(i=3, outerRadius=2, innerRadius=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0037 begin`);
      const actual: number = polygonRadiusOf(3, 2, -1);
      logInfo(`polygonRadiusOf(i=3, outerRadius=2, inner...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0038
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0038
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=100, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0038 begin`);
      const actual: number = polygonRadiusOf(15, 100, 0);
      logInfo(`polygonRadiusOf(i=15, outerRadius=100, in...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0039
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0039
     * @tc.desc      polygonRadiusOf(i=-1, outerRadius=2, innerRadius=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0039 begin`);
      const actual: number = polygonRadiusOf(-1, 2, -1);
      logInfo(`polygonRadiusOf(i=-1, outerRadius=2, inne...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0040
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0040
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=1, innerRadius=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0040 begin`);
      const actual: number = polygonRadiusOf(15, 1, 2);
      logInfo(`polygonRadiusOf(i=15, outerRadius=1, inne...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PolygonRadiusOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0041
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0041
     * @tc.desc      polygonRadiusOf(i=5, outerRadius=404, innerRadius=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0041 begin`);
      const actual: number = polygonRadiusOf(5, 404, 25);
      logInfo(`polygonRadiusOf(i=5, outerRadius=404, inn...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0042
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0042
     * @tc.desc      polygonRadiusOf(i=0, outerRadius=1, innerRadius=401) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0042 begin`);
      const actual: number = polygonRadiusOf(0, 1, 401);
      logInfo(`polygonRadiusOf(i=0, outerRadius=1, inner...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0043
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0043
     * @tc.desc      polygonRadiusOf(i=-1, outerRadius=404, innerRadius=500) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0043 begin`);
      const actual: number = polygonRadiusOf(-1, 404, 500);
      logInfo(`polygonRadiusOf(i=-1, outerRadius=404, in...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}PolygonRadiusOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0044
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0044
     * @tc.desc      polygonRadiusOf(i=3, outerRadius=401, innerRadius=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0044 begin`);
      const actual: number = polygonRadiusOf(3, 401, 2);
      logInfo(`polygonRadiusOf(i=3, outerRadius=401, inn...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PolygonRadiusOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0045
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0045
     * @tc.desc      polygonRadiusOf(i=10, outerRadius=3, innerRadius=25) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0045 begin`);
      const actual: number = polygonRadiusOf(10, 3, 25);
      logInfo(`polygonRadiusOf(i=10, outerRadius=3, inne...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PolygonRadiusOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0046
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0046
     * @tc.desc      polygonRadiusOf(i=20, outerRadius=10, innerRadius=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0046 begin`);
      const actual: number = polygonRadiusOf(20, 10, 10);
      logInfo(`polygonRadiusOf(i=20, outerRadius=10, inn...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PolygonRadiusOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0047
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0047
     * @tc.desc      polygonRadiusOf(i=25, outerRadius=1, innerRadius=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0047 begin`);
      const actual: number = polygonRadiusOf(25, 1, 25);
      logInfo(`polygonRadiusOf(i=25, outerRadius=1, inne...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0048
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0048
     * @tc.desc      polygonRadiusOf(i=20, outerRadius=10, innerRadius=500) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0048 begin`);
      const actual: number = polygonRadiusOf(20, 10, 500);
      logInfo(`polygonRadiusOf(i=20, outerRadius=10, inn...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PolygonRadiusOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0049
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0049
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=404, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0049 begin`);
      const actual: number = polygonRadiusOf(15, 404, 0);
      logInfo(`polygonRadiusOf(i=15, outerRadius=404, in...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0050
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0050
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=25, innerRadius=401) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0050 begin`);
      const actual: number = polygonRadiusOf(2, 25, 401);
      logInfo(`polygonRadiusOf(i=2, outerRadius=25, inne...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0051
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0051
     * @tc.desc      polygonRadiusOf(i=3, outerRadius=404, innerRadius=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0051 begin`);
      const actual: number = polygonRadiusOf(3, 404, 0);
      logInfo(`polygonRadiusOf(i=3, outerRadius=404, inn...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0052
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0052
     * @tc.desc      polygonRadiusOf(i=135, outerRadius=1, innerRadius=404) returns 404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0052 begin`);
      const actual: number = polygonRadiusOf(135, 1, 404);
      logInfo(`polygonRadiusOf(i=135, outerRadius=1, inn...: actual=${actual}`);
      expect(actual).assertEqual(404);
      logInfo(`${BUNDLE}PolygonRadiusOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0053
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0053
     * @tc.desc      polygonRadiusOf(i=1, outerRadius=10, innerRadius=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0053 begin`);
      const actual: number = polygonRadiusOf(1, 10, 100);
      logInfo(`polygonRadiusOf(i=1, outerRadius=10, inne...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PolygonRadiusOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0054
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0054
     * @tc.desc      polygonRadiusOf(i=0, outerRadius=3, innerRadius=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0054 begin`);
      const actual: number = polygonRadiusOf(0, 3, 100);
      logInfo(`polygonRadiusOf(i=0, outerRadius=3, inner...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PolygonRadiusOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0055
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0055
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=200, innerRadius=-1) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0055 begin`);
      const actual: number = polygonRadiusOf(2, 200, -1);
      logInfo(`polygonRadiusOf(i=2, outerRadius=200, inn...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}PolygonRadiusOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0056
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0056
     * @tc.desc      polygonRadiusOf(i=100, outerRadius=100, innerRadius=401) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0056 begin`);
      const actual: number = polygonRadiusOf(100, 100, 401);
      logInfo(`polygonRadiusOf(i=100, outerRadius=100, i...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PolygonRadiusOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0057
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0057
     * @tc.desc      polygonRadiusOf(i=25, outerRadius=3, innerRadius=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0057 begin`);
      const actual: number = polygonRadiusOf(25, 3, 25);
      logInfo(`polygonRadiusOf(i=25, outerRadius=3, inne...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0058
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0058
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=2, innerRadius=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0058 begin`);
      const actual: number = polygonRadiusOf(15, 2, 25);
      logInfo(`polygonRadiusOf(i=15, outerRadius=2, inne...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0059
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0059
     * @tc.desc      polygonRadiusOf(i=-1, outerRadius=401, innerRadius=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0059 begin`);
      const actual: number = polygonRadiusOf(-1, 401, -1);
      logInfo(`polygonRadiusOf(i=-1, outerRadius=401, in...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0060
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0060
     * @tc.desc      polygonRadiusOf(i=25, outerRadius=200, innerRadius=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0060 begin`);
      const actual: number = polygonRadiusOf(25, 200, 25);
      logInfo(`polygonRadiusOf(i=25, outerRadius=200, in...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0061
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0061
     * @tc.desc      polygonRadiusOf(i=0, outerRadius=25, innerRadius=100) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0061 begin`);
      const actual: number = polygonRadiusOf(0, 25, 100);
      logInfo(`polygonRadiusOf(i=0, outerRadius=25, inne...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PolygonRadiusOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0062
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0062
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=-1, innerRadius=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0062 begin`);
      const actual: number = polygonRadiusOf(15, -1, 3);
      logInfo(`polygonRadiusOf(i=15, outerRadius=-1, inn...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PolygonRadiusOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0063
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0063
     * @tc.desc      polygonRadiusOf(i=10, outerRadius=2, innerRadius=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0063 begin`);
      const actual: number = polygonRadiusOf(10, 2, 0);
      logInfo(`polygonRadiusOf(i=10, outerRadius=2, inne...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PolygonRadiusOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0064
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0064
     * @tc.desc      polygonRadiusOf(i=1, outerRadius=200, innerRadius=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0064 begin`);
      const actual: number = polygonRadiusOf(1, 200, 100);
      logInfo(`polygonRadiusOf(i=1, outerRadius=200, inn...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PolygonRadiusOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0065
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0065
     * @tc.desc      polygonRadiusOf(i=3, outerRadius=3, innerRadius=404) returns 404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0065 begin`);
      const actual: number = polygonRadiusOf(3, 3, 404);
      logInfo(`polygonRadiusOf(i=3, outerRadius=3, inner...: actual=${actual}`);
      expect(actual).assertEqual(404);
      logInfo(`${BUNDLE}PolygonRadiusOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0066
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0066
     * @tc.desc      polygonRadiusOf(i=2, outerRadius=2, innerRadius=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0066 begin`);
      const actual: number = polygonRadiusOf(2, 2, 2);
      logInfo(`polygonRadiusOf(i=2, outerRadius=2, inner...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PolygonRadiusOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0067
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0067
     * @tc.desc      polygonRadiusOf(i=135, outerRadius=25, innerRadius=404) returns 404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0067 begin`);
      const actual: number = polygonRadiusOf(135, 25, 404);
      logInfo(`polygonRadiusOf(i=135, outerRadius=25, in...: actual=${actual}`);
      expect(actual).assertEqual(404);
      logInfo(`${BUNDLE}PolygonRadiusOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0068
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0068
     * @tc.desc      polygonRadiusOf(i=10, outerRadius=0, innerRadius=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0068 begin`);
      const actual: number = polygonRadiusOf(10, 0, -1);
      logInfo(`polygonRadiusOf(i=10, outerRadius=0, inne...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonRadiusOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0069
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0069
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=-1, innerRadius=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0069 begin`);
      const actual: number = polygonRadiusOf(15, -1, 10);
      logInfo(`polygonRadiusOf(i=15, outerRadius=-1, inn...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PolygonRadiusOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0070
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0070
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=500, innerRadius=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0070 begin`);
      const actual: number = polygonRadiusOf(15, 500, 10);
      logInfo(`polygonRadiusOf(i=15, outerRadius=500, in...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PolygonRadiusOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0071
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0071
     * @tc.desc      polygonRadiusOf(i=3, outerRadius=2, innerRadius=500) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0071 begin`);
      const actual: number = polygonRadiusOf(3, 2, 500);
      logInfo(`polygonRadiusOf(i=3, outerRadius=2, inner...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}PolygonRadiusOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0072
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0072
     * @tc.desc      polygonRadiusOf(i=20, outerRadius=-1, innerRadius=404) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0072 begin`);
      const actual: number = polygonRadiusOf(20, -1, 404);
      logInfo(`polygonRadiusOf(i=20, outerRadius=-1, inn...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0073
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0073
     * @tc.desc      polygonRadiusOf(i=10, outerRadius=200, innerRadius=500) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonRadiusOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0073 begin`);
      const actual: number = polygonRadiusOf(10, 200, 500);
      logInfo(`polygonRadiusOf(i=10, outerRadius=200, in...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}PolygonRadiusOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0074
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0074
     * @tc.desc      polygonRadiusOf(i=0, outerRadius=500, innerRadius=200) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0074 begin`);
      const actual: number = polygonRadiusOf(0, 500, 200);
      logInfo(`polygonRadiusOf(i=0, outerRadius=500, inn...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}PolygonRadiusOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_RADIUS_OF_0075
     * @tc.name      TsDrawingSample_PolygonRadiusOf_0075
     * @tc.desc      polygonRadiusOf(i=15, outerRadius=25, innerRadius=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonRadiusOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonRadiusOf_0075 begin`);
      const actual: number = polygonRadiusOf(15, 25, 1);
      logInfo(`polygonRadiusOf(i=15, outerRadius=25, inn...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PolygonRadiusOf_0075 end`);
    });
  });
}
