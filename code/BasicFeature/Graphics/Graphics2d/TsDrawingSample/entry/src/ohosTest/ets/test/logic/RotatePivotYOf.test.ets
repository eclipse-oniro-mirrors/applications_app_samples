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
import { rotatePivotYOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for rotatePivotYOf (74 cases). */
export default function rotatePivotYOfTest(): void {
  describe('RotatePivotYOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0001
     * @tc.name      TsDrawingSample_RotatePivotYOf_0001
     * @tc.desc      rotatePivotYOf(screenWidth=0) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RotatePivotYOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0001 begin`);
      const actual: number = rotatePivotYOf(0);
      logInfo(`rotatePivotYOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}RotatePivotYOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0002
     * @tc.name      TsDrawingSample_RotatePivotYOf_0002
     * @tc.desc      rotatePivotYOf(screenWidth=1) returns 200.37333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RotatePivotYOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0002 begin`);
      const actual: number = rotatePivotYOf(1);
      logInfo(`rotatePivotYOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(200.37333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0003
     * @tc.name      TsDrawingSample_RotatePivotYOf_0003
     * @tc.desc      rotatePivotYOf(screenWidth=2) returns 200.74666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatePivotYOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0003 begin`);
      const actual: number = rotatePivotYOf(2);
      logInfo(`rotatePivotYOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(200.74666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0004
     * @tc.name      TsDrawingSample_RotatePivotYOf_0004
     * @tc.desc      rotatePivotYOf(screenWidth=100) returns 237.33333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatePivotYOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0004 begin`);
      const actual: number = rotatePivotYOf(100);
      logInfo(`rotatePivotYOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertClose(237.33333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0005
     * @tc.name      TsDrawingSample_RotatePivotYOf_0005
     * @tc.desc      rotatePivotYOf(screenWidth=99) returns 236.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatePivotYOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0005 begin`);
      const actual: number = rotatePivotYOf(99);
      logInfo(`rotatePivotYOf(screenWidth=99): actual=${actual}`);
      expect(actual).assertClose(236.96, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0006
     * @tc.name      TsDrawingSample_RotatePivotYOf_0006
     * @tc.desc      rotatePivotYOf(screenWidth=101) returns 237.70666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatePivotYOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0006 begin`);
      const actual: number = rotatePivotYOf(101);
      logInfo(`rotatePivotYOf(screenWidth=101): actual=${actual}`);
      expect(actual).assertClose(237.70666666666665, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0007
     * @tc.name      TsDrawingSample_RotatePivotYOf_0007
     * @tc.desc      rotatePivotYOf(screenWidth=200) returns 274.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0007 begin`);
      const actual: number = rotatePivotYOf(200);
      logInfo(`rotatePivotYOf(screenWidth=200): actual=${actual}`);
      expect(actual).assertClose(274.6666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0008
     * @tc.name      TsDrawingSample_RotatePivotYOf_0008
     * @tc.desc      rotatePivotYOf(screenWidth=50) returns 218.66666666666669
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0008 begin`);
      const actual: number = rotatePivotYOf(50);
      logInfo(`rotatePivotYOf(screenWidth=50): actual=${actual}`);
      expect(actual).assertClose(218.66666666666669, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0009
     * @tc.name      TsDrawingSample_RotatePivotYOf_0009
     * @tc.desc      rotatePivotYOf(screenWidth=360) returns 334.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0009 begin`);
      const actual: number = rotatePivotYOf(360);
      logInfo(`rotatePivotYOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertClose(334.4, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0010
     * @tc.name      TsDrawingSample_RotatePivotYOf_0010
     * @tc.desc      rotatePivotYOf(screenWidth=720) returns 468.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0010 begin`);
      const actual: number = rotatePivotYOf(720);
      logInfo(`rotatePivotYOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertClose(468.8, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0011
     * @tc.name      TsDrawingSample_RotatePivotYOf_0011
     * @tc.desc      rotatePivotYOf(screenWidth=1080) returns 603.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0011 begin`);
      const actual: number = rotatePivotYOf(1080);
      logInfo(`rotatePivotYOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertClose(603.2, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0012
     * @tc.name      TsDrawingSample_RotatePivotYOf_0012
     * @tc.desc      rotatePivotYOf(screenWidth=1920) returns 916.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0012 begin`);
      const actual: number = rotatePivotYOf(1920);
      logInfo(`rotatePivotYOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertClose(916.8, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0013
     * @tc.name      TsDrawingSample_RotatePivotYOf_0013
     * @tc.desc      rotatePivotYOf(screenWidth=-1) returns 199.62666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0013 begin`);
      const actual: number = rotatePivotYOf(-1);
      logInfo(`rotatePivotYOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(199.62666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0014
     * @tc.name      TsDrawingSample_RotatePivotYOf_0014
     * @tc.desc      rotatePivotYOf(screenWidth=3) returns 201.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0014 begin`);
      const actual: number = rotatePivotYOf(3);
      logInfo(`rotatePivotYOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(201.12, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0015
     * @tc.name      TsDrawingSample_RotatePivotYOf_0015
     * @tc.desc      rotatePivotYOf(screenWidth=10) returns 203.73333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0015 begin`);
      const actual: number = rotatePivotYOf(10);
      logInfo(`rotatePivotYOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(203.73333333333335, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0016
     * @tc.name      TsDrawingSample_RotatePivotYOf_0016
     * @tc.desc      rotatePivotYOf(screenWidth=96) returns 235.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0016 begin`);
      const actual: number = rotatePivotYOf(96);
      logInfo(`rotatePivotYOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertClose(235.84, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0017
     * @tc.name      TsDrawingSample_RotatePivotYOf_0017
     * @tc.desc      rotatePivotYOf(screenWidth=192) returns 271.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0017 begin`);
      const actual: number = rotatePivotYOf(192);
      logInfo(`rotatePivotYOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertClose(271.68, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0018
     * @tc.name      TsDrawingSample_RotatePivotYOf_0018
     * @tc.desc      rotatePivotYOf(screenWidth=288) returns 307.52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0018 begin`);
      const actual: number = rotatePivotYOf(288);
      logInfo(`rotatePivotYOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertClose(307.52, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0019
     * @tc.name      TsDrawingSample_RotatePivotYOf_0019
     * @tc.desc      rotatePivotYOf(screenWidth=384) returns 343.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0019 begin`);
      const actual: number = rotatePivotYOf(384);
      logInfo(`rotatePivotYOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertClose(343.36, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0020
     * @tc.name      TsDrawingSample_RotatePivotYOf_0020
     * @tc.desc      rotatePivotYOf(screenWidth=480) returns 379.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0020 begin`);
      const actual: number = rotatePivotYOf(480);
      logInfo(`rotatePivotYOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertClose(379.2, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0021
     * @tc.name      TsDrawingSample_RotatePivotYOf_0021
     * @tc.desc      rotatePivotYOf(screenWidth=576) returns 415.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0021 begin`);
      const actual: number = rotatePivotYOf(576);
      logInfo(`rotatePivotYOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertClose(415.04, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0022
     * @tc.name      TsDrawingSample_RotatePivotYOf_0022
     * @tc.desc      rotatePivotYOf(screenWidth=672) returns 450.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0022 begin`);
      const actual: number = rotatePivotYOf(672);
      logInfo(`rotatePivotYOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertClose(450.88, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0023
     * @tc.name      TsDrawingSample_RotatePivotYOf_0023
     * @tc.desc      rotatePivotYOf(screenWidth=768) returns 486.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0023 begin`);
      const actual: number = rotatePivotYOf(768);
      logInfo(`rotatePivotYOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertClose(486.72, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0024
     * @tc.name      TsDrawingSample_RotatePivotYOf_0024
     * @tc.desc      rotatePivotYOf(screenWidth=864) returns 522.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0024 begin`);
      const actual: number = rotatePivotYOf(864);
      logInfo(`rotatePivotYOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertClose(522.56, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0025
     * @tc.name      TsDrawingSample_RotatePivotYOf_0025
     * @tc.desc      rotatePivotYOf(screenWidth=960) returns 558.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0025 begin`);
      const actual: number = rotatePivotYOf(960);
      logInfo(`rotatePivotYOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertClose(558.4, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0026
     * @tc.name      TsDrawingSample_RotatePivotYOf_0026
     * @tc.desc      rotatePivotYOf(screenWidth=1056) returns 594.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0026 begin`);
      const actual: number = rotatePivotYOf(1056);
      logInfo(`rotatePivotYOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertClose(594.24, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0027
     * @tc.name      TsDrawingSample_RotatePivotYOf_0027
     * @tc.desc      rotatePivotYOf(screenWidth=1152) returns 630.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0027 begin`);
      const actual: number = rotatePivotYOf(1152);
      logInfo(`rotatePivotYOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertClose(630.08, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0028
     * @tc.name      TsDrawingSample_RotatePivotYOf_0028
     * @tc.desc      rotatePivotYOf(screenWidth=1248) returns 665.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0028 begin`);
      const actual: number = rotatePivotYOf(1248);
      logInfo(`rotatePivotYOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertClose(665.92, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0029
     * @tc.name      TsDrawingSample_RotatePivotYOf_0029
     * @tc.desc      rotatePivotYOf(screenWidth=1344) returns 701.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0029 begin`);
      const actual: number = rotatePivotYOf(1344);
      logInfo(`rotatePivotYOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertClose(701.76, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0030
     * @tc.name      TsDrawingSample_RotatePivotYOf_0030
     * @tc.desc      rotatePivotYOf(screenWidth=1440) returns 737.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0030 begin`);
      const actual: number = rotatePivotYOf(1440);
      logInfo(`rotatePivotYOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertClose(737.6, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0031
     * @tc.name      TsDrawingSample_RotatePivotYOf_0031
     * @tc.desc      rotatePivotYOf(screenWidth=1536) returns 773.44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0031 begin`);
      const actual: number = rotatePivotYOf(1536);
      logInfo(`rotatePivotYOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertClose(773.44, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0032
     * @tc.name      TsDrawingSample_RotatePivotYOf_0032
     * @tc.desc      rotatePivotYOf(screenWidth=1632) returns 809.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0032 begin`);
      const actual: number = rotatePivotYOf(1632);
      logInfo(`rotatePivotYOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertClose(809.28, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0033
     * @tc.name      TsDrawingSample_RotatePivotYOf_0033
     * @tc.desc      rotatePivotYOf(screenWidth=1728) returns 845.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0033 begin`);
      const actual: number = rotatePivotYOf(1728);
      logInfo(`rotatePivotYOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertClose(845.12, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0034
     * @tc.name      TsDrawingSample_RotatePivotYOf_0034
     * @tc.desc      rotatePivotYOf(screenWidth=1824) returns 880.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0034 begin`);
      const actual: number = rotatePivotYOf(1824);
      logInfo(`rotatePivotYOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertClose(880.96, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0035
     * @tc.name      TsDrawingSample_RotatePivotYOf_0035
     * @tc.desc      rotatePivotYOf(screenWidth=2016) returns 952.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0035 begin`);
      const actual: number = rotatePivotYOf(2016);
      logInfo(`rotatePivotYOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertClose(952.64, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0036
     * @tc.name      TsDrawingSample_RotatePivotYOf_0036
     * @tc.desc      rotatePivotYOf(screenWidth=2112) returns 988.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0036 begin`);
      const actual: number = rotatePivotYOf(2112);
      logInfo(`rotatePivotYOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertClose(988.48, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0037
     * @tc.name      TsDrawingSample_RotatePivotYOf_0037
     * @tc.desc      rotatePivotYOf(screenWidth=2208) returns 1024.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0037 begin`);
      const actual: number = rotatePivotYOf(2208);
      logInfo(`rotatePivotYOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertClose(1024.32, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0038
     * @tc.name      TsDrawingSample_RotatePivotYOf_0038
     * @tc.desc      rotatePivotYOf(screenWidth=2304) returns 1060.1599999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0038 begin`);
      const actual: number = rotatePivotYOf(2304);
      logInfo(`rotatePivotYOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertClose(1060.1599999999999, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0039
     * @tc.name      TsDrawingSample_RotatePivotYOf_0039
     * @tc.desc      rotatePivotYOf(screenWidth=2400) returns 1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0039 begin`);
      const actual: number = rotatePivotYOf(2400);
      logInfo(`rotatePivotYOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(1096);
      logInfo(`${BUNDLE}RotatePivotYOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0040
     * @tc.name      TsDrawingSample_RotatePivotYOf_0040
     * @tc.desc      rotatePivotYOf(screenWidth=2496) returns 1131.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0040 begin`);
      const actual: number = rotatePivotYOf(2496);
      logInfo(`rotatePivotYOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertClose(1131.84, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0041
     * @tc.name      TsDrawingSample_RotatePivotYOf_0041
     * @tc.desc      rotatePivotYOf(screenWidth=2592) returns 1167.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0041 begin`);
      const actual: number = rotatePivotYOf(2592);
      logInfo(`rotatePivotYOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertClose(1167.68, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0042
     * @tc.name      TsDrawingSample_RotatePivotYOf_0042
     * @tc.desc      rotatePivotYOf(screenWidth=2688) returns 1203.52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0042 begin`);
      const actual: number = rotatePivotYOf(2688);
      logInfo(`rotatePivotYOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertClose(1203.52, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0043
     * @tc.name      TsDrawingSample_RotatePivotYOf_0043
     * @tc.desc      rotatePivotYOf(screenWidth=2784) returns 1239.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0043 begin`);
      const actual: number = rotatePivotYOf(2784);
      logInfo(`rotatePivotYOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertClose(1239.36, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0044
     * @tc.name      TsDrawingSample_RotatePivotYOf_0044
     * @tc.desc      rotatePivotYOf(screenWidth=2880) returns 1275.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0044 begin`);
      const actual: number = rotatePivotYOf(2880);
      logInfo(`rotatePivotYOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertClose(1275.2, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0045
     * @tc.name      TsDrawingSample_RotatePivotYOf_0045
     * @tc.desc      rotatePivotYOf(screenWidth=2976) returns 1311.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0045 begin`);
      const actual: number = rotatePivotYOf(2976);
      logInfo(`rotatePivotYOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertClose(1311.04, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0046
     * @tc.name      TsDrawingSample_RotatePivotYOf_0046
     * @tc.desc      rotatePivotYOf(screenWidth=3072) returns 1346.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0046 begin`);
      const actual: number = rotatePivotYOf(3072);
      logInfo(`rotatePivotYOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertClose(1346.88, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0047
     * @tc.name      TsDrawingSample_RotatePivotYOf_0047
     * @tc.desc      rotatePivotYOf(screenWidth=3168) returns 1382.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0047 begin`);
      const actual: number = rotatePivotYOf(3168);
      logInfo(`rotatePivotYOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertClose(1382.72, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0048
     * @tc.name      TsDrawingSample_RotatePivotYOf_0048
     * @tc.desc      rotatePivotYOf(screenWidth=3264) returns 1418.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0048 begin`);
      const actual: number = rotatePivotYOf(3264);
      logInfo(`rotatePivotYOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertClose(1418.56, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0049
     * @tc.name      TsDrawingSample_RotatePivotYOf_0049
     * @tc.desc      rotatePivotYOf(screenWidth=3360) returns 1454.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0049 begin`);
      const actual: number = rotatePivotYOf(3360);
      logInfo(`rotatePivotYOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertClose(1454.4, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0050
     * @tc.name      TsDrawingSample_RotatePivotYOf_0050
     * @tc.desc      rotatePivotYOf(screenWidth=3456) returns 1490.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0050 begin`);
      const actual: number = rotatePivotYOf(3456);
      logInfo(`rotatePivotYOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertClose(1490.24, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0051
     * @tc.name      TsDrawingSample_RotatePivotYOf_0051
     * @tc.desc      rotatePivotYOf(screenWidth=3552) returns 1526.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0051 begin`);
      const actual: number = rotatePivotYOf(3552);
      logInfo(`rotatePivotYOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertClose(1526.08, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0052
     * @tc.name      TsDrawingSample_RotatePivotYOf_0052
     * @tc.desc      rotatePivotYOf(screenWidth=3648) returns 1561.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0052 begin`);
      const actual: number = rotatePivotYOf(3648);
      logInfo(`rotatePivotYOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertClose(1561.92, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0053
     * @tc.name      TsDrawingSample_RotatePivotYOf_0053
     * @tc.desc      rotatePivotYOf(screenWidth=3744) returns 1597.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0053 begin`);
      const actual: number = rotatePivotYOf(3744);
      logInfo(`rotatePivotYOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertClose(1597.76, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0054
     * @tc.name      TsDrawingSample_RotatePivotYOf_0054
     * @tc.desc      rotatePivotYOf(screenWidth=3840) returns 1633.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0054 begin`);
      const actual: number = rotatePivotYOf(3840);
      logInfo(`rotatePivotYOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertClose(1633.6, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0055
     * @tc.name      TsDrawingSample_RotatePivotYOf_0055
     * @tc.desc      rotatePivotYOf(screenWidth=628) returns 434.4533333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0055 begin`);
      const actual: number = rotatePivotYOf(628);
      logInfo(`rotatePivotYOf(screenWidth=628): actual=${actual}`);
      expect(actual).assertClose(434.4533333333334, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0056
     * @tc.name      TsDrawingSample_RotatePivotYOf_0056
     * @tc.desc      rotatePivotYOf(screenWidth=1808.29) returns 875.0949333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0056 begin`);
      const actual: number = rotatePivotYOf(1808.29);
      logInfo(`rotatePivotYOf(screenWidth=1808.29): actual=${actual}`);
      expect(actual).assertClose(875.0949333333333, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0057
     * @tc.name      TsDrawingSample_RotatePivotYOf_0057
     * @tc.desc      rotatePivotYOf(screenWidth=1782) returns 865.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0057 begin`);
      const actual: number = rotatePivotYOf(1782);
      logInfo(`rotatePivotYOf(screenWidth=1782): actual=${actual}`);
      expect(actual).assertClose(865.28, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0058
     * @tc.name      TsDrawingSample_RotatePivotYOf_0058
     * @tc.desc      rotatePivotYOf(screenWidth=2403) returns 1097.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0058 begin`);
      const actual: number = rotatePivotYOf(2403);
      logInfo(`rotatePivotYOf(screenWidth=2403): actual=${actual}`);
      expect(actual).assertClose(1097.12, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0059
     * @tc.name      TsDrawingSample_RotatePivotYOf_0059
     * @tc.desc      rotatePivotYOf(screenWidth=1044) returns 589.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0059 begin`);
      const actual: number = rotatePivotYOf(1044);
      logInfo(`rotatePivotYOf(screenWidth=1044): actual=${actual}`);
      expect(actual).assertClose(589.76, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0060
     * @tc.name      TsDrawingSample_RotatePivotYOf_0060
     * @tc.desc      rotatePivotYOf(screenWidth=1779) returns 864.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0060 begin`);
      const actual: number = rotatePivotYOf(1779);
      logInfo(`rotatePivotYOf(screenWidth=1779): actual=${actual}`);
      expect(actual).assertClose(864.16, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0061
     * @tc.name      TsDrawingSample_RotatePivotYOf_0061
     * @tc.desc      rotatePivotYOf(screenWidth=-1649) returns -415.62666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0061 begin`);
      const actual: number = rotatePivotYOf(-1649);
      logInfo(`rotatePivotYOf(screenWidth=-1649): actual=${actual}`);
      expect(actual).assertClose(-415.62666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0062
     * @tc.name      TsDrawingSample_RotatePivotYOf_0062
     * @tc.desc      rotatePivotYOf(screenWidth=3022) returns 1328.2133333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0062 begin`);
      const actual: number = rotatePivotYOf(3022);
      logInfo(`rotatePivotYOf(screenWidth=3022): actual=${actual}`);
      expect(actual).assertClose(1328.2133333333336, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0063
     * @tc.name      TsDrawingSample_RotatePivotYOf_0063
     * @tc.desc      rotatePivotYOf(screenWidth=67.16) returns 225.07306666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0063 begin`);
      const actual: number = rotatePivotYOf(67.16);
      logInfo(`rotatePivotYOf(screenWidth=67.16): actual=${actual}`);
      expect(actual).assertClose(225.07306666666668, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0064
     * @tc.name      TsDrawingSample_RotatePivotYOf_0064
     * @tc.desc      rotatePivotYOf(screenWidth=-466) returns 26.026666666666657
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0064 begin`);
      const actual: number = rotatePivotYOf(-466);
      logInfo(`rotatePivotYOf(screenWidth=-466): actual=${actual}`);
      expect(actual).assertClose(26.026666666666657, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0065
     * @tc.name      TsDrawingSample_RotatePivotYOf_0065
     * @tc.desc      rotatePivotYOf(screenWidth=-258) returns 103.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0065 begin`);
      const actual: number = rotatePivotYOf(-258);
      logInfo(`rotatePivotYOf(screenWidth=-258): actual=${actual}`);
      expect(actual).assertClose(103.68, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0066
     * @tc.name      TsDrawingSample_RotatePivotYOf_0066
     * @tc.desc      rotatePivotYOf(screenWidth=-603) returns -25.120000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0066 begin`);
      const actual: number = rotatePivotYOf(-603);
      logInfo(`rotatePivotYOf(screenWidth=-603): actual=${actual}`);
      expect(actual).assertClose(-25.120000000000005, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0067
     * @tc.name      TsDrawingSample_RotatePivotYOf_0067
     * @tc.desc      rotatePivotYOf(screenWidth=-725) returns -70.66666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0067 begin`);
      const actual: number = rotatePivotYOf(-725);
      logInfo(`rotatePivotYOf(screenWidth=-725): actual=${actual}`);
      expect(actual).assertClose(-70.66666666666666, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0068
     * @tc.name      TsDrawingSample_RotatePivotYOf_0068
     * @tc.desc      rotatePivotYOf(screenWidth=-62) returns 176.85333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0068 begin`);
      const actual: number = rotatePivotYOf(-62);
      logInfo(`rotatePivotYOf(screenWidth=-62): actual=${actual}`);
      expect(actual).assertClose(176.85333333333332, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0069
     * @tc.name      TsDrawingSample_RotatePivotYOf_0069
     * @tc.desc      rotatePivotYOf(screenWidth=1712) returns 839.1466666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0069 begin`);
      const actual: number = rotatePivotYOf(1712);
      logInfo(`rotatePivotYOf(screenWidth=1712): actual=${actual}`);
      expect(actual).assertClose(839.1466666666666, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0070
     * @tc.name      TsDrawingSample_RotatePivotYOf_0070
     * @tc.desc      rotatePivotYOf(screenWidth=-142) returns 146.98666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotYOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0070 begin`);
      const actual: number = rotatePivotYOf(-142);
      logInfo(`rotatePivotYOf(screenWidth=-142): actual=${actual}`);
      expect(actual).assertClose(146.98666666666668, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0071
     * @tc.name      TsDrawingSample_RotatePivotYOf_0071
     * @tc.desc      rotatePivotYOf(screenWidth=1203.51) returns 649.3104000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0071 begin`);
      const actual: number = rotatePivotYOf(1203.51);
      logInfo(`rotatePivotYOf(screenWidth=1203.51): actual=${actual}`);
      expect(actual).assertClose(649.3104000000001, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0072
     * @tc.name      TsDrawingSample_RotatePivotYOf_0072
     * @tc.desc      rotatePivotYOf(screenWidth=3740) returns 1596.2666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0072 begin`);
      const actual: number = rotatePivotYOf(3740);
      logInfo(`rotatePivotYOf(screenWidth=3740): actual=${actual}`);
      expect(actual).assertClose(1596.2666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0073
     * @tc.name      TsDrawingSample_RotatePivotYOf_0073
     * @tc.desc      rotatePivotYOf(screenWidth=3585) returns 1538.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0073 begin`);
      const actual: number = rotatePivotYOf(3585);
      logInfo(`rotatePivotYOf(screenWidth=3585): actual=${actual}`);
      expect(actual).assertClose(1538.4, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_YOF_0074
     * @tc.name      TsDrawingSample_RotatePivotYOf_0074
     * @tc.desc      rotatePivotYOf(screenWidth=1612) returns 801.8133333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotYOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotYOf_0074 begin`);
      const actual: number = rotatePivotYOf(1612);
      logInfo(`rotatePivotYOf(screenWidth=1612): actual=${actual}`);
      expect(actual).assertClose(801.8133333333334, PRECISION);
      logInfo(`${BUNDLE}RotatePivotYOf_0074 end`);
    });
  });
}
