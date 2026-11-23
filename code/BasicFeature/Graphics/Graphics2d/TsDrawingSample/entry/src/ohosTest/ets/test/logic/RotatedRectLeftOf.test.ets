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
import { rotatedRectLeftOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for rotatedRectLeftOf (74 cases). */
export default function rotatedRectLeftOfTest(): void {
  describe('RotatedRectLeftOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0001
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0001
     * @tc.desc      rotatedRectLeftOf(screenWidth=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RotatedRectLeftOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0001 begin`);
      const actual: number = rotatedRectLeftOf(0);
      logInfo(`rotatedRectLeftOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0002
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0002
     * @tc.desc      rotatedRectLeftOf(screenWidth=1) returns 100.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RotatedRectLeftOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0002 begin`);
      const actual: number = rotatedRectLeftOf(1);
      logInfo(`rotatedRectLeftOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(100.33333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0003
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0003
     * @tc.desc      rotatedRectLeftOf(screenWidth=3) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatedRectLeftOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0003 begin`);
      const actual: number = rotatedRectLeftOf(3);
      logInfo(`rotatedRectLeftOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0004
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0004
     * @tc.desc      rotatedRectLeftOf(screenWidth=2) returns 100.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatedRectLeftOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0004 begin`);
      const actual: number = rotatedRectLeftOf(2);
      logInfo(`rotatedRectLeftOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(100.66666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0005
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0005
     * @tc.desc      rotatedRectLeftOf(screenWidth=4) returns 101.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RotatedRectLeftOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0005 begin`);
      const actual: number = rotatedRectLeftOf(4);
      logInfo(`rotatedRectLeftOf(screenWidth=4): actual=${actual}`);
      expect(actual).assertClose(101.33333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0006
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0006
     * @tc.desc      rotatedRectLeftOf(screenWidth=100) returns 133.33333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0006 begin`);
      const actual: number = rotatedRectLeftOf(100);
      logInfo(`rotatedRectLeftOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertClose(133.33333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0007
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0007
     * @tc.desc      rotatedRectLeftOf(screenWidth=360) returns 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0007 begin`);
      const actual: number = rotatedRectLeftOf(360);
      logInfo(`rotatedRectLeftOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(220);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0008
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0008
     * @tc.desc      rotatedRectLeftOf(screenWidth=720) returns 340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0008 begin`);
      const actual: number = rotatedRectLeftOf(720);
      logInfo(`rotatedRectLeftOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(340);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0009
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0009
     * @tc.desc      rotatedRectLeftOf(screenWidth=1080) returns 460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0009 begin`);
      const actual: number = rotatedRectLeftOf(1080);
      logInfo(`rotatedRectLeftOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(460);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0010
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0010
     * @tc.desc      rotatedRectLeftOf(screenWidth=1920) returns 740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0010 begin`);
      const actual: number = rotatedRectLeftOf(1920);
      logInfo(`rotatedRectLeftOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(740);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0011
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0011
     * @tc.desc      rotatedRectLeftOf(screenWidth=-1) returns 99.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatedRectLeftOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0011 begin`);
      const actual: number = rotatedRectLeftOf(-1);
      logInfo(`rotatedRectLeftOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(99.66666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0012
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0012
     * @tc.desc      rotatedRectLeftOf(screenWidth=10) returns 103.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0012 begin`);
      const actual: number = rotatedRectLeftOf(10);
      logInfo(`rotatedRectLeftOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(103.33333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0013
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0013
     * @tc.desc      rotatedRectLeftOf(screenWidth=96) returns 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0013 begin`);
      const actual: number = rotatedRectLeftOf(96);
      logInfo(`rotatedRectLeftOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(132);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0014
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0014
     * @tc.desc      rotatedRectLeftOf(screenWidth=192) returns 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0014 begin`);
      const actual: number = rotatedRectLeftOf(192);
      logInfo(`rotatedRectLeftOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(164);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0015
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0015
     * @tc.desc      rotatedRectLeftOf(screenWidth=288) returns 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0015 begin`);
      const actual: number = rotatedRectLeftOf(288);
      logInfo(`rotatedRectLeftOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0016
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0016
     * @tc.desc      rotatedRectLeftOf(screenWidth=384) returns 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0016 begin`);
      const actual: number = rotatedRectLeftOf(384);
      logInfo(`rotatedRectLeftOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(228);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0017
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0017
     * @tc.desc      rotatedRectLeftOf(screenWidth=480) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0017 begin`);
      const actual: number = rotatedRectLeftOf(480);
      logInfo(`rotatedRectLeftOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0018
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0018
     * @tc.desc      rotatedRectLeftOf(screenWidth=576) returns 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0018 begin`);
      const actual: number = rotatedRectLeftOf(576);
      logInfo(`rotatedRectLeftOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(292);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0019
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0019
     * @tc.desc      rotatedRectLeftOf(screenWidth=672) returns 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0019 begin`);
      const actual: number = rotatedRectLeftOf(672);
      logInfo(`rotatedRectLeftOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(324);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0020
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0020
     * @tc.desc      rotatedRectLeftOf(screenWidth=768) returns 356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0020 begin`);
      const actual: number = rotatedRectLeftOf(768);
      logInfo(`rotatedRectLeftOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(356);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0021
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0021
     * @tc.desc      rotatedRectLeftOf(screenWidth=864) returns 388
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0021 begin`);
      const actual: number = rotatedRectLeftOf(864);
      logInfo(`rotatedRectLeftOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(388);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0022
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0022
     * @tc.desc      rotatedRectLeftOf(screenWidth=960) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0022 begin`);
      const actual: number = rotatedRectLeftOf(960);
      logInfo(`rotatedRectLeftOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0023
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0023
     * @tc.desc      rotatedRectLeftOf(screenWidth=1056) returns 452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0023 begin`);
      const actual: number = rotatedRectLeftOf(1056);
      logInfo(`rotatedRectLeftOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(452);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0024
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0024
     * @tc.desc      rotatedRectLeftOf(screenWidth=1152) returns 484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0024 begin`);
      const actual: number = rotatedRectLeftOf(1152);
      logInfo(`rotatedRectLeftOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(484);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0025
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0025
     * @tc.desc      rotatedRectLeftOf(screenWidth=1248) returns 516
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0025 begin`);
      const actual: number = rotatedRectLeftOf(1248);
      logInfo(`rotatedRectLeftOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(516);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0026
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0026
     * @tc.desc      rotatedRectLeftOf(screenWidth=1344) returns 548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0026 begin`);
      const actual: number = rotatedRectLeftOf(1344);
      logInfo(`rotatedRectLeftOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(548);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0027
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0027
     * @tc.desc      rotatedRectLeftOf(screenWidth=1440) returns 580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0027 begin`);
      const actual: number = rotatedRectLeftOf(1440);
      logInfo(`rotatedRectLeftOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(580);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0028
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0028
     * @tc.desc      rotatedRectLeftOf(screenWidth=1536) returns 612
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0028 begin`);
      const actual: number = rotatedRectLeftOf(1536);
      logInfo(`rotatedRectLeftOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(612);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0029
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0029
     * @tc.desc      rotatedRectLeftOf(screenWidth=1632) returns 644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0029 begin`);
      const actual: number = rotatedRectLeftOf(1632);
      logInfo(`rotatedRectLeftOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(644);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0030
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0030
     * @tc.desc      rotatedRectLeftOf(screenWidth=1728) returns 676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0030 begin`);
      const actual: number = rotatedRectLeftOf(1728);
      logInfo(`rotatedRectLeftOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(676);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0031
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0031
     * @tc.desc      rotatedRectLeftOf(screenWidth=1824) returns 708
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0031 begin`);
      const actual: number = rotatedRectLeftOf(1824);
      logInfo(`rotatedRectLeftOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(708);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0032
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0032
     * @tc.desc      rotatedRectLeftOf(screenWidth=2016) returns 772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0032 begin`);
      const actual: number = rotatedRectLeftOf(2016);
      logInfo(`rotatedRectLeftOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(772);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0033
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0033
     * @tc.desc      rotatedRectLeftOf(screenWidth=2112) returns 804
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0033 begin`);
      const actual: number = rotatedRectLeftOf(2112);
      logInfo(`rotatedRectLeftOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(804);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0034
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0034
     * @tc.desc      rotatedRectLeftOf(screenWidth=2208) returns 836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0034 begin`);
      const actual: number = rotatedRectLeftOf(2208);
      logInfo(`rotatedRectLeftOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(836);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0035
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0035
     * @tc.desc      rotatedRectLeftOf(screenWidth=2304) returns 868
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0035 begin`);
      const actual: number = rotatedRectLeftOf(2304);
      logInfo(`rotatedRectLeftOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(868);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0036
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0036
     * @tc.desc      rotatedRectLeftOf(screenWidth=2400) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0036 begin`);
      const actual: number = rotatedRectLeftOf(2400);
      logInfo(`rotatedRectLeftOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0037
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0037
     * @tc.desc      rotatedRectLeftOf(screenWidth=2496) returns 932
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0037 begin`);
      const actual: number = rotatedRectLeftOf(2496);
      logInfo(`rotatedRectLeftOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(932);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0038
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0038
     * @tc.desc      rotatedRectLeftOf(screenWidth=2592) returns 964
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0038 begin`);
      const actual: number = rotatedRectLeftOf(2592);
      logInfo(`rotatedRectLeftOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(964);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0039
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0039
     * @tc.desc      rotatedRectLeftOf(screenWidth=2688) returns 996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0039 begin`);
      const actual: number = rotatedRectLeftOf(2688);
      logInfo(`rotatedRectLeftOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(996);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0040
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0040
     * @tc.desc      rotatedRectLeftOf(screenWidth=2784) returns 1028
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0040 begin`);
      const actual: number = rotatedRectLeftOf(2784);
      logInfo(`rotatedRectLeftOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(1028);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0041
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0041
     * @tc.desc      rotatedRectLeftOf(screenWidth=2880) returns 1060
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0041 begin`);
      const actual: number = rotatedRectLeftOf(2880);
      logInfo(`rotatedRectLeftOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(1060);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0042
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0042
     * @tc.desc      rotatedRectLeftOf(screenWidth=2976) returns 1092
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0042 begin`);
      const actual: number = rotatedRectLeftOf(2976);
      logInfo(`rotatedRectLeftOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(1092);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0043
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0043
     * @tc.desc      rotatedRectLeftOf(screenWidth=3072) returns 1124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0043 begin`);
      const actual: number = rotatedRectLeftOf(3072);
      logInfo(`rotatedRectLeftOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(1124);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0044
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0044
     * @tc.desc      rotatedRectLeftOf(screenWidth=3168) returns 1156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0044 begin`);
      const actual: number = rotatedRectLeftOf(3168);
      logInfo(`rotatedRectLeftOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(1156);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0045
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0045
     * @tc.desc      rotatedRectLeftOf(screenWidth=3264) returns 1188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0045 begin`);
      const actual: number = rotatedRectLeftOf(3264);
      logInfo(`rotatedRectLeftOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(1188);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0046
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0046
     * @tc.desc      rotatedRectLeftOf(screenWidth=3360) returns 1220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0046 begin`);
      const actual: number = rotatedRectLeftOf(3360);
      logInfo(`rotatedRectLeftOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(1220);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0047
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0047
     * @tc.desc      rotatedRectLeftOf(screenWidth=3456) returns 1252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0047 begin`);
      const actual: number = rotatedRectLeftOf(3456);
      logInfo(`rotatedRectLeftOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(1252);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0048
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0048
     * @tc.desc      rotatedRectLeftOf(screenWidth=3552) returns 1284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0048 begin`);
      const actual: number = rotatedRectLeftOf(3552);
      logInfo(`rotatedRectLeftOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(1284);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0049
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0049
     * @tc.desc      rotatedRectLeftOf(screenWidth=3648) returns 1316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0049 begin`);
      const actual: number = rotatedRectLeftOf(3648);
      logInfo(`rotatedRectLeftOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(1316);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0050
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0050
     * @tc.desc      rotatedRectLeftOf(screenWidth=3744) returns 1348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0050 begin`);
      const actual: number = rotatedRectLeftOf(3744);
      logInfo(`rotatedRectLeftOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(1348);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0051
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0051
     * @tc.desc      rotatedRectLeftOf(screenWidth=3840) returns 1380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0051 begin`);
      const actual: number = rotatedRectLeftOf(3840);
      logInfo(`rotatedRectLeftOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(1380);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0052
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0052
     * @tc.desc      rotatedRectLeftOf(screenWidth=3580) returns 1293.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0052 begin`);
      const actual: number = rotatedRectLeftOf(3580);
      logInfo(`rotatedRectLeftOf(screenWidth=3580): actual=${actual}`);
      expect(actual).assertClose(1293.3333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0053
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0053
     * @tc.desc      rotatedRectLeftOf(screenWidth=313.43) returns 204.4766666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0053 begin`);
      const actual: number = rotatedRectLeftOf(313.43);
      logInfo(`rotatedRectLeftOf(screenWidth=313.43): actual=${actual}`);
      expect(actual).assertClose(204.4766666666667, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0054
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0054
     * @tc.desc      rotatedRectLeftOf(screenWidth=2410) returns 903.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0054 begin`);
      const actual: number = rotatedRectLeftOf(2410);
      logInfo(`rotatedRectLeftOf(screenWidth=2410): actual=${actual}`);
      expect(actual).assertClose(903.3333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0055
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0055
     * @tc.desc      rotatedRectLeftOf(screenWidth=3009) returns 1103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0055 begin`);
      const actual: number = rotatedRectLeftOf(3009);
      logInfo(`rotatedRectLeftOf(screenWidth=3009): actual=${actual}`);
      expect(actual).assertEqual(1103);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0056
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0056
     * @tc.desc      rotatedRectLeftOf(screenWidth=1239.53) returns 513.1766666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0056 begin`);
      const actual: number = rotatedRectLeftOf(1239.53);
      logInfo(`rotatedRectLeftOf(screenWidth=1239.53): actual=${actual}`);
      expect(actual).assertClose(513.1766666666667, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0057
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0057
     * @tc.desc      rotatedRectLeftOf(screenWidth=169) returns 156.33333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0057 begin`);
      const actual: number = rotatedRectLeftOf(169);
      logInfo(`rotatedRectLeftOf(screenWidth=169): actual=${actual}`);
      expect(actual).assertClose(156.33333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0058
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0058
     * @tc.desc      rotatedRectLeftOf(screenWidth=2130) returns 810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0058 begin`);
      const actual: number = rotatedRectLeftOf(2130);
      logInfo(`rotatedRectLeftOf(screenWidth=2130): actual=${actual}`);
      expect(actual).assertEqual(810);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0059
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0059
     * @tc.desc      rotatedRectLeftOf(screenWidth=2711) returns 1003.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0059 begin`);
      const actual: number = rotatedRectLeftOf(2711);
      logInfo(`rotatedRectLeftOf(screenWidth=2711): actual=${actual}`);
      expect(actual).assertClose(1003.6666666666666, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0060
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0060
     * @tc.desc      rotatedRectLeftOf(screenWidth=1420) returns 573.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0060 begin`);
      const actual: number = rotatedRectLeftOf(1420);
      logInfo(`rotatedRectLeftOf(screenWidth=1420): actual=${actual}`);
      expect(actual).assertClose(573.3333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0061
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0061
     * @tc.desc      rotatedRectLeftOf(screenWidth=948) returns 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0061 begin`);
      const actual: number = rotatedRectLeftOf(948);
      logInfo(`rotatedRectLeftOf(screenWidth=948): actual=${actual}`);
      expect(actual).assertEqual(416);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0062
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0062
     * @tc.desc      rotatedRectLeftOf(screenWidth=3046) returns 1115.3333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0062 begin`);
      const actual: number = rotatedRectLeftOf(3046);
      logInfo(`rotatedRectLeftOf(screenWidth=3046): actual=${actual}`);
      expect(actual).assertClose(1115.3333333333335, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0063
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0063
     * @tc.desc      rotatedRectLeftOf(screenWidth=2653) returns 984.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0063 begin`);
      const actual: number = rotatedRectLeftOf(2653);
      logInfo(`rotatedRectLeftOf(screenWidth=2653): actual=${actual}`);
      expect(actual).assertClose(984.3333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0064
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0064
     * @tc.desc      rotatedRectLeftOf(screenWidth=-721) returns -140.33333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatedRectLeftOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0064 begin`);
      const actual: number = rotatedRectLeftOf(-721);
      logInfo(`rotatedRectLeftOf(screenWidth=-721): actual=${actual}`);
      expect(actual).assertClose(-140.33333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0065
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0065
     * @tc.desc      rotatedRectLeftOf(screenWidth=2725) returns 1008.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0065 begin`);
      const actual: number = rotatedRectLeftOf(2725);
      logInfo(`rotatedRectLeftOf(screenWidth=2725): actual=${actual}`);
      expect(actual).assertClose(1008.3333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0066
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0066
     * @tc.desc      rotatedRectLeftOf(screenWidth=-57) returns 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatedRectLeftOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0066 begin`);
      const actual: number = rotatedRectLeftOf(-57);
      logInfo(`rotatedRectLeftOf(screenWidth=-57): actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0067
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0067
     * @tc.desc      rotatedRectLeftOf(screenWidth=2533) returns 944.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0067 begin`);
      const actual: number = rotatedRectLeftOf(2533);
      logInfo(`rotatedRectLeftOf(screenWidth=2533): actual=${actual}`);
      expect(actual).assertClose(944.3333333333334, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0068
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0068
     * @tc.desc      rotatedRectLeftOf(screenWidth=-1521) returns -407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatedRectLeftOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0068 begin`);
      const actual: number = rotatedRectLeftOf(-1521);
      logInfo(`rotatedRectLeftOf(screenWidth=-1521): actual=${actual}`);
      expect(actual).assertEqual(-407);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0069
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0069
     * @tc.desc      rotatedRectLeftOf(screenWidth=862) returns 387.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0069 begin`);
      const actual: number = rotatedRectLeftOf(862);
      logInfo(`rotatedRectLeftOf(screenWidth=862): actual=${actual}`);
      expect(actual).assertClose(387.3333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0070
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0070
     * @tc.desc      rotatedRectLeftOf(screenWidth=3284) returns 1194.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0070 begin`);
      const actual: number = rotatedRectLeftOf(3284);
      logInfo(`rotatedRectLeftOf(screenWidth=3284): actual=${actual}`);
      expect(actual).assertClose(1194.6666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0071
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0071
     * @tc.desc      rotatedRectLeftOf(screenWidth=1327.67) returns 542.5566666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0071 begin`);
      const actual: number = rotatedRectLeftOf(1327.67);
      logInfo(`rotatedRectLeftOf(screenWidth=1327.67): actual=${actual}`);
      expect(actual).assertClose(542.5566666666666, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0072
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0072
     * @tc.desc      rotatedRectLeftOf(screenWidth=473.84) returns 257.94666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0072 begin`);
      const actual: number = rotatedRectLeftOf(473.84);
      logInfo(`rotatedRectLeftOf(screenWidth=473.84): actual=${actual}`);
      expect(actual).assertClose(257.94666666666666, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0073
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0073
     * @tc.desc      rotatedRectLeftOf(screenWidth=1593.4) returns 631.1333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RotatedRectLeftOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0073 begin`);
      const actual: number = rotatedRectLeftOf(1593.4);
      logInfo(`rotatedRectLeftOf(screenWidth=1593.4): actual=${actual}`);
      expect(actual).assertClose(631.1333333333333, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROTATED_RECT_LEFT_OF_0074
     * @tc.name      TsDrawingSample_RotatedRectLeftOf_0074
     * @tc.desc      rotatedRectLeftOf(screenWidth=-1115) returns -271.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RotatedRectLeftOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RotatedRectLeftOf_0074 begin`);
      const actual: number = rotatedRectLeftOf(-1115);
      logInfo(`rotatedRectLeftOf(screenWidth=-1115): actual=${actual}`);
      expect(actual).assertClose(-271.6666666666667, PRECISION);
      logInfo(`${BUNDLE}RotatedRectLeftOf_0074 end`);
    });
  });
}
