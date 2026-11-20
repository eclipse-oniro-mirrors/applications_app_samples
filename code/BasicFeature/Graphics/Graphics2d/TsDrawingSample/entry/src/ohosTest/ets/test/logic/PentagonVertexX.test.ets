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
import { pentagonVertexX } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pentagonVertexX (74 cases). */
export default function pentagonVertexXTest(): void {
  describe('PentagonVertexXTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0001
     * @tc.name      TsDrawingSample_PentagonVertexX_0001
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PentagonVertexX_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0001 begin`);
      const actual: number = pentagonVertexX(2, 2, 0);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PentagonVertexX_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0002
     * @tc.name      TsDrawingSample_PentagonVertexX_0002
     * @tc.desc      pentagonVertexX(i=2, centerX=1, sideLength=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PentagonVertexX_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0002 begin`);
      const actual: number = pentagonVertexX(2, 1, 0);
      logInfo(`pentagonVertexX(i=2, centerX=1, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PentagonVertexX_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0003
     * @tc.name      TsDrawingSample_PentagonVertexX_0003
     * @tc.desc      pentagonVertexX(i=2, centerX=3, sideLength=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0003 begin`);
      const actual: number = pentagonVertexX(2, 3, 0);
      logInfo(`pentagonVertexX(i=2, centerX=3, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PentagonVertexX_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0004
     * @tc.name      TsDrawingSample_PentagonVertexX_0004
     * @tc.desc      pentagonVertexX(i=2, centerX=5, sideLength=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0004 begin`);
      const actual: number = pentagonVertexX(2, 5, 0);
      logInfo(`pentagonVertexX(i=2, centerX=5, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}PentagonVertexX_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0005
     * @tc.name      TsDrawingSample_PentagonVertexX_0005
     * @tc.desc      pentagonVertexX(i=2, centerX=4, sideLength=0) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0005 begin`);
      const actual: number = pentagonVertexX(2, 4, 0);
      logInfo(`pentagonVertexX(i=2, centerX=4, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}PentagonVertexX_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0006
     * @tc.name      TsDrawingSample_PentagonVertexX_0006
     * @tc.desc      pentagonVertexX(i=2, centerX=6, sideLength=0) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0006 begin`);
      const actual: number = pentagonVertexX(2, 6, 0);
      logInfo(`pentagonVertexX(i=2, centerX=6, sideLengt...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}PentagonVertexX_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0007
     * @tc.name      TsDrawingSample_PentagonVertexX_0007
     * @tc.desc      pentagonVertexX(i=2, centerX=60, sideLength=0) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0007 begin`);
      const actual: number = pentagonVertexX(2, 60, 0);
      logInfo(`pentagonVertexX(i=2, centerX=60, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}PentagonVertexX_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0008
     * @tc.name      TsDrawingSample_PentagonVertexX_0008
     * @tc.desc      pentagonVertexX(i=2, centerX=59, sideLength=0) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0008 begin`);
      const actual: number = pentagonVertexX(2, 59, 0);
      logInfo(`pentagonVertexX(i=2, centerX=59, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}PentagonVertexX_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0009
     * @tc.name      TsDrawingSample_PentagonVertexX_0009
     * @tc.desc      pentagonVertexX(i=2, centerX=61, sideLength=0) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0009 begin`);
      const actual: number = pentagonVertexX(2, 61, 0);
      logInfo(`pentagonVertexX(i=2, centerX=61, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}PentagonVertexX_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0010
     * @tc.name      TsDrawingSample_PentagonVertexX_0010
     * @tc.desc      pentagonVertexX(i=2, centerX=120, sideLength=0) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0010 begin`);
      const actual: number = pentagonVertexX(2, 120, 0);
      logInfo(`pentagonVertexX(i=2, centerX=120, sideLen...: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}PentagonVertexX_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0011
     * @tc.name      TsDrawingSample_PentagonVertexX_0011
     * @tc.desc      pentagonVertexX(i=2, centerX=30, sideLength=0) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0011 begin`);
      const actual: number = pentagonVertexX(2, 30, 0);
      logInfo(`pentagonVertexX(i=2, centerX=30, sideLeng...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}PentagonVertexX_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0012
     * @tc.name      TsDrawingSample_PentagonVertexX_0012
     * @tc.desc      pentagonVertexX(i=2, centerX=3.141592653589793, sideLength=0) returns 3.141592653589793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0012 begin`);
      const actual: number = pentagonVertexX(2, 3.141592653589793, 0);
      logInfo(`pentagonVertexX(i=2, centerX=3.1415926535...: actual=${actual}`);
      expect(actual).assertClose(3.141592653589793, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0013
     * @tc.name      TsDrawingSample_PentagonVertexX_0013
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=1) returns 2.5913550989931635
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0013 begin`);
      const actual: number = pentagonVertexX(2, 2, 1);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(2.5913550989931635, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0014
     * @tc.name      TsDrawingSample_PentagonVertexX_0014
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=2) returns 3.182710197986327
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0014 begin`);
      const actual: number = pentagonVertexX(2, 2, 2);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(3.182710197986327, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0015
     * @tc.name      TsDrawingSample_PentagonVertexX_0015
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=3) returns 3.77406529697949
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0015 begin`);
      const actual: number = pentagonVertexX(2, 2, 3);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(3.77406529697949, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0016
     * @tc.name      TsDrawingSample_PentagonVertexX_0016
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=5) returns 4.956775494965817
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0016 begin`);
      const actual: number = pentagonVertexX(2, 2, 5);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(4.956775494965817, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0017
     * @tc.name      TsDrawingSample_PentagonVertexX_0017
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=4) returns 4.365420395972654
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0017 begin`);
      const actual: number = pentagonVertexX(2, 2, 4);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(4.365420395972654, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0018
     * @tc.name      TsDrawingSample_PentagonVertexX_0018
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=6) returns 5.54813059395898
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0018 begin`);
      const actual: number = pentagonVertexX(2, 2, 6);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(5.54813059395898, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0019
     * @tc.name      TsDrawingSample_PentagonVertexX_0019
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=60) returns 37.4813059395898
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0019 begin`);
      const actual: number = pentagonVertexX(2, 2, 60);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(37.4813059395898, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0020
     * @tc.name      TsDrawingSample_PentagonVertexX_0020
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=59) returns 36.88995084059664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0020 begin`);
      const actual: number = pentagonVertexX(2, 2, 59);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(36.88995084059664, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0021
     * @tc.name      TsDrawingSample_PentagonVertexX_0021
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=61) returns 38.072661038582964
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0021 begin`);
      const actual: number = pentagonVertexX(2, 2, 61);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(38.072661038582964, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0022
     * @tc.name      TsDrawingSample_PentagonVertexX_0022
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=120) returns 72.9626118791796
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0022 begin`);
      const actual: number = pentagonVertexX(2, 2, 120);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(72.9626118791796, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0023
     * @tc.name      TsDrawingSample_PentagonVertexX_0023
     * @tc.desc      pentagonVertexX(i=2, centerX=2, sideLength=30) returns 19.7406529697949
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0023 begin`);
      const actual: number = pentagonVertexX(2, 2, 30);
      logInfo(`pentagonVertexX(i=2, centerX=2, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(19.7406529697949, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0024
     * @tc.name      TsDrawingSample_PentagonVertexX_0024
     * @tc.desc      pentagonVertexX(i=120, centerX=3, sideLength=61) returns -55.09719180532443
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0024 begin`);
      const actual: number = pentagonVertexX(120, 3, 61);
      logInfo(`pentagonVertexX(i=120, centerX=3, sideLen...: actual=${actual}`);
      expect(actual).assertClose(-55.09719180532443, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0025
     * @tc.name      TsDrawingSample_PentagonVertexX_0025
     * @tc.desc      pentagonVertexX(i=3, centerX=4, sideLength=4) returns 7.798725898580589
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0025 begin`);
      const actual: number = pentagonVertexX(3, 4, 4);
      logInfo(`pentagonVertexX(i=3, centerX=4, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(7.798725898580589, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0026
     * @tc.name      TsDrawingSample_PentagonVertexX_0026
     * @tc.desc      pentagonVertexX(i=3, centerX=1, sideLength=2) returns 2.8993629492902944
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0026 begin`);
      const actual: number = pentagonVertexX(3, 1, 2);
      logInfo(`pentagonVertexX(i=3, centerX=1, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(2.8993629492902944, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0027
     * @tc.name      TsDrawingSample_PentagonVertexX_0027
     * @tc.desc      pentagonVertexX(i=5, centerX=3, sideLength=2) returns 1.0951740391696876
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0027 begin`);
      const actual: number = pentagonVertexX(5, 3, 2);
      logInfo(`pentagonVertexX(i=5, centerX=3, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(1.0951740391696876, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0028
     * @tc.name      TsDrawingSample_PentagonVertexX_0028
     * @tc.desc      pentagonVertexX(i=60, centerX=61, sideLength=6) returns 55.28552211750907
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0028 begin`);
      const actual: number = pentagonVertexX(60, 61, 6);
      logInfo(`pentagonVertexX(i=60, centerX=61, sideLen...: actual=${actual}`);
      expect(actual).assertClose(55.28552211750907, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0029
     * @tc.name      TsDrawingSample_PentagonVertexX_0029
     * @tc.desc      pentagonVertexX(i=2, centerX=30, sideLength=6) returns 33.54813059395898
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0029 begin`);
      const actual: number = pentagonVertexX(2, 30, 6);
      logInfo(`pentagonVertexX(i=2, centerX=30, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(33.54813059395898, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0030
     * @tc.name      TsDrawingSample_PentagonVertexX_0030
     * @tc.desc      pentagonVertexX(i=3.141592653589793, centerX=61, sideLength=30) returns 87.37751906059862
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0030 begin`);
      const actual: number = pentagonVertexX(3.141592653589793, 61, 30);
      logInfo(`pentagonVertexX(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(87.37751906059862, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0031
     * @tc.name      TsDrawingSample_PentagonVertexX_0031
     * @tc.desc      pentagonVertexX(i=4, centerX=30, sideLength=3) returns 29.986740992470978
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0031 begin`);
      const actual: number = pentagonVertexX(4, 30, 3);
      logInfo(`pentagonVertexX(i=4, centerX=30, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(29.986740992470978, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0032
     * @tc.name      TsDrawingSample_PentagonVertexX_0032
     * @tc.desc      pentagonVertexX(i=30, centerX=1, sideLength=1) returns 0.047587019584844126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0032 begin`);
      const actual: number = pentagonVertexX(30, 1, 1);
      logInfo(`pentagonVertexX(i=30, centerX=1, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(0.047587019584844126, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0033
     * @tc.name      TsDrawingSample_PentagonVertexX_0033
     * @tc.desc      pentagonVertexX(i=3.141592653589793, centerX=5, sideLength=61) returns 58.63428875655053
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0033 begin`);
      const actual: number = pentagonVertexX(3.141592653589793, 5, 61);
      logInfo(`pentagonVertexX(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(58.63428875655053, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0034
     * @tc.name      TsDrawingSample_PentagonVertexX_0034
     * @tc.desc      pentagonVertexX(i=60, centerX=60, sideLength=61) returns 1.9028081946755222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0034 begin`);
      const actual: number = pentagonVertexX(60, 60, 61);
      logInfo(`pentagonVertexX(i=60, centerX=60, sideLen...: actual=${actual}`);
      expect(actual).assertClose(1.9028081946755222, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0035
     * @tc.name      TsDrawingSample_PentagonVertexX_0035
     * @tc.desc      pentagonVertexX(i=59, centerX=61, sideLength=4) returns 60.98232132329468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0035 begin`);
      const actual: number = pentagonVertexX(59, 61, 4);
      logInfo(`pentagonVertexX(i=59, centerX=61, sideLen...: actual=${actual}`);
      expect(actual).assertClose(60.98232132329468, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0036
     * @tc.name      TsDrawingSample_PentagonVertexX_0036
     * @tc.desc      pentagonVertexX(i=1, centerX=60, sideLength=59) returns 25.531968481238003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0036 begin`);
      const actual: number = pentagonVertexX(1, 60, 59);
      logInfo(`pentagonVertexX(i=1, centerX=60, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(25.531968481238003, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0037
     * @tc.name      TsDrawingSample_PentagonVertexX_0037
     * @tc.desc      pentagonVertexX(i=60, centerX=2, sideLength=4) returns -1.8096519216606217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0037 begin`);
      const actual: number = pentagonVertexX(60, 2, 4);
      logInfo(`pentagonVertexX(i=60, centerX=2, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-1.8096519216606217, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0038
     * @tc.name      TsDrawingSample_PentagonVertexX_0038
     * @tc.desc      pentagonVertexX(i=61, centerX=61, sideLength=6) returns 57.49477645571914
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0038 begin`);
      const actual: number = pentagonVertexX(61, 61, 6);
      logInfo(`pentagonVertexX(i=61, centerX=61, sideLen...: actual=${actual}`);
      expect(actual).assertClose(57.49477645571914, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0039
     * @tc.name      TsDrawingSample_PentagonVertexX_0039
     * @tc.desc      pentagonVertexX(i=30, centerX=3, sideLength=59) returns -53.1923658444942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0039 begin`);
      const actual: number = pentagonVertexX(30, 3, 59);
      logInfo(`pentagonVertexX(i=30, centerX=3, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-53.1923658444942, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0040
     * @tc.name      TsDrawingSample_PentagonVertexX_0040
     * @tc.desc      pentagonVertexX(i=5, centerX=3.141592653589793, sideLength=120) returns -111.14796499622895
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0040 begin`);
      const actual: number = pentagonVertexX(5, 3.141592653589793, 120);
      logInfo(`pentagonVertexX(i=5, centerX=3.1415926535...: actual=${actual}`);
      expect(actual).assertClose(-111.14796499622895, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0041
     * @tc.name      TsDrawingSample_PentagonVertexX_0041
     * @tc.desc      pentagonVertexX(i=4, centerX=120, sideLength=120) returns 119.4696396988391
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0041 begin`);
      const actual: number = pentagonVertexX(4, 120, 120);
      logInfo(`pentagonVertexX(i=4, centerX=120, sideLen...: actual=${actual}`);
      expect(actual).assertClose(119.4696396988391, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0042
     * @tc.name      TsDrawingSample_PentagonVertexX_0042
     * @tc.desc      pentagonVertexX(i=30, centerX=59, sideLength=61) returns 0.9028081946754938
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0042 begin`);
      const actual: number = pentagonVertexX(30, 59, 61);
      logInfo(`pentagonVertexX(i=30, centerX=59, sideLen...: actual=${actual}`);
      expect(actual).assertClose(0.9028081946754938, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0043
     * @tc.name      TsDrawingSample_PentagonVertexX_0043
     * @tc.desc      pentagonVertexX(i=60, centerX=3.141592653589793, sideLength=3) returns 0.28435371234432694
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0043 begin`);
      const actual: number = pentagonVertexX(60, 3.141592653589793, 3);
      logInfo(`pentagonVertexX(i=60, centerX=3.141592653...: actual=${actual}`);
      expect(actual).assertClose(0.28435371234432694, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0044
     * @tc.name      TsDrawingSample_PentagonVertexX_0044
     * @tc.desc      pentagonVertexX(i=4, centerX=60, sideLength=3) returns 59.98674099247098
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0044 begin`);
      const actual: number = pentagonVertexX(4, 60, 3);
      logInfo(`pentagonVertexX(i=4, centerX=60, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(59.98674099247098, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0045
     * @tc.name      TsDrawingSample_PentagonVertexX_0045
     * @tc.desc      pentagonVertexX(i=1, centerX=120, sideLength=2) returns 118.83159215190638
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0045 begin`);
      const actual: number = pentagonVertexX(1, 120, 2);
      logInfo(`pentagonVertexX(i=1, centerX=120, sideLen...: actual=${actual}`);
      expect(actual).assertClose(118.83159215190638, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0046
     * @tc.name      TsDrawingSample_PentagonVertexX_0046
     * @tc.desc      pentagonVertexX(i=61, centerX=5, sideLength=5) returns 2.078980379765949
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0046 begin`);
      const actual: number = pentagonVertexX(61, 5, 5);
      logInfo(`pentagonVertexX(i=61, centerX=5, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(2.078980379765949, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0047
     * @tc.name      TsDrawingSample_PentagonVertexX_0047
     * @tc.desc      pentagonVertexX(i=2, centerX=5, sideLength=59) returns 39.88995084059664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0047 begin`);
      const actual: number = pentagonVertexX(2, 5, 59);
      logInfo(`pentagonVertexX(i=2, centerX=5, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(39.88995084059664, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0048
     * @tc.name      TsDrawingSample_PentagonVertexX_0048
     * @tc.desc      pentagonVertexX(i=3.141592653589793, centerX=1, sideLength=120) returns 106.51007624239449
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0048 begin`);
      const actual: number = pentagonVertexX(3.141592653589793, 1, 120);
      logInfo(`pentagonVertexX(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(106.51007624239449, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0049
     * @tc.name      TsDrawingSample_PentagonVertexX_0049
     * @tc.desc      pentagonVertexX(i=4, centerX=4, sideLength=6) returns 3.973481984941955
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0049 begin`);
      const actual: number = pentagonVertexX(4, 4, 6);
      logInfo(`pentagonVertexX(i=4, centerX=4, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(3.973481984941955, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0050
     * @tc.name      TsDrawingSample_PentagonVertexX_0050
     * @tc.desc      pentagonVertexX(i=30, centerX=120, sideLength=120) returns 5.710442350181296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PentagonVertexX_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0050 begin`);
      const actual: number = pentagonVertexX(30, 120, 120);
      logInfo(`pentagonVertexX(i=30, centerX=120, sideLe...: actual=${actual}`);
      expect(actual).assertClose(5.710442350181296, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0051
     * @tc.name      TsDrawingSample_PentagonVertexX_0051
     * @tc.desc      pentagonVertexX(i=120, centerX=61, sideLength=1) returns 60.047587019584846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0051 begin`);
      const actual: number = pentagonVertexX(120, 61, 1);
      logInfo(`pentagonVertexX(i=120, centerX=61, sideLe...: actual=${actual}`);
      expect(actual).assertClose(60.047587019584846, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0052
     * @tc.name      TsDrawingSample_PentagonVertexX_0052
     * @tc.desc      pentagonVertexX(i=6, centerX=1, sideLength=59) returns -33.46803151876201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0052 begin`);
      const actual: number = pentagonVertexX(6, 1, 59);
      logInfo(`pentagonVertexX(i=6, centerX=1, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-33.46803151876201, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0053
     * @tc.name      TsDrawingSample_PentagonVertexX_0053
     * @tc.desc      pentagonVertexX(i=60, centerX=2, sideLength=1) returns 1.0475870195848445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0053 begin`);
      const actual: number = pentagonVertexX(60, 2, 1);
      logInfo(`pentagonVertexX(i=60, centerX=2, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(1.0475870195848445, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0054
     * @tc.name      TsDrawingSample_PentagonVertexX_0054
     * @tc.desc      pentagonVertexX(i=30, centerX=59, sideLength=59) returns 2.807634155505802
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0054 begin`);
      const actual: number = pentagonVertexX(30, 59, 59);
      logInfo(`pentagonVertexX(i=30, centerX=59, sideLen...: actual=${actual}`);
      expect(actual).assertClose(2.807634155505802, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0055
     * @tc.name      TsDrawingSample_PentagonVertexX_0055
     * @tc.desc      pentagonVertexX(i=3.141592653589793, centerX=1, sideLength=60) returns 53.755038121197245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0055 begin`);
      const actual: number = pentagonVertexX(3.141592653589793, 1, 60);
      logInfo(`pentagonVertexX(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(53.755038121197245, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0056
     * @tc.name      TsDrawingSample_PentagonVertexX_0056
     * @tc.desc      pentagonVertexX(i=30, centerX=1, sideLength=3) returns -1.8572389412454675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0056 begin`);
      const actual: number = pentagonVertexX(30, 1, 3);
      logInfo(`pentagonVertexX(i=30, centerX=1, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-1.8572389412454675, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0057
     * @tc.name      TsDrawingSample_PentagonVertexX_0057
     * @tc.desc      pentagonVertexX(i=1, centerX=3.141592653589793, sideLength=5) returns 0.2205730333557252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0057 begin`);
      const actual: number = pentagonVertexX(1, 3.141592653589793, 5);
      logInfo(`pentagonVertexX(i=1, centerX=3.1415926535...: actual=${actual}`);
      expect(actual).assertClose(0.2205730333557252, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0058
     * @tc.name      TsDrawingSample_PentagonVertexX_0058
     * @tc.desc      pentagonVertexX(i=5, centerX=3, sideLength=61) returns -55.09719180532453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0058 begin`);
      const actual: number = pentagonVertexX(5, 3, 61);
      logInfo(`pentagonVertexX(i=5, centerX=3, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-55.09719180532453, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0059
     * @tc.name      TsDrawingSample_PentagonVertexX_0059
     * @tc.desc      pentagonVertexX(i=4, centerX=6, sideLength=5) returns 5.977901654118296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0059 begin`);
      const actual: number = pentagonVertexX(4, 6, 5);
      logInfo(`pentagonVertexX(i=4, centerX=6, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(5.977901654118296, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0060
     * @tc.name      TsDrawingSample_PentagonVertexX_0060
     * @tc.desc      pentagonVertexX(i=60, centerX=1, sideLength=60) returns -56.144778824909324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0060 begin`);
      const actual: number = pentagonVertexX(60, 1, 60);
      logInfo(`pentagonVertexX(i=60, centerX=1, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-56.144778824909324, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0061
     * @tc.name      TsDrawingSample_PentagonVertexX_0061
     * @tc.desc      pentagonVertexX(i=60, centerX=59, sideLength=5) returns 54.23793509792422
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0061 begin`);
      const actual: number = pentagonVertexX(60, 59, 5);
      logInfo(`pentagonVertexX(i=60, centerX=59, sideLen...: actual=${actual}`);
      expect(actual).assertClose(54.23793509792422, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0062
     * @tc.name      TsDrawingSample_PentagonVertexX_0062
     * @tc.desc      pentagonVertexX(i=30, centerX=6, sideLength=59) returns -50.1923658444942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0062 begin`);
      const actual: number = pentagonVertexX(30, 6, 59);
      logInfo(`pentagonVertexX(i=30, centerX=6, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(-50.1923658444942, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0063
     * @tc.name      TsDrawingSample_PentagonVertexX_0063
     * @tc.desc      pentagonVertexX(i=2, centerX=3.141592653589793, sideLength=3) returns 4.915657950569283
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0063 begin`);
      const actual: number = pentagonVertexX(2, 3.141592653589793, 3);
      logInfo(`pentagonVertexX(i=2, centerX=3.1415926535...: actual=${actual}`);
      expect(actual).assertClose(4.915657950569283, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0064
     * @tc.name      TsDrawingSample_PentagonVertexX_0064
     * @tc.desc      pentagonVertexX(i=3.141592653589793, centerX=30, sideLength=6) returns 35.27550381211972
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0064 begin`);
      const actual: number = pentagonVertexX(3.141592653589793, 30, 6);
      logInfo(`pentagonVertexX(i=3.141592653589793, cent...: actual=${actual}`);
      expect(actual).assertClose(35.27550381211972, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0065
     * @tc.name      TsDrawingSample_PentagonVertexX_0065
     * @tc.desc      pentagonVertexX(i=1, centerX=61, sideLength=61) returns 25.363560633144374
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0065 begin`);
      const actual: number = pentagonVertexX(1, 61, 61);
      logInfo(`pentagonVertexX(i=1, centerX=61, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(25.363560633144374, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0066
     * @tc.name      TsDrawingSample_PentagonVertexX_0066
     * @tc.desc      pentagonVertexX(i=4, centerX=30, sideLength=120) returns 29.4696396988391
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0066 begin`);
      const actual: number = pentagonVertexX(4, 30, 120);
      logInfo(`pentagonVertexX(i=4, centerX=30, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(29.4696396988391, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0067
     * @tc.name      TsDrawingSample_PentagonVertexX_0067
     * @tc.desc      pentagonVertexX(i=60, centerX=3.141592653589793, sideLength=1) returns 2.1891796731746376
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0067 begin`);
      const actual: number = pentagonVertexX(60, 3.141592653589793, 1);
      logInfo(`pentagonVertexX(i=60, centerX=3.141592653...: actual=${actual}`);
      expect(actual).assertClose(2.1891796731746376, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0068
     * @tc.name      TsDrawingSample_PentagonVertexX_0068
     * @tc.desc      pentagonVertexX(i=120, centerX=60, sideLength=120) returns -54.28955764981855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0068 begin`);
      const actual: number = pentagonVertexX(120, 60, 120);
      logInfo(`pentagonVertexX(i=120, centerX=60, sideLe...: actual=${actual}`);
      expect(actual).assertClose(-54.28955764981855, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0069
     * @tc.name      TsDrawingSample_PentagonVertexX_0069
     * @tc.desc      pentagonVertexX(i=1, centerX=1, sideLength=5) returns -1.921019620234068
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0069 begin`);
      const actual: number = pentagonVertexX(1, 1, 5);
      logInfo(`pentagonVertexX(i=1, centerX=1, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(-1.921019620234068, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0070
     * @tc.name      TsDrawingSample_PentagonVertexX_0070
     * @tc.desc      pentagonVertexX(i=3, centerX=6, sideLength=2) returns 7.899362949290294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0070 begin`);
      const actual: number = pentagonVertexX(3, 6, 2);
      logInfo(`pentagonVertexX(i=3, centerX=6, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(7.899362949290294, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0071
     * @tc.name      TsDrawingSample_PentagonVertexX_0071
     * @tc.desc      pentagonVertexX(i=120, centerX=6, sideLength=120) returns -108.28955764981855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0071 begin`);
      const actual: number = pentagonVertexX(120, 6, 120);
      logInfo(`pentagonVertexX(i=120, centerX=6, sideLen...: actual=${actual}`);
      expect(actual).assertClose(-108.28955764981855, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0072
     * @tc.name      TsDrawingSample_PentagonVertexX_0072
     * @tc.desc      pentagonVertexX(i=5, centerX=30, sideLength=3) returns 27.14276105875453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0072 begin`);
      const actual: number = pentagonVertexX(5, 30, 3);
      logInfo(`pentagonVertexX(i=5, centerX=30, sideLeng...: actual=${actual}`);
      expect(actual).assertClose(27.14276105875453, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0073
     * @tc.name      TsDrawingSample_PentagonVertexX_0073
     * @tc.desc      pentagonVertexX(i=3, centerX=1, sideLength=61) returns 58.93056995335399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0073 begin`);
      const actual: number = pentagonVertexX(3, 1, 61);
      logInfo(`pentagonVertexX(i=3, centerX=1, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(58.93056995335399, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PENTAGON_VERTEX_X_0074
     * @tc.name      TsDrawingSample_PentagonVertexX_0074
     * @tc.desc      pentagonVertexX(i=6, centerX=4, sideLength=6) returns 0.49477645571911744
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PentagonVertexX_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PentagonVertexX_0074 begin`);
      const actual: number = pentagonVertexX(6, 4, 6);
      logInfo(`pentagonVertexX(i=6, centerX=4, sideLengt...: actual=${actual}`);
      expect(actual).assertClose(0.49477645571911744, PRECISION);
      logInfo(`${BUNDLE}PentagonVertexX_0074 end`);
    });
  });
}
