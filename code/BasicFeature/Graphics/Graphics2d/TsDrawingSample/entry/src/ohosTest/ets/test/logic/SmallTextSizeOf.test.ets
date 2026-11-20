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
import { smallTextSizeOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for smallTextSizeOf (74 cases). */
export default function smallTextSizeOfTest(): void {
  describe('SmallTextSizeOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0001
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0001
     * @tc.desc      smallTextSizeOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_SmallTextSizeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0001 begin`);
      const actual: number = smallTextSizeOf(0);
      logInfo(`smallTextSizeOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SmallTextSizeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0002
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0002
     * @tc.desc      smallTextSizeOf(screenWidth=1) returns 0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_SmallTextSizeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0002 begin`);
      const actual: number = smallTextSizeOf(1);
      logInfo(`smallTextSizeOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.04, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0003
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0003
     * @tc.desc      smallTextSizeOf(screenWidth=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_SmallTextSizeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0003 begin`);
      const actual: number = smallTextSizeOf(25);
      logInfo(`smallTextSizeOf(screenWidth=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SmallTextSizeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0004
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0004
     * @tc.desc      smallTextSizeOf(screenWidth=24) returns 0.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_SmallTextSizeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0004 begin`);
      const actual: number = smallTextSizeOf(24);
      logInfo(`smallTextSizeOf(screenWidth=24): actual=${actual}`);
      expect(actual).assertClose(0.96, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0005
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0005
     * @tc.desc      smallTextSizeOf(screenWidth=26) returns 1.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_SmallTextSizeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0005 begin`);
      const actual: number = smallTextSizeOf(26);
      logInfo(`smallTextSizeOf(screenWidth=26): actual=${actual}`);
      expect(actual).assertClose(1.04, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0006
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0006
     * @tc.desc      smallTextSizeOf(screenWidth=50) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0006 begin`);
      const actual: number = smallTextSizeOf(50);
      logInfo(`smallTextSizeOf(screenWidth=50): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SmallTextSizeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0007
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0007
     * @tc.desc      smallTextSizeOf(screenWidth=12) returns 0.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0007 begin`);
      const actual: number = smallTextSizeOf(12);
      logInfo(`smallTextSizeOf(screenWidth=12): actual=${actual}`);
      expect(actual).assertClose(0.48, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0008
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0008
     * @tc.desc      smallTextSizeOf(screenWidth=100) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0008 begin`);
      const actual: number = smallTextSizeOf(100);
      logInfo(`smallTextSizeOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}SmallTextSizeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0009
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0009
     * @tc.desc      smallTextSizeOf(screenWidth=360) returns 14.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0009 begin`);
      const actual: number = smallTextSizeOf(360);
      logInfo(`smallTextSizeOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertClose(14.4, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0010
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0010
     * @tc.desc      smallTextSizeOf(screenWidth=720) returns 28.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0010 begin`);
      const actual: number = smallTextSizeOf(720);
      logInfo(`smallTextSizeOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertClose(28.8, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0011
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0011
     * @tc.desc      smallTextSizeOf(screenWidth=1080) returns 43.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0011 begin`);
      const actual: number = smallTextSizeOf(1080);
      logInfo(`smallTextSizeOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertClose(43.2, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0012
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0012
     * @tc.desc      smallTextSizeOf(screenWidth=1920) returns 76.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0012 begin`);
      const actual: number = smallTextSizeOf(1920);
      logInfo(`smallTextSizeOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertClose(76.8, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0013
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0013
     * @tc.desc      smallTextSizeOf(screenWidth=-1) returns -0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0013 begin`);
      const actual: number = smallTextSizeOf(-1);
      logInfo(`smallTextSizeOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.04, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0014
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0014
     * @tc.desc      smallTextSizeOf(screenWidth=2) returns 0.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0014 begin`);
      const actual: number = smallTextSizeOf(2);
      logInfo(`smallTextSizeOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.08, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0015
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0015
     * @tc.desc      smallTextSizeOf(screenWidth=3) returns 0.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0015 begin`);
      const actual: number = smallTextSizeOf(3);
      logInfo(`smallTextSizeOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertClose(0.12, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0016
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0016
     * @tc.desc      smallTextSizeOf(screenWidth=10) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0016 begin`);
      const actual: number = smallTextSizeOf(10);
      logInfo(`smallTextSizeOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0017
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0017
     * @tc.desc      smallTextSizeOf(screenWidth=96) returns 3.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0017 begin`);
      const actual: number = smallTextSizeOf(96);
      logInfo(`smallTextSizeOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertClose(3.84, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0018
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0018
     * @tc.desc      smallTextSizeOf(screenWidth=192) returns 7.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0018 begin`);
      const actual: number = smallTextSizeOf(192);
      logInfo(`smallTextSizeOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertClose(7.68, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0019
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0019
     * @tc.desc      smallTextSizeOf(screenWidth=288) returns 11.52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0019 begin`);
      const actual: number = smallTextSizeOf(288);
      logInfo(`smallTextSizeOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertClose(11.52, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0020
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0020
     * @tc.desc      smallTextSizeOf(screenWidth=384) returns 15.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0020 begin`);
      const actual: number = smallTextSizeOf(384);
      logInfo(`smallTextSizeOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertClose(15.36, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0021
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0021
     * @tc.desc      smallTextSizeOf(screenWidth=480) returns 19.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0021 begin`);
      const actual: number = smallTextSizeOf(480);
      logInfo(`smallTextSizeOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertClose(19.2, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0022
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0022
     * @tc.desc      smallTextSizeOf(screenWidth=576) returns 23.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0022 begin`);
      const actual: number = smallTextSizeOf(576);
      logInfo(`smallTextSizeOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertClose(23.04, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0023
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0023
     * @tc.desc      smallTextSizeOf(screenWidth=672) returns 26.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0023 begin`);
      const actual: number = smallTextSizeOf(672);
      logInfo(`smallTextSizeOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertClose(26.88, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0024
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0024
     * @tc.desc      smallTextSizeOf(screenWidth=768) returns 30.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0024 begin`);
      const actual: number = smallTextSizeOf(768);
      logInfo(`smallTextSizeOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertClose(30.72, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0025
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0025
     * @tc.desc      smallTextSizeOf(screenWidth=864) returns 34.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0025 begin`);
      const actual: number = smallTextSizeOf(864);
      logInfo(`smallTextSizeOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertClose(34.56, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0026
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0026
     * @tc.desc      smallTextSizeOf(screenWidth=960) returns 38.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0026 begin`);
      const actual: number = smallTextSizeOf(960);
      logInfo(`smallTextSizeOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertClose(38.4, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0027
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0027
     * @tc.desc      smallTextSizeOf(screenWidth=1056) returns 42.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0027 begin`);
      const actual: number = smallTextSizeOf(1056);
      logInfo(`smallTextSizeOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertClose(42.24, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0028
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0028
     * @tc.desc      smallTextSizeOf(screenWidth=1152) returns 46.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0028 begin`);
      const actual: number = smallTextSizeOf(1152);
      logInfo(`smallTextSizeOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertClose(46.08, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0029
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0029
     * @tc.desc      smallTextSizeOf(screenWidth=1248) returns 49.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0029 begin`);
      const actual: number = smallTextSizeOf(1248);
      logInfo(`smallTextSizeOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertClose(49.92, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0030
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0030
     * @tc.desc      smallTextSizeOf(screenWidth=1344) returns 53.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0030 begin`);
      const actual: number = smallTextSizeOf(1344);
      logInfo(`smallTextSizeOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertClose(53.76, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0031
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0031
     * @tc.desc      smallTextSizeOf(screenWidth=1440) returns 57.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0031 begin`);
      const actual: number = smallTextSizeOf(1440);
      logInfo(`smallTextSizeOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertClose(57.6, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0032
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0032
     * @tc.desc      smallTextSizeOf(screenWidth=1536) returns 61.44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0032 begin`);
      const actual: number = smallTextSizeOf(1536);
      logInfo(`smallTextSizeOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertClose(61.44, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0033
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0033
     * @tc.desc      smallTextSizeOf(screenWidth=1632) returns 65.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0033 begin`);
      const actual: number = smallTextSizeOf(1632);
      logInfo(`smallTextSizeOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertClose(65.28, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0034
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0034
     * @tc.desc      smallTextSizeOf(screenWidth=1728) returns 69.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0034 begin`);
      const actual: number = smallTextSizeOf(1728);
      logInfo(`smallTextSizeOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertClose(69.12, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0035
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0035
     * @tc.desc      smallTextSizeOf(screenWidth=1824) returns 72.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0035 begin`);
      const actual: number = smallTextSizeOf(1824);
      logInfo(`smallTextSizeOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertClose(72.96, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0036
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0036
     * @tc.desc      smallTextSizeOf(screenWidth=2016) returns 80.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0036 begin`);
      const actual: number = smallTextSizeOf(2016);
      logInfo(`smallTextSizeOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertClose(80.64, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0037
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0037
     * @tc.desc      smallTextSizeOf(screenWidth=2112) returns 84.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0037 begin`);
      const actual: number = smallTextSizeOf(2112);
      logInfo(`smallTextSizeOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertClose(84.48, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0038
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0038
     * @tc.desc      smallTextSizeOf(screenWidth=2208) returns 88.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0038 begin`);
      const actual: number = smallTextSizeOf(2208);
      logInfo(`smallTextSizeOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertClose(88.32, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0039
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0039
     * @tc.desc      smallTextSizeOf(screenWidth=2304) returns 92.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0039 begin`);
      const actual: number = smallTextSizeOf(2304);
      logInfo(`smallTextSizeOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertClose(92.16, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0040
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0040
     * @tc.desc      smallTextSizeOf(screenWidth=2400) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0040 begin`);
      const actual: number = smallTextSizeOf(2400);
      logInfo(`smallTextSizeOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}SmallTextSizeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0041
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0041
     * @tc.desc      smallTextSizeOf(screenWidth=2496) returns 99.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0041 begin`);
      const actual: number = smallTextSizeOf(2496);
      logInfo(`smallTextSizeOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertClose(99.84, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0042
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0042
     * @tc.desc      smallTextSizeOf(screenWidth=2592) returns 103.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0042 begin`);
      const actual: number = smallTextSizeOf(2592);
      logInfo(`smallTextSizeOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertClose(103.68, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0043
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0043
     * @tc.desc      smallTextSizeOf(screenWidth=2688) returns 107.52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0043 begin`);
      const actual: number = smallTextSizeOf(2688);
      logInfo(`smallTextSizeOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertClose(107.52, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0044
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0044
     * @tc.desc      smallTextSizeOf(screenWidth=2784) returns 111.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0044 begin`);
      const actual: number = smallTextSizeOf(2784);
      logInfo(`smallTextSizeOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertClose(111.36, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0045
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0045
     * @tc.desc      smallTextSizeOf(screenWidth=2880) returns 115.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0045 begin`);
      const actual: number = smallTextSizeOf(2880);
      logInfo(`smallTextSizeOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertClose(115.2, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0046
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0046
     * @tc.desc      smallTextSizeOf(screenWidth=2976) returns 119.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0046 begin`);
      const actual: number = smallTextSizeOf(2976);
      logInfo(`smallTextSizeOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertClose(119.04, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0047
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0047
     * @tc.desc      smallTextSizeOf(screenWidth=3072) returns 122.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0047 begin`);
      const actual: number = smallTextSizeOf(3072);
      logInfo(`smallTextSizeOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertClose(122.88, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0048
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0048
     * @tc.desc      smallTextSizeOf(screenWidth=3168) returns 126.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0048 begin`);
      const actual: number = smallTextSizeOf(3168);
      logInfo(`smallTextSizeOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertClose(126.72, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0049
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0049
     * @tc.desc      smallTextSizeOf(screenWidth=3264) returns 130.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0049 begin`);
      const actual: number = smallTextSizeOf(3264);
      logInfo(`smallTextSizeOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertClose(130.56, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0050
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0050
     * @tc.desc      smallTextSizeOf(screenWidth=3360) returns 134.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0050 begin`);
      const actual: number = smallTextSizeOf(3360);
      logInfo(`smallTextSizeOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertClose(134.4, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0051
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0051
     * @tc.desc      smallTextSizeOf(screenWidth=3456) returns 138.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0051 begin`);
      const actual: number = smallTextSizeOf(3456);
      logInfo(`smallTextSizeOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertClose(138.24, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0052
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0052
     * @tc.desc      smallTextSizeOf(screenWidth=3552) returns 142.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0052 begin`);
      const actual: number = smallTextSizeOf(3552);
      logInfo(`smallTextSizeOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertClose(142.08, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0053
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0053
     * @tc.desc      smallTextSizeOf(screenWidth=3648) returns 145.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0053 begin`);
      const actual: number = smallTextSizeOf(3648);
      logInfo(`smallTextSizeOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertClose(145.92, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0054
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0054
     * @tc.desc      smallTextSizeOf(screenWidth=3744) returns 149.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0054 begin`);
      const actual: number = smallTextSizeOf(3744);
      logInfo(`smallTextSizeOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertClose(149.76, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0055
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0055
     * @tc.desc      smallTextSizeOf(screenWidth=3840) returns 153.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0055 begin`);
      const actual: number = smallTextSizeOf(3840);
      logInfo(`smallTextSizeOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertClose(153.6, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0056
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0056
     * @tc.desc      smallTextSizeOf(screenWidth=-672) returns -26.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0056 begin`);
      const actual: number = smallTextSizeOf(-672);
      logInfo(`smallTextSizeOf(screenWidth=-672): actual=${actual}`);
      expect(actual).assertClose(-26.88, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0057
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0057
     * @tc.desc      smallTextSizeOf(screenWidth=-293) returns -11.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0057 begin`);
      const actual: number = smallTextSizeOf(-293);
      logInfo(`smallTextSizeOf(screenWidth=-293): actual=${actual}`);
      expect(actual).assertClose(-11.72, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0058
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0058
     * @tc.desc      smallTextSizeOf(screenWidth=3469) returns 138.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0058 begin`);
      const actual: number = smallTextSizeOf(3469);
      logInfo(`smallTextSizeOf(screenWidth=3469): actual=${actual}`);
      expect(actual).assertClose(138.76, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0059
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0059
     * @tc.desc      smallTextSizeOf(screenWidth=2240) returns 89.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0059 begin`);
      const actual: number = smallTextSizeOf(2240);
      logInfo(`smallTextSizeOf(screenWidth=2240): actual=${actual}`);
      expect(actual).assertClose(89.6, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0060
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0060
     * @tc.desc      smallTextSizeOf(screenWidth=2579) returns 103.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0060 begin`);
      const actual: number = smallTextSizeOf(2579);
      logInfo(`smallTextSizeOf(screenWidth=2579): actual=${actual}`);
      expect(actual).assertClose(103.16, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0061
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0061
     * @tc.desc      smallTextSizeOf(screenWidth=600.1) returns 24.004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0061 begin`);
      const actual: number = smallTextSizeOf(600.1);
      logInfo(`smallTextSizeOf(screenWidth=600.1): actual=${actual}`);
      expect(actual).assertClose(24.004, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0062
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0062
     * @tc.desc      smallTextSizeOf(screenWidth=-136) returns -5.44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0062 begin`);
      const actual: number = smallTextSizeOf(-136);
      logInfo(`smallTextSizeOf(screenWidth=-136): actual=${actual}`);
      expect(actual).assertClose(-5.44, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0063
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0063
     * @tc.desc      smallTextSizeOf(screenWidth=1883.08) returns 75.3232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0063 begin`);
      const actual: number = smallTextSizeOf(1883.08);
      logInfo(`smallTextSizeOf(screenWidth=1883.08): actual=${actual}`);
      expect(actual).assertClose(75.3232, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0064
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0064
     * @tc.desc      smallTextSizeOf(screenWidth=2689) returns 107.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0064 begin`);
      const actual: number = smallTextSizeOf(2689);
      logInfo(`smallTextSizeOf(screenWidth=2689): actual=${actual}`);
      expect(actual).assertClose(107.56, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0065
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0065
     * @tc.desc      smallTextSizeOf(screenWidth=586) returns 23.44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0065 begin`);
      const actual: number = smallTextSizeOf(586);
      logInfo(`smallTextSizeOf(screenWidth=586): actual=${actual}`);
      expect(actual).assertClose(23.44, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0066
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0066
     * @tc.desc      smallTextSizeOf(screenWidth=-1528) returns -61.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0066 begin`);
      const actual: number = smallTextSizeOf(-1528);
      logInfo(`smallTextSizeOf(screenWidth=-1528): actual=${actual}`);
      expect(actual).assertClose(-61.12, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0067
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0067
     * @tc.desc      smallTextSizeOf(screenWidth=1186.15) returns 47.446000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0067 begin`);
      const actual: number = smallTextSizeOf(1186.15);
      logInfo(`smallTextSizeOf(screenWidth=1186.15): actual=${actual}`);
      expect(actual).assertClose(47.446000000000005, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0068
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0068
     * @tc.desc      smallTextSizeOf(screenWidth=-1372) returns -54.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0068 begin`);
      const actual: number = smallTextSizeOf(-1372);
      logInfo(`smallTextSizeOf(screenWidth=-1372): actual=${actual}`);
      expect(actual).assertClose(-54.88, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0069
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0069
     * @tc.desc      smallTextSizeOf(screenWidth=2728) returns 109.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0069 begin`);
      const actual: number = smallTextSizeOf(2728);
      logInfo(`smallTextSizeOf(screenWidth=2728): actual=${actual}`);
      expect(actual).assertClose(109.12, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0070
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0070
     * @tc.desc      smallTextSizeOf(screenWidth=-948) returns -37.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0070 begin`);
      const actual: number = smallTextSizeOf(-948);
      logInfo(`smallTextSizeOf(screenWidth=-948): actual=${actual}`);
      expect(actual).assertClose(-37.92, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0071
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0071
     * @tc.desc      smallTextSizeOf(screenWidth=2624) returns 104.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0071 begin`);
      const actual: number = smallTextSizeOf(2624);
      logInfo(`smallTextSizeOf(screenWidth=2624): actual=${actual}`);
      expect(actual).assertClose(104.96, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0072
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0072
     * @tc.desc      smallTextSizeOf(screenWidth=664.31) returns 26.5724
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0072 begin`);
      const actual: number = smallTextSizeOf(664.31);
      logInfo(`smallTextSizeOf(screenWidth=664.31): actual=${actual}`);
      expect(actual).assertClose(26.5724, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0073
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0073
     * @tc.desc      smallTextSizeOf(screenWidth=-624) returns -24.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_SmallTextSizeOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0073 begin`);
      const actual: number = smallTextSizeOf(-624);
      logInfo(`smallTextSizeOf(screenWidth=-624): actual=${actual}`);
      expect(actual).assertClose(-24.96, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SMALL_TEXT_SIZE_OF_0074
     * @tc.name      TsDrawingSample_SmallTextSizeOf_0074
     * @tc.desc      smallTextSizeOf(screenWidth=2180) returns 87.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_SmallTextSizeOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SmallTextSizeOf_0074 begin`);
      const actual: number = smallTextSizeOf(2180);
      logInfo(`smallTextSizeOf(screenWidth=2180): actual=${actual}`);
      expect(actual).assertClose(87.2, PRECISION);
      logInfo(`${BUNDLE}SmallTextSizeOf_0074 end`);
    });
  });
}
