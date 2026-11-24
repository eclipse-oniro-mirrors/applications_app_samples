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
import { titleXOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for titleXOf (74 cases). */
export default function titleXOfTest(): void {
  describe('TitleXOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0001
     * @tc.name      TsDrawingSample_TitleXOf_0001
     * @tc.desc      titleXOf(screenWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_TitleXOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleXOf_0001 begin`);
      const actual: number = titleXOf(0);
      logInfo(`titleXOf(screenWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleXOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0002
     * @tc.name      TsDrawingSample_TitleXOf_0002
     * @tc.desc      titleXOf(screenWidth=1) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_TitleXOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleXOf_0002 begin`);
      const actual: number = titleXOf(1);
      logInfo(`titleXOf(screenWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0003
     * @tc.name      TsDrawingSample_TitleXOf_0003
     * @tc.desc      titleXOf(screenWidth=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_TitleXOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TitleXOf_0003 begin`);
      const actual: number = titleXOf(3);
      logInfo(`titleXOf(screenWidth=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TitleXOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0004
     * @tc.name      TsDrawingSample_TitleXOf_0004
     * @tc.desc      titleXOf(screenWidth=2) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_TitleXOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TitleXOf_0004 begin`);
      const actual: number = titleXOf(2);
      logInfo(`titleXOf(screenWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0005
     * @tc.name      TsDrawingSample_TitleXOf_0005
     * @tc.desc      titleXOf(screenWidth=4) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_TitleXOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TitleXOf_0005 begin`);
      const actual: number = titleXOf(4);
      logInfo(`titleXOf(screenWidth=4): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0006
     * @tc.name      TsDrawingSample_TitleXOf_0006
     * @tc.desc      titleXOf(screenWidth=100) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0006 begin`);
      const actual: number = titleXOf(100);
      logInfo(`titleXOf(screenWidth=100): actual=${actual}`);
      expect(actual).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0007
     * @tc.name      TsDrawingSample_TitleXOf_0007
     * @tc.desc      titleXOf(screenWidth=360) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0007 begin`);
      const actual: number = titleXOf(360);
      logInfo(`titleXOf(screenWidth=360): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}TitleXOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0008
     * @tc.name      TsDrawingSample_TitleXOf_0008
     * @tc.desc      titleXOf(screenWidth=720) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0008 begin`);
      const actual: number = titleXOf(720);
      logInfo(`titleXOf(screenWidth=720): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}TitleXOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0009
     * @tc.name      TsDrawingSample_TitleXOf_0009
     * @tc.desc      titleXOf(screenWidth=1080) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0009 begin`);
      const actual: number = titleXOf(1080);
      logInfo(`titleXOf(screenWidth=1080): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}TitleXOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0010
     * @tc.name      TsDrawingSample_TitleXOf_0010
     * @tc.desc      titleXOf(screenWidth=1920) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0010 begin`);
      const actual: number = titleXOf(1920);
      logInfo(`titleXOf(screenWidth=1920): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}TitleXOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0011
     * @tc.name      TsDrawingSample_TitleXOf_0011
     * @tc.desc      titleXOf(screenWidth=-1) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_TitleXOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleXOf_0011 begin`);
      const actual: number = titleXOf(-1);
      logInfo(`titleXOf(screenWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0012
     * @tc.name      TsDrawingSample_TitleXOf_0012
     * @tc.desc      titleXOf(screenWidth=10) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0012 begin`);
      const actual: number = titleXOf(10);
      logInfo(`titleXOf(screenWidth=10): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0013
     * @tc.name      TsDrawingSample_TitleXOf_0013
     * @tc.desc      titleXOf(screenWidth=96) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0013 begin`);
      const actual: number = titleXOf(96);
      logInfo(`titleXOf(screenWidth=96): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}TitleXOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0014
     * @tc.name      TsDrawingSample_TitleXOf_0014
     * @tc.desc      titleXOf(screenWidth=192) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0014 begin`);
      const actual: number = titleXOf(192);
      logInfo(`titleXOf(screenWidth=192): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TitleXOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0015
     * @tc.name      TsDrawingSample_TitleXOf_0015
     * @tc.desc      titleXOf(screenWidth=288) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0015 begin`);
      const actual: number = titleXOf(288);
      logInfo(`titleXOf(screenWidth=288): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}TitleXOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0016
     * @tc.name      TsDrawingSample_TitleXOf_0016
     * @tc.desc      titleXOf(screenWidth=384) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0016 begin`);
      const actual: number = titleXOf(384);
      logInfo(`titleXOf(screenWidth=384): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}TitleXOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0017
     * @tc.name      TsDrawingSample_TitleXOf_0017
     * @tc.desc      titleXOf(screenWidth=480) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0017 begin`);
      const actual: number = titleXOf(480);
      logInfo(`titleXOf(screenWidth=480): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}TitleXOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0018
     * @tc.name      TsDrawingSample_TitleXOf_0018
     * @tc.desc      titleXOf(screenWidth=576) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0018 begin`);
      const actual: number = titleXOf(576);
      logInfo(`titleXOf(screenWidth=576): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}TitleXOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0019
     * @tc.name      TsDrawingSample_TitleXOf_0019
     * @tc.desc      titleXOf(screenWidth=672) returns 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0019 begin`);
      const actual: number = titleXOf(672);
      logInfo(`titleXOf(screenWidth=672): actual=${actual}`);
      expect(actual).assertEqual(224);
      logInfo(`${BUNDLE}TitleXOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0020
     * @tc.name      TsDrawingSample_TitleXOf_0020
     * @tc.desc      titleXOf(screenWidth=768) returns 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0020 begin`);
      const actual: number = titleXOf(768);
      logInfo(`titleXOf(screenWidth=768): actual=${actual}`);
      expect(actual).assertEqual(256);
      logInfo(`${BUNDLE}TitleXOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0021
     * @tc.name      TsDrawingSample_TitleXOf_0021
     * @tc.desc      titleXOf(screenWidth=864) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0021 begin`);
      const actual: number = titleXOf(864);
      logInfo(`titleXOf(screenWidth=864): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}TitleXOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0022
     * @tc.name      TsDrawingSample_TitleXOf_0022
     * @tc.desc      titleXOf(screenWidth=960) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0022 begin`);
      const actual: number = titleXOf(960);
      logInfo(`titleXOf(screenWidth=960): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}TitleXOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0023
     * @tc.name      TsDrawingSample_TitleXOf_0023
     * @tc.desc      titleXOf(screenWidth=1056) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0023 begin`);
      const actual: number = titleXOf(1056);
      logInfo(`titleXOf(screenWidth=1056): actual=${actual}`);
      expect(actual).assertEqual(352);
      logInfo(`${BUNDLE}TitleXOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0024
     * @tc.name      TsDrawingSample_TitleXOf_0024
     * @tc.desc      titleXOf(screenWidth=1152) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0024 begin`);
      const actual: number = titleXOf(1152);
      logInfo(`titleXOf(screenWidth=1152): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}TitleXOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0025
     * @tc.name      TsDrawingSample_TitleXOf_0025
     * @tc.desc      titleXOf(screenWidth=1248) returns 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0025 begin`);
      const actual: number = titleXOf(1248);
      logInfo(`titleXOf(screenWidth=1248): actual=${actual}`);
      expect(actual).assertEqual(416);
      logInfo(`${BUNDLE}TitleXOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0026
     * @tc.name      TsDrawingSample_TitleXOf_0026
     * @tc.desc      titleXOf(screenWidth=1344) returns 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0026 begin`);
      const actual: number = titleXOf(1344);
      logInfo(`titleXOf(screenWidth=1344): actual=${actual}`);
      expect(actual).assertEqual(448);
      logInfo(`${BUNDLE}TitleXOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0027
     * @tc.name      TsDrawingSample_TitleXOf_0027
     * @tc.desc      titleXOf(screenWidth=1440) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0027 begin`);
      const actual: number = titleXOf(1440);
      logInfo(`titleXOf(screenWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}TitleXOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0028
     * @tc.name      TsDrawingSample_TitleXOf_0028
     * @tc.desc      titleXOf(screenWidth=1536) returns 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0028 begin`);
      const actual: number = titleXOf(1536);
      logInfo(`titleXOf(screenWidth=1536): actual=${actual}`);
      expect(actual).assertEqual(512);
      logInfo(`${BUNDLE}TitleXOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0029
     * @tc.name      TsDrawingSample_TitleXOf_0029
     * @tc.desc      titleXOf(screenWidth=1632) returns 544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0029 begin`);
      const actual: number = titleXOf(1632);
      logInfo(`titleXOf(screenWidth=1632): actual=${actual}`);
      expect(actual).assertEqual(544);
      logInfo(`${BUNDLE}TitleXOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0030
     * @tc.name      TsDrawingSample_TitleXOf_0030
     * @tc.desc      titleXOf(screenWidth=1728) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0030 begin`);
      const actual: number = titleXOf(1728);
      logInfo(`titleXOf(screenWidth=1728): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}TitleXOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0031
     * @tc.name      TsDrawingSample_TitleXOf_0031
     * @tc.desc      titleXOf(screenWidth=1824) returns 608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0031 begin`);
      const actual: number = titleXOf(1824);
      logInfo(`titleXOf(screenWidth=1824): actual=${actual}`);
      expect(actual).assertEqual(608);
      logInfo(`${BUNDLE}TitleXOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0032
     * @tc.name      TsDrawingSample_TitleXOf_0032
     * @tc.desc      titleXOf(screenWidth=2016) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0032 begin`);
      const actual: number = titleXOf(2016);
      logInfo(`titleXOf(screenWidth=2016): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}TitleXOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0033
     * @tc.name      TsDrawingSample_TitleXOf_0033
     * @tc.desc      titleXOf(screenWidth=2112) returns 704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0033 begin`);
      const actual: number = titleXOf(2112);
      logInfo(`titleXOf(screenWidth=2112): actual=${actual}`);
      expect(actual).assertEqual(704);
      logInfo(`${BUNDLE}TitleXOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0034
     * @tc.name      TsDrawingSample_TitleXOf_0034
     * @tc.desc      titleXOf(screenWidth=2208) returns 736
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0034 begin`);
      const actual: number = titleXOf(2208);
      logInfo(`titleXOf(screenWidth=2208): actual=${actual}`);
      expect(actual).assertEqual(736);
      logInfo(`${BUNDLE}TitleXOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0035
     * @tc.name      TsDrawingSample_TitleXOf_0035
     * @tc.desc      titleXOf(screenWidth=2304) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0035 begin`);
      const actual: number = titleXOf(2304);
      logInfo(`titleXOf(screenWidth=2304): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}TitleXOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0036
     * @tc.name      TsDrawingSample_TitleXOf_0036
     * @tc.desc      titleXOf(screenWidth=2400) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0036 begin`);
      const actual: number = titleXOf(2400);
      logInfo(`titleXOf(screenWidth=2400): actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}TitleXOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0037
     * @tc.name      TsDrawingSample_TitleXOf_0037
     * @tc.desc      titleXOf(screenWidth=2496) returns 832
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0037 begin`);
      const actual: number = titleXOf(2496);
      logInfo(`titleXOf(screenWidth=2496): actual=${actual}`);
      expect(actual).assertEqual(832);
      logInfo(`${BUNDLE}TitleXOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0038
     * @tc.name      TsDrawingSample_TitleXOf_0038
     * @tc.desc      titleXOf(screenWidth=2592) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0038 begin`);
      const actual: number = titleXOf(2592);
      logInfo(`titleXOf(screenWidth=2592): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}TitleXOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0039
     * @tc.name      TsDrawingSample_TitleXOf_0039
     * @tc.desc      titleXOf(screenWidth=2688) returns 896
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0039 begin`);
      const actual: number = titleXOf(2688);
      logInfo(`titleXOf(screenWidth=2688): actual=${actual}`);
      expect(actual).assertEqual(896);
      logInfo(`${BUNDLE}TitleXOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0040
     * @tc.name      TsDrawingSample_TitleXOf_0040
     * @tc.desc      titleXOf(screenWidth=2784) returns 928
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0040 begin`);
      const actual: number = titleXOf(2784);
      logInfo(`titleXOf(screenWidth=2784): actual=${actual}`);
      expect(actual).assertEqual(928);
      logInfo(`${BUNDLE}TitleXOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0041
     * @tc.name      TsDrawingSample_TitleXOf_0041
     * @tc.desc      titleXOf(screenWidth=2880) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0041 begin`);
      const actual: number = titleXOf(2880);
      logInfo(`titleXOf(screenWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}TitleXOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0042
     * @tc.name      TsDrawingSample_TitleXOf_0042
     * @tc.desc      titleXOf(screenWidth=2976) returns 992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0042 begin`);
      const actual: number = titleXOf(2976);
      logInfo(`titleXOf(screenWidth=2976): actual=${actual}`);
      expect(actual).assertEqual(992);
      logInfo(`${BUNDLE}TitleXOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0043
     * @tc.name      TsDrawingSample_TitleXOf_0043
     * @tc.desc      titleXOf(screenWidth=3072) returns 1024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0043 begin`);
      const actual: number = titleXOf(3072);
      logInfo(`titleXOf(screenWidth=3072): actual=${actual}`);
      expect(actual).assertEqual(1024);
      logInfo(`${BUNDLE}TitleXOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0044
     * @tc.name      TsDrawingSample_TitleXOf_0044
     * @tc.desc      titleXOf(screenWidth=3168) returns 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0044 begin`);
      const actual: number = titleXOf(3168);
      logInfo(`titleXOf(screenWidth=3168): actual=${actual}`);
      expect(actual).assertEqual(1056);
      logInfo(`${BUNDLE}TitleXOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0045
     * @tc.name      TsDrawingSample_TitleXOf_0045
     * @tc.desc      titleXOf(screenWidth=3264) returns 1088
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0045 begin`);
      const actual: number = titleXOf(3264);
      logInfo(`titleXOf(screenWidth=3264): actual=${actual}`);
      expect(actual).assertEqual(1088);
      logInfo(`${BUNDLE}TitleXOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0046
     * @tc.name      TsDrawingSample_TitleXOf_0046
     * @tc.desc      titleXOf(screenWidth=3360) returns 1120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0046 begin`);
      const actual: number = titleXOf(3360);
      logInfo(`titleXOf(screenWidth=3360): actual=${actual}`);
      expect(actual).assertEqual(1120);
      logInfo(`${BUNDLE}TitleXOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0047
     * @tc.name      TsDrawingSample_TitleXOf_0047
     * @tc.desc      titleXOf(screenWidth=3456) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0047 begin`);
      const actual: number = titleXOf(3456);
      logInfo(`titleXOf(screenWidth=3456): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}TitleXOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0048
     * @tc.name      TsDrawingSample_TitleXOf_0048
     * @tc.desc      titleXOf(screenWidth=3552) returns 1184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0048 begin`);
      const actual: number = titleXOf(3552);
      logInfo(`titleXOf(screenWidth=3552): actual=${actual}`);
      expect(actual).assertEqual(1184);
      logInfo(`${BUNDLE}TitleXOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0049
     * @tc.name      TsDrawingSample_TitleXOf_0049
     * @tc.desc      titleXOf(screenWidth=3648) returns 1216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0049 begin`);
      const actual: number = titleXOf(3648);
      logInfo(`titleXOf(screenWidth=3648): actual=${actual}`);
      expect(actual).assertEqual(1216);
      logInfo(`${BUNDLE}TitleXOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0050
     * @tc.name      TsDrawingSample_TitleXOf_0050
     * @tc.desc      titleXOf(screenWidth=3744) returns 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0050 begin`);
      const actual: number = titleXOf(3744);
      logInfo(`titleXOf(screenWidth=3744): actual=${actual}`);
      expect(actual).assertEqual(1248);
      logInfo(`${BUNDLE}TitleXOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0051
     * @tc.name      TsDrawingSample_TitleXOf_0051
     * @tc.desc      titleXOf(screenWidth=3840) returns 1280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0051 begin`);
      const actual: number = titleXOf(3840);
      logInfo(`titleXOf(screenWidth=3840): actual=${actual}`);
      expect(actual).assertEqual(1280);
      logInfo(`${BUNDLE}TitleXOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0052
     * @tc.name      TsDrawingSample_TitleXOf_0052
     * @tc.desc      titleXOf(screenWidth=1301) returns 433.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0052 begin`);
      const actual: number = titleXOf(1301);
      logInfo(`titleXOf(screenWidth=1301): actual=${actual}`);
      expect(actual).assertClose(433.6666666666667, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0053
     * @tc.name      TsDrawingSample_TitleXOf_0053
     * @tc.desc      titleXOf(screenWidth=1829) returns 609.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0053 begin`);
      const actual: number = titleXOf(1829);
      logInfo(`titleXOf(screenWidth=1829): actual=${actual}`);
      expect(actual).assertClose(609.6666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0054
     * @tc.name      TsDrawingSample_TitleXOf_0054
     * @tc.desc      titleXOf(screenWidth=-156) returns -52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_TitleXOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleXOf_0054 begin`);
      const actual: number = titleXOf(-156);
      logInfo(`titleXOf(screenWidth=-156): actual=${actual}`);
      expect(actual).assertEqual(-52);
      logInfo(`${BUNDLE}TitleXOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0055
     * @tc.name      TsDrawingSample_TitleXOf_0055
     * @tc.desc      titleXOf(screenWidth=168) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0055 begin`);
      const actual: number = titleXOf(168);
      logInfo(`titleXOf(screenWidth=168): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}TitleXOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0056
     * @tc.name      TsDrawingSample_TitleXOf_0056
     * @tc.desc      titleXOf(screenWidth=1528) returns 509.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0056 begin`);
      const actual: number = titleXOf(1528);
      logInfo(`titleXOf(screenWidth=1528): actual=${actual}`);
      expect(actual).assertClose(509.3333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0057
     * @tc.name      TsDrawingSample_TitleXOf_0057
     * @tc.desc      titleXOf(screenWidth=1144) returns 381.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0057 begin`);
      const actual: number = titleXOf(1144);
      logInfo(`titleXOf(screenWidth=1144): actual=${actual}`);
      expect(actual).assertClose(381.3333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0058
     * @tc.name      TsDrawingSample_TitleXOf_0058
     * @tc.desc      titleXOf(screenWidth=-26) returns -8.666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_TitleXOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleXOf_0058 begin`);
      const actual: number = titleXOf(-26);
      logInfo(`titleXOf(screenWidth=-26): actual=${actual}`);
      expect(actual).assertClose(-8.666666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0059
     * @tc.name      TsDrawingSample_TitleXOf_0059
     * @tc.desc      titleXOf(screenWidth=1542.56) returns 514.1866666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0059 begin`);
      const actual: number = titleXOf(1542.56);
      logInfo(`titleXOf(screenWidth=1542.56): actual=${actual}`);
      expect(actual).assertClose(514.1866666666666, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0060
     * @tc.name      TsDrawingSample_TitleXOf_0060
     * @tc.desc      titleXOf(screenWidth=1795.12) returns 598.3733333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0060 begin`);
      const actual: number = titleXOf(1795.12);
      logInfo(`titleXOf(screenWidth=1795.12): actual=${actual}`);
      expect(actual).assertClose(598.3733333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0061
     * @tc.name      TsDrawingSample_TitleXOf_0061
     * @tc.desc      titleXOf(screenWidth=565) returns 188.33333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0061 begin`);
      const actual: number = titleXOf(565);
      logInfo(`titleXOf(screenWidth=565): actual=${actual}`);
      expect(actual).assertClose(188.33333333333334, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0062
     * @tc.name      TsDrawingSample_TitleXOf_0062
     * @tc.desc      titleXOf(screenWidth=3481) returns 1160.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0062 begin`);
      const actual: number = titleXOf(3481);
      logInfo(`titleXOf(screenWidth=3481): actual=${actual}`);
      expect(actual).assertClose(1160.3333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0063
     * @tc.name      TsDrawingSample_TitleXOf_0063
     * @tc.desc      titleXOf(screenWidth=1455) returns 485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0063 begin`);
      const actual: number = titleXOf(1455);
      logInfo(`titleXOf(screenWidth=1455): actual=${actual}`);
      expect(actual).assertEqual(485);
      logInfo(`${BUNDLE}TitleXOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0064
     * @tc.name      TsDrawingSample_TitleXOf_0064
     * @tc.desc      titleXOf(screenWidth=1022) returns 340.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0064 begin`);
      const actual: number = titleXOf(1022);
      logInfo(`titleXOf(screenWidth=1022): actual=${actual}`);
      expect(actual).assertClose(340.6666666666667, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0065
     * @tc.name      TsDrawingSample_TitleXOf_0065
     * @tc.desc      titleXOf(screenWidth=2607) returns 869
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0065 begin`);
      const actual: number = titleXOf(2607);
      logInfo(`titleXOf(screenWidth=2607): actual=${actual}`);
      expect(actual).assertEqual(869);
      logInfo(`${BUNDLE}TitleXOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0066
     * @tc.name      TsDrawingSample_TitleXOf_0066
     * @tc.desc      titleXOf(screenWidth=2705) returns 901.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0066 begin`);
      const actual: number = titleXOf(2705);
      logInfo(`titleXOf(screenWidth=2705): actual=${actual}`);
      expect(actual).assertClose(901.6666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0067
     * @tc.name      TsDrawingSample_TitleXOf_0067
     * @tc.desc      titleXOf(screenWidth=238.1) returns 79.36666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0067 begin`);
      const actual: number = titleXOf(238.1);
      logInfo(`titleXOf(screenWidth=238.1): actual=${actual}`);
      expect(actual).assertClose(79.36666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0068
     * @tc.name      TsDrawingSample_TitleXOf_0068
     * @tc.desc      titleXOf(screenWidth=-1621) returns -540.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_TitleXOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleXOf_0068 begin`);
      const actual: number = titleXOf(-1621);
      logInfo(`titleXOf(screenWidth=-1621): actual=${actual}`);
      expect(actual).assertClose(-540.3333333333334, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0069
     * @tc.name      TsDrawingSample_TitleXOf_0069
     * @tc.desc      titleXOf(screenWidth=1838) returns 612.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0069 begin`);
      const actual: number = titleXOf(1838);
      logInfo(`titleXOf(screenWidth=1838): actual=${actual}`);
      expect(actual).assertClose(612.6666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0070
     * @tc.name      TsDrawingSample_TitleXOf_0070
     * @tc.desc      titleXOf(screenWidth=-1920) returns -640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_TitleXOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleXOf_0070 begin`);
      const actual: number = titleXOf(-1920);
      logInfo(`titleXOf(screenWidth=-1920): actual=${actual}`);
      expect(actual).assertEqual(-640);
      logInfo(`${BUNDLE}TitleXOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0071
     * @tc.name      TsDrawingSample_TitleXOf_0071
     * @tc.desc      titleXOf(screenWidth=3136) returns 1045.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0071 begin`);
      const actual: number = titleXOf(3136);
      logInfo(`titleXOf(screenWidth=3136): actual=${actual}`);
      expect(actual).assertClose(1045.3333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0072
     * @tc.name      TsDrawingSample_TitleXOf_0072
     * @tc.desc      titleXOf(screenWidth=3369) returns 1123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0072 begin`);
      const actual: number = titleXOf(3369);
      logInfo(`titleXOf(screenWidth=3369): actual=${actual}`);
      expect(actual).assertEqual(1123);
      logInfo(`${BUNDLE}TitleXOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0073
     * @tc.name      TsDrawingSample_TitleXOf_0073
     * @tc.desc      titleXOf(screenWidth=-289) returns -96.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_TitleXOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleXOf_0073 begin`);
      const actual: number = titleXOf(-289);
      logInfo(`titleXOf(screenWidth=-289): actual=${actual}`);
      expect(actual).assertClose(-96.33333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_TITLE_XOF_0074
     * @tc.name      TsDrawingSample_TitleXOf_0074
     * @tc.desc      titleXOf(screenWidth=310) returns 103.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_TitleXOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleXOf_0074 begin`);
      const actual: number = titleXOf(310);
      logInfo(`titleXOf(screenWidth=310): actual=${actual}`);
      expect(actual).assertClose(103.33333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleXOf_0074 end`);
    });
  });
}
