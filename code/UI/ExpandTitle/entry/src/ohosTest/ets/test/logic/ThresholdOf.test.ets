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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { thresholdOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for thresholdOf (96 cases). */
export default function thresholdOfTest(): void {
  describe('ThresholdOfTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0001
     * @tc.name      ExpandTitle_ThresholdOf_0001
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ThresholdOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ThresholdOf_0001 begin`);
      const actual: number = thresholdOf(0, 0);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ThresholdOf_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0002
     * @tc.name      ExpandTitle_ThresholdOf_0002
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ThresholdOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ThresholdOf_0002 begin`);
      const actual: number = thresholdOf(0, 1);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0003
     * @tc.name      ExpandTitle_ThresholdOf_0003
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0003 begin`);
      const actual: number = thresholdOf(0, 2);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ThresholdOf_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0004
     * @tc.name      ExpandTitle_ThresholdOf_0004
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=3) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0004 begin`);
      const actual: number = thresholdOf(0, 3);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0005
     * @tc.name      ExpandTitle_ThresholdOf_0005
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=100) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0005 begin`);
      const actual: number = thresholdOf(0, 100);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}ThresholdOf_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0006
     * @tc.name      ExpandTitle_ThresholdOf_0006
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=360) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0006 begin`);
      const actual: number = thresholdOf(0, 360);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}ThresholdOf_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0007
     * @tc.name      ExpandTitle_ThresholdOf_0007
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=720) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0007 begin`);
      const actual: number = thresholdOf(0, 720);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}ThresholdOf_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0008
     * @tc.name      ExpandTitle_ThresholdOf_0008
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1080) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0008 begin`);
      const actual: number = thresholdOf(0, 1080);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}ThresholdOf_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0009
     * @tc.name      ExpandTitle_ThresholdOf_0009
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1920) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0009 begin`);
      const actual: number = thresholdOf(0, 1920);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}ThresholdOf_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0010
     * @tc.name      ExpandTitle_ThresholdOf_0010
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=-1) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0010 begin`);
      const actual: number = thresholdOf(0, -1);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0011
     * @tc.name      ExpandTitle_ThresholdOf_0011
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0011 begin`);
      const actual: number = thresholdOf(0, 10);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ThresholdOf_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0012
     * @tc.name      ExpandTitle_ThresholdOf_0012
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=96) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0012 begin`);
      const actual: number = thresholdOf(0, 96);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}ThresholdOf_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0013
     * @tc.name      ExpandTitle_ThresholdOf_0013
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=192) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0013 begin`);
      const actual: number = thresholdOf(0, 192);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}ThresholdOf_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0014
     * @tc.name      ExpandTitle_ThresholdOf_0014
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=288) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0014 begin`);
      const actual: number = thresholdOf(0, 288);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}ThresholdOf_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0015
     * @tc.name      ExpandTitle_ThresholdOf_0015
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=384) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0015 begin`);
      const actual: number = thresholdOf(0, 384);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}ThresholdOf_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0016
     * @tc.name      ExpandTitle_ThresholdOf_0016
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=480) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0016 begin`);
      const actual: number = thresholdOf(0, 480);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}ThresholdOf_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0017
     * @tc.name      ExpandTitle_ThresholdOf_0017
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=576) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0017 begin`);
      const actual: number = thresholdOf(0, 576);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}ThresholdOf_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0018
     * @tc.name      ExpandTitle_ThresholdOf_0018
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=672) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0018 begin`);
      const actual: number = thresholdOf(0, 672);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}ThresholdOf_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0019
     * @tc.name      ExpandTitle_ThresholdOf_0019
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=768) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0019 begin`);
      const actual: number = thresholdOf(0, 768);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}ThresholdOf_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0020
     * @tc.name      ExpandTitle_ThresholdOf_0020
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=864) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0020 begin`);
      const actual: number = thresholdOf(0, 864);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}ThresholdOf_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0021
     * @tc.name      ExpandTitle_ThresholdOf_0021
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=960) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0021 begin`);
      const actual: number = thresholdOf(0, 960);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}ThresholdOf_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0022
     * @tc.name      ExpandTitle_ThresholdOf_0022
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1056) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0022 begin`);
      const actual: number = thresholdOf(0, 1056);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}ThresholdOf_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0023
     * @tc.name      ExpandTitle_ThresholdOf_0023
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1152) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0023 begin`);
      const actual: number = thresholdOf(0, 1152);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}ThresholdOf_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0024
     * @tc.name      ExpandTitle_ThresholdOf_0024
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1248) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0024 begin`);
      const actual: number = thresholdOf(0, 1248);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}ThresholdOf_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0025
     * @tc.name      ExpandTitle_ThresholdOf_0025
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1344) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0025 begin`);
      const actual: number = thresholdOf(0, 1344);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}ThresholdOf_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0026
     * @tc.name      ExpandTitle_ThresholdOf_0026
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1440) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0026 begin`);
      const actual: number = thresholdOf(0, 1440);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ThresholdOf_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0027
     * @tc.name      ExpandTitle_ThresholdOf_0027
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1536) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0027 begin`);
      const actual: number = thresholdOf(0, 1536);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}ThresholdOf_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0028
     * @tc.name      ExpandTitle_ThresholdOf_0028
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1632) returns 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0028 begin`);
      const actual: number = thresholdOf(0, 1632);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`${BUNDLE}ThresholdOf_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0029
     * @tc.name      ExpandTitle_ThresholdOf_0029
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1728) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0029 begin`);
      const actual: number = thresholdOf(0, 1728);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}ThresholdOf_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0030
     * @tc.name      ExpandTitle_ThresholdOf_0030
     * @tc.desc      thresholdOf(normalTitleHeight=0, expandTitleHeight=1824) returns 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0030 begin`);
      const actual: number = thresholdOf(0, 1824);
      logInfo(`thresholdOf(normalTitleHeight=0, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`${BUNDLE}ThresholdOf_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0031
     * @tc.name      ExpandTitle_ThresholdOf_0031
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0031 begin`);
      const actual: number = thresholdOf(1, 3);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ThresholdOf_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0032
     * @tc.name      ExpandTitle_ThresholdOf_0032
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=100) returns 50.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0032 begin`);
      const actual: number = thresholdOf(1, 100);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(50.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0033
     * @tc.name      ExpandTitle_ThresholdOf_0033
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=360) returns 180.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0033 begin`);
      const actual: number = thresholdOf(1, 360);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(180.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0034
     * @tc.name      ExpandTitle_ThresholdOf_0034
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=720) returns 360.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0034 begin`);
      const actual: number = thresholdOf(1, 720);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(360.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0035
     * @tc.name      ExpandTitle_ThresholdOf_0035
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1080) returns 540.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0035 begin`);
      const actual: number = thresholdOf(1, 1080);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(540.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0036
     * @tc.name      ExpandTitle_ThresholdOf_0036
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1920) returns 960.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0036 begin`);
      const actual: number = thresholdOf(1, 1920);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(960.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0037
     * @tc.name      ExpandTitle_ThresholdOf_0037
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=10) returns 5.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0037 begin`);
      const actual: number = thresholdOf(1, 10);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(5.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0038
     * @tc.name      ExpandTitle_ThresholdOf_0038
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=96) returns 48.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0038 begin`);
      const actual: number = thresholdOf(1, 96);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(48.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0039
     * @tc.name      ExpandTitle_ThresholdOf_0039
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=192) returns 96.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0039 begin`);
      const actual: number = thresholdOf(1, 192);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(96.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0040
     * @tc.name      ExpandTitle_ThresholdOf_0040
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=288) returns 144.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0040 begin`);
      const actual: number = thresholdOf(1, 288);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(144.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0041
     * @tc.name      ExpandTitle_ThresholdOf_0041
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=384) returns 192.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0041 begin`);
      const actual: number = thresholdOf(1, 384);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(192.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0042
     * @tc.name      ExpandTitle_ThresholdOf_0042
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=480) returns 240.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0042 begin`);
      const actual: number = thresholdOf(1, 480);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(240.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0043
     * @tc.name      ExpandTitle_ThresholdOf_0043
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=576) returns 288.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0043 begin`);
      const actual: number = thresholdOf(1, 576);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(288.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0044
     * @tc.name      ExpandTitle_ThresholdOf_0044
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=672) returns 336.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0044 begin`);
      const actual: number = thresholdOf(1, 672);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(336.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0045
     * @tc.name      ExpandTitle_ThresholdOf_0045
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=768) returns 384.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0045 begin`);
      const actual: number = thresholdOf(1, 768);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(384.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0046
     * @tc.name      ExpandTitle_ThresholdOf_0046
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=864) returns 432.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0046 begin`);
      const actual: number = thresholdOf(1, 864);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(432.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0047
     * @tc.name      ExpandTitle_ThresholdOf_0047
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=960) returns 480.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0047 begin`);
      const actual: number = thresholdOf(1, 960);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(480.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0048
     * @tc.name      ExpandTitle_ThresholdOf_0048
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1056) returns 528.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0048 begin`);
      const actual: number = thresholdOf(1, 1056);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(528.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0049
     * @tc.name      ExpandTitle_ThresholdOf_0049
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1152) returns 576.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0049 begin`);
      const actual: number = thresholdOf(1, 1152);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(576.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0050
     * @tc.name      ExpandTitle_ThresholdOf_0050
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1248) returns 624.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0050 begin`);
      const actual: number = thresholdOf(1, 1248);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(624.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0051
     * @tc.name      ExpandTitle_ThresholdOf_0051
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1344) returns 672.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0051 begin`);
      const actual: number = thresholdOf(1, 1344);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(672.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0052
     * @tc.name      ExpandTitle_ThresholdOf_0052
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1440) returns 720.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0052 begin`);
      const actual: number = thresholdOf(1, 1440);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(720.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0053
     * @tc.name      ExpandTitle_ThresholdOf_0053
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1536) returns 768.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0053 begin`);
      const actual: number = thresholdOf(1, 1536);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(768.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0054
     * @tc.name      ExpandTitle_ThresholdOf_0054
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1632) returns 816.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0054 begin`);
      const actual: number = thresholdOf(1, 1632);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(816.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0055
     * @tc.name      ExpandTitle_ThresholdOf_0055
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1728) returns 864.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0055 begin`);
      const actual: number = thresholdOf(1, 1728);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(864.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0056
     * @tc.name      ExpandTitle_ThresholdOf_0056
     * @tc.desc      thresholdOf(normalTitleHeight=1, expandTitleHeight=1824) returns 912.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0056 begin`);
      const actual: number = thresholdOf(1, 1824);
      logInfo(`thresholdOf(normalTitleHeight=1, expandTi...: actual=${actual}`);
      expect(actual).assertClose(912.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0057
     * @tc.name      ExpandTitle_ThresholdOf_0057
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=3) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0057 begin`);
      const actual: number = thresholdOf(2, 3);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0058
     * @tc.name      ExpandTitle_ThresholdOf_0058
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=100) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0058 begin`);
      const actual: number = thresholdOf(2, 100);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}ThresholdOf_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0059
     * @tc.name      ExpandTitle_ThresholdOf_0059
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=360) returns 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0059 begin`);
      const actual: number = thresholdOf(2, 360);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(181);
      logInfo(`${BUNDLE}ThresholdOf_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0060
     * @tc.name      ExpandTitle_ThresholdOf_0060
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=720) returns 361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0060 begin`);
      const actual: number = thresholdOf(2, 720);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}ThresholdOf_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0061
     * @tc.name      ExpandTitle_ThresholdOf_0061
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1080) returns 541
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0061 begin`);
      const actual: number = thresholdOf(2, 1080);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(541);
      logInfo(`${BUNDLE}ThresholdOf_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0062
     * @tc.name      ExpandTitle_ThresholdOf_0062
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1920) returns 961
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0062 begin`);
      const actual: number = thresholdOf(2, 1920);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(961);
      logInfo(`${BUNDLE}ThresholdOf_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0063
     * @tc.name      ExpandTitle_ThresholdOf_0063
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=10) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0063 begin`);
      const actual: number = thresholdOf(2, 10);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ThresholdOf_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0064
     * @tc.name      ExpandTitle_ThresholdOf_0064
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=96) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0064 begin`);
      const actual: number = thresholdOf(2, 96);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}ThresholdOf_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0065
     * @tc.name      ExpandTitle_ThresholdOf_0065
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=192) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0065 begin`);
      const actual: number = thresholdOf(2, 192);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}ThresholdOf_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0066
     * @tc.name      ExpandTitle_ThresholdOf_0066
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=288) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0066 begin`);
      const actual: number = thresholdOf(2, 288);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}ThresholdOf_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0067
     * @tc.name      ExpandTitle_ThresholdOf_0067
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=384) returns 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0067 begin`);
      const actual: number = thresholdOf(2, 384);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(193);
      logInfo(`${BUNDLE}ThresholdOf_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0068
     * @tc.name      ExpandTitle_ThresholdOf_0068
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=480) returns 241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0068 begin`);
      const actual: number = thresholdOf(2, 480);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(241);
      logInfo(`${BUNDLE}ThresholdOf_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0069
     * @tc.name      ExpandTitle_ThresholdOf_0069
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=576) returns 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0069 begin`);
      const actual: number = thresholdOf(2, 576);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(289);
      logInfo(`${BUNDLE}ThresholdOf_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0070
     * @tc.name      ExpandTitle_ThresholdOf_0070
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=672) returns 337
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0070 begin`);
      const actual: number = thresholdOf(2, 672);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(337);
      logInfo(`${BUNDLE}ThresholdOf_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0071
     * @tc.name      ExpandTitle_ThresholdOf_0071
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=768) returns 385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0071 begin`);
      const actual: number = thresholdOf(2, 768);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(385);
      logInfo(`${BUNDLE}ThresholdOf_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0072
     * @tc.name      ExpandTitle_ThresholdOf_0072
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=864) returns 433
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0072 begin`);
      const actual: number = thresholdOf(2, 864);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(433);
      logInfo(`${BUNDLE}ThresholdOf_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0073
     * @tc.name      ExpandTitle_ThresholdOf_0073
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=960) returns 481
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0073 begin`);
      const actual: number = thresholdOf(2, 960);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(481);
      logInfo(`${BUNDLE}ThresholdOf_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0074
     * @tc.name      ExpandTitle_ThresholdOf_0074
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1056) returns 529
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0074 begin`);
      const actual: number = thresholdOf(2, 1056);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(529);
      logInfo(`${BUNDLE}ThresholdOf_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0075
     * @tc.name      ExpandTitle_ThresholdOf_0075
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1152) returns 577
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0075 begin`);
      const actual: number = thresholdOf(2, 1152);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(577);
      logInfo(`${BUNDLE}ThresholdOf_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0076
     * @tc.name      ExpandTitle_ThresholdOf_0076
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1248) returns 625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0076 begin`);
      const actual: number = thresholdOf(2, 1248);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(625);
      logInfo(`${BUNDLE}ThresholdOf_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0077
     * @tc.name      ExpandTitle_ThresholdOf_0077
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1344) returns 673
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0077 begin`);
      const actual: number = thresholdOf(2, 1344);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(673);
      logInfo(`${BUNDLE}ThresholdOf_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0078
     * @tc.name      ExpandTitle_ThresholdOf_0078
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1440) returns 721
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0078 begin`);
      const actual: number = thresholdOf(2, 1440);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(721);
      logInfo(`${BUNDLE}ThresholdOf_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0079
     * @tc.name      ExpandTitle_ThresholdOf_0079
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1536) returns 769
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0079 begin`);
      const actual: number = thresholdOf(2, 1536);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(769);
      logInfo(`${BUNDLE}ThresholdOf_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0080
     * @tc.name      ExpandTitle_ThresholdOf_0080
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1632) returns 817
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0080 begin`);
      const actual: number = thresholdOf(2, 1632);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(817);
      logInfo(`${BUNDLE}ThresholdOf_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0081
     * @tc.name      ExpandTitle_ThresholdOf_0081
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1728) returns 865
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0081 begin`);
      const actual: number = thresholdOf(2, 1728);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(865);
      logInfo(`${BUNDLE}ThresholdOf_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0082
     * @tc.name      ExpandTitle_ThresholdOf_0082
     * @tc.desc      thresholdOf(normalTitleHeight=2, expandTitleHeight=1824) returns 913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0082 begin`);
      const actual: number = thresholdOf(2, 1824);
      logInfo(`thresholdOf(normalTitleHeight=2, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(913);
      logInfo(`${BUNDLE}ThresholdOf_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0083
     * @tc.name      ExpandTitle_ThresholdOf_0083
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0083 begin`);
      const actual: number = thresholdOf(3, 3);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ThresholdOf_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0084
     * @tc.name      ExpandTitle_ThresholdOf_0084
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=100) returns 51.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0084 begin`);
      const actual: number = thresholdOf(3, 100);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(51.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0085
     * @tc.name      ExpandTitle_ThresholdOf_0085
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=360) returns 181.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0085 begin`);
      const actual: number = thresholdOf(3, 360);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(181.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0086
     * @tc.name      ExpandTitle_ThresholdOf_0086
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=720) returns 361.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0086 begin`);
      const actual: number = thresholdOf(3, 720);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(361.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0087
     * @tc.name      ExpandTitle_ThresholdOf_0087
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1080) returns 541.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0087 begin`);
      const actual: number = thresholdOf(3, 1080);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(541.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0088
     * @tc.name      ExpandTitle_ThresholdOf_0088
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1920) returns 961.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0088 begin`);
      const actual: number = thresholdOf(3, 1920);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(961.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0089
     * @tc.name      ExpandTitle_ThresholdOf_0089
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=10) returns 6.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0089 begin`);
      const actual: number = thresholdOf(3, 10);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(6.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0090
     * @tc.name      ExpandTitle_ThresholdOf_0090
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=96) returns 49.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0090 begin`);
      const actual: number = thresholdOf(3, 96);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(49.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0091
     * @tc.name      ExpandTitle_ThresholdOf_0091
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=192) returns 97.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0091 begin`);
      const actual: number = thresholdOf(3, 192);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(97.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0092
     * @tc.name      ExpandTitle_ThresholdOf_0092
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=288) returns 145.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0092 begin`);
      const actual: number = thresholdOf(3, 288);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(145.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0093
     * @tc.name      ExpandTitle_ThresholdOf_0093
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=384) returns 193.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0093 begin`);
      const actual: number = thresholdOf(3, 384);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(193.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0094
     * @tc.name      ExpandTitle_ThresholdOf_0094
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=480) returns 241.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0094 begin`);
      const actual: number = thresholdOf(3, 480);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(241.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0095
     * @tc.name      ExpandTitle_ThresholdOf_0095
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=576) returns 289.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0095 begin`);
      const actual: number = thresholdOf(3, 576);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(289.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0096
     * @tc.name      ExpandTitle_ThresholdOf_0096
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=672) returns 337.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0096 begin`);
      const actual: number = thresholdOf(3, 672);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(337.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0096 end`);
    });
  });
}
