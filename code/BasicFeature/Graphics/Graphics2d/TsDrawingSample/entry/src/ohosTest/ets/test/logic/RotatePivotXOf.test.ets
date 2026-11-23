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
import { rotatePivotXOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for rotatePivotXOf (74 cases). */
export default function rotatePivotXOfTest(): void {
  describe('RotatePivotXOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0001
     * @tc.name      TsDrawingSample_RotatePivotXOf_0001
     * @tc.desc      rotatePivotXOf(screenWidth=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RotatePivotXOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0001 begin`);
      const actual: number = rotatePivotXOf(0);
      logInfo(`rotatePivotXOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RotatePivotXOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0002
     * @tc.name      TsDrawingSample_RotatePivotXOf_0002
     * @tc.desc      rotatePivotXOf(screenWidth=1) returns 100.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RotatePivotXOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0002 begin`);
      const actual: number = rotatePivotXOf(1);
      logInfo(`rotatePivotXOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(100.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0003
     * @tc.name      TsDrawingSample_RotatePivotXOf_0003
     * @tc.desc      rotatePivotXOf(screenWidth=2) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatePivotXOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0003 begin`);
      const actual: number = rotatePivotXOf(2);
      logInfo(`rotatePivotXOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}RotatePivotXOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0004
     * @tc.name      TsDrawingSample_RotatePivotXOf_0004
     * @tc.desc      rotatePivotXOf(screenWidth=3) returns 101.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatePivotXOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0004 begin`);
      const actual: number = rotatePivotXOf(3);
      logInfo(`rotatePivotXOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(101.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0005
     * @tc.name      TsDrawingSample_RotatePivotXOf_0005
     * @tc.desc      rotatePivotXOf(screenWidth=100) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0005 begin`);
      const actual: number = rotatePivotXOf(100);
      logInfo(`rotatePivotXOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RotatePivotXOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0006
     * @tc.name      TsDrawingSample_RotatePivotXOf_0006
     * @tc.desc      rotatePivotXOf(screenWidth=360) returns 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0006 begin`);
      const actual: number = rotatePivotXOf(360);
      logInfo(`rotatePivotXOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(280);
      logInfo(`${BUNDLE}RotatePivotXOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0007
     * @tc.name      TsDrawingSample_RotatePivotXOf_0007
     * @tc.desc      rotatePivotXOf(screenWidth=720) returns 460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0007 begin`);
      const actual: number = rotatePivotXOf(720);
      logInfo(`rotatePivotXOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(460);
      logInfo(`${BUNDLE}RotatePivotXOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0008
     * @tc.name      TsDrawingSample_RotatePivotXOf_0008
     * @tc.desc      rotatePivotXOf(screenWidth=1080) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0008 begin`);
      const actual: number = rotatePivotXOf(1080);
      logInfo(`rotatePivotXOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}RotatePivotXOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0009
     * @tc.name      TsDrawingSample_RotatePivotXOf_0009
     * @tc.desc      rotatePivotXOf(screenWidth=1920) returns 1060
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0009 begin`);
      const actual: number = rotatePivotXOf(1920);
      logInfo(`rotatePivotXOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(1060);
      logInfo(`${BUNDLE}RotatePivotXOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0010
     * @tc.name      TsDrawingSample_RotatePivotXOf_0010
     * @tc.desc      rotatePivotXOf(screenWidth=-1) returns 99.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotXOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0010 begin`);
      const actual: number = rotatePivotXOf(-1);
      logInfo(`rotatePivotXOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(99.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0011
     * @tc.name      TsDrawingSample_RotatePivotXOf_0011
     * @tc.desc      rotatePivotXOf(screenWidth=10) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0011 begin`);
      const actual: number = rotatePivotXOf(10);
      logInfo(`rotatePivotXOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RotatePivotXOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0012
     * @tc.name      TsDrawingSample_RotatePivotXOf_0012
     * @tc.desc      rotatePivotXOf(screenWidth=96) returns 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0012 begin`);
      const actual: number = rotatePivotXOf(96);
      logInfo(`rotatePivotXOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(148);
      logInfo(`${BUNDLE}RotatePivotXOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0013
     * @tc.name      TsDrawingSample_RotatePivotXOf_0013
     * @tc.desc      rotatePivotXOf(screenWidth=192) returns 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0013 begin`);
      const actual: number = rotatePivotXOf(192);
      logInfo(`rotatePivotXOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}RotatePivotXOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0014
     * @tc.name      TsDrawingSample_RotatePivotXOf_0014
     * @tc.desc      rotatePivotXOf(screenWidth=288) returns 244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0014 begin`);
      const actual: number = rotatePivotXOf(288);
      logInfo(`rotatePivotXOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(244);
      logInfo(`${BUNDLE}RotatePivotXOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0015
     * @tc.name      TsDrawingSample_RotatePivotXOf_0015
     * @tc.desc      rotatePivotXOf(screenWidth=384) returns 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0015 begin`);
      const actual: number = rotatePivotXOf(384);
      logInfo(`rotatePivotXOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(292);
      logInfo(`${BUNDLE}RotatePivotXOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0016
     * @tc.name      TsDrawingSample_RotatePivotXOf_0016
     * @tc.desc      rotatePivotXOf(screenWidth=480) returns 340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0016 begin`);
      const actual: number = rotatePivotXOf(480);
      logInfo(`rotatePivotXOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(340);
      logInfo(`${BUNDLE}RotatePivotXOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0017
     * @tc.name      TsDrawingSample_RotatePivotXOf_0017
     * @tc.desc      rotatePivotXOf(screenWidth=576) returns 388
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0017 begin`);
      const actual: number = rotatePivotXOf(576);
      logInfo(`rotatePivotXOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(388);
      logInfo(`${BUNDLE}RotatePivotXOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0018
     * @tc.name      TsDrawingSample_RotatePivotXOf_0018
     * @tc.desc      rotatePivotXOf(screenWidth=672) returns 436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0018 begin`);
      const actual: number = rotatePivotXOf(672);
      logInfo(`rotatePivotXOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(436);
      logInfo(`${BUNDLE}RotatePivotXOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0019
     * @tc.name      TsDrawingSample_RotatePivotXOf_0019
     * @tc.desc      rotatePivotXOf(screenWidth=768) returns 484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0019 begin`);
      const actual: number = rotatePivotXOf(768);
      logInfo(`rotatePivotXOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(484);
      logInfo(`${BUNDLE}RotatePivotXOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0020
     * @tc.name      TsDrawingSample_RotatePivotXOf_0020
     * @tc.desc      rotatePivotXOf(screenWidth=864) returns 532
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0020 begin`);
      const actual: number = rotatePivotXOf(864);
      logInfo(`rotatePivotXOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(532);
      logInfo(`${BUNDLE}RotatePivotXOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0021
     * @tc.name      TsDrawingSample_RotatePivotXOf_0021
     * @tc.desc      rotatePivotXOf(screenWidth=960) returns 580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0021 begin`);
      const actual: number = rotatePivotXOf(960);
      logInfo(`rotatePivotXOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(580);
      logInfo(`${BUNDLE}RotatePivotXOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0022
     * @tc.name      TsDrawingSample_RotatePivotXOf_0022
     * @tc.desc      rotatePivotXOf(screenWidth=1056) returns 628
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0022 begin`);
      const actual: number = rotatePivotXOf(1056);
      logInfo(`rotatePivotXOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(628);
      logInfo(`${BUNDLE}RotatePivotXOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0023
     * @tc.name      TsDrawingSample_RotatePivotXOf_0023
     * @tc.desc      rotatePivotXOf(screenWidth=1152) returns 676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0023 begin`);
      const actual: number = rotatePivotXOf(1152);
      logInfo(`rotatePivotXOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(676);
      logInfo(`${BUNDLE}RotatePivotXOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0024
     * @tc.name      TsDrawingSample_RotatePivotXOf_0024
     * @tc.desc      rotatePivotXOf(screenWidth=1248) returns 724
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0024 begin`);
      const actual: number = rotatePivotXOf(1248);
      logInfo(`rotatePivotXOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(724);
      logInfo(`${BUNDLE}RotatePivotXOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0025
     * @tc.name      TsDrawingSample_RotatePivotXOf_0025
     * @tc.desc      rotatePivotXOf(screenWidth=1344) returns 772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0025 begin`);
      const actual: number = rotatePivotXOf(1344);
      logInfo(`rotatePivotXOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(772);
      logInfo(`${BUNDLE}RotatePivotXOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0026
     * @tc.name      TsDrawingSample_RotatePivotXOf_0026
     * @tc.desc      rotatePivotXOf(screenWidth=1440) returns 820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0026 begin`);
      const actual: number = rotatePivotXOf(1440);
      logInfo(`rotatePivotXOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(820);
      logInfo(`${BUNDLE}RotatePivotXOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0027
     * @tc.name      TsDrawingSample_RotatePivotXOf_0027
     * @tc.desc      rotatePivotXOf(screenWidth=1536) returns 868
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0027 begin`);
      const actual: number = rotatePivotXOf(1536);
      logInfo(`rotatePivotXOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(868);
      logInfo(`${BUNDLE}RotatePivotXOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0028
     * @tc.name      TsDrawingSample_RotatePivotXOf_0028
     * @tc.desc      rotatePivotXOf(screenWidth=1632) returns 916
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0028 begin`);
      const actual: number = rotatePivotXOf(1632);
      logInfo(`rotatePivotXOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(916);
      logInfo(`${BUNDLE}RotatePivotXOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0029
     * @tc.name      TsDrawingSample_RotatePivotXOf_0029
     * @tc.desc      rotatePivotXOf(screenWidth=1728) returns 964
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0029 begin`);
      const actual: number = rotatePivotXOf(1728);
      logInfo(`rotatePivotXOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(964);
      logInfo(`${BUNDLE}RotatePivotXOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0030
     * @tc.name      TsDrawingSample_RotatePivotXOf_0030
     * @tc.desc      rotatePivotXOf(screenWidth=1824) returns 1012
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0030 begin`);
      const actual: number = rotatePivotXOf(1824);
      logInfo(`rotatePivotXOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(1012);
      logInfo(`${BUNDLE}RotatePivotXOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0031
     * @tc.name      TsDrawingSample_RotatePivotXOf_0031
     * @tc.desc      rotatePivotXOf(screenWidth=2016) returns 1108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0031 begin`);
      const actual: number = rotatePivotXOf(2016);
      logInfo(`rotatePivotXOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(1108);
      logInfo(`${BUNDLE}RotatePivotXOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0032
     * @tc.name      TsDrawingSample_RotatePivotXOf_0032
     * @tc.desc      rotatePivotXOf(screenWidth=2112) returns 1156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0032 begin`);
      const actual: number = rotatePivotXOf(2112);
      logInfo(`rotatePivotXOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(1156);
      logInfo(`${BUNDLE}RotatePivotXOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0033
     * @tc.name      TsDrawingSample_RotatePivotXOf_0033
     * @tc.desc      rotatePivotXOf(screenWidth=2208) returns 1204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0033 begin`);
      const actual: number = rotatePivotXOf(2208);
      logInfo(`rotatePivotXOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(1204);
      logInfo(`${BUNDLE}RotatePivotXOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0034
     * @tc.name      TsDrawingSample_RotatePivotXOf_0034
     * @tc.desc      rotatePivotXOf(screenWidth=2304) returns 1252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0034 begin`);
      const actual: number = rotatePivotXOf(2304);
      logInfo(`rotatePivotXOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(1252);
      logInfo(`${BUNDLE}RotatePivotXOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0035
     * @tc.name      TsDrawingSample_RotatePivotXOf_0035
     * @tc.desc      rotatePivotXOf(screenWidth=2400) returns 1300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0035 begin`);
      const actual: number = rotatePivotXOf(2400);
      logInfo(`rotatePivotXOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(1300);
      logInfo(`${BUNDLE}RotatePivotXOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0036
     * @tc.name      TsDrawingSample_RotatePivotXOf_0036
     * @tc.desc      rotatePivotXOf(screenWidth=2496) returns 1348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0036 begin`);
      const actual: number = rotatePivotXOf(2496);
      logInfo(`rotatePivotXOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(1348);
      logInfo(`${BUNDLE}RotatePivotXOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0037
     * @tc.name      TsDrawingSample_RotatePivotXOf_0037
     * @tc.desc      rotatePivotXOf(screenWidth=2592) returns 1396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0037 begin`);
      const actual: number = rotatePivotXOf(2592);
      logInfo(`rotatePivotXOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(1396);
      logInfo(`${BUNDLE}RotatePivotXOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0038
     * @tc.name      TsDrawingSample_RotatePivotXOf_0038
     * @tc.desc      rotatePivotXOf(screenWidth=2688) returns 1444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0038 begin`);
      const actual: number = rotatePivotXOf(2688);
      logInfo(`rotatePivotXOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(1444);
      logInfo(`${BUNDLE}RotatePivotXOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0039
     * @tc.name      TsDrawingSample_RotatePivotXOf_0039
     * @tc.desc      rotatePivotXOf(screenWidth=2784) returns 1492
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0039 begin`);
      const actual: number = rotatePivotXOf(2784);
      logInfo(`rotatePivotXOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(1492);
      logInfo(`${BUNDLE}RotatePivotXOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0040
     * @tc.name      TsDrawingSample_RotatePivotXOf_0040
     * @tc.desc      rotatePivotXOf(screenWidth=2880) returns 1540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0040 begin`);
      const actual: number = rotatePivotXOf(2880);
      logInfo(`rotatePivotXOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(1540);
      logInfo(`${BUNDLE}RotatePivotXOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0041
     * @tc.name      TsDrawingSample_RotatePivotXOf_0041
     * @tc.desc      rotatePivotXOf(screenWidth=2976) returns 1588
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0041 begin`);
      const actual: number = rotatePivotXOf(2976);
      logInfo(`rotatePivotXOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(1588);
      logInfo(`${BUNDLE}RotatePivotXOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0042
     * @tc.name      TsDrawingSample_RotatePivotXOf_0042
     * @tc.desc      rotatePivotXOf(screenWidth=3072) returns 1636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0042 begin`);
      const actual: number = rotatePivotXOf(3072);
      logInfo(`rotatePivotXOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(1636);
      logInfo(`${BUNDLE}RotatePivotXOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0043
     * @tc.name      TsDrawingSample_RotatePivotXOf_0043
     * @tc.desc      rotatePivotXOf(screenWidth=3168) returns 1684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0043 begin`);
      const actual: number = rotatePivotXOf(3168);
      logInfo(`rotatePivotXOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(1684);
      logInfo(`${BUNDLE}RotatePivotXOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0044
     * @tc.name      TsDrawingSample_RotatePivotXOf_0044
     * @tc.desc      rotatePivotXOf(screenWidth=3264) returns 1732
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0044 begin`);
      const actual: number = rotatePivotXOf(3264);
      logInfo(`rotatePivotXOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(1732);
      logInfo(`${BUNDLE}RotatePivotXOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0045
     * @tc.name      TsDrawingSample_RotatePivotXOf_0045
     * @tc.desc      rotatePivotXOf(screenWidth=3360) returns 1780
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0045 begin`);
      const actual: number = rotatePivotXOf(3360);
      logInfo(`rotatePivotXOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(1780);
      logInfo(`${BUNDLE}RotatePivotXOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0046
     * @tc.name      TsDrawingSample_RotatePivotXOf_0046
     * @tc.desc      rotatePivotXOf(screenWidth=3456) returns 1828
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0046 begin`);
      const actual: number = rotatePivotXOf(3456);
      logInfo(`rotatePivotXOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(1828);
      logInfo(`${BUNDLE}RotatePivotXOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0047
     * @tc.name      TsDrawingSample_RotatePivotXOf_0047
     * @tc.desc      rotatePivotXOf(screenWidth=3552) returns 1876
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0047 begin`);
      const actual: number = rotatePivotXOf(3552);
      logInfo(`rotatePivotXOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(1876);
      logInfo(`${BUNDLE}RotatePivotXOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0048
     * @tc.name      TsDrawingSample_RotatePivotXOf_0048
     * @tc.desc      rotatePivotXOf(screenWidth=3648) returns 1924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0048 begin`);
      const actual: number = rotatePivotXOf(3648);
      logInfo(`rotatePivotXOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(1924);
      logInfo(`${BUNDLE}RotatePivotXOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0049
     * @tc.name      TsDrawingSample_RotatePivotXOf_0049
     * @tc.desc      rotatePivotXOf(screenWidth=3744) returns 1972
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0049 begin`);
      const actual: number = rotatePivotXOf(3744);
      logInfo(`rotatePivotXOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(1972);
      logInfo(`${BUNDLE}RotatePivotXOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0050
     * @tc.name      TsDrawingSample_RotatePivotXOf_0050
     * @tc.desc      rotatePivotXOf(screenWidth=3840) returns 2020
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0050 begin`);
      const actual: number = rotatePivotXOf(3840);
      logInfo(`rotatePivotXOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(2020);
      logInfo(`${BUNDLE}RotatePivotXOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0051
     * @tc.name      TsDrawingSample_RotatePivotXOf_0051
     * @tc.desc      rotatePivotXOf(screenWidth=-1515) returns -657.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotXOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0051 begin`);
      const actual: number = rotatePivotXOf(-1515);
      logInfo(`rotatePivotXOf(screenWidth=-1515): actual=${actual}`);
      expect(actual).assertClose(-657.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0052
     * @tc.name      TsDrawingSample_RotatePivotXOf_0052
     * @tc.desc      rotatePivotXOf(screenWidth=-212) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotXOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0052 begin`);
      const actual: number = rotatePivotXOf(-212);
      logInfo(`rotatePivotXOf(screenWidth=-212): actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}RotatePivotXOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0053
     * @tc.name      TsDrawingSample_RotatePivotXOf_0053
     * @tc.desc      rotatePivotXOf(screenWidth=1828.35) returns 1014.175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0053 begin`);
      const actual: number = rotatePivotXOf(1828.35);
      logInfo(`rotatePivotXOf(screenWidth=1828.35): actual=${actual}`);
      expect(actual).assertClose(1014.175, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0054
     * @tc.name      TsDrawingSample_RotatePivotXOf_0054
     * @tc.desc      rotatePivotXOf(screenWidth=2844) returns 1522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0054 begin`);
      const actual: number = rotatePivotXOf(2844);
      logInfo(`rotatePivotXOf(screenWidth=2844): actual=${actual}`);
      expect(actual).assertEqual(1522);
      logInfo(`${BUNDLE}RotatePivotXOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0055
     * @tc.name      TsDrawingSample_RotatePivotXOf_0055
     * @tc.desc      rotatePivotXOf(screenWidth=3378) returns 1789
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0055 begin`);
      const actual: number = rotatePivotXOf(3378);
      logInfo(`rotatePivotXOf(screenWidth=3378): actual=${actual}`);
      expect(actual).assertEqual(1789);
      logInfo(`${BUNDLE}RotatePivotXOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0056
     * @tc.name      TsDrawingSample_RotatePivotXOf_0056
     * @tc.desc      rotatePivotXOf(screenWidth=1584.74) returns 892.37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0056 begin`);
      const actual: number = rotatePivotXOf(1584.74);
      logInfo(`rotatePivotXOf(screenWidth=1584.74): actual=${actual}`);
      expect(actual).assertClose(892.37, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0057
     * @tc.name      TsDrawingSample_RotatePivotXOf_0057
     * @tc.desc      rotatePivotXOf(screenWidth=1781) returns 990.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0057 begin`);
      const actual: number = rotatePivotXOf(1781);
      logInfo(`rotatePivotXOf(screenWidth=1781): actual=${actual}`);
      expect(actual).assertClose(990.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0058
     * @tc.name      TsDrawingSample_RotatePivotXOf_0058
     * @tc.desc      rotatePivotXOf(screenWidth=1423) returns 811.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0058 begin`);
      const actual: number = rotatePivotXOf(1423);
      logInfo(`rotatePivotXOf(screenWidth=1423): actual=${actual}`);
      expect(actual).assertClose(811.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0059
     * @tc.name      TsDrawingSample_RotatePivotXOf_0059
     * @tc.desc      rotatePivotXOf(screenWidth=1782.26) returns 991.13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0059 begin`);
      const actual: number = rotatePivotXOf(1782.26);
      logInfo(`rotatePivotXOf(screenWidth=1782.26): actual=${actual}`);
      expect(actual).assertClose(991.13, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0060
     * @tc.name      TsDrawingSample_RotatePivotXOf_0060
     * @tc.desc      rotatePivotXOf(screenWidth=1328.52) returns 764.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0060 begin`);
      const actual: number = rotatePivotXOf(1328.52);
      logInfo(`rotatePivotXOf(screenWidth=1328.52): actual=${actual}`);
      expect(actual).assertClose(764.26, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0061
     * @tc.name      TsDrawingSample_RotatePivotXOf_0061
     * @tc.desc      rotatePivotXOf(screenWidth=-1325) returns -562.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotXOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0061 begin`);
      const actual: number = rotatePivotXOf(-1325);
      logInfo(`rotatePivotXOf(screenWidth=-1325): actual=${actual}`);
      expect(actual).assertClose(-562.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0062
     * @tc.name      TsDrawingSample_RotatePivotXOf_0062
     * @tc.desc      rotatePivotXOf(screenWidth=1504) returns 852
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0062 begin`);
      const actual: number = rotatePivotXOf(1504);
      logInfo(`rotatePivotXOf(screenWidth=1504): actual=${actual}`);
      expect(actual).assertEqual(852);
      logInfo(`${BUNDLE}RotatePivotXOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0063
     * @tc.name      TsDrawingSample_RotatePivotXOf_0063
     * @tc.desc      rotatePivotXOf(screenWidth=3513) returns 1856.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0063 begin`);
      const actual: number = rotatePivotXOf(3513);
      logInfo(`rotatePivotXOf(screenWidth=3513): actual=${actual}`);
      expect(actual).assertClose(1856.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0064
     * @tc.name      TsDrawingSample_RotatePivotXOf_0064
     * @tc.desc      rotatePivotXOf(screenWidth=3704) returns 1952
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0064 begin`);
      const actual: number = rotatePivotXOf(3704);
      logInfo(`rotatePivotXOf(screenWidth=3704): actual=${actual}`);
      expect(actual).assertEqual(1952);
      logInfo(`${BUNDLE}RotatePivotXOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0065
     * @tc.name      TsDrawingSample_RotatePivotXOf_0065
     * @tc.desc      rotatePivotXOf(screenWidth=1582.4) returns 891.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0065 begin`);
      const actual: number = rotatePivotXOf(1582.4);
      logInfo(`rotatePivotXOf(screenWidth=1582.4): actual=${actual}`);
      expect(actual).assertClose(891.2, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0066
     * @tc.name      TsDrawingSample_RotatePivotXOf_0066
     * @tc.desc      rotatePivotXOf(screenWidth=3192) returns 1696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0066 begin`);
      const actual: number = rotatePivotXOf(3192);
      logInfo(`rotatePivotXOf(screenWidth=3192): actual=${actual}`);
      expect(actual).assertEqual(1696);
      logInfo(`${BUNDLE}RotatePivotXOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0067
     * @tc.name      TsDrawingSample_RotatePivotXOf_0067
     * @tc.desc      rotatePivotXOf(screenWidth=1881) returns 1040.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0067 begin`);
      const actual: number = rotatePivotXOf(1881);
      logInfo(`rotatePivotXOf(screenWidth=1881): actual=${actual}`);
      expect(actual).assertClose(1040.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0068
     * @tc.name      TsDrawingSample_RotatePivotXOf_0068
     * @tc.desc      rotatePivotXOf(screenWidth=679) returns 439.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0068 begin`);
      const actual: number = rotatePivotXOf(679);
      logInfo(`rotatePivotXOf(screenWidth=679): actual=${actual}`);
      expect(actual).assertClose(439.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0069
     * @tc.name      TsDrawingSample_RotatePivotXOf_0069
     * @tc.desc      rotatePivotXOf(screenWidth=469.39) returns 334.695
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0069 begin`);
      const actual: number = rotatePivotXOf(469.39);
      logInfo(`rotatePivotXOf(screenWidth=469.39): actual=${actual}`);
      expect(actual).assertClose(334.695, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0070
     * @tc.name      TsDrawingSample_RotatePivotXOf_0070
     * @tc.desc      rotatePivotXOf(screenWidth=720.41) returns 460.205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0070 begin`);
      const actual: number = rotatePivotXOf(720.41);
      logInfo(`rotatePivotXOf(screenWidth=720.41): actual=${actual}`);
      expect(actual).assertClose(460.205, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0071
     * @tc.name      TsDrawingSample_RotatePivotXOf_0071
     * @tc.desc      rotatePivotXOf(screenWidth=228.19) returns 214.095
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0071 begin`);
      const actual: number = rotatePivotXOf(228.19);
      logInfo(`rotatePivotXOf(screenWidth=228.19): actual=${actual}`);
      expect(actual).assertClose(214.095, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0072
     * @tc.name      TsDrawingSample_RotatePivotXOf_0072
     * @tc.desc      rotatePivotXOf(screenWidth=2856) returns 1528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0072 begin`);
      const actual: number = rotatePivotXOf(2856);
      logInfo(`rotatePivotXOf(screenWidth=2856): actual=${actual}`);
      expect(actual).assertEqual(1528);
      logInfo(`${BUNDLE}RotatePivotXOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0073
     * @tc.name      TsDrawingSample_RotatePivotXOf_0073
     * @tc.desc      rotatePivotXOf(screenWidth=-268) returns -34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatePivotXOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0073 begin`);
      const actual: number = rotatePivotXOf(-268);
      logInfo(`rotatePivotXOf(screenWidth=-268): actual=${actual}`);
      expect(actual).assertEqual(-34);
      logInfo(`${BUNDLE}RotatePivotXOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATE_PIVOT_XOF_0074
     * @tc.name      TsDrawingSample_RotatePivotXOf_0074
     * @tc.desc      rotatePivotXOf(screenWidth=1255) returns 727.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatePivotXOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatePivotXOf_0074 begin`);
      const actual: number = rotatePivotXOf(1255);
      logInfo(`rotatePivotXOf(screenWidth=1255): actual=${actual}`);
      expect(actual).assertClose(727.5, PRECISION);
      logInfo(`${BUNDLE}RotatePivotXOf_0074 end`);
    });
  });
}
