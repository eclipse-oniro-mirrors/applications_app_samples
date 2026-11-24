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
import { polygonVertexCount } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for polygonVertexCount (74 cases). */
export default function polygonVertexCountTest(): void {
  describe('PolygonVertexCountTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0001
     * @tc.name      TsDrawingSample_PolygonVertexCount_0001
     * @tc.desc      polygonVertexCount(points=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonVertexCount_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0001 begin`);
      const actual: number = polygonVertexCount(2);
      logInfo(`polygonVertexCount(points=2): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}PolygonVertexCount_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0002
     * @tc.name      TsDrawingSample_PolygonVertexCount_0002
     * @tc.desc      polygonVertexCount(points=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PolygonVertexCount_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0002 begin`);
      const actual: number = polygonVertexCount(1);
      logInfo(`polygonVertexCount(points=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PolygonVertexCount_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0003
     * @tc.name      TsDrawingSample_PolygonVertexCount_0003
     * @tc.desc      polygonVertexCount(points=3) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PolygonVertexCount_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0003 begin`);
      const actual: number = polygonVertexCount(3);
      logInfo(`polygonVertexCount(points=3): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}PolygonVertexCount_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0004
     * @tc.name      TsDrawingSample_PolygonVertexCount_0004
     * @tc.desc      polygonVertexCount(points=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0004 begin`);
      const actual: number = polygonVertexCount(0);
      logInfo(`polygonVertexCount(points=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PolygonVertexCount_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0005
     * @tc.name      TsDrawingSample_PolygonVertexCount_0005
     * @tc.desc      polygonVertexCount(points=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexCount_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0005 begin`);
      const actual: number = polygonVertexCount(-1);
      logInfo(`polygonVertexCount(points=-1): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}PolygonVertexCount_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0006
     * @tc.name      TsDrawingSample_PolygonVertexCount_0006
     * @tc.desc      polygonVertexCount(points=10) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0006 begin`);
      const actual: number = polygonVertexCount(10);
      logInfo(`polygonVertexCount(points=10): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}PolygonVertexCount_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0007
     * @tc.name      TsDrawingSample_PolygonVertexCount_0007
     * @tc.desc      polygonVertexCount(points=100) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0007 begin`);
      const actual: number = polygonVertexCount(100);
      logInfo(`polygonVertexCount(points=100): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}PolygonVertexCount_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0008
     * @tc.name      TsDrawingSample_PolygonVertexCount_0008
     * @tc.desc      polygonVertexCount(points=5) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0008 begin`);
      const actual: number = polygonVertexCount(5);
      logInfo(`polygonVertexCount(points=5): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PolygonVertexCount_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0009
     * @tc.name      TsDrawingSample_PolygonVertexCount_0009
     * @tc.desc      polygonVertexCount(points=15) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0009 begin`);
      const actual: number = polygonVertexCount(15);
      logInfo(`polygonVertexCount(points=15): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}PolygonVertexCount_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0010
     * @tc.name      TsDrawingSample_PolygonVertexCount_0010
     * @tc.desc      polygonVertexCount(points=20) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0010 begin`);
      const actual: number = polygonVertexCount(20);
      logInfo(`polygonVertexCount(points=20): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}PolygonVertexCount_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0011
     * @tc.name      TsDrawingSample_PolygonVertexCount_0011
     * @tc.desc      polygonVertexCount(points=25) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0011 begin`);
      const actual: number = polygonVertexCount(25);
      logInfo(`polygonVertexCount(points=25): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}PolygonVertexCount_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0012
     * @tc.name      TsDrawingSample_PolygonVertexCount_0012
     * @tc.desc      polygonVertexCount(points=30) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0012 begin`);
      const actual: number = polygonVertexCount(30);
      logInfo(`polygonVertexCount(points=30): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}PolygonVertexCount_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0013
     * @tc.name      TsDrawingSample_PolygonVertexCount_0013
     * @tc.desc      polygonVertexCount(points=35) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0013 begin`);
      const actual: number = polygonVertexCount(35);
      logInfo(`polygonVertexCount(points=35): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}PolygonVertexCount_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0014
     * @tc.name      TsDrawingSample_PolygonVertexCount_0014
     * @tc.desc      polygonVertexCount(points=40) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0014 begin`);
      const actual: number = polygonVertexCount(40);
      logInfo(`polygonVertexCount(points=40): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}PolygonVertexCount_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0015
     * @tc.name      TsDrawingSample_PolygonVertexCount_0015
     * @tc.desc      polygonVertexCount(points=45) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0015 begin`);
      const actual: number = polygonVertexCount(45);
      logInfo(`polygonVertexCount(points=45): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}PolygonVertexCount_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0016
     * @tc.name      TsDrawingSample_PolygonVertexCount_0016
     * @tc.desc      polygonVertexCount(points=50) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0016 begin`);
      const actual: number = polygonVertexCount(50);
      logInfo(`polygonVertexCount(points=50): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PolygonVertexCount_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0017
     * @tc.name      TsDrawingSample_PolygonVertexCount_0017
     * @tc.desc      polygonVertexCount(points=55) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0017 begin`);
      const actual: number = polygonVertexCount(55);
      logInfo(`polygonVertexCount(points=55): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}PolygonVertexCount_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0018
     * @tc.name      TsDrawingSample_PolygonVertexCount_0018
     * @tc.desc      polygonVertexCount(points=60) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0018 begin`);
      const actual: number = polygonVertexCount(60);
      logInfo(`polygonVertexCount(points=60): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}PolygonVertexCount_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0019
     * @tc.name      TsDrawingSample_PolygonVertexCount_0019
     * @tc.desc      polygonVertexCount(points=65) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0019 begin`);
      const actual: number = polygonVertexCount(65);
      logInfo(`polygonVertexCount(points=65): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}PolygonVertexCount_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0020
     * @tc.name      TsDrawingSample_PolygonVertexCount_0020
     * @tc.desc      polygonVertexCount(points=70) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0020 begin`);
      const actual: number = polygonVertexCount(70);
      logInfo(`polygonVertexCount(points=70): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}PolygonVertexCount_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0021
     * @tc.name      TsDrawingSample_PolygonVertexCount_0021
     * @tc.desc      polygonVertexCount(points=75) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0021 begin`);
      const actual: number = polygonVertexCount(75);
      logInfo(`polygonVertexCount(points=75): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}PolygonVertexCount_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0022
     * @tc.name      TsDrawingSample_PolygonVertexCount_0022
     * @tc.desc      polygonVertexCount(points=80) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0022 begin`);
      const actual: number = polygonVertexCount(80);
      logInfo(`polygonVertexCount(points=80): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}PolygonVertexCount_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0023
     * @tc.name      TsDrawingSample_PolygonVertexCount_0023
     * @tc.desc      polygonVertexCount(points=85) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0023 begin`);
      const actual: number = polygonVertexCount(85);
      logInfo(`polygonVertexCount(points=85): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}PolygonVertexCount_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0024
     * @tc.name      TsDrawingSample_PolygonVertexCount_0024
     * @tc.desc      polygonVertexCount(points=90) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0024 begin`);
      const actual: number = polygonVertexCount(90);
      logInfo(`polygonVertexCount(points=90): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PolygonVertexCount_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0025
     * @tc.name      TsDrawingSample_PolygonVertexCount_0025
     * @tc.desc      polygonVertexCount(points=95) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0025 begin`);
      const actual: number = polygonVertexCount(95);
      logInfo(`polygonVertexCount(points=95): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}PolygonVertexCount_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0026
     * @tc.name      TsDrawingSample_PolygonVertexCount_0026
     * @tc.desc      polygonVertexCount(points=105) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0026 begin`);
      const actual: number = polygonVertexCount(105);
      logInfo(`polygonVertexCount(points=105): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}PolygonVertexCount_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0027
     * @tc.name      TsDrawingSample_PolygonVertexCount_0027
     * @tc.desc      polygonVertexCount(points=110) returns 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0027 begin`);
      const actual: number = polygonVertexCount(110);
      logInfo(`polygonVertexCount(points=110): actual=${actual}`);
      expect(actual).assertEqual(220);
      logInfo(`${BUNDLE}PolygonVertexCount_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0028
     * @tc.name      TsDrawingSample_PolygonVertexCount_0028
     * @tc.desc      polygonVertexCount(points=115) returns 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0028 begin`);
      const actual: number = polygonVertexCount(115);
      logInfo(`polygonVertexCount(points=115): actual=${actual}`);
      expect(actual).assertEqual(230);
      logInfo(`${BUNDLE}PolygonVertexCount_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0029
     * @tc.name      TsDrawingSample_PolygonVertexCount_0029
     * @tc.desc      polygonVertexCount(points=120) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0029 begin`);
      const actual: number = polygonVertexCount(120);
      logInfo(`polygonVertexCount(points=120): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}PolygonVertexCount_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0030
     * @tc.name      TsDrawingSample_PolygonVertexCount_0030
     * @tc.desc      polygonVertexCount(points=125) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0030 begin`);
      const actual: number = polygonVertexCount(125);
      logInfo(`polygonVertexCount(points=125): actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}PolygonVertexCount_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0031
     * @tc.name      TsDrawingSample_PolygonVertexCount_0031
     * @tc.desc      polygonVertexCount(points=130) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0031 begin`);
      const actual: number = polygonVertexCount(130);
      logInfo(`polygonVertexCount(points=130): actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}PolygonVertexCount_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0032
     * @tc.name      TsDrawingSample_PolygonVertexCount_0032
     * @tc.desc      polygonVertexCount(points=135) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0032 begin`);
      const actual: number = polygonVertexCount(135);
      logInfo(`polygonVertexCount(points=135): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}PolygonVertexCount_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0033
     * @tc.name      TsDrawingSample_PolygonVertexCount_0033
     * @tc.desc      polygonVertexCount(points=140) returns 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0033 begin`);
      const actual: number = polygonVertexCount(140);
      logInfo(`polygonVertexCount(points=140): actual=${actual}`);
      expect(actual).assertEqual(280);
      logInfo(`${BUNDLE}PolygonVertexCount_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0034
     * @tc.name      TsDrawingSample_PolygonVertexCount_0034
     * @tc.desc      polygonVertexCount(points=145) returns 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0034 begin`);
      const actual: number = polygonVertexCount(145);
      logInfo(`polygonVertexCount(points=145): actual=${actual}`);
      expect(actual).assertEqual(290);
      logInfo(`${BUNDLE}PolygonVertexCount_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0035
     * @tc.name      TsDrawingSample_PolygonVertexCount_0035
     * @tc.desc      polygonVertexCount(points=150) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0035 begin`);
      const actual: number = polygonVertexCount(150);
      logInfo(`polygonVertexCount(points=150): actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}PolygonVertexCount_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0036
     * @tc.name      TsDrawingSample_PolygonVertexCount_0036
     * @tc.desc      polygonVertexCount(points=155) returns 310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0036 begin`);
      const actual: number = polygonVertexCount(155);
      logInfo(`polygonVertexCount(points=155): actual=${actual}`);
      expect(actual).assertEqual(310);
      logInfo(`${BUNDLE}PolygonVertexCount_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0037
     * @tc.name      TsDrawingSample_PolygonVertexCount_0037
     * @tc.desc      polygonVertexCount(points=160) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0037 begin`);
      const actual: number = polygonVertexCount(160);
      logInfo(`polygonVertexCount(points=160): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}PolygonVertexCount_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0038
     * @tc.name      TsDrawingSample_PolygonVertexCount_0038
     * @tc.desc      polygonVertexCount(points=165) returns 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0038 begin`);
      const actual: number = polygonVertexCount(165);
      logInfo(`polygonVertexCount(points=165): actual=${actual}`);
      expect(actual).assertEqual(330);
      logInfo(`${BUNDLE}PolygonVertexCount_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0039
     * @tc.name      TsDrawingSample_PolygonVertexCount_0039
     * @tc.desc      polygonVertexCount(points=170) returns 340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0039 begin`);
      const actual: number = polygonVertexCount(170);
      logInfo(`polygonVertexCount(points=170): actual=${actual}`);
      expect(actual).assertEqual(340);
      logInfo(`${BUNDLE}PolygonVertexCount_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0040
     * @tc.name      TsDrawingSample_PolygonVertexCount_0040
     * @tc.desc      polygonVertexCount(points=175) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0040 begin`);
      const actual: number = polygonVertexCount(175);
      logInfo(`polygonVertexCount(points=175): actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}PolygonVertexCount_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0041
     * @tc.name      TsDrawingSample_PolygonVertexCount_0041
     * @tc.desc      polygonVertexCount(points=180) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0041 begin`);
      const actual: number = polygonVertexCount(180);
      logInfo(`polygonVertexCount(points=180): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}PolygonVertexCount_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0042
     * @tc.name      TsDrawingSample_PolygonVertexCount_0042
     * @tc.desc      polygonVertexCount(points=185) returns 370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0042 begin`);
      const actual: number = polygonVertexCount(185);
      logInfo(`polygonVertexCount(points=185): actual=${actual}`);
      expect(actual).assertEqual(370);
      logInfo(`${BUNDLE}PolygonVertexCount_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0043
     * @tc.name      TsDrawingSample_PolygonVertexCount_0043
     * @tc.desc      polygonVertexCount(points=190) returns 380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0043 begin`);
      const actual: number = polygonVertexCount(190);
      logInfo(`polygonVertexCount(points=190): actual=${actual}`);
      expect(actual).assertEqual(380);
      logInfo(`${BUNDLE}PolygonVertexCount_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0044
     * @tc.name      TsDrawingSample_PolygonVertexCount_0044
     * @tc.desc      polygonVertexCount(points=195) returns 390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0044 begin`);
      const actual: number = polygonVertexCount(195);
      logInfo(`polygonVertexCount(points=195): actual=${actual}`);
      expect(actual).assertEqual(390);
      logInfo(`${BUNDLE}PolygonVertexCount_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0045
     * @tc.name      TsDrawingSample_PolygonVertexCount_0045
     * @tc.desc      polygonVertexCount(points=200) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0045 begin`);
      const actual: number = polygonVertexCount(200);
      logInfo(`polygonVertexCount(points=200): actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}PolygonVertexCount_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0046
     * @tc.name      TsDrawingSample_PolygonVertexCount_0046
     * @tc.desc      polygonVertexCount(points=15.6) returns 31.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0046 begin`);
      const actual: number = polygonVertexCount(15.6);
      logInfo(`polygonVertexCount(points=15.6): actual=${actual}`);
      expect(actual).assertClose(31.2, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0047
     * @tc.name      TsDrawingSample_PolygonVertexCount_0047
     * @tc.desc      polygonVertexCount(points=-67) returns -134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexCount_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0047 begin`);
      const actual: number = polygonVertexCount(-67);
      logInfo(`polygonVertexCount(points=-67): actual=${actual}`);
      expect(actual).assertEqual(-134);
      logInfo(`${BUNDLE}PolygonVertexCount_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0048
     * @tc.name      TsDrawingSample_PolygonVertexCount_0048
     * @tc.desc      polygonVertexCount(points=134) returns 268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0048 begin`);
      const actual: number = polygonVertexCount(134);
      logInfo(`polygonVertexCount(points=134): actual=${actual}`);
      expect(actual).assertEqual(268);
      logInfo(`${BUNDLE}PolygonVertexCount_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0049
     * @tc.name      TsDrawingSample_PolygonVertexCount_0049
     * @tc.desc      polygonVertexCount(points=71.64) returns 143.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0049 begin`);
      const actual: number = polygonVertexCount(71.64);
      logInfo(`polygonVertexCount(points=71.64): actual=${actual}`);
      expect(actual).assertClose(143.28, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0050
     * @tc.name      TsDrawingSample_PolygonVertexCount_0050
     * @tc.desc      polygonVertexCount(points=60.25) returns 120.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0050 begin`);
      const actual: number = polygonVertexCount(60.25);
      logInfo(`polygonVertexCount(points=60.25): actual=${actual}`);
      expect(actual).assertClose(120.5, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0051
     * @tc.name      TsDrawingSample_PolygonVertexCount_0051
     * @tc.desc      polygonVertexCount(points=67.68) returns 135.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0051 begin`);
      const actual: number = polygonVertexCount(67.68);
      logInfo(`polygonVertexCount(points=67.68): actual=${actual}`);
      expect(actual).assertClose(135.36, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0052
     * @tc.name      TsDrawingSample_PolygonVertexCount_0052
     * @tc.desc      polygonVertexCount(points=-12) returns -24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexCount_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0052 begin`);
      const actual: number = polygonVertexCount(-12);
      logInfo(`polygonVertexCount(points=-12): actual=${actual}`);
      expect(actual).assertEqual(-24);
      logInfo(`${BUNDLE}PolygonVertexCount_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0053
     * @tc.name      TsDrawingSample_PolygonVertexCount_0053
     * @tc.desc      polygonVertexCount(points=34) returns 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0053 begin`);
      const actual: number = polygonVertexCount(34);
      logInfo(`polygonVertexCount(points=34): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`${BUNDLE}PolygonVertexCount_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0054
     * @tc.name      TsDrawingSample_PolygonVertexCount_0054
     * @tc.desc      polygonVertexCount(points=95.46) returns 190.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0054 begin`);
      const actual: number = polygonVertexCount(95.46);
      logInfo(`polygonVertexCount(points=95.46): actual=${actual}`);
      expect(actual).assertClose(190.92, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0055
     * @tc.name      TsDrawingSample_PolygonVertexCount_0055
     * @tc.desc      polygonVertexCount(points=43) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0055 begin`);
      const actual: number = polygonVertexCount(43);
      logInfo(`polygonVertexCount(points=43): actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}PolygonVertexCount_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0056
     * @tc.name      TsDrawingSample_PolygonVertexCount_0056
     * @tc.desc      polygonVertexCount(points=92.24) returns 184.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0056 begin`);
      const actual: number = polygonVertexCount(92.24);
      logInfo(`polygonVertexCount(points=92.24): actual=${actual}`);
      expect(actual).assertClose(184.48, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0057
     * @tc.name      TsDrawingSample_PolygonVertexCount_0057
     * @tc.desc      polygonVertexCount(points=74) returns 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0057 begin`);
      const actual: number = polygonVertexCount(74);
      logInfo(`polygonVertexCount(points=74): actual=${actual}`);
      expect(actual).assertEqual(148);
      logInfo(`${BUNDLE}PolygonVertexCount_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0058
     * @tc.name      TsDrawingSample_PolygonVertexCount_0058
     * @tc.desc      polygonVertexCount(points=149) returns 298
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0058 begin`);
      const actual: number = polygonVertexCount(149);
      logInfo(`polygonVertexCount(points=149): actual=${actual}`);
      expect(actual).assertEqual(298);
      logInfo(`${BUNDLE}PolygonVertexCount_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0059
     * @tc.name      TsDrawingSample_PolygonVertexCount_0059
     * @tc.desc      polygonVertexCount(points=79) returns 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0059 begin`);
      const actual: number = polygonVertexCount(79);
      logInfo(`polygonVertexCount(points=79): actual=${actual}`);
      expect(actual).assertEqual(158);
      logInfo(`${BUNDLE}PolygonVertexCount_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0060
     * @tc.name      TsDrawingSample_PolygonVertexCount_0060
     * @tc.desc      polygonVertexCount(points=97.65) returns 195.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0060 begin`);
      const actual: number = polygonVertexCount(97.65);
      logInfo(`polygonVertexCount(points=97.65): actual=${actual}`);
      expect(actual).assertClose(195.3, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0061
     * @tc.name      TsDrawingSample_PolygonVertexCount_0061
     * @tc.desc      polygonVertexCount(points=59) returns 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0061 begin`);
      const actual: number = polygonVertexCount(59);
      logInfo(`polygonVertexCount(points=59): actual=${actual}`);
      expect(actual).assertEqual(118);
      logInfo(`${BUNDLE}PolygonVertexCount_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0062
     * @tc.name      TsDrawingSample_PolygonVertexCount_0062
     * @tc.desc      polygonVertexCount(points=98) returns 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0062 begin`);
      const actual: number = polygonVertexCount(98);
      logInfo(`polygonVertexCount(points=98): actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}PolygonVertexCount_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0063
     * @tc.name      TsDrawingSample_PolygonVertexCount_0063
     * @tc.desc      polygonVertexCount(points=-63) returns -126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexCount_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0063 begin`);
      const actual: number = polygonVertexCount(-63);
      logInfo(`polygonVertexCount(points=-63): actual=${actual}`);
      expect(actual).assertEqual(-126);
      logInfo(`${BUNDLE}PolygonVertexCount_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0064
     * @tc.name      TsDrawingSample_PolygonVertexCount_0064
     * @tc.desc      polygonVertexCount(points=54.49) returns 108.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0064 begin`);
      const actual: number = polygonVertexCount(54.49);
      logInfo(`polygonVertexCount(points=54.49): actual=${actual}`);
      expect(actual).assertClose(108.98, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0065
     * @tc.name      TsDrawingSample_PolygonVertexCount_0065
     * @tc.desc      polygonVertexCount(points=167) returns 334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0065 begin`);
      const actual: number = polygonVertexCount(167);
      logInfo(`polygonVertexCount(points=167): actual=${actual}`);
      expect(actual).assertEqual(334);
      logInfo(`${BUNDLE}PolygonVertexCount_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0066
     * @tc.name      TsDrawingSample_PolygonVertexCount_0066
     * @tc.desc      polygonVertexCount(points=14.91) returns 29.82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0066 begin`);
      const actual: number = polygonVertexCount(14.91);
      logInfo(`polygonVertexCount(points=14.91): actual=${actual}`);
      expect(actual).assertClose(29.82, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0067
     * @tc.name      TsDrawingSample_PolygonVertexCount_0067
     * @tc.desc      polygonVertexCount(points=151) returns 302
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0067 begin`);
      const actual: number = polygonVertexCount(151);
      logInfo(`polygonVertexCount(points=151): actual=${actual}`);
      expect(actual).assertEqual(302);
      logInfo(`${BUNDLE}PolygonVertexCount_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0068
     * @tc.name      TsDrawingSample_PolygonVertexCount_0068
     * @tc.desc      polygonVertexCount(points=199) returns 398
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0068 begin`);
      const actual: number = polygonVertexCount(199);
      logInfo(`polygonVertexCount(points=199): actual=${actual}`);
      expect(actual).assertEqual(398);
      logInfo(`${BUNDLE}PolygonVertexCount_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0069
     * @tc.name      TsDrawingSample_PolygonVertexCount_0069
     * @tc.desc      polygonVertexCount(points=92.55) returns 185.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0069 begin`);
      const actual: number = polygonVertexCount(92.55);
      logInfo(`polygonVertexCount(points=92.55): actual=${actual}`);
      expect(actual).assertClose(185.1, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0070
     * @tc.name      TsDrawingSample_PolygonVertexCount_0070
     * @tc.desc      polygonVertexCount(points=63.25) returns 126.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0070 begin`);
      const actual: number = polygonVertexCount(63.25);
      logInfo(`polygonVertexCount(points=63.25): actual=${actual}`);
      expect(actual).assertClose(126.5, PRECISION);
      logInfo(`${BUNDLE}PolygonVertexCount_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0071
     * @tc.name      TsDrawingSample_PolygonVertexCount_0071
     * @tc.desc      polygonVertexCount(points=-58) returns -116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexCount_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0071 begin`);
      const actual: number = polygonVertexCount(-58);
      logInfo(`polygonVertexCount(points=-58): actual=${actual}`);
      expect(actual).assertEqual(-116);
      logInfo(`${BUNDLE}PolygonVertexCount_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0072
     * @tc.name      TsDrawingSample_PolygonVertexCount_0072
     * @tc.desc      polygonVertexCount(points=192) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0072 begin`);
      const actual: number = polygonVertexCount(192);
      logInfo(`polygonVertexCount(points=192): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}PolygonVertexCount_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0073
     * @tc.name      TsDrawingSample_PolygonVertexCount_0073
     * @tc.desc      polygonVertexCount(points=137) returns 274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PolygonVertexCount_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0073 begin`);
      const actual: number = polygonVertexCount(137);
      logInfo(`polygonVertexCount(points=137): actual=${actual}`);
      expect(actual).assertEqual(274);
      logInfo(`${BUNDLE}PolygonVertexCount_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_POLYGON_VERTEX_COUNT_0074
     * @tc.name      TsDrawingSample_PolygonVertexCount_0074
     * @tc.desc      polygonVertexCount(points=-90) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PolygonVertexCount_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PolygonVertexCount_0074 begin`);
      const actual: number = polygonVertexCount(-90);
      logInfo(`polygonVertexCount(points=-90): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}PolygonVertexCount_0074 end`);
    });
  });
}
