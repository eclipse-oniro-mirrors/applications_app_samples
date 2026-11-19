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
export default function thresholdOf2Test(): void {
  describe('ThresholdOf2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0097
     * @tc.name      ExpandTitle_ThresholdOf_0097
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=768) returns 385.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0097 begin`);
      const actual: number = thresholdOf(3, 768);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(385.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0098
     * @tc.name      ExpandTitle_ThresholdOf_0098
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=864) returns 433.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0098 begin`);
      const actual: number = thresholdOf(3, 864);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(433.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0099
     * @tc.name      ExpandTitle_ThresholdOf_0099
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=960) returns 481.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0099 begin`);
      const actual: number = thresholdOf(3, 960);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(481.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0100
     * @tc.name      ExpandTitle_ThresholdOf_0100
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1056) returns 529.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0100 begin`);
      const actual: number = thresholdOf(3, 1056);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(529.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0101
     * @tc.name      ExpandTitle_ThresholdOf_0101
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1152) returns 577.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0101 begin`);
      const actual: number = thresholdOf(3, 1152);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(577.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0102
     * @tc.name      ExpandTitle_ThresholdOf_0102
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1248) returns 625.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0102 begin`);
      const actual: number = thresholdOf(3, 1248);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(625.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0103
     * @tc.name      ExpandTitle_ThresholdOf_0103
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1344) returns 673.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0103 begin`);
      const actual: number = thresholdOf(3, 1344);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(673.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0104
     * @tc.name      ExpandTitle_ThresholdOf_0104
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1440) returns 721.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0104 begin`);
      const actual: number = thresholdOf(3, 1440);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(721.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0105
     * @tc.name      ExpandTitle_ThresholdOf_0105
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1536) returns 769.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0105 begin`);
      const actual: number = thresholdOf(3, 1536);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(769.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0106
     * @tc.name      ExpandTitle_ThresholdOf_0106
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1632) returns 817.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0106 begin`);
      const actual: number = thresholdOf(3, 1632);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(817.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0107
     * @tc.name      ExpandTitle_ThresholdOf_0107
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1728) returns 865.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0107 begin`);
      const actual: number = thresholdOf(3, 1728);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(865.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0108
     * @tc.name      ExpandTitle_ThresholdOf_0108
     * @tc.desc      thresholdOf(normalTitleHeight=3, expandTitleHeight=1824) returns 913.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ThresholdOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ThresholdOf_0108 begin`);
      const actual: number = thresholdOf(3, 1824);
      logInfo(`thresholdOf(normalTitleHeight=3, expandTi...: actual=${actual}`);
      expect(actual).assertClose(913.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0109
     * @tc.name      ExpandTitle_ThresholdOf_0109
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0109 begin`);
      const actual: number = thresholdOf(100, 100);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ThresholdOf_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0110
     * @tc.name      ExpandTitle_ThresholdOf_0110
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=360) returns 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0110 begin`);
      const actual: number = thresholdOf(100, 360);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(230);
      logInfo(`${BUNDLE}ThresholdOf_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0111
     * @tc.name      ExpandTitle_ThresholdOf_0111
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=720) returns 410
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0111 begin`);
      const actual: number = thresholdOf(100, 720);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(410);
      logInfo(`${BUNDLE}ThresholdOf_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0112
     * @tc.name      ExpandTitle_ThresholdOf_0112
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1080) returns 590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0112 begin`);
      const actual: number = thresholdOf(100, 1080);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(590);
      logInfo(`${BUNDLE}ThresholdOf_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0113
     * @tc.name      ExpandTitle_ThresholdOf_0113
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1920) returns 1010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0113 begin`);
      const actual: number = thresholdOf(100, 1920);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(1010);
      logInfo(`${BUNDLE}ThresholdOf_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0114
     * @tc.name      ExpandTitle_ThresholdOf_0114
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=10) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0114 begin`);
      const actual: number = thresholdOf(100, 10);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}ThresholdOf_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0115
     * @tc.name      ExpandTitle_ThresholdOf_0115
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=96) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0115 begin`);
      const actual: number = thresholdOf(100, 96);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}ThresholdOf_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0116
     * @tc.name      ExpandTitle_ThresholdOf_0116
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=192) returns 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0116 begin`);
      const actual: number = thresholdOf(100, 192);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(146);
      logInfo(`${BUNDLE}ThresholdOf_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0117
     * @tc.name      ExpandTitle_ThresholdOf_0117
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=288) returns 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0117 begin`);
      const actual: number = thresholdOf(100, 288);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(194);
      logInfo(`${BUNDLE}ThresholdOf_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0118
     * @tc.name      ExpandTitle_ThresholdOf_0118
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=384) returns 242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0118 begin`);
      const actual: number = thresholdOf(100, 384);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(242);
      logInfo(`${BUNDLE}ThresholdOf_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0119
     * @tc.name      ExpandTitle_ThresholdOf_0119
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=480) returns 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0119 begin`);
      const actual: number = thresholdOf(100, 480);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(290);
      logInfo(`${BUNDLE}ThresholdOf_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0120
     * @tc.name      ExpandTitle_ThresholdOf_0120
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=576) returns 338
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0120 begin`);
      const actual: number = thresholdOf(100, 576);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(338);
      logInfo(`${BUNDLE}ThresholdOf_0120 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0121
     * @tc.name      ExpandTitle_ThresholdOf_0121
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=672) returns 386
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0121 begin`);
      const actual: number = thresholdOf(100, 672);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(386);
      logInfo(`${BUNDLE}ThresholdOf_0121 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0122
     * @tc.name      ExpandTitle_ThresholdOf_0122
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=768) returns 434
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0122 begin`);
      const actual: number = thresholdOf(100, 768);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(434);
      logInfo(`${BUNDLE}ThresholdOf_0122 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0123
     * @tc.name      ExpandTitle_ThresholdOf_0123
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=864) returns 482
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0123 begin`);
      const actual: number = thresholdOf(100, 864);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(482);
      logInfo(`${BUNDLE}ThresholdOf_0123 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0124
     * @tc.name      ExpandTitle_ThresholdOf_0124
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=960) returns 530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0124 begin`);
      const actual: number = thresholdOf(100, 960);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(530);
      logInfo(`${BUNDLE}ThresholdOf_0124 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0125
     * @tc.name      ExpandTitle_ThresholdOf_0125
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1056) returns 578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0125 begin`);
      const actual: number = thresholdOf(100, 1056);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(578);
      logInfo(`${BUNDLE}ThresholdOf_0125 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0126
     * @tc.name      ExpandTitle_ThresholdOf_0126
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1152) returns 626
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0126 begin`);
      const actual: number = thresholdOf(100, 1152);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(626);
      logInfo(`${BUNDLE}ThresholdOf_0126 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0127
     * @tc.name      ExpandTitle_ThresholdOf_0127
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1248) returns 674
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0127 begin`);
      const actual: number = thresholdOf(100, 1248);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(674);
      logInfo(`${BUNDLE}ThresholdOf_0127 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0128
     * @tc.name      ExpandTitle_ThresholdOf_0128
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1344) returns 722
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0128 begin`);
      const actual: number = thresholdOf(100, 1344);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(722);
      logInfo(`${BUNDLE}ThresholdOf_0128 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0129
     * @tc.name      ExpandTitle_ThresholdOf_0129
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1440) returns 770
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0129 begin`);
      const actual: number = thresholdOf(100, 1440);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(770);
      logInfo(`${BUNDLE}ThresholdOf_0129 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0130
     * @tc.name      ExpandTitle_ThresholdOf_0130
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1536) returns 818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0130 begin`);
      const actual: number = thresholdOf(100, 1536);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(818);
      logInfo(`${BUNDLE}ThresholdOf_0130 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0131
     * @tc.name      ExpandTitle_ThresholdOf_0131
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1632) returns 866
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0131 begin`);
      const actual: number = thresholdOf(100, 1632);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(866);
      logInfo(`${BUNDLE}ThresholdOf_0131 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0132
     * @tc.name      ExpandTitle_ThresholdOf_0132
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1728) returns 914
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0132 begin`);
      const actual: number = thresholdOf(100, 1728);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(914);
      logInfo(`${BUNDLE}ThresholdOf_0132 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0133
     * @tc.name      ExpandTitle_ThresholdOf_0133
     * @tc.desc      thresholdOf(normalTitleHeight=100, expandTitleHeight=1824) returns 962
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0133 begin`);
      const actual: number = thresholdOf(100, 1824);
      logInfo(`thresholdOf(normalTitleHeight=100, expand...: actual=${actual}`);
      expect(actual).assertEqual(962);
      logInfo(`${BUNDLE}ThresholdOf_0133 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0134
     * @tc.name      ExpandTitle_ThresholdOf_0134
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1920) returns 1140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0134 begin`);
      const actual: number = thresholdOf(360, 1920);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(1140);
      logInfo(`${BUNDLE}ThresholdOf_0134 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0135
     * @tc.name      ExpandTitle_ThresholdOf_0135
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=-1) returns 179.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0135 begin`);
      const actual: number = thresholdOf(360, -1);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertClose(179.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0135 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0136
     * @tc.name      ExpandTitle_ThresholdOf_0136
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=10) returns 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0136 begin`);
      const actual: number = thresholdOf(360, 10);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(185);
      logInfo(`${BUNDLE}ThresholdOf_0136 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0137
     * @tc.name      ExpandTitle_ThresholdOf_0137
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=96) returns 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0137 begin`);
      const actual: number = thresholdOf(360, 96);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(228);
      logInfo(`${BUNDLE}ThresholdOf_0137 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0138
     * @tc.name      ExpandTitle_ThresholdOf_0138
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=192) returns 276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0138 begin`);
      const actual: number = thresholdOf(360, 192);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(276);
      logInfo(`${BUNDLE}ThresholdOf_0138 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0139
     * @tc.name      ExpandTitle_ThresholdOf_0139
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=288) returns 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0139 begin`);
      const actual: number = thresholdOf(360, 288);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(324);
      logInfo(`${BUNDLE}ThresholdOf_0139 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0140
     * @tc.name      ExpandTitle_ThresholdOf_0140
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=384) returns 372
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0140 begin`);
      const actual: number = thresholdOf(360, 384);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(372);
      logInfo(`${BUNDLE}ThresholdOf_0140 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0141
     * @tc.name      ExpandTitle_ThresholdOf_0141
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=480) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0141 begin`);
      const actual: number = thresholdOf(360, 480);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}ThresholdOf_0141 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0142
     * @tc.name      ExpandTitle_ThresholdOf_0142
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=576) returns 468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0142 begin`);
      const actual: number = thresholdOf(360, 576);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(468);
      logInfo(`${BUNDLE}ThresholdOf_0142 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0143
     * @tc.name      ExpandTitle_ThresholdOf_0143
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=672) returns 516
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0143 begin`);
      const actual: number = thresholdOf(360, 672);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(516);
      logInfo(`${BUNDLE}ThresholdOf_0143 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0144
     * @tc.name      ExpandTitle_ThresholdOf_0144
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=768) returns 564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0144 begin`);
      const actual: number = thresholdOf(360, 768);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(564);
      logInfo(`${BUNDLE}ThresholdOf_0144 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0145
     * @tc.name      ExpandTitle_ThresholdOf_0145
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=864) returns 612
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0145 begin`);
      const actual: number = thresholdOf(360, 864);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(612);
      logInfo(`${BUNDLE}ThresholdOf_0145 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0146
     * @tc.name      ExpandTitle_ThresholdOf_0146
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=960) returns 660
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0146 begin`);
      const actual: number = thresholdOf(360, 960);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(660);
      logInfo(`${BUNDLE}ThresholdOf_0146 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0147
     * @tc.name      ExpandTitle_ThresholdOf_0147
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1056) returns 708
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0147 begin`);
      const actual: number = thresholdOf(360, 1056);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(708);
      logInfo(`${BUNDLE}ThresholdOf_0147 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0148
     * @tc.name      ExpandTitle_ThresholdOf_0148
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1152) returns 756
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0148 begin`);
      const actual: number = thresholdOf(360, 1152);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(756);
      logInfo(`${BUNDLE}ThresholdOf_0148 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0149
     * @tc.name      ExpandTitle_ThresholdOf_0149
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1248) returns 804
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0149 begin`);
      const actual: number = thresholdOf(360, 1248);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(804);
      logInfo(`${BUNDLE}ThresholdOf_0149 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0150
     * @tc.name      ExpandTitle_ThresholdOf_0150
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1344) returns 852
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0150 begin`);
      const actual: number = thresholdOf(360, 1344);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(852);
      logInfo(`${BUNDLE}ThresholdOf_0150 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0151
     * @tc.name      ExpandTitle_ThresholdOf_0151
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1440) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0151 begin`);
      const actual: number = thresholdOf(360, 1440);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}ThresholdOf_0151 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0152
     * @tc.name      ExpandTitle_ThresholdOf_0152
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1536) returns 948
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0152 begin`);
      const actual: number = thresholdOf(360, 1536);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(948);
      logInfo(`${BUNDLE}ThresholdOf_0152 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0153
     * @tc.name      ExpandTitle_ThresholdOf_0153
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1632) returns 996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0153 begin`);
      const actual: number = thresholdOf(360, 1632);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(996);
      logInfo(`${BUNDLE}ThresholdOf_0153 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0154
     * @tc.name      ExpandTitle_ThresholdOf_0154
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1728) returns 1044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0154 begin`);
      const actual: number = thresholdOf(360, 1728);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(1044);
      logInfo(`${BUNDLE}ThresholdOf_0154 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0155
     * @tc.name      ExpandTitle_ThresholdOf_0155
     * @tc.desc      thresholdOf(normalTitleHeight=360, expandTitleHeight=1824) returns 1092
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0155 begin`);
      const actual: number = thresholdOf(360, 1824);
      logInfo(`thresholdOf(normalTitleHeight=360, expand...: actual=${actual}`);
      expect(actual).assertEqual(1092);
      logInfo(`${BUNDLE}ThresholdOf_0155 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0156
     * @tc.name      ExpandTitle_ThresholdOf_0156
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1920) returns 1320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0156 begin`);
      const actual: number = thresholdOf(720, 1920);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(1320);
      logInfo(`${BUNDLE}ThresholdOf_0156 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0157
     * @tc.name      ExpandTitle_ThresholdOf_0157
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=-1) returns 359.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0157 begin`);
      const actual: number = thresholdOf(720, -1);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertClose(359.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0157 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0158
     * @tc.name      ExpandTitle_ThresholdOf_0158
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=10) returns 365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0158 begin`);
      const actual: number = thresholdOf(720, 10);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(365);
      logInfo(`${BUNDLE}ThresholdOf_0158 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0159
     * @tc.name      ExpandTitle_ThresholdOf_0159
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=96) returns 408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0159 begin`);
      const actual: number = thresholdOf(720, 96);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(408);
      logInfo(`${BUNDLE}ThresholdOf_0159 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0160
     * @tc.name      ExpandTitle_ThresholdOf_0160
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=192) returns 456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0160 begin`);
      const actual: number = thresholdOf(720, 192);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(456);
      logInfo(`${BUNDLE}ThresholdOf_0160 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0161
     * @tc.name      ExpandTitle_ThresholdOf_0161
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=288) returns 504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0161 begin`);
      const actual: number = thresholdOf(720, 288);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(504);
      logInfo(`${BUNDLE}ThresholdOf_0161 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0162
     * @tc.name      ExpandTitle_ThresholdOf_0162
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=384) returns 552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0162 begin`);
      const actual: number = thresholdOf(720, 384);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(552);
      logInfo(`${BUNDLE}ThresholdOf_0162 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0163
     * @tc.name      ExpandTitle_ThresholdOf_0163
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=480) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0163 begin`);
      const actual: number = thresholdOf(720, 480);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}ThresholdOf_0163 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0164
     * @tc.name      ExpandTitle_ThresholdOf_0164
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=576) returns 648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0164 begin`);
      const actual: number = thresholdOf(720, 576);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(648);
      logInfo(`${BUNDLE}ThresholdOf_0164 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0165
     * @tc.name      ExpandTitle_ThresholdOf_0165
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=672) returns 696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0165 begin`);
      const actual: number = thresholdOf(720, 672);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(696);
      logInfo(`${BUNDLE}ThresholdOf_0165 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0166
     * @tc.name      ExpandTitle_ThresholdOf_0166
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=768) returns 744
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0166 begin`);
      const actual: number = thresholdOf(720, 768);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(744);
      logInfo(`${BUNDLE}ThresholdOf_0166 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0167
     * @tc.name      ExpandTitle_ThresholdOf_0167
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=864) returns 792
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0167 begin`);
      const actual: number = thresholdOf(720, 864);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(792);
      logInfo(`${BUNDLE}ThresholdOf_0167 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0168
     * @tc.name      ExpandTitle_ThresholdOf_0168
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=960) returns 840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0168 begin`);
      const actual: number = thresholdOf(720, 960);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}ThresholdOf_0168 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0169
     * @tc.name      ExpandTitle_ThresholdOf_0169
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1056) returns 888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0169 begin`);
      const actual: number = thresholdOf(720, 1056);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(888);
      logInfo(`${BUNDLE}ThresholdOf_0169 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0170
     * @tc.name      ExpandTitle_ThresholdOf_0170
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1152) returns 936
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0170 begin`);
      const actual: number = thresholdOf(720, 1152);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(936);
      logInfo(`${BUNDLE}ThresholdOf_0170 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0171
     * @tc.name      ExpandTitle_ThresholdOf_0171
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1248) returns 984
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0171 begin`);
      const actual: number = thresholdOf(720, 1248);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(984);
      logInfo(`${BUNDLE}ThresholdOf_0171 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0172
     * @tc.name      ExpandTitle_ThresholdOf_0172
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1344) returns 1032
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0172 begin`);
      const actual: number = thresholdOf(720, 1344);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(1032);
      logInfo(`${BUNDLE}ThresholdOf_0172 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0173
     * @tc.name      ExpandTitle_ThresholdOf_0173
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1440) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0173 begin`);
      const actual: number = thresholdOf(720, 1440);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}ThresholdOf_0173 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0174
     * @tc.name      ExpandTitle_ThresholdOf_0174
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1536) returns 1128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0174 begin`);
      const actual: number = thresholdOf(720, 1536);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(1128);
      logInfo(`${BUNDLE}ThresholdOf_0174 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0175
     * @tc.name      ExpandTitle_ThresholdOf_0175
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1632) returns 1176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0175 begin`);
      const actual: number = thresholdOf(720, 1632);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(1176);
      logInfo(`${BUNDLE}ThresholdOf_0175 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0176
     * @tc.name      ExpandTitle_ThresholdOf_0176
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1728) returns 1224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0176 begin`);
      const actual: number = thresholdOf(720, 1728);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(1224);
      logInfo(`${BUNDLE}ThresholdOf_0176 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0177
     * @tc.name      ExpandTitle_ThresholdOf_0177
     * @tc.desc      thresholdOf(normalTitleHeight=720, expandTitleHeight=1824) returns 1272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0177 begin`);
      const actual: number = thresholdOf(720, 1824);
      logInfo(`thresholdOf(normalTitleHeight=720, expand...: actual=${actual}`);
      expect(actual).assertEqual(1272);
      logInfo(`${BUNDLE}ThresholdOf_0177 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0178
     * @tc.name      ExpandTitle_ThresholdOf_0178
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1920) returns 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0178 begin`);
      const actual: number = thresholdOf(1080, 1920);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}ThresholdOf_0178 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0179
     * @tc.name      ExpandTitle_ThresholdOf_0179
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=-1) returns 539.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0179 begin`);
      const actual: number = thresholdOf(1080, -1);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertClose(539.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0179 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0180
     * @tc.name      ExpandTitle_ThresholdOf_0180
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=10) returns 545
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0180 begin`);
      const actual: number = thresholdOf(1080, 10);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(545);
      logInfo(`${BUNDLE}ThresholdOf_0180 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0181
     * @tc.name      ExpandTitle_ThresholdOf_0181
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=96) returns 588
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0181 begin`);
      const actual: number = thresholdOf(1080, 96);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(588);
      logInfo(`${BUNDLE}ThresholdOf_0181 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0182
     * @tc.name      ExpandTitle_ThresholdOf_0182
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=192) returns 636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0182 begin`);
      const actual: number = thresholdOf(1080, 192);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(636);
      logInfo(`${BUNDLE}ThresholdOf_0182 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0183
     * @tc.name      ExpandTitle_ThresholdOf_0183
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=288) returns 684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0183 begin`);
      const actual: number = thresholdOf(1080, 288);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(684);
      logInfo(`${BUNDLE}ThresholdOf_0183 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0184
     * @tc.name      ExpandTitle_ThresholdOf_0184
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=384) returns 732
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0184 begin`);
      const actual: number = thresholdOf(1080, 384);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(732);
      logInfo(`${BUNDLE}ThresholdOf_0184 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0185
     * @tc.name      ExpandTitle_ThresholdOf_0185
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=480) returns 780
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0185 begin`);
      const actual: number = thresholdOf(1080, 480);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(780);
      logInfo(`${BUNDLE}ThresholdOf_0185 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0186
     * @tc.name      ExpandTitle_ThresholdOf_0186
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=576) returns 828
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0186 begin`);
      const actual: number = thresholdOf(1080, 576);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(828);
      logInfo(`${BUNDLE}ThresholdOf_0186 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0187
     * @tc.name      ExpandTitle_ThresholdOf_0187
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=672) returns 876
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0187 begin`);
      const actual: number = thresholdOf(1080, 672);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(876);
      logInfo(`${BUNDLE}ThresholdOf_0187 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0188
     * @tc.name      ExpandTitle_ThresholdOf_0188
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=768) returns 924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0188 begin`);
      const actual: number = thresholdOf(1080, 768);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(924);
      logInfo(`${BUNDLE}ThresholdOf_0188 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0189
     * @tc.name      ExpandTitle_ThresholdOf_0189
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=864) returns 972
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0189 begin`);
      const actual: number = thresholdOf(1080, 864);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(972);
      logInfo(`${BUNDLE}ThresholdOf_0189 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0190
     * @tc.name      ExpandTitle_ThresholdOf_0190
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=960) returns 1020
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0190 begin`);
      const actual: number = thresholdOf(1080, 960);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1020);
      logInfo(`${BUNDLE}ThresholdOf_0190 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0191
     * @tc.name      ExpandTitle_ThresholdOf_0191
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1056) returns 1068
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0191 begin`);
      const actual: number = thresholdOf(1080, 1056);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1068);
      logInfo(`${BUNDLE}ThresholdOf_0191 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0192
     * @tc.name      ExpandTitle_ThresholdOf_0192
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1152) returns 1116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0192 begin`);
      const actual: number = thresholdOf(1080, 1152);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1116);
      logInfo(`${BUNDLE}ThresholdOf_0192 end`);
    });
  });
}
