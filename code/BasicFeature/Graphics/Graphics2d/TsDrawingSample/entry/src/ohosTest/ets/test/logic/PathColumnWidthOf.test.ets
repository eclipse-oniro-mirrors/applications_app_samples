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
import { pathColumnWidthOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pathColumnWidthOf (74 cases). */
export default function pathColumnWidthOfTest(): void {
  describe('PathColumnWidthOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0001
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0001
     * @tc.desc      pathColumnWidthOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PathColumnWidthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0001 begin`);
      const actual: number = pathColumnWidthOf(0);
      logInfo(`pathColumnWidthOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PathColumnWidthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0002
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0002
     * @tc.desc      pathColumnWidthOf(screenWidth=1) returns 0.16666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PathColumnWidthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0002 begin`);
      const actual: number = pathColumnWidthOf(1);
      logInfo(`pathColumnWidthOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.16666666666666666, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0003
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0003
     * @tc.desc      pathColumnWidthOf(screenWidth=6) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PathColumnWidthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0003 begin`);
      const actual: number = pathColumnWidthOf(6);
      logInfo(`pathColumnWidthOf(screenWidth=6): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PathColumnWidthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0004
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0004
     * @tc.desc      pathColumnWidthOf(screenWidth=5) returns 0.8333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PathColumnWidthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0004 begin`);
      const actual: number = pathColumnWidthOf(5);
      logInfo(`pathColumnWidthOf(screenWidth=5): actual=${actual}`);
      expect(actual).assertClose(0.8333333333333334, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0005
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0005
     * @tc.desc      pathColumnWidthOf(screenWidth=7) returns 1.1666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PathColumnWidthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0005 begin`);
      const actual: number = pathColumnWidthOf(7);
      logInfo(`pathColumnWidthOf(screenWidth=7): actual=${actual}`);
      expect(actual).assertClose(1.1666666666666667, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0006
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0006
     * @tc.desc      pathColumnWidthOf(screenWidth=100) returns 16.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0006 begin`);
      const actual: number = pathColumnWidthOf(100);
      logInfo(`pathColumnWidthOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertClose(16.666666666666668, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0007
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0007
     * @tc.desc      pathColumnWidthOf(screenWidth=360) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0007 begin`);
      const actual: number = pathColumnWidthOf(360);
      logInfo(`pathColumnWidthOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}PathColumnWidthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0008
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0008
     * @tc.desc      pathColumnWidthOf(screenWidth=720) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0008 begin`);
      const actual: number = pathColumnWidthOf(720);
      logInfo(`pathColumnWidthOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}PathColumnWidthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0009
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0009
     * @tc.desc      pathColumnWidthOf(screenWidth=1080) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0009 begin`);
      const actual: number = pathColumnWidthOf(1080);
      logInfo(`pathColumnWidthOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PathColumnWidthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0010
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0010
     * @tc.desc      pathColumnWidthOf(screenWidth=1920) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0010 begin`);
      const actual: number = pathColumnWidthOf(1920);
      logInfo(`pathColumnWidthOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}PathColumnWidthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0011
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0011
     * @tc.desc      pathColumnWidthOf(screenWidth=-1) returns -0.16666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0011 begin`);
      const actual: number = pathColumnWidthOf(-1);
      logInfo(`pathColumnWidthOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.16666666666666666, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0012
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0012
     * @tc.desc      pathColumnWidthOf(screenWidth=2) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0012 begin`);
      const actual: number = pathColumnWidthOf(2);
      logInfo(`pathColumnWidthOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0013
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0013
     * @tc.desc      pathColumnWidthOf(screenWidth=3) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0013 begin`);
      const actual: number = pathColumnWidthOf(3);
      logInfo(`pathColumnWidthOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0014
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0014
     * @tc.desc      pathColumnWidthOf(screenWidth=10) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0014 begin`);
      const actual: number = pathColumnWidthOf(10);
      logInfo(`pathColumnWidthOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0015
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0015
     * @tc.desc      pathColumnWidthOf(screenWidth=96) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0015 begin`);
      const actual: number = pathColumnWidthOf(96);
      logInfo(`pathColumnWidthOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}PathColumnWidthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0016
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0016
     * @tc.desc      pathColumnWidthOf(screenWidth=192) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0016 begin`);
      const actual: number = pathColumnWidthOf(192);
      logInfo(`pathColumnWidthOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}PathColumnWidthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0017
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0017
     * @tc.desc      pathColumnWidthOf(screenWidth=288) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0017 begin`);
      const actual: number = pathColumnWidthOf(288);
      logInfo(`pathColumnWidthOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}PathColumnWidthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0018
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0018
     * @tc.desc      pathColumnWidthOf(screenWidth=384) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0018 begin`);
      const actual: number = pathColumnWidthOf(384);
      logInfo(`pathColumnWidthOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}PathColumnWidthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0019
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0019
     * @tc.desc      pathColumnWidthOf(screenWidth=480) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0019 begin`);
      const actual: number = pathColumnWidthOf(480);
      logInfo(`pathColumnWidthOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}PathColumnWidthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0020
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0020
     * @tc.desc      pathColumnWidthOf(screenWidth=576) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0020 begin`);
      const actual: number = pathColumnWidthOf(576);
      logInfo(`pathColumnWidthOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}PathColumnWidthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0021
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0021
     * @tc.desc      pathColumnWidthOf(screenWidth=672) returns 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0021 begin`);
      const actual: number = pathColumnWidthOf(672);
      logInfo(`pathColumnWidthOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(112);
      logInfo(`${BUNDLE}PathColumnWidthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0022
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0022
     * @tc.desc      pathColumnWidthOf(screenWidth=768) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0022 begin`);
      const actual: number = pathColumnWidthOf(768);
      logInfo(`pathColumnWidthOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}PathColumnWidthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0023
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0023
     * @tc.desc      pathColumnWidthOf(screenWidth=864) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0023 begin`);
      const actual: number = pathColumnWidthOf(864);
      logInfo(`pathColumnWidthOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}PathColumnWidthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0024
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0024
     * @tc.desc      pathColumnWidthOf(screenWidth=960) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0024 begin`);
      const actual: number = pathColumnWidthOf(960);
      logInfo(`pathColumnWidthOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}PathColumnWidthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0025
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0025
     * @tc.desc      pathColumnWidthOf(screenWidth=1056) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0025 begin`);
      const actual: number = pathColumnWidthOf(1056);
      logInfo(`pathColumnWidthOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}PathColumnWidthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0026
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0026
     * @tc.desc      pathColumnWidthOf(screenWidth=1152) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0026 begin`);
      const actual: number = pathColumnWidthOf(1152);
      logInfo(`pathColumnWidthOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}PathColumnWidthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0027
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0027
     * @tc.desc      pathColumnWidthOf(screenWidth=1248) returns 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0027 begin`);
      const actual: number = pathColumnWidthOf(1248);
      logInfo(`pathColumnWidthOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(208);
      logInfo(`${BUNDLE}PathColumnWidthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0028
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0028
     * @tc.desc      pathColumnWidthOf(screenWidth=1344) returns 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0028 begin`);
      const actual: number = pathColumnWidthOf(1344);
      logInfo(`pathColumnWidthOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(224);
      logInfo(`${BUNDLE}PathColumnWidthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0029
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0029
     * @tc.desc      pathColumnWidthOf(screenWidth=1440) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0029 begin`);
      const actual: number = pathColumnWidthOf(1440);
      logInfo(`pathColumnWidthOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}PathColumnWidthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0030
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0030
     * @tc.desc      pathColumnWidthOf(screenWidth=1536) returns 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0030 begin`);
      const actual: number = pathColumnWidthOf(1536);
      logInfo(`pathColumnWidthOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(256);
      logInfo(`${BUNDLE}PathColumnWidthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0031
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0031
     * @tc.desc      pathColumnWidthOf(screenWidth=1632) returns 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0031 begin`);
      const actual: number = pathColumnWidthOf(1632);
      logInfo(`pathColumnWidthOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(272);
      logInfo(`${BUNDLE}PathColumnWidthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0032
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0032
     * @tc.desc      pathColumnWidthOf(screenWidth=1728) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0032 begin`);
      const actual: number = pathColumnWidthOf(1728);
      logInfo(`pathColumnWidthOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}PathColumnWidthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0033
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0033
     * @tc.desc      pathColumnWidthOf(screenWidth=1824) returns 304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0033 begin`);
      const actual: number = pathColumnWidthOf(1824);
      logInfo(`pathColumnWidthOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(304);
      logInfo(`${BUNDLE}PathColumnWidthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0034
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0034
     * @tc.desc      pathColumnWidthOf(screenWidth=2016) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0034 begin`);
      const actual: number = pathColumnWidthOf(2016);
      logInfo(`pathColumnWidthOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}PathColumnWidthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0035
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0035
     * @tc.desc      pathColumnWidthOf(screenWidth=2112) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0035 begin`);
      const actual: number = pathColumnWidthOf(2112);
      logInfo(`pathColumnWidthOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(352);
      logInfo(`${BUNDLE}PathColumnWidthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0036
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0036
     * @tc.desc      pathColumnWidthOf(screenWidth=2208) returns 368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0036 begin`);
      const actual: number = pathColumnWidthOf(2208);
      logInfo(`pathColumnWidthOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(368);
      logInfo(`${BUNDLE}PathColumnWidthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0037
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0037
     * @tc.desc      pathColumnWidthOf(screenWidth=2304) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0037 begin`);
      const actual: number = pathColumnWidthOf(2304);
      logInfo(`pathColumnWidthOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}PathColumnWidthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0038
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0038
     * @tc.desc      pathColumnWidthOf(screenWidth=2400) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0038 begin`);
      const actual: number = pathColumnWidthOf(2400);
      logInfo(`pathColumnWidthOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}PathColumnWidthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0039
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0039
     * @tc.desc      pathColumnWidthOf(screenWidth=2496) returns 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0039 begin`);
      const actual: number = pathColumnWidthOf(2496);
      logInfo(`pathColumnWidthOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(416);
      logInfo(`${BUNDLE}PathColumnWidthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0040
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0040
     * @tc.desc      pathColumnWidthOf(screenWidth=2592) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0040 begin`);
      const actual: number = pathColumnWidthOf(2592);
      logInfo(`pathColumnWidthOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}PathColumnWidthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0041
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0041
     * @tc.desc      pathColumnWidthOf(screenWidth=2688) returns 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0041 begin`);
      const actual: number = pathColumnWidthOf(2688);
      logInfo(`pathColumnWidthOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(448);
      logInfo(`${BUNDLE}PathColumnWidthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0042
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0042
     * @tc.desc      pathColumnWidthOf(screenWidth=2784) returns 464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0042 begin`);
      const actual: number = pathColumnWidthOf(2784);
      logInfo(`pathColumnWidthOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(464);
      logInfo(`${BUNDLE}PathColumnWidthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0043
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0043
     * @tc.desc      pathColumnWidthOf(screenWidth=2880) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0043 begin`);
      const actual: number = pathColumnWidthOf(2880);
      logInfo(`pathColumnWidthOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}PathColumnWidthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0044
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0044
     * @tc.desc      pathColumnWidthOf(screenWidth=2976) returns 496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0044 begin`);
      const actual: number = pathColumnWidthOf(2976);
      logInfo(`pathColumnWidthOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(496);
      logInfo(`${BUNDLE}PathColumnWidthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0045
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0045
     * @tc.desc      pathColumnWidthOf(screenWidth=3072) returns 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0045 begin`);
      const actual: number = pathColumnWidthOf(3072);
      logInfo(`pathColumnWidthOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(512);
      logInfo(`${BUNDLE}PathColumnWidthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0046
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0046
     * @tc.desc      pathColumnWidthOf(screenWidth=3168) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0046 begin`);
      const actual: number = pathColumnWidthOf(3168);
      logInfo(`pathColumnWidthOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}PathColumnWidthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0047
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0047
     * @tc.desc      pathColumnWidthOf(screenWidth=3264) returns 544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0047 begin`);
      const actual: number = pathColumnWidthOf(3264);
      logInfo(`pathColumnWidthOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(544);
      logInfo(`${BUNDLE}PathColumnWidthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0048
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0048
     * @tc.desc      pathColumnWidthOf(screenWidth=3360) returns 560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0048 begin`);
      const actual: number = pathColumnWidthOf(3360);
      logInfo(`pathColumnWidthOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(560);
      logInfo(`${BUNDLE}PathColumnWidthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0049
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0049
     * @tc.desc      pathColumnWidthOf(screenWidth=3456) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0049 begin`);
      const actual: number = pathColumnWidthOf(3456);
      logInfo(`pathColumnWidthOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}PathColumnWidthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0050
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0050
     * @tc.desc      pathColumnWidthOf(screenWidth=3552) returns 592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0050 begin`);
      const actual: number = pathColumnWidthOf(3552);
      logInfo(`pathColumnWidthOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(592);
      logInfo(`${BUNDLE}PathColumnWidthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0051
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0051
     * @tc.desc      pathColumnWidthOf(screenWidth=3648) returns 608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0051 begin`);
      const actual: number = pathColumnWidthOf(3648);
      logInfo(`pathColumnWidthOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(608);
      logInfo(`${BUNDLE}PathColumnWidthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0052
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0052
     * @tc.desc      pathColumnWidthOf(screenWidth=3744) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0052 begin`);
      const actual: number = pathColumnWidthOf(3744);
      logInfo(`pathColumnWidthOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}PathColumnWidthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0053
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0053
     * @tc.desc      pathColumnWidthOf(screenWidth=3840) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0053 begin`);
      const actual: number = pathColumnWidthOf(3840);
      logInfo(`pathColumnWidthOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}PathColumnWidthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0054
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0054
     * @tc.desc      pathColumnWidthOf(screenWidth=-85) returns -14.166666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0054 begin`);
      const actual: number = pathColumnWidthOf(-85);
      logInfo(`pathColumnWidthOf(screenWidth=-85): actual=${actual}`);
      expect(actual).assertClose(-14.166666666666666, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0055
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0055
     * @tc.desc      pathColumnWidthOf(screenWidth=69.06) returns 11.51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0055 begin`);
      const actual: number = pathColumnWidthOf(69.06);
      logInfo(`pathColumnWidthOf(screenWidth=69.06): actual=${actual}`);
      expect(actual).assertClose(11.51, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0056
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0056
     * @tc.desc      pathColumnWidthOf(screenWidth=225.35) returns 37.55833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0056 begin`);
      const actual: number = pathColumnWidthOf(225.35);
      logInfo(`pathColumnWidthOf(screenWidth=225.35): actual=${actual}`);
      expect(actual).assertClose(37.55833333333333, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0057
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0057
     * @tc.desc      pathColumnWidthOf(screenWidth=37) returns 6.166666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0057 begin`);
      const actual: number = pathColumnWidthOf(37);
      logInfo(`pathColumnWidthOf(screenWidth=37): actual=${actual}`);
      expect(actual).assertClose(6.166666666666667, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0058
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0058
     * @tc.desc      pathColumnWidthOf(screenWidth=2904) returns 484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0058 begin`);
      const actual: number = pathColumnWidthOf(2904);
      logInfo(`pathColumnWidthOf(screenWidth=2904): actual=${actual}`);
      expect(actual).assertEqual(484);
      logInfo(`${BUNDLE}PathColumnWidthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0059
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0059
     * @tc.desc      pathColumnWidthOf(screenWidth=-1495) returns -249.16666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0059 begin`);
      const actual: number = pathColumnWidthOf(-1495);
      logInfo(`pathColumnWidthOf(screenWidth=-1495): actual=${actual}`);
      expect(actual).assertClose(-249.16666666666666, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0060
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0060
     * @tc.desc      pathColumnWidthOf(screenWidth=891.67) returns 148.61166666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0060 begin`);
      const actual: number = pathColumnWidthOf(891.67);
      logInfo(`pathColumnWidthOf(screenWidth=891.67): actual=${actual}`);
      expect(actual).assertClose(148.61166666666665, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0061
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0061
     * @tc.desc      pathColumnWidthOf(screenWidth=3358) returns 559.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0061 begin`);
      const actual: number = pathColumnWidthOf(3358);
      logInfo(`pathColumnWidthOf(screenWidth=3358): actual=${actual}`);
      expect(actual).assertClose(559.6666666666666, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0062
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0062
     * @tc.desc      pathColumnWidthOf(screenWidth=333.44) returns 55.57333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0062 begin`);
      const actual: number = pathColumnWidthOf(333.44);
      logInfo(`pathColumnWidthOf(screenWidth=333.44): actual=${actual}`);
      expect(actual).assertClose(55.57333333333333, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0063
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0063
     * @tc.desc      pathColumnWidthOf(screenWidth=2800) returns 466.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0063 begin`);
      const actual: number = pathColumnWidthOf(2800);
      logInfo(`pathColumnWidthOf(screenWidth=2800): actual=${actual}`);
      expect(actual).assertClose(466.6666666666667, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0064
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0064
     * @tc.desc      pathColumnWidthOf(screenWidth=-1335) returns -222.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0064 begin`);
      const actual: number = pathColumnWidthOf(-1335);
      logInfo(`pathColumnWidthOf(screenWidth=-1335): actual=${actual}`);
      expect(actual).assertClose(-222.5, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0065
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0065
     * @tc.desc      pathColumnWidthOf(screenWidth=-286) returns -47.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0065 begin`);
      const actual: number = pathColumnWidthOf(-286);
      logInfo(`pathColumnWidthOf(screenWidth=-286): actual=${actual}`);
      expect(actual).assertClose(-47.666666666666664, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0066
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0066
     * @tc.desc      pathColumnWidthOf(screenWidth=-22) returns -3.6666666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0066 begin`);
      const actual: number = pathColumnWidthOf(-22);
      logInfo(`pathColumnWidthOf(screenWidth=-22): actual=${actual}`);
      expect(actual).assertClose(-3.6666666666666665, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0067
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0067
     * @tc.desc      pathColumnWidthOf(screenWidth=-1150) returns -191.66666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0067 begin`);
      const actual: number = pathColumnWidthOf(-1150);
      logInfo(`pathColumnWidthOf(screenWidth=-1150): actual=${actual}`);
      expect(actual).assertClose(-191.66666666666666, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0068
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0068
     * @tc.desc      pathColumnWidthOf(screenWidth=-314) returns -52.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathColumnWidthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0068 begin`);
      const actual: number = pathColumnWidthOf(-314);
      logInfo(`pathColumnWidthOf(screenWidth=-314): actual=${actual}`);
      expect(actual).assertClose(-52.333333333333336, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0069
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0069
     * @tc.desc      pathColumnWidthOf(screenWidth=1796) returns 299.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0069 begin`);
      const actual: number = pathColumnWidthOf(1796);
      logInfo(`pathColumnWidthOf(screenWidth=1796): actual=${actual}`);
      expect(actual).assertClose(299.3333333333333, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0070
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0070
     * @tc.desc      pathColumnWidthOf(screenWidth=2783) returns 463.8333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0070 begin`);
      const actual: number = pathColumnWidthOf(2783);
      logInfo(`pathColumnWidthOf(screenWidth=2783): actual=${actual}`);
      expect(actual).assertClose(463.8333333333333, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0071
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0071
     * @tc.desc      pathColumnWidthOf(screenWidth=1754.21) returns 292.36833333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0071 begin`);
      const actual: number = pathColumnWidthOf(1754.21);
      logInfo(`pathColumnWidthOf(screenWidth=1754.21): actual=${actual}`);
      expect(actual).assertClose(292.36833333333334, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0072
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0072
     * @tc.desc      pathColumnWidthOf(screenWidth=2647) returns 441.1666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0072 begin`);
      const actual: number = pathColumnWidthOf(2647);
      logInfo(`pathColumnWidthOf(screenWidth=2647): actual=${actual}`);
      expect(actual).assertClose(441.1666666666667, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0073
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0073
     * @tc.desc      pathColumnWidthOf(screenWidth=3584) returns 597.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0073 begin`);
      const actual: number = pathColumnWidthOf(3584);
      logInfo(`pathColumnWidthOf(screenWidth=3584): actual=${actual}`);
      expect(actual).assertClose(597.3333333333334, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_COLUMN_WIDTH_OF_0074
     * @tc.name      TsDrawingSample_PathColumnWidthOf_0074
     * @tc.desc      pathColumnWidthOf(screenWidth=1750) returns 291.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathColumnWidthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathColumnWidthOf_0074 begin`);
      const actual: number = pathColumnWidthOf(1750);
      logInfo(`pathColumnWidthOf(screenWidth=1750): actual=${actual}`);
      expect(actual).assertClose(291.6666666666667, PRECISION);
      logInfo(`${BUNDLE}PathColumnWidthOf_0074 end`);
    });
  });
}
