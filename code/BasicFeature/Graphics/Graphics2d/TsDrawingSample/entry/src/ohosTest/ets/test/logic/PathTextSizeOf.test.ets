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
import { pathTextSizeOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pathTextSizeOf (74 cases). */
export default function pathTextSizeOfTest(): void {
  describe('PathTextSizeOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0001
     * @tc.name      TsDrawingSample_PathTextSizeOf_0001
     * @tc.desc      pathTextSizeOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PathTextSizeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0001 begin`);
      const actual: number = pathTextSizeOf(0);
      logInfo(`pathTextSizeOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PathTextSizeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0002
     * @tc.name      TsDrawingSample_PathTextSizeOf_0002
     * @tc.desc      pathTextSizeOf(screenWidth=1) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_PathTextSizeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0002 begin`);
      const actual: number = pathTextSizeOf(1);
      logInfo(`pathTextSizeOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0003
     * @tc.name      TsDrawingSample_PathTextSizeOf_0003
     * @tc.desc      pathTextSizeOf(screenWidth=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PathTextSizeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0003 begin`);
      const actual: number = pathTextSizeOf(20);
      logInfo(`pathTextSizeOf(screenWidth=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PathTextSizeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0004
     * @tc.name      TsDrawingSample_PathTextSizeOf_0004
     * @tc.desc      pathTextSizeOf(screenWidth=19) returns 0.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PathTextSizeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0004 begin`);
      const actual: number = pathTextSizeOf(19);
      logInfo(`pathTextSizeOf(screenWidth=19): actual=${actual}`);
      expect(actual).assertClose(0.95, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0005
     * @tc.name      TsDrawingSample_PathTextSizeOf_0005
     * @tc.desc      pathTextSizeOf(screenWidth=21) returns 1.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_PathTextSizeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0005 begin`);
      const actual: number = pathTextSizeOf(21);
      logInfo(`pathTextSizeOf(screenWidth=21): actual=${actual}`);
      expect(actual).assertClose(1.05, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0006
     * @tc.name      TsDrawingSample_PathTextSizeOf_0006
     * @tc.desc      pathTextSizeOf(screenWidth=40) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0006 begin`);
      const actual: number = pathTextSizeOf(40);
      logInfo(`pathTextSizeOf(screenWidth=40): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PathTextSizeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0007
     * @tc.name      TsDrawingSample_PathTextSizeOf_0007
     * @tc.desc      pathTextSizeOf(screenWidth=10) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0007 begin`);
      const actual: number = pathTextSizeOf(10);
      logInfo(`pathTextSizeOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0008
     * @tc.name      TsDrawingSample_PathTextSizeOf_0008
     * @tc.desc      pathTextSizeOf(screenWidth=100) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0008 begin`);
      const actual: number = pathTextSizeOf(100);
      logInfo(`pathTextSizeOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}PathTextSizeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0009
     * @tc.name      TsDrawingSample_PathTextSizeOf_0009
     * @tc.desc      pathTextSizeOf(screenWidth=360) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0009 begin`);
      const actual: number = pathTextSizeOf(360);
      logInfo(`pathTextSizeOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}PathTextSizeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0010
     * @tc.name      TsDrawingSample_PathTextSizeOf_0010
     * @tc.desc      pathTextSizeOf(screenWidth=720) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0010 begin`);
      const actual: number = pathTextSizeOf(720);
      logInfo(`pathTextSizeOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}PathTextSizeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0011
     * @tc.name      TsDrawingSample_PathTextSizeOf_0011
     * @tc.desc      pathTextSizeOf(screenWidth=1080) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0011 begin`);
      const actual: number = pathTextSizeOf(1080);
      logInfo(`pathTextSizeOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}PathTextSizeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0012
     * @tc.name      TsDrawingSample_PathTextSizeOf_0012
     * @tc.desc      pathTextSizeOf(screenWidth=1920) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0012 begin`);
      const actual: number = pathTextSizeOf(1920);
      logInfo(`pathTextSizeOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}PathTextSizeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0013
     * @tc.name      TsDrawingSample_PathTextSizeOf_0013
     * @tc.desc      pathTextSizeOf(screenWidth=-1) returns -0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathTextSizeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0013 begin`);
      const actual: number = pathTextSizeOf(-1);
      logInfo(`pathTextSizeOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.05, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0014
     * @tc.name      TsDrawingSample_PathTextSizeOf_0014
     * @tc.desc      pathTextSizeOf(screenWidth=2) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0014 begin`);
      const actual: number = pathTextSizeOf(2);
      logInfo(`pathTextSizeOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0015
     * @tc.name      TsDrawingSample_PathTextSizeOf_0015
     * @tc.desc      pathTextSizeOf(screenWidth=3) returns 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0015 begin`);
      const actual: number = pathTextSizeOf(3);
      logInfo(`pathTextSizeOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0016
     * @tc.name      TsDrawingSample_PathTextSizeOf_0016
     * @tc.desc      pathTextSizeOf(screenWidth=96) returns 4.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0016 begin`);
      const actual: number = pathTextSizeOf(96);
      logInfo(`pathTextSizeOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertClose(4.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0017
     * @tc.name      TsDrawingSample_PathTextSizeOf_0017
     * @tc.desc      pathTextSizeOf(screenWidth=192) returns 9.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0017 begin`);
      const actual: number = pathTextSizeOf(192);
      logInfo(`pathTextSizeOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertClose(9.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0018
     * @tc.name      TsDrawingSample_PathTextSizeOf_0018
     * @tc.desc      pathTextSizeOf(screenWidth=288) returns 14.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0018 begin`);
      const actual: number = pathTextSizeOf(288);
      logInfo(`pathTextSizeOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertClose(14.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0019
     * @tc.name      TsDrawingSample_PathTextSizeOf_0019
     * @tc.desc      pathTextSizeOf(screenWidth=384) returns 19.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0019 begin`);
      const actual: number = pathTextSizeOf(384);
      logInfo(`pathTextSizeOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertClose(19.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0020
     * @tc.name      TsDrawingSample_PathTextSizeOf_0020
     * @tc.desc      pathTextSizeOf(screenWidth=480) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0020 begin`);
      const actual: number = pathTextSizeOf(480);
      logInfo(`pathTextSizeOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}PathTextSizeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0021
     * @tc.name      TsDrawingSample_PathTextSizeOf_0021
     * @tc.desc      pathTextSizeOf(screenWidth=576) returns 28.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0021 begin`);
      const actual: number = pathTextSizeOf(576);
      logInfo(`pathTextSizeOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertClose(28.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0022
     * @tc.name      TsDrawingSample_PathTextSizeOf_0022
     * @tc.desc      pathTextSizeOf(screenWidth=672) returns 33.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0022 begin`);
      const actual: number = pathTextSizeOf(672);
      logInfo(`pathTextSizeOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertClose(33.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0023
     * @tc.name      TsDrawingSample_PathTextSizeOf_0023
     * @tc.desc      pathTextSizeOf(screenWidth=768) returns 38.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0023 begin`);
      const actual: number = pathTextSizeOf(768);
      logInfo(`pathTextSizeOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertClose(38.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0024
     * @tc.name      TsDrawingSample_PathTextSizeOf_0024
     * @tc.desc      pathTextSizeOf(screenWidth=864) returns 43.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0024 begin`);
      const actual: number = pathTextSizeOf(864);
      logInfo(`pathTextSizeOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertClose(43.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0025
     * @tc.name      TsDrawingSample_PathTextSizeOf_0025
     * @tc.desc      pathTextSizeOf(screenWidth=960) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0025 begin`);
      const actual: number = pathTextSizeOf(960);
      logInfo(`pathTextSizeOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}PathTextSizeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0026
     * @tc.name      TsDrawingSample_PathTextSizeOf_0026
     * @tc.desc      pathTextSizeOf(screenWidth=1056) returns 52.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0026 begin`);
      const actual: number = pathTextSizeOf(1056);
      logInfo(`pathTextSizeOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertClose(52.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0027
     * @tc.name      TsDrawingSample_PathTextSizeOf_0027
     * @tc.desc      pathTextSizeOf(screenWidth=1152) returns 57.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0027 begin`);
      const actual: number = pathTextSizeOf(1152);
      logInfo(`pathTextSizeOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertClose(57.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0028
     * @tc.name      TsDrawingSample_PathTextSizeOf_0028
     * @tc.desc      pathTextSizeOf(screenWidth=1248) returns 62.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0028 begin`);
      const actual: number = pathTextSizeOf(1248);
      logInfo(`pathTextSizeOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertClose(62.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0029
     * @tc.name      TsDrawingSample_PathTextSizeOf_0029
     * @tc.desc      pathTextSizeOf(screenWidth=1344) returns 67.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0029 begin`);
      const actual: number = pathTextSizeOf(1344);
      logInfo(`pathTextSizeOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertClose(67.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0030
     * @tc.name      TsDrawingSample_PathTextSizeOf_0030
     * @tc.desc      pathTextSizeOf(screenWidth=1440) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0030 begin`);
      const actual: number = pathTextSizeOf(1440);
      logInfo(`pathTextSizeOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}PathTextSizeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0031
     * @tc.name      TsDrawingSample_PathTextSizeOf_0031
     * @tc.desc      pathTextSizeOf(screenWidth=1536) returns 76.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0031 begin`);
      const actual: number = pathTextSizeOf(1536);
      logInfo(`pathTextSizeOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertClose(76.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0032
     * @tc.name      TsDrawingSample_PathTextSizeOf_0032
     * @tc.desc      pathTextSizeOf(screenWidth=1632) returns 81.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0032 begin`);
      const actual: number = pathTextSizeOf(1632);
      logInfo(`pathTextSizeOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertClose(81.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0033
     * @tc.name      TsDrawingSample_PathTextSizeOf_0033
     * @tc.desc      pathTextSizeOf(screenWidth=1728) returns 86.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0033 begin`);
      const actual: number = pathTextSizeOf(1728);
      logInfo(`pathTextSizeOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertClose(86.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0034
     * @tc.name      TsDrawingSample_PathTextSizeOf_0034
     * @tc.desc      pathTextSizeOf(screenWidth=1824) returns 91.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0034 begin`);
      const actual: number = pathTextSizeOf(1824);
      logInfo(`pathTextSizeOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertClose(91.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0035
     * @tc.name      TsDrawingSample_PathTextSizeOf_0035
     * @tc.desc      pathTextSizeOf(screenWidth=2016) returns 100.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0035 begin`);
      const actual: number = pathTextSizeOf(2016);
      logInfo(`pathTextSizeOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertClose(100.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0036
     * @tc.name      TsDrawingSample_PathTextSizeOf_0036
     * @tc.desc      pathTextSizeOf(screenWidth=2112) returns 105.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0036 begin`);
      const actual: number = pathTextSizeOf(2112);
      logInfo(`pathTextSizeOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertClose(105.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0037
     * @tc.name      TsDrawingSample_PathTextSizeOf_0037
     * @tc.desc      pathTextSizeOf(screenWidth=2208) returns 110.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0037 begin`);
      const actual: number = pathTextSizeOf(2208);
      logInfo(`pathTextSizeOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertClose(110.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0038
     * @tc.name      TsDrawingSample_PathTextSizeOf_0038
     * @tc.desc      pathTextSizeOf(screenWidth=2304) returns 115.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0038 begin`);
      const actual: number = pathTextSizeOf(2304);
      logInfo(`pathTextSizeOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertClose(115.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0039
     * @tc.name      TsDrawingSample_PathTextSizeOf_0039
     * @tc.desc      pathTextSizeOf(screenWidth=2400) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0039 begin`);
      const actual: number = pathTextSizeOf(2400);
      logInfo(`pathTextSizeOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}PathTextSizeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0040
     * @tc.name      TsDrawingSample_PathTextSizeOf_0040
     * @tc.desc      pathTextSizeOf(screenWidth=2496) returns 124.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0040 begin`);
      const actual: number = pathTextSizeOf(2496);
      logInfo(`pathTextSizeOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertClose(124.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0041
     * @tc.name      TsDrawingSample_PathTextSizeOf_0041
     * @tc.desc      pathTextSizeOf(screenWidth=2592) returns 129.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0041 begin`);
      const actual: number = pathTextSizeOf(2592);
      logInfo(`pathTextSizeOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertClose(129.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0042
     * @tc.name      TsDrawingSample_PathTextSizeOf_0042
     * @tc.desc      pathTextSizeOf(screenWidth=2688) returns 134.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0042 begin`);
      const actual: number = pathTextSizeOf(2688);
      logInfo(`pathTextSizeOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertClose(134.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0043
     * @tc.name      TsDrawingSample_PathTextSizeOf_0043
     * @tc.desc      pathTextSizeOf(screenWidth=2784) returns 139.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0043 begin`);
      const actual: number = pathTextSizeOf(2784);
      logInfo(`pathTextSizeOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertClose(139.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0044
     * @tc.name      TsDrawingSample_PathTextSizeOf_0044
     * @tc.desc      pathTextSizeOf(screenWidth=2880) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0044 begin`);
      const actual: number = pathTextSizeOf(2880);
      logInfo(`pathTextSizeOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}PathTextSizeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0045
     * @tc.name      TsDrawingSample_PathTextSizeOf_0045
     * @tc.desc      pathTextSizeOf(screenWidth=2976) returns 148.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0045 begin`);
      const actual: number = pathTextSizeOf(2976);
      logInfo(`pathTextSizeOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertClose(148.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0046
     * @tc.name      TsDrawingSample_PathTextSizeOf_0046
     * @tc.desc      pathTextSizeOf(screenWidth=3072) returns 153.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0046 begin`);
      const actual: number = pathTextSizeOf(3072);
      logInfo(`pathTextSizeOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertClose(153.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0047
     * @tc.name      TsDrawingSample_PathTextSizeOf_0047
     * @tc.desc      pathTextSizeOf(screenWidth=3168) returns 158.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0047 begin`);
      const actual: number = pathTextSizeOf(3168);
      logInfo(`pathTextSizeOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertClose(158.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0048
     * @tc.name      TsDrawingSample_PathTextSizeOf_0048
     * @tc.desc      pathTextSizeOf(screenWidth=3264) returns 163.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0048 begin`);
      const actual: number = pathTextSizeOf(3264);
      logInfo(`pathTextSizeOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertClose(163.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0049
     * @tc.name      TsDrawingSample_PathTextSizeOf_0049
     * @tc.desc      pathTextSizeOf(screenWidth=3360) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0049 begin`);
      const actual: number = pathTextSizeOf(3360);
      logInfo(`pathTextSizeOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}PathTextSizeOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0050
     * @tc.name      TsDrawingSample_PathTextSizeOf_0050
     * @tc.desc      pathTextSizeOf(screenWidth=3456) returns 172.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0050 begin`);
      const actual: number = pathTextSizeOf(3456);
      logInfo(`pathTextSizeOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertClose(172.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0051
     * @tc.name      TsDrawingSample_PathTextSizeOf_0051
     * @tc.desc      pathTextSizeOf(screenWidth=3552) returns 177.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0051 begin`);
      const actual: number = pathTextSizeOf(3552);
      logInfo(`pathTextSizeOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertClose(177.6, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0052
     * @tc.name      TsDrawingSample_PathTextSizeOf_0052
     * @tc.desc      pathTextSizeOf(screenWidth=3648) returns 182.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0052 begin`);
      const actual: number = pathTextSizeOf(3648);
      logInfo(`pathTextSizeOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertClose(182.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0053
     * @tc.name      TsDrawingSample_PathTextSizeOf_0053
     * @tc.desc      pathTextSizeOf(screenWidth=3744) returns 187.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0053 begin`);
      const actual: number = pathTextSizeOf(3744);
      logInfo(`pathTextSizeOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertClose(187.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0054
     * @tc.name      TsDrawingSample_PathTextSizeOf_0054
     * @tc.desc      pathTextSizeOf(screenWidth=3840) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0054 begin`);
      const actual: number = pathTextSizeOf(3840);
      logInfo(`pathTextSizeOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}PathTextSizeOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0055
     * @tc.name      TsDrawingSample_PathTextSizeOf_0055
     * @tc.desc      pathTextSizeOf(screenWidth=1825.94) returns 91.297
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0055 begin`);
      const actual: number = pathTextSizeOf(1825.94);
      logInfo(`pathTextSizeOf(screenWidth=1825.94): actual=${actual}`);
      expect(actual).assertClose(91.297, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0056
     * @tc.name      TsDrawingSample_PathTextSizeOf_0056
     * @tc.desc      pathTextSizeOf(screenWidth=2631) returns 131.55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0056 begin`);
      const actual: number = pathTextSizeOf(2631);
      logInfo(`pathTextSizeOf(screenWidth=2631): actual=${actual}`);
      expect(actual).assertClose(131.55, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0057
     * @tc.name      TsDrawingSample_PathTextSizeOf_0057
     * @tc.desc      pathTextSizeOf(screenWidth=769) returns 38.45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0057 begin`);
      const actual: number = pathTextSizeOf(769);
      logInfo(`pathTextSizeOf(screenWidth=769): actual=${actual}`);
      expect(actual).assertClose(38.45, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0058
     * @tc.name      TsDrawingSample_PathTextSizeOf_0058
     * @tc.desc      pathTextSizeOf(screenWidth=1265) returns 63.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0058 begin`);
      const actual: number = pathTextSizeOf(1265);
      logInfo(`pathTextSizeOf(screenWidth=1265): actual=${actual}`);
      expect(actual).assertClose(63.25, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0059
     * @tc.name      TsDrawingSample_PathTextSizeOf_0059
     * @tc.desc      pathTextSizeOf(screenWidth=147) returns 7.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0059 begin`);
      const actual: number = pathTextSizeOf(147);
      logInfo(`pathTextSizeOf(screenWidth=147): actual=${actual}`);
      expect(actual).assertClose(7.35, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0060
     * @tc.name      TsDrawingSample_PathTextSizeOf_0060
     * @tc.desc      pathTextSizeOf(screenWidth=887.51) returns 44.3755
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0060 begin`);
      const actual: number = pathTextSizeOf(887.51);
      logInfo(`pathTextSizeOf(screenWidth=887.51): actual=${actual}`);
      expect(actual).assertClose(44.3755, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0061
     * @tc.name      TsDrawingSample_PathTextSizeOf_0061
     * @tc.desc      pathTextSizeOf(screenWidth=-1307) returns -65.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathTextSizeOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0061 begin`);
      const actual: number = pathTextSizeOf(-1307);
      logInfo(`pathTextSizeOf(screenWidth=-1307): actual=${actual}`);
      expect(actual).assertClose(-65.35, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0062
     * @tc.name      TsDrawingSample_PathTextSizeOf_0062
     * @tc.desc      pathTextSizeOf(screenWidth=591.62) returns 29.581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0062 begin`);
      const actual: number = pathTextSizeOf(591.62);
      logInfo(`pathTextSizeOf(screenWidth=591.62): actual=${actual}`);
      expect(actual).assertClose(29.581, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0063
     * @tc.name      TsDrawingSample_PathTextSizeOf_0063
     * @tc.desc      pathTextSizeOf(screenWidth=1404.12) returns 70.20599999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0063 begin`);
      const actual: number = pathTextSizeOf(1404.12);
      logInfo(`pathTextSizeOf(screenWidth=1404.12): actual=${actual}`);
      expect(actual).assertClose(70.20599999999999, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0064
     * @tc.name      TsDrawingSample_PathTextSizeOf_0064
     * @tc.desc      pathTextSizeOf(screenWidth=259) returns 12.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0064 begin`);
      const actual: number = pathTextSizeOf(259);
      logInfo(`pathTextSizeOf(screenWidth=259): actual=${actual}`);
      expect(actual).assertClose(12.95, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0065
     * @tc.name      TsDrawingSample_PathTextSizeOf_0065
     * @tc.desc      pathTextSizeOf(screenWidth=1827) returns 91.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0065 begin`);
      const actual: number = pathTextSizeOf(1827);
      logInfo(`pathTextSizeOf(screenWidth=1827): actual=${actual}`);
      expect(actual).assertClose(91.35, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0066
     * @tc.name      TsDrawingSample_PathTextSizeOf_0066
     * @tc.desc      pathTextSizeOf(screenWidth=2981) returns 149.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0066 begin`);
      const actual: number = pathTextSizeOf(2981);
      logInfo(`pathTextSizeOf(screenWidth=2981): actual=${actual}`);
      expect(actual).assertClose(149.05, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0067
     * @tc.name      TsDrawingSample_PathTextSizeOf_0067
     * @tc.desc      pathTextSizeOf(screenWidth=1490) returns 74.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0067 begin`);
      const actual: number = pathTextSizeOf(1490);
      logInfo(`pathTextSizeOf(screenWidth=1490): actual=${actual}`);
      expect(actual).assertClose(74.5, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0068
     * @tc.name      TsDrawingSample_PathTextSizeOf_0068
     * @tc.desc      pathTextSizeOf(screenWidth=2468) returns 123.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0068 begin`);
      const actual: number = pathTextSizeOf(2468);
      logInfo(`pathTextSizeOf(screenWidth=2468): actual=${actual}`);
      expect(actual).assertClose(123.4, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0069
     * @tc.name      TsDrawingSample_PathTextSizeOf_0069
     * @tc.desc      pathTextSizeOf(screenWidth=-224) returns -11.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathTextSizeOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0069 begin`);
      const actual: number = pathTextSizeOf(-224);
      logInfo(`pathTextSizeOf(screenWidth=-224): actual=${actual}`);
      expect(actual).assertClose(-11.2, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0070
     * @tc.name      TsDrawingSample_PathTextSizeOf_0070
     * @tc.desc      pathTextSizeOf(screenWidth=423.96) returns 21.198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0070 begin`);
      const actual: number = pathTextSizeOf(423.96);
      logInfo(`pathTextSizeOf(screenWidth=423.96): actual=${actual}`);
      expect(actual).assertClose(21.198, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0071
     * @tc.name      TsDrawingSample_PathTextSizeOf_0071
     * @tc.desc      pathTextSizeOf(screenWidth=-965) returns -48.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathTextSizeOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0071 begin`);
      const actual: number = pathTextSizeOf(-965);
      logInfo(`pathTextSizeOf(screenWidth=-965): actual=${actual}`);
      expect(actual).assertClose(-48.25, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0072
     * @tc.name      TsDrawingSample_PathTextSizeOf_0072
     * @tc.desc      pathTextSizeOf(screenWidth=-1255) returns -62.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_PathTextSizeOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0072 begin`);
      const actual: number = pathTextSizeOf(-1255);
      logInfo(`pathTextSizeOf(screenWidth=-1255): actual=${actual}`);
      expect(actual).assertClose(-62.75, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0073
     * @tc.name      TsDrawingSample_PathTextSizeOf_0073
     * @tc.desc      pathTextSizeOf(screenWidth=3539) returns 176.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0073 begin`);
      const actual: number = pathTextSizeOf(3539);
      logInfo(`pathTextSizeOf(screenWidth=3539): actual=${actual}`);
      expect(actual).assertClose(176.95, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_PATH_TEXT_SIZE_OF_0074
     * @tc.name      TsDrawingSample_PathTextSizeOf_0074
     * @tc.desc      pathTextSizeOf(screenWidth=716) returns 35.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_PathTextSizeOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PathTextSizeOf_0074 begin`);
      const actual: number = pathTextSizeOf(716);
      logInfo(`pathTextSizeOf(screenWidth=716): actual=${actual}`);
      expect(actual).assertClose(35.8, PRECISION);
      logInfo(`${BUNDLE}PathTextSizeOf_0074 end`);
    });
  });
}
