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
import { pentagonVertexY } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pentagonVertexY (74 cases). */
export default function pentagonVertexYTest(): void {
  describe('PentagonVertexYTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0001
     * @tc.name      TsDrawingSample_PentagonVertexY_0001
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PentagonVertexY_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0001 begin`);
      const actual: number = pentagonVertexY(2, 2, 0);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PentagonVertexY_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0002
     * @tc.name      TsDrawingSample_PentagonVertexY_0002
     * @tc.desc      pentagonVertexY(i=2, centerY=1, sideLength=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PentagonVertexY_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0002 begin`);
      const actual: number = pentagonVertexY(2, 1, 0);
      logInfo(`pentagonVertexY(i=2, centerY=1, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PentagonVertexY_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0003
     * @tc.name      TsDrawingSample_PentagonVertexY_0003
     * @tc.desc      pentagonVertexY(i=2, centerY=3, sideLength=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0003 begin`);
      const actual: number = pentagonVertexY(2, 3, 0);
      logInfo(`pentagonVertexY(i=2, centerY=3, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PentagonVertexY_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0004
     * @tc.name      TsDrawingSample_PentagonVertexY_0004
     * @tc.desc      pentagonVertexY(i=2, centerY=5, sideLength=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0004 begin`);
      const actual: number = pentagonVertexY(2, 5, 0);
      logInfo(`pentagonVertexY(i=2, centerY=5, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}PentagonVertexY_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0005
     * @tc.name      TsDrawingSample_PentagonVertexY_0005
     * @tc.desc      pentagonVertexY(i=2, centerY=4, sideLength=0) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0005 begin`);
      const actual: number = pentagonVertexY(2, 4, 0);
      logInfo(`pentagonVertexY(i=2, centerY=4, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}PentagonVertexY_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0006
     * @tc.name      TsDrawingSample_PentagonVertexY_0006
     * @tc.desc      pentagonVertexY(i=2, centerY=6, sideLength=0) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0006 begin`);
      const actual: number = pentagonVertexY(2, 6, 0);
      logInfo(`pentagonVertexY(i=2, centerY=6, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}PentagonVertexY_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0007
     * @tc.name      TsDrawingSample_PentagonVertexY_0007
     * @tc.desc      pentagonVertexY(i=2, centerY=60, sideLength=0) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0007 begin`);
      const actual: number = pentagonVertexY(2, 60, 0);
      logInfo(`pentagonVertexY(i=2, centerY=60, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}PentagonVertexY_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0008
     * @tc.name      TsDrawingSample_PentagonVertexY_0008
     * @tc.desc      pentagonVertexY(i=2, centerY=59, sideLength=0) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0008 begin`);
      const actual: number = pentagonVertexY(2, 59, 0);
      logInfo(`pentagonVertexY(i=2, centerY=59, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}PentagonVertexY_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0009
     * @tc.name      TsDrawingSample_PentagonVertexY_0009
     * @tc.desc      pentagonVertexY(i=2, centerY=61, sideLength=0) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0009 begin`);
      const actual: number = pentagonVertexY(2, 61, 0);
      logInfo(`pentagonVertexY(i=2, centerY=61, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}PentagonVertexY_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0010
     * @tc.name      TsDrawingSample_PentagonVertexY_0010
     * @tc.desc      pentagonVertexY(i=2, centerY=120, sideLength=0) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0010 begin`);
      const actual: number = pentagonVertexY(2, 120, 0);
      logInfo(`pentagonVertexY(i=2, centerY=120, sideLen...: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}PentagonVertexY_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0011
     * @tc.name      TsDrawingSample_PentagonVertexY_0011
     * @tc.desc      pentagonVertexY(i=2, centerY=30, sideLength=0) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0011 begin`);
      const actual: number = pentagonVertexY(2, 30, 0);
      logInfo(`pentagonVertexY(i=2, centerY=30, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}PentagonVertexY_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0012
     * @tc.name      TsDrawingSample_PentagonVertexY_0012
     * @tc.desc      pentagonVertexY(i=2, centerY=3.141592653589793, sideLength=0) returns 3.141592653589793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0012 begin`);
      const actual: number = pentagonVertexY(2, 3.141592653589793, 0);
      logInfo(`pentagonVertexY(i=2, centerY=3.1415926535...: actual=${actual}`);
      expect(actual).assertClose(3.141592653589793, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0013
     * @tc.name      TsDrawingSample_PentagonVertexY_0013
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=1) returns 2.8064112765176255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0013 begin`);
      const actual: number = pentagonVertexY(2, 2, 1);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(2.8064112765176255, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0014
     * @tc.name      TsDrawingSample_PentagonVertexY_0014
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=2) returns 3.6128225530352505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0014 begin`);
      const actual: number = pentagonVertexY(2, 2, 2);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(3.6128225530352505, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0015
     * @tc.name      TsDrawingSample_PentagonVertexY_0015
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=3) returns 4.4192338295528755
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0015 begin`);
      const actual: number = pentagonVertexY(2, 2, 3);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(4.4192338295528755, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0016
     * @tc.name      TsDrawingSample_PentagonVertexY_0016
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=5) returns 6.032056382588126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0016 begin`);
      const actual: number = pentagonVertexY(2, 2, 5);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(6.032056382588126, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0017
     * @tc.name      TsDrawingSample_PentagonVertexY_0017
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=4) returns 5.225645106070501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0017 begin`);
      const actual: number = pentagonVertexY(2, 2, 4);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(5.225645106070501, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0018
     * @tc.name      TsDrawingSample_PentagonVertexY_0018
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=6) returns 6.838467659105751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0018 begin`);
      const actual: number = pentagonVertexY(2, 2, 6);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(6.838467659105751, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0019
     * @tc.name      TsDrawingSample_PentagonVertexY_0019
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=60) returns 50.38467659105751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0019 begin`);
      const actual: number = pentagonVertexY(2, 2, 60);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(50.38467659105751, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0020
     * @tc.name      TsDrawingSample_PentagonVertexY_0020
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=59) returns 49.57826531453989
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0020 begin`);
      const actual: number = pentagonVertexY(2, 2, 59);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(49.57826531453989, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0021
     * @tc.name      TsDrawingSample_PentagonVertexY_0021
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=61) returns 51.19108786757514
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0021 begin`);
      const actual: number = pentagonVertexY(2, 2, 61);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(51.19108786757514, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0022
     * @tc.name      TsDrawingSample_PentagonVertexY_0022
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=120) returns 98.76935318211503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0022 begin`);
      const actual: number = pentagonVertexY(2, 2, 120);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(98.76935318211503, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0023
     * @tc.name      TsDrawingSample_PentagonVertexY_0023
     * @tc.desc      pentagonVertexY(i=2, centerY=2, sideLength=30) returns 26.192338295528756
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0023 begin`);
      const actual: number = pentagonVertexY(2, 2, 30);
      logInfo(`pentagonVertexY(i=2, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(26.192338295528756, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0024
     * @tc.name      TsDrawingSample_PentagonVertexY_0024
     * @tc.desc      pentagonVertexY(i=30, centerY=3.141592653589793, sideLength=60) returns -15.147044612543294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0024 begin`);
      const actual: number = pentagonVertexY(30, 3.141592653589793, 60);
      logInfo(`pentagonVertexY(i=30, centerY=3.141592653...: actual=${actual}`);
      expect(actual).assertClose(-15.147044612543294, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0025
     * @tc.name      TsDrawingSample_PentagonVertexY_0025
     * @tc.desc      pentagonVertexY(i=60, centerY=2, sideLength=30) returns -7.144318633066586
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0025 begin`);
      const actual: number = pentagonVertexY(60, 2, 30);
      logInfo(`pentagonVertexY(i=60, centerY=2, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-7.144318633066586, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0026
     * @tc.name      TsDrawingSample_PentagonVertexY_0026
     * @tc.desc      pentagonVertexY(i=30, centerY=4, sideLength=3) returns 3.085568136693346
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0026 begin`);
      const actual: number = pentagonVertexY(30, 4, 3);
      logInfo(`pentagonVertexY(i=30, centerY=4, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(3.085568136693346, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0027
     * @tc.name      TsDrawingSample_PentagonVertexY_0027
     * @tc.desc      pentagonVertexY(i=60, centerY=6, sideLength=6) returns 4.171136273386683
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0027 begin`);
      const actual: number = pentagonVertexY(60, 6, 6);
      logInfo(`pentagonVertexY(i=60, centerY=6, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(4.171136273386683, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0028
     * @tc.name      TsDrawingSample_PentagonVertexY_0028
     * @tc.desc      pentagonVertexY(i=30, centerY=30, sideLength=60) returns 11.711362733866913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0028 begin`);
      const actual: number = pentagonVertexY(30, 30, 60);
      logInfo(`pentagonVertexY(i=30, centerY=30, sideLen...: actual=${actual}`);
      expect(actual).assertClose(11.711362733866913, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0029
     * @tc.name      TsDrawingSample_PentagonVertexY_0029
     * @tc.desc      pentagonVertexY(i=3.141592653589793, centerY=120, sideLength=3) returns 118.5709216669204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0029 begin`);
      const actual: number = pentagonVertexY(3.141592653589793, 120, 3);
      logInfo(`pentagonVertexY(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(118.5709216669204, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0030
     * @tc.name      TsDrawingSample_PentagonVertexY_0030
     * @tc.desc      pentagonVertexY(i=2, centerY=3, sideLength=5) returns 7.032056382588126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0030 begin`);
      const actual: number = pentagonVertexY(2, 3, 5);
      logInfo(`pentagonVertexY(i=2, centerY=3, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(7.032056382588126, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0031
     * @tc.name      TsDrawingSample_PentagonVertexY_0031
     * @tc.desc      pentagonVertexY(i=6, centerY=3.141592653589793, sideLength=30) returns 27.489799930830436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0031 begin`);
      const actual: number = pentagonVertexY(6, 3.141592653589793, 30);
      logInfo(`pentagonVertexY(i=6, centerY=3.1415926535...: actual=${actual}`);
      expect(actual).assertClose(27.489799930830436, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0032
     * @tc.name      TsDrawingSample_PentagonVertexY_0032
     * @tc.desc      pentagonVertexY(i=1, centerY=120, sideLength=60) returns 168.6964145544813
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0032 begin`);
      const actual: number = pentagonVertexY(1, 120, 60);
      logInfo(`pentagonVertexY(i=1, centerY=120, sideLen...: actual=${actual}`);
      expect(actual).assertClose(168.6964145544813, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0033
     * @tc.name      TsDrawingSample_PentagonVertexY_0033
     * @tc.desc      pentagonVertexY(i=30, centerY=120, sideLength=2) returns 119.39037875779556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0033 begin`);
      const actual: number = pentagonVertexY(30, 120, 2);
      logInfo(`pentagonVertexY(i=30, centerY=120, sideLe...: actual=${actual}`);
      expect(actual).assertClose(119.39037875779556, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0034
     * @tc.name      TsDrawingSample_PentagonVertexY_0034
     * @tc.desc      pentagonVertexY(i=3, centerY=2, sideLength=3) returns 1.0603480056731827
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0034 begin`);
      const actual: number = pentagonVertexY(3, 2, 3);
      logInfo(`pentagonVertexY(i=3, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(1.0603480056731827, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0035
     * @tc.name      TsDrawingSample_PentagonVertexY_0035
     * @tc.desc      pentagonVertexY(i=3.141592653589793, centerY=61, sideLength=6) returns 58.141843333840804
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0035 begin`);
      const actual: number = pentagonVertexY(3.141592653589793, 61, 6);
      logInfo(`pentagonVertexY(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(58.141843333840804, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0036
     * @tc.name      TsDrawingSample_PentagonVertexY_0036
     * @tc.desc      pentagonVertexY(i=3, centerY=61, sideLength=60) returns 42.20696011346365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0036 begin`);
      const actual: number = pentagonVertexY(3, 61, 60);
      logInfo(`pentagonVertexY(i=3, centerY=61, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(42.20696011346365, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0037
     * @tc.name      TsDrawingSample_PentagonVertexY_0037
     * @tc.desc      pentagonVertexY(i=30, centerY=5, sideLength=61) returns -13.593447887235307
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0037 begin`);
      const actual: number = pentagonVertexY(30, 5, 61);
      logInfo(`pentagonVertexY(i=30, centerY=5, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-13.593447887235307, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0038
     * @tc.name      TsDrawingSample_PentagonVertexY_0038
     * @tc.desc      pentagonVertexY(i=5, centerY=3, sideLength=4) returns 1.7807575155911322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0038 begin`);
      const actual: number = pentagonVertexY(5, 3, 4);
      logInfo(`pentagonVertexY(i=5, centerY=3, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(1.7807575155911322, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0039
     * @tc.name      TsDrawingSample_PentagonVertexY_0039
     * @tc.desc      pentagonVertexY(i=4, centerY=4, sideLength=5) returns -0.9999511660724538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0039 begin`);
      const actual: number = pentagonVertexY(4, 4, 5);
      logInfo(`pentagonVertexY(i=4, centerY=4, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-0.9999511660724538, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0040
     * @tc.name      TsDrawingSample_PentagonVertexY_0040
     * @tc.desc      pentagonVertexY(i=4, centerY=6, sideLength=6) returns 0.00005860071305541226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0040 begin`);
      const actual: number = pentagonVertexY(4, 6, 6);
      logInfo(`pentagonVertexY(i=4, centerY=6, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(0.00005860071305541226, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0041
     * @tc.name      TsDrawingSample_PentagonVertexY_0041
     * @tc.desc      pentagonVertexY(i=30, centerY=2, sideLength=30) returns -7.144318633066543
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0041 begin`);
      const actual: number = pentagonVertexY(30, 2, 30);
      logInfo(`pentagonVertexY(i=30, centerY=2, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-7.144318633066543, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0042
     * @tc.name      TsDrawingSample_PentagonVertexY_0042
     * @tc.desc      pentagonVertexY(i=6, centerY=30, sideLength=120) returns 127.39282910896257
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0042 begin`);
      const actual: number = pentagonVertexY(6, 30, 120);
      logInfo(`pentagonVertexY(i=6, centerY=30, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(127.39282910896257, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0043
     * @tc.name      TsDrawingSample_PentagonVertexY_0043
     * @tc.desc      pentagonVertexY(i=120, centerY=5, sideLength=5) returns 3.4759468944888887
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0043 begin`);
      const actual: number = pentagonVertexY(120, 5, 5);
      logInfo(`pentagonVertexY(i=120, centerY=5, sideLen...: actual=${actual}`);
      expect(actual).assertClose(3.4759468944888887, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0044
     * @tc.name      TsDrawingSample_PentagonVertexY_0044
     * @tc.desc      pentagonVertexY(i=30, centerY=61, sideLength=3) returns 60.08556813669335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0044 begin`);
      const actual: number = pentagonVertexY(30, 61, 3);
      logInfo(`pentagonVertexY(i=30, centerY=61, sideLen...: actual=${actual}`);
      expect(actual).assertClose(60.08556813669335, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0045
     * @tc.name      TsDrawingSample_PentagonVertexY_0045
     * @tc.desc      pentagonVertexY(i=5, centerY=4, sideLength=60) returns -14.28863726613302
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0045 begin`);
      const actual: number = pentagonVertexY(5, 4, 60);
      logInfo(`pentagonVertexY(i=5, centerY=4, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-14.28863726613302, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0046
     * @tc.name      TsDrawingSample_PentagonVertexY_0046
     * @tc.desc      pentagonVertexY(i=5, centerY=6, sideLength=61) returns -12.593447887235236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0046 begin`);
      const actual: number = pentagonVertexY(5, 6, 61);
      logInfo(`pentagonVertexY(i=5, centerY=6, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-12.593447887235236, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0047
     * @tc.name      TsDrawingSample_PentagonVertexY_0047
     * @tc.desc      pentagonVertexY(i=30, centerY=6, sideLength=60) returns -12.288637266133087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0047 begin`);
      const actual: number = pentagonVertexY(30, 6, 60);
      logInfo(`pentagonVertexY(i=30, centerY=6, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-12.288637266133087, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0048
     * @tc.name      TsDrawingSample_PentagonVertexY_0048
     * @tc.desc      pentagonVertexY(i=1, centerY=3.141592653589793, sideLength=2) returns 4.764806472072503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0048 begin`);
      const actual: number = pentagonVertexY(1, 3.141592653589793, 2);
      logInfo(`pentagonVertexY(i=1, centerY=3.1415926535...: actual=${actual}`);
      expect(actual).assertClose(4.764806472072503, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0049
     * @tc.name      TsDrawingSample_PentagonVertexY_0049
     * @tc.desc      pentagonVertexY(i=5, centerY=5, sideLength=120) returns -31.57727453226604
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0049 begin`);
      const actual: number = pentagonVertexY(5, 5, 120);
      logInfo(`pentagonVertexY(i=5, centerY=5, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-31.57727453226604, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0050
     * @tc.name      TsDrawingSample_PentagonVertexY_0050
     * @tc.desc      pentagonVertexY(i=1, centerY=30, sideLength=5) returns 34.05803454620678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0050 begin`);
      const actual: number = pentagonVertexY(1, 30, 5);
      logInfo(`pentagonVertexY(i=1, centerY=30, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(34.05803454620678, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0051
     * @tc.name      TsDrawingSample_PentagonVertexY_0051
     * @tc.desc      pentagonVertexY(i=2, centerY=6, sideLength=59) returns 53.57826531453989
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0051 begin`);
      const actual: number = pentagonVertexY(2, 6, 59);
      logInfo(`pentagonVertexY(i=2, centerY=6, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(53.57826531453989, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0052
     * @tc.name      TsDrawingSample_PentagonVertexY_0052
     * @tc.desc      pentagonVertexY(i=3.141592653589793, centerY=3.141592653589793, sideLength=5) returns 0.75979543...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0052 begin`);
      const actual: number = pentagonVertexY(3.141592653589793, 3.141592653589793, 5);
      logInfo(`pentagonVertexY(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(0.7597954317904629, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0053
     * @tc.name      TsDrawingSample_PentagonVertexY_0053
     * @tc.desc      pentagonVertexY(i=3.141592653589793, centerY=120, sideLength=30) returns 105.70921666920401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0053 begin`);
      const actual: number = pentagonVertexY(3.141592653589793, 120, 30);
      logInfo(`pentagonVertexY(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(105.70921666920401, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0054
     * @tc.name      TsDrawingSample_PentagonVertexY_0054
     * @tc.desc      pentagonVertexY(i=30, centerY=3, sideLength=61) returns -15.593447887235307
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0054 begin`);
      const actual: number = pentagonVertexY(30, 3, 61);
      logInfo(`pentagonVertexY(i=30, centerY=3, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-15.593447887235307, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0055
     * @tc.name      TsDrawingSample_PentagonVertexY_0055
     * @tc.desc      pentagonVertexY(i=120, centerY=61, sideLength=4) returns 59.78075751559111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0055 begin`);
      const actual: number = pentagonVertexY(120, 61, 4);
      logInfo(`pentagonVertexY(i=120, centerY=61, sideLe...: actual=${actual}`);
      expect(actual).assertClose(59.78075751559111, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0056
     * @tc.name      TsDrawingSample_PentagonVertexY_0056
     * @tc.desc      pentagonVertexY(i=30, centerY=120, sideLength=59) returns 102.01617335496913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0056 begin`);
      const actual: number = pentagonVertexY(30, 120, 59);
      logInfo(`pentagonVertexY(i=30, centerY=120, sideLe...: actual=${actual}`);
      expect(actual).assertClose(102.01617335496913, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0057
     * @tc.name      TsDrawingSample_PentagonVertexY_0057
     * @tc.desc      pentagonVertexY(i=2, centerY=60, sideLength=4) returns 63.2256451060705
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0057 begin`);
      const actual: number = pentagonVertexY(2, 60, 4);
      logInfo(`pentagonVertexY(i=2, centerY=60, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(63.2256451060705, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0058
     * @tc.name      TsDrawingSample_PentagonVertexY_0058
     * @tc.desc      pentagonVertexY(i=30, centerY=6, sideLength=30) returns -3.1443186330665434
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0058 begin`);
      const actual: number = pentagonVertexY(30, 6, 30);
      logInfo(`pentagonVertexY(i=30, centerY=6, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-3.1443186330665434, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0059
     * @tc.name      TsDrawingSample_PentagonVertexY_0059
     * @tc.desc      pentagonVertexY(i=6, centerY=2, sideLength=59) returns 49.88480764523993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0059 begin`);
      const actual: number = pentagonVertexY(6, 2, 59);
      logInfo(`pentagonVertexY(i=6, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(49.88480764523993, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0060
     * @tc.name      TsDrawingSample_PentagonVertexY_0060
     * @tc.desc      pentagonVertexY(i=6, centerY=60, sideLength=6) returns 64.86964145544813
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0060 begin`);
      const actual: number = pentagonVertexY(6, 60, 6);
      logInfo(`pentagonVertexY(i=6, centerY=60, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(64.86964145544813, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0061
     * @tc.name      TsDrawingSample_PentagonVertexY_0061
     * @tc.desc      pentagonVertexY(i=59, centerY=30, sideLength=120) returns -89.9988279857389
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0061 begin`);
      const actual: number = pentagonVertexY(59, 30, 120);
      logInfo(`pentagonVertexY(i=59, centerY=30, sideLen...: actual=${actual}`);
      expect(actual).assertClose(-89.9988279857389, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0062
     * @tc.name      TsDrawingSample_PentagonVertexY_0062
     * @tc.desc      pentagonVertexY(i=3, centerY=3, sideLength=30) returns -6.396519943268174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0062 begin`);
      const actual: number = pentagonVertexY(3, 3, 30);
      logInfo(`pentagonVertexY(i=3, centerY=3, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-6.396519943268174, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0063
     * @tc.name      TsDrawingSample_PentagonVertexY_0063
     * @tc.desc      pentagonVertexY(i=2, centerY=4, sideLength=61) returns 53.19108786757514
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0063 begin`);
      const actual: number = pentagonVertexY(2, 4, 61);
      logInfo(`pentagonVertexY(i=2, centerY=4, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(53.19108786757514, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0064
     * @tc.name      TsDrawingSample_PentagonVertexY_0064
     * @tc.desc      pentagonVertexY(i=30, centerY=4, sideLength=2) returns 3.3903787577955637
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0064 begin`);
      const actual: number = pentagonVertexY(30, 4, 2);
      logInfo(`pentagonVertexY(i=30, centerY=4, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(3.3903787577955637, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0065
     * @tc.name      TsDrawingSample_PentagonVertexY_0065
     * @tc.desc      pentagonVertexY(i=120, centerY=6, sideLength=6) returns 4.171136273386667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0065 begin`);
      const actual: number = pentagonVertexY(120, 6, 6);
      logInfo(`pentagonVertexY(i=120, centerY=6, sideLen...: actual=${actual}`);
      expect(actual).assertClose(4.171136273386667, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0066
     * @tc.name      TsDrawingSample_PentagonVertexY_0066
     * @tc.desc      pentagonVertexY(i=3, centerY=2, sideLength=61) returns -17.106257217978623
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0066 begin`);
      const actual: number = pentagonVertexY(3, 2, 61);
      logInfo(`pentagonVertexY(i=3, centerY=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-17.106257217978623, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0067
     * @tc.name      TsDrawingSample_PentagonVertexY_0067
     * @tc.desc      pentagonVertexY(i=3, centerY=1, sideLength=60) returns -17.79303988653635
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0067 begin`);
      const actual: number = pentagonVertexY(3, 1, 60);
      logInfo(`pentagonVertexY(i=3, centerY=1, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-17.79303988653635, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0068
     * @tc.name      TsDrawingSample_PentagonVertexY_0068
     * @tc.desc      pentagonVertexY(i=60, centerY=3, sideLength=4) returns 1.780757515591122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0068 begin`);
      const actual: number = pentagonVertexY(60, 3, 4);
      logInfo(`pentagonVertexY(i=60, centerY=3, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(1.780757515591122, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0069
     * @tc.name      TsDrawingSample_PentagonVertexY_0069
     * @tc.desc      pentagonVertexY(i=60, centerY=1, sideLength=6) returns -0.8288637266133172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0069 begin`);
      const actual: number = pentagonVertexY(60, 1, 6);
      logInfo(`pentagonVertexY(i=60, centerY=1, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-0.8288637266133172, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0070
     * @tc.name      TsDrawingSample_PentagonVertexY_0070
     * @tc.desc      pentagonVertexY(i=120, centerY=60, sideLength=59) returns 42.016173354968885
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0070 begin`);
      const actual: number = pentagonVertexY(120, 60, 59);
      logInfo(`pentagonVertexY(i=120, centerY=60, sideLe...: actual=${actual}`);
      expect(actual).assertClose(42.016173354968885, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0071
     * @tc.name      TsDrawingSample_PentagonVertexY_0071
     * @tc.desc      pentagonVertexY(i=5, centerY=5, sideLength=1) returns 4.695189378897783
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0071 begin`);
      const actual: number = pentagonVertexY(5, 5, 1);
      logInfo(`pentagonVertexY(i=5, centerY=5, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(4.695189378897783, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0072
     * @tc.name      TsDrawingSample_PentagonVertexY_0072
     * @tc.desc      pentagonVertexY(i=1, centerY=5, sideLength=6) returns 9.869641455448129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0072 begin`);
      const actual: number = pentagonVertexY(1, 5, 6);
      logInfo(`pentagonVertexY(i=1, centerY=5, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(9.869641455448129, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0073
     * @tc.name      TsDrawingSample_PentagonVertexY_0073
     * @tc.desc      pentagonVertexY(i=2, centerY=30, sideLength=61) returns 79.19108786757513
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0073 begin`);
      const actual: number = pentagonVertexY(2, 30, 61);
      logInfo(`pentagonVertexY(i=2, centerY=30, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(79.19108786757513, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_Y_0074
     * @tc.name      TsDrawingSample_PentagonVertexY_0074
     * @tc.desc      pentagonVertexY(i=60, centerY=1, sideLength=4) returns -0.21924248440887806
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexY_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexY_0074 begin`);
      const actual: number = pentagonVertexY(60, 1, 4);
      logInfo(`pentagonVertexY(i=60, centerY=1, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-0.21924248440887806, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexY_0074 end`);
    });
  });
}
