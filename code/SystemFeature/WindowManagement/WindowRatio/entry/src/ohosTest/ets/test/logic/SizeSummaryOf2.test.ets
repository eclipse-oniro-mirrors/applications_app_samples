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
import { sizeSummaryOf } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sizeSummaryOf (96 cases). */
export default function sizeSummaryOf2Test(): void {
  describe('SizeSummaryOf2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0097
     * @tc.name      WindowRatio_SizeSummaryOf_0097
     * @tc.desc      sizeSummaryOf(width=360, height=1920) returns "360 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0097 begin`);
      const actual: string = sizeSummaryOf(360, 1920);
      logInfo(`sizeSummaryOf(width=360, height=1920): actual=${actual}`);
      expect(actual).assertEqual('360 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0098
     * @tc.name      WindowRatio_SizeSummaryOf_0098
     * @tc.desc      sizeSummaryOf(width=360, height=-1) returns "360 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0098 begin`);
      const actual: string = sizeSummaryOf(360, -1);
      logInfo(`sizeSummaryOf(width=360, height=-1): actual=${actual}`);
      expect(actual).assertEqual('360 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0099
     * @tc.name      WindowRatio_SizeSummaryOf_0099
     * @tc.desc      sizeSummaryOf(width=360, height=2) returns "360 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0099 begin`);
      const actual: string = sizeSummaryOf(360, 2);
      logInfo(`sizeSummaryOf(width=360, height=2): actual=${actual}`);
      expect(actual).assertEqual('360 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0100
     * @tc.name      WindowRatio_SizeSummaryOf_0100
     * @tc.desc      sizeSummaryOf(width=360, height=3) returns "360 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0100 begin`);
      const actual: string = sizeSummaryOf(360, 3);
      logInfo(`sizeSummaryOf(width=360, height=3): actual=${actual}`);
      expect(actual).assertEqual('360 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0101
     * @tc.name      WindowRatio_SizeSummaryOf_0101
     * @tc.desc      sizeSummaryOf(width=360, height=10) returns "360 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0101 begin`);
      const actual: string = sizeSummaryOf(360, 10);
      logInfo(`sizeSummaryOf(width=360, height=10): actual=${actual}`);
      expect(actual).assertEqual('360 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0102
     * @tc.name      WindowRatio_SizeSummaryOf_0102
     * @tc.desc      sizeSummaryOf(width=360, height=96) returns "360 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0102 begin`);
      const actual: string = sizeSummaryOf(360, 96);
      logInfo(`sizeSummaryOf(width=360, height=96): actual=${actual}`);
      expect(actual).assertEqual('360 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0103
     * @tc.name      WindowRatio_SizeSummaryOf_0103
     * @tc.desc      sizeSummaryOf(width=360, height=192) returns "360 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0103 begin`);
      const actual: string = sizeSummaryOf(360, 192);
      logInfo(`sizeSummaryOf(width=360, height=192): actual=${actual}`);
      expect(actual).assertEqual('360 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0104
     * @tc.name      WindowRatio_SizeSummaryOf_0104
     * @tc.desc      sizeSummaryOf(width=360, height=288) returns "360 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0104 begin`);
      const actual: string = sizeSummaryOf(360, 288);
      logInfo(`sizeSummaryOf(width=360, height=288): actual=${actual}`);
      expect(actual).assertEqual('360 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0105
     * @tc.name      WindowRatio_SizeSummaryOf_0105
     * @tc.desc      sizeSummaryOf(width=360, height=384) returns "360 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0105 begin`);
      const actual: string = sizeSummaryOf(360, 384);
      logInfo(`sizeSummaryOf(width=360, height=384): actual=${actual}`);
      expect(actual).assertEqual('360 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0106
     * @tc.name      WindowRatio_SizeSummaryOf_0106
     * @tc.desc      sizeSummaryOf(width=360, height=480) returns "360 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0106 begin`);
      const actual: string = sizeSummaryOf(360, 480);
      logInfo(`sizeSummaryOf(width=360, height=480): actual=${actual}`);
      expect(actual).assertEqual('360 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0107
     * @tc.name      WindowRatio_SizeSummaryOf_0107
     * @tc.desc      sizeSummaryOf(width=360, height=576) returns "360 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0107 begin`);
      const actual: string = sizeSummaryOf(360, 576);
      logInfo(`sizeSummaryOf(width=360, height=576): actual=${actual}`);
      expect(actual).assertEqual('360 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0108
     * @tc.name      WindowRatio_SizeSummaryOf_0108
     * @tc.desc      sizeSummaryOf(width=360, height=672) returns "360 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0108 begin`);
      const actual: string = sizeSummaryOf(360, 672);
      logInfo(`sizeSummaryOf(width=360, height=672): actual=${actual}`);
      expect(actual).assertEqual('360 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0109
     * @tc.name      WindowRatio_SizeSummaryOf_0109
     * @tc.desc      sizeSummaryOf(width=360, height=768) returns "360 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0109 begin`);
      const actual: string = sizeSummaryOf(360, 768);
      logInfo(`sizeSummaryOf(width=360, height=768): actual=${actual}`);
      expect(actual).assertEqual('360 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0110
     * @tc.name      WindowRatio_SizeSummaryOf_0110
     * @tc.desc      sizeSummaryOf(width=360, height=864) returns "360 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0110 begin`);
      const actual: string = sizeSummaryOf(360, 864);
      logInfo(`sizeSummaryOf(width=360, height=864): actual=${actual}`);
      expect(actual).assertEqual('360 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0111
     * @tc.name      WindowRatio_SizeSummaryOf_0111
     * @tc.desc      sizeSummaryOf(width=360, height=960) returns "360 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0111 begin`);
      const actual: string = sizeSummaryOf(360, 960);
      logInfo(`sizeSummaryOf(width=360, height=960): actual=${actual}`);
      expect(actual).assertEqual('360 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0112
     * @tc.name      WindowRatio_SizeSummaryOf_0112
     * @tc.desc      sizeSummaryOf(width=360, height=1056) returns "360 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0112 begin`);
      const actual: string = sizeSummaryOf(360, 1056);
      logInfo(`sizeSummaryOf(width=360, height=1056): actual=${actual}`);
      expect(actual).assertEqual('360 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0113
     * @tc.name      WindowRatio_SizeSummaryOf_0113
     * @tc.desc      sizeSummaryOf(width=360, height=1152) returns "360 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0113 begin`);
      const actual: string = sizeSummaryOf(360, 1152);
      logInfo(`sizeSummaryOf(width=360, height=1152): actual=${actual}`);
      expect(actual).assertEqual('360 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0114
     * @tc.name      WindowRatio_SizeSummaryOf_0114
     * @tc.desc      sizeSummaryOf(width=360, height=1248) returns "360 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0114 begin`);
      const actual: string = sizeSummaryOf(360, 1248);
      logInfo(`sizeSummaryOf(width=360, height=1248): actual=${actual}`);
      expect(actual).assertEqual('360 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0115
     * @tc.name      WindowRatio_SizeSummaryOf_0115
     * @tc.desc      sizeSummaryOf(width=360, height=1344) returns "360 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0115 begin`);
      const actual: string = sizeSummaryOf(360, 1344);
      logInfo(`sizeSummaryOf(width=360, height=1344): actual=${actual}`);
      expect(actual).assertEqual('360 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0116
     * @tc.name      WindowRatio_SizeSummaryOf_0116
     * @tc.desc      sizeSummaryOf(width=360, height=1440) returns "360 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0116 begin`);
      const actual: string = sizeSummaryOf(360, 1440);
      logInfo(`sizeSummaryOf(width=360, height=1440): actual=${actual}`);
      expect(actual).assertEqual('360 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0117
     * @tc.name      WindowRatio_SizeSummaryOf_0117
     * @tc.desc      sizeSummaryOf(width=360, height=1536) returns "360 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0117 begin`);
      const actual: string = sizeSummaryOf(360, 1536);
      logInfo(`sizeSummaryOf(width=360, height=1536): actual=${actual}`);
      expect(actual).assertEqual('360 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0118
     * @tc.name      WindowRatio_SizeSummaryOf_0118
     * @tc.desc      sizeSummaryOf(width=360, height=1632) returns "360 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0118 begin`);
      const actual: string = sizeSummaryOf(360, 1632);
      logInfo(`sizeSummaryOf(width=360, height=1632): actual=${actual}`);
      expect(actual).assertEqual('360 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0119
     * @tc.name      WindowRatio_SizeSummaryOf_0119
     * @tc.desc      sizeSummaryOf(width=360, height=1728) returns "360 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0119 begin`);
      const actual: string = sizeSummaryOf(360, 1728);
      logInfo(`sizeSummaryOf(width=360, height=1728): actual=${actual}`);
      expect(actual).assertEqual('360 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0120
     * @tc.name      WindowRatio_SizeSummaryOf_0120
     * @tc.desc      sizeSummaryOf(width=360, height=1824) returns "360 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0120 begin`);
      const actual: string = sizeSummaryOf(360, 1824);
      logInfo(`sizeSummaryOf(width=360, height=1824): actual=${actual}`);
      expect(actual).assertEqual('360 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0121
     * @tc.name      WindowRatio_SizeSummaryOf_0121
     * @tc.desc      sizeSummaryOf(width=720, height=0) returns "720 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0121 begin`);
      const actual: string = sizeSummaryOf(720, 0);
      logInfo(`sizeSummaryOf(width=720, height=0): actual=${actual}`);
      expect(actual).assertEqual('720 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0122
     * @tc.name      WindowRatio_SizeSummaryOf_0122
     * @tc.desc      sizeSummaryOf(width=720, height=1) returns "720 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0122 begin`);
      const actual: string = sizeSummaryOf(720, 1);
      logInfo(`sizeSummaryOf(width=720, height=1): actual=${actual}`);
      expect(actual).assertEqual('720 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0123
     * @tc.name      WindowRatio_SizeSummaryOf_0123
     * @tc.desc      sizeSummaryOf(width=720, height=100) returns "720 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0123 begin`);
      const actual: string = sizeSummaryOf(720, 100);
      logInfo(`sizeSummaryOf(width=720, height=100): actual=${actual}`);
      expect(actual).assertEqual('720 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0124
     * @tc.name      WindowRatio_SizeSummaryOf_0124
     * @tc.desc      sizeSummaryOf(width=720, height=360) returns "720 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0124 begin`);
      const actual: string = sizeSummaryOf(720, 360);
      logInfo(`sizeSummaryOf(width=720, height=360): actual=${actual}`);
      expect(actual).assertEqual('720 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0125
     * @tc.name      WindowRatio_SizeSummaryOf_0125
     * @tc.desc      sizeSummaryOf(width=720, height=720) returns "720 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0125 begin`);
      const actual: string = sizeSummaryOf(720, 720);
      logInfo(`sizeSummaryOf(width=720, height=720): actual=${actual}`);
      expect(actual).assertEqual('720 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0126
     * @tc.name      WindowRatio_SizeSummaryOf_0126
     * @tc.desc      sizeSummaryOf(width=720, height=1080) returns "720 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0126 begin`);
      const actual: string = sizeSummaryOf(720, 1080);
      logInfo(`sizeSummaryOf(width=720, height=1080): actual=${actual}`);
      expect(actual).assertEqual('720 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0127
     * @tc.name      WindowRatio_SizeSummaryOf_0127
     * @tc.desc      sizeSummaryOf(width=720, height=1920) returns "720 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0127 begin`);
      const actual: string = sizeSummaryOf(720, 1920);
      logInfo(`sizeSummaryOf(width=720, height=1920): actual=${actual}`);
      expect(actual).assertEqual('720 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0128
     * @tc.name      WindowRatio_SizeSummaryOf_0128
     * @tc.desc      sizeSummaryOf(width=720, height=-1) returns "720 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0128 begin`);
      const actual: string = sizeSummaryOf(720, -1);
      logInfo(`sizeSummaryOf(width=720, height=-1): actual=${actual}`);
      expect(actual).assertEqual('720 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0129
     * @tc.name      WindowRatio_SizeSummaryOf_0129
     * @tc.desc      sizeSummaryOf(width=720, height=2) returns "720 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0129 begin`);
      const actual: string = sizeSummaryOf(720, 2);
      logInfo(`sizeSummaryOf(width=720, height=2): actual=${actual}`);
      expect(actual).assertEqual('720 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0130
     * @tc.name      WindowRatio_SizeSummaryOf_0130
     * @tc.desc      sizeSummaryOf(width=720, height=3) returns "720 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0130 begin`);
      const actual: string = sizeSummaryOf(720, 3);
      logInfo(`sizeSummaryOf(width=720, height=3): actual=${actual}`);
      expect(actual).assertEqual('720 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0131
     * @tc.name      WindowRatio_SizeSummaryOf_0131
     * @tc.desc      sizeSummaryOf(width=720, height=10) returns "720 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0131 begin`);
      const actual: string = sizeSummaryOf(720, 10);
      logInfo(`sizeSummaryOf(width=720, height=10): actual=${actual}`);
      expect(actual).assertEqual('720 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0132
     * @tc.name      WindowRatio_SizeSummaryOf_0132
     * @tc.desc      sizeSummaryOf(width=720, height=96) returns "720 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0132 begin`);
      const actual: string = sizeSummaryOf(720, 96);
      logInfo(`sizeSummaryOf(width=720, height=96): actual=${actual}`);
      expect(actual).assertEqual('720 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0133
     * @tc.name      WindowRatio_SizeSummaryOf_0133
     * @tc.desc      sizeSummaryOf(width=720, height=192) returns "720 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0133 begin`);
      const actual: string = sizeSummaryOf(720, 192);
      logInfo(`sizeSummaryOf(width=720, height=192): actual=${actual}`);
      expect(actual).assertEqual('720 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0134
     * @tc.name      WindowRatio_SizeSummaryOf_0134
     * @tc.desc      sizeSummaryOf(width=720, height=288) returns "720 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0134 begin`);
      const actual: string = sizeSummaryOf(720, 288);
      logInfo(`sizeSummaryOf(width=720, height=288): actual=${actual}`);
      expect(actual).assertEqual('720 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0135
     * @tc.name      WindowRatio_SizeSummaryOf_0135
     * @tc.desc      sizeSummaryOf(width=720, height=384) returns "720 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0135 begin`);
      const actual: string = sizeSummaryOf(720, 384);
      logInfo(`sizeSummaryOf(width=720, height=384): actual=${actual}`);
      expect(actual).assertEqual('720 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0136
     * @tc.name      WindowRatio_SizeSummaryOf_0136
     * @tc.desc      sizeSummaryOf(width=720, height=480) returns "720 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0136 begin`);
      const actual: string = sizeSummaryOf(720, 480);
      logInfo(`sizeSummaryOf(width=720, height=480): actual=${actual}`);
      expect(actual).assertEqual('720 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0137
     * @tc.name      WindowRatio_SizeSummaryOf_0137
     * @tc.desc      sizeSummaryOf(width=720, height=576) returns "720 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0137 begin`);
      const actual: string = sizeSummaryOf(720, 576);
      logInfo(`sizeSummaryOf(width=720, height=576): actual=${actual}`);
      expect(actual).assertEqual('720 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0138
     * @tc.name      WindowRatio_SizeSummaryOf_0138
     * @tc.desc      sizeSummaryOf(width=720, height=672) returns "720 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0138 begin`);
      const actual: string = sizeSummaryOf(720, 672);
      logInfo(`sizeSummaryOf(width=720, height=672): actual=${actual}`);
      expect(actual).assertEqual('720 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0139
     * @tc.name      WindowRatio_SizeSummaryOf_0139
     * @tc.desc      sizeSummaryOf(width=720, height=768) returns "720 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0139 begin`);
      const actual: string = sizeSummaryOf(720, 768);
      logInfo(`sizeSummaryOf(width=720, height=768): actual=${actual}`);
      expect(actual).assertEqual('720 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0140
     * @tc.name      WindowRatio_SizeSummaryOf_0140
     * @tc.desc      sizeSummaryOf(width=720, height=864) returns "720 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0140 begin`);
      const actual: string = sizeSummaryOf(720, 864);
      logInfo(`sizeSummaryOf(width=720, height=864): actual=${actual}`);
      expect(actual).assertEqual('720 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0141
     * @tc.name      WindowRatio_SizeSummaryOf_0141
     * @tc.desc      sizeSummaryOf(width=720, height=960) returns "720 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0141 begin`);
      const actual: string = sizeSummaryOf(720, 960);
      logInfo(`sizeSummaryOf(width=720, height=960): actual=${actual}`);
      expect(actual).assertEqual('720 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0142
     * @tc.name      WindowRatio_SizeSummaryOf_0142
     * @tc.desc      sizeSummaryOf(width=720, height=1056) returns "720 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0142 begin`);
      const actual: string = sizeSummaryOf(720, 1056);
      logInfo(`sizeSummaryOf(width=720, height=1056): actual=${actual}`);
      expect(actual).assertEqual('720 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0143
     * @tc.name      WindowRatio_SizeSummaryOf_0143
     * @tc.desc      sizeSummaryOf(width=720, height=1152) returns "720 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0143 begin`);
      const actual: string = sizeSummaryOf(720, 1152);
      logInfo(`sizeSummaryOf(width=720, height=1152): actual=${actual}`);
      expect(actual).assertEqual('720 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0144
     * @tc.name      WindowRatio_SizeSummaryOf_0144
     * @tc.desc      sizeSummaryOf(width=720, height=1248) returns "720 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0144 begin`);
      const actual: string = sizeSummaryOf(720, 1248);
      logInfo(`sizeSummaryOf(width=720, height=1248): actual=${actual}`);
      expect(actual).assertEqual('720 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0145
     * @tc.name      WindowRatio_SizeSummaryOf_0145
     * @tc.desc      sizeSummaryOf(width=720, height=1344) returns "720 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0145 begin`);
      const actual: string = sizeSummaryOf(720, 1344);
      logInfo(`sizeSummaryOf(width=720, height=1344): actual=${actual}`);
      expect(actual).assertEqual('720 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0146
     * @tc.name      WindowRatio_SizeSummaryOf_0146
     * @tc.desc      sizeSummaryOf(width=720, height=1440) returns "720 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0146 begin`);
      const actual: string = sizeSummaryOf(720, 1440);
      logInfo(`sizeSummaryOf(width=720, height=1440): actual=${actual}`);
      expect(actual).assertEqual('720 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0147
     * @tc.name      WindowRatio_SizeSummaryOf_0147
     * @tc.desc      sizeSummaryOf(width=720, height=1536) returns "720 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0147 begin`);
      const actual: string = sizeSummaryOf(720, 1536);
      logInfo(`sizeSummaryOf(width=720, height=1536): actual=${actual}`);
      expect(actual).assertEqual('720 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0148
     * @tc.name      WindowRatio_SizeSummaryOf_0148
     * @tc.desc      sizeSummaryOf(width=720, height=1632) returns "720 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0148 begin`);
      const actual: string = sizeSummaryOf(720, 1632);
      logInfo(`sizeSummaryOf(width=720, height=1632): actual=${actual}`);
      expect(actual).assertEqual('720 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0149
     * @tc.name      WindowRatio_SizeSummaryOf_0149
     * @tc.desc      sizeSummaryOf(width=720, height=1728) returns "720 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0149 begin`);
      const actual: string = sizeSummaryOf(720, 1728);
      logInfo(`sizeSummaryOf(width=720, height=1728): actual=${actual}`);
      expect(actual).assertEqual('720 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0150
     * @tc.name      WindowRatio_SizeSummaryOf_0150
     * @tc.desc      sizeSummaryOf(width=720, height=1824) returns "720 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0150 begin`);
      const actual: string = sizeSummaryOf(720, 1824);
      logInfo(`sizeSummaryOf(width=720, height=1824): actual=${actual}`);
      expect(actual).assertEqual('720 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0151
     * @tc.name      WindowRatio_SizeSummaryOf_0151
     * @tc.desc      sizeSummaryOf(width=1080, height=0) returns "1080 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0151 begin`);
      const actual: string = sizeSummaryOf(1080, 0);
      logInfo(`sizeSummaryOf(width=1080, height=0): actual=${actual}`);
      expect(actual).assertEqual('1080 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0152
     * @tc.name      WindowRatio_SizeSummaryOf_0152
     * @tc.desc      sizeSummaryOf(width=1080, height=1) returns "1080 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0152 begin`);
      const actual: string = sizeSummaryOf(1080, 1);
      logInfo(`sizeSummaryOf(width=1080, height=1): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0153
     * @tc.name      WindowRatio_SizeSummaryOf_0153
     * @tc.desc      sizeSummaryOf(width=1080, height=100) returns "1080 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0153 begin`);
      const actual: string = sizeSummaryOf(1080, 100);
      logInfo(`sizeSummaryOf(width=1080, height=100): actual=${actual}`);
      expect(actual).assertEqual('1080 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0154
     * @tc.name      WindowRatio_SizeSummaryOf_0154
     * @tc.desc      sizeSummaryOf(width=1080, height=360) returns "1080 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0154 begin`);
      const actual: string = sizeSummaryOf(1080, 360);
      logInfo(`sizeSummaryOf(width=1080, height=360): actual=${actual}`);
      expect(actual).assertEqual('1080 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0155
     * @tc.name      WindowRatio_SizeSummaryOf_0155
     * @tc.desc      sizeSummaryOf(width=1080, height=720) returns "1080 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0155 begin`);
      const actual: string = sizeSummaryOf(1080, 720);
      logInfo(`sizeSummaryOf(width=1080, height=720): actual=${actual}`);
      expect(actual).assertEqual('1080 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0156
     * @tc.name      WindowRatio_SizeSummaryOf_0156
     * @tc.desc      sizeSummaryOf(width=1080, height=1080) returns "1080 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0156 begin`);
      const actual: string = sizeSummaryOf(1080, 1080);
      logInfo(`sizeSummaryOf(width=1080, height=1080): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0157
     * @tc.name      WindowRatio_SizeSummaryOf_0157
     * @tc.desc      sizeSummaryOf(width=1080, height=1920) returns "1080 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0157 begin`);
      const actual: string = sizeSummaryOf(1080, 1920);
      logInfo(`sizeSummaryOf(width=1080, height=1920): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0158
     * @tc.name      WindowRatio_SizeSummaryOf_0158
     * @tc.desc      sizeSummaryOf(width=1080, height=-1) returns "1080 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0158 begin`);
      const actual: string = sizeSummaryOf(1080, -1);
      logInfo(`sizeSummaryOf(width=1080, height=-1): actual=${actual}`);
      expect(actual).assertEqual('1080 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0159
     * @tc.name      WindowRatio_SizeSummaryOf_0159
     * @tc.desc      sizeSummaryOf(width=1080, height=2) returns "1080 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0159 begin`);
      const actual: string = sizeSummaryOf(1080, 2);
      logInfo(`sizeSummaryOf(width=1080, height=2): actual=${actual}`);
      expect(actual).assertEqual('1080 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0160
     * @tc.name      WindowRatio_SizeSummaryOf_0160
     * @tc.desc      sizeSummaryOf(width=1080, height=3) returns "1080 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0160 begin`);
      const actual: string = sizeSummaryOf(1080, 3);
      logInfo(`sizeSummaryOf(width=1080, height=3): actual=${actual}`);
      expect(actual).assertEqual('1080 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0161
     * @tc.name      WindowRatio_SizeSummaryOf_0161
     * @tc.desc      sizeSummaryOf(width=1080, height=10) returns "1080 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0161 begin`);
      const actual: string = sizeSummaryOf(1080, 10);
      logInfo(`sizeSummaryOf(width=1080, height=10): actual=${actual}`);
      expect(actual).assertEqual('1080 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0162
     * @tc.name      WindowRatio_SizeSummaryOf_0162
     * @tc.desc      sizeSummaryOf(width=1080, height=96) returns "1080 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0162 begin`);
      const actual: string = sizeSummaryOf(1080, 96);
      logInfo(`sizeSummaryOf(width=1080, height=96): actual=${actual}`);
      expect(actual).assertEqual('1080 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0163
     * @tc.name      WindowRatio_SizeSummaryOf_0163
     * @tc.desc      sizeSummaryOf(width=1080, height=192) returns "1080 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0163 begin`);
      const actual: string = sizeSummaryOf(1080, 192);
      logInfo(`sizeSummaryOf(width=1080, height=192): actual=${actual}`);
      expect(actual).assertEqual('1080 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0164
     * @tc.name      WindowRatio_SizeSummaryOf_0164
     * @tc.desc      sizeSummaryOf(width=1080, height=288) returns "1080 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0164 begin`);
      const actual: string = sizeSummaryOf(1080, 288);
      logInfo(`sizeSummaryOf(width=1080, height=288): actual=${actual}`);
      expect(actual).assertEqual('1080 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0165
     * @tc.name      WindowRatio_SizeSummaryOf_0165
     * @tc.desc      sizeSummaryOf(width=1080, height=384) returns "1080 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0165 begin`);
      const actual: string = sizeSummaryOf(1080, 384);
      logInfo(`sizeSummaryOf(width=1080, height=384): actual=${actual}`);
      expect(actual).assertEqual('1080 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0166
     * @tc.name      WindowRatio_SizeSummaryOf_0166
     * @tc.desc      sizeSummaryOf(width=1080, height=480) returns "1080 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0166 begin`);
      const actual: string = sizeSummaryOf(1080, 480);
      logInfo(`sizeSummaryOf(width=1080, height=480): actual=${actual}`);
      expect(actual).assertEqual('1080 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0167
     * @tc.name      WindowRatio_SizeSummaryOf_0167
     * @tc.desc      sizeSummaryOf(width=1080, height=576) returns "1080 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0167 begin`);
      const actual: string = sizeSummaryOf(1080, 576);
      logInfo(`sizeSummaryOf(width=1080, height=576): actual=${actual}`);
      expect(actual).assertEqual('1080 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0168
     * @tc.name      WindowRatio_SizeSummaryOf_0168
     * @tc.desc      sizeSummaryOf(width=1080, height=672) returns "1080 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0168 begin`);
      const actual: string = sizeSummaryOf(1080, 672);
      logInfo(`sizeSummaryOf(width=1080, height=672): actual=${actual}`);
      expect(actual).assertEqual('1080 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0169
     * @tc.name      WindowRatio_SizeSummaryOf_0169
     * @tc.desc      sizeSummaryOf(width=1080, height=768) returns "1080 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0169 begin`);
      const actual: string = sizeSummaryOf(1080, 768);
      logInfo(`sizeSummaryOf(width=1080, height=768): actual=${actual}`);
      expect(actual).assertEqual('1080 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0170
     * @tc.name      WindowRatio_SizeSummaryOf_0170
     * @tc.desc      sizeSummaryOf(width=1080, height=864) returns "1080 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0170 begin`);
      const actual: string = sizeSummaryOf(1080, 864);
      logInfo(`sizeSummaryOf(width=1080, height=864): actual=${actual}`);
      expect(actual).assertEqual('1080 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0171
     * @tc.name      WindowRatio_SizeSummaryOf_0171
     * @tc.desc      sizeSummaryOf(width=1080, height=960) returns "1080 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0171 begin`);
      const actual: string = sizeSummaryOf(1080, 960);
      logInfo(`sizeSummaryOf(width=1080, height=960): actual=${actual}`);
      expect(actual).assertEqual('1080 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0172
     * @tc.name      WindowRatio_SizeSummaryOf_0172
     * @tc.desc      sizeSummaryOf(width=1080, height=1056) returns "1080 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0172 begin`);
      const actual: string = sizeSummaryOf(1080, 1056);
      logInfo(`sizeSummaryOf(width=1080, height=1056): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0173
     * @tc.name      WindowRatio_SizeSummaryOf_0173
     * @tc.desc      sizeSummaryOf(width=1080, height=1152) returns "1080 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0173 begin`);
      const actual: string = sizeSummaryOf(1080, 1152);
      logInfo(`sizeSummaryOf(width=1080, height=1152): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0174
     * @tc.name      WindowRatio_SizeSummaryOf_0174
     * @tc.desc      sizeSummaryOf(width=1080, height=1248) returns "1080 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0174 begin`);
      const actual: string = sizeSummaryOf(1080, 1248);
      logInfo(`sizeSummaryOf(width=1080, height=1248): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0175
     * @tc.name      WindowRatio_SizeSummaryOf_0175
     * @tc.desc      sizeSummaryOf(width=1080, height=1344) returns "1080 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0175 begin`);
      const actual: string = sizeSummaryOf(1080, 1344);
      logInfo(`sizeSummaryOf(width=1080, height=1344): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0176
     * @tc.name      WindowRatio_SizeSummaryOf_0176
     * @tc.desc      sizeSummaryOf(width=1080, height=1440) returns "1080 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0176 begin`);
      const actual: string = sizeSummaryOf(1080, 1440);
      logInfo(`sizeSummaryOf(width=1080, height=1440): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0177
     * @tc.name      WindowRatio_SizeSummaryOf_0177
     * @tc.desc      sizeSummaryOf(width=1080, height=1536) returns "1080 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0177 begin`);
      const actual: string = sizeSummaryOf(1080, 1536);
      logInfo(`sizeSummaryOf(width=1080, height=1536): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0178
     * @tc.name      WindowRatio_SizeSummaryOf_0178
     * @tc.desc      sizeSummaryOf(width=1080, height=1632) returns "1080 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0178 begin`);
      const actual: string = sizeSummaryOf(1080, 1632);
      logInfo(`sizeSummaryOf(width=1080, height=1632): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0179
     * @tc.name      WindowRatio_SizeSummaryOf_0179
     * @tc.desc      sizeSummaryOf(width=1080, height=1728) returns "1080 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0179 begin`);
      const actual: string = sizeSummaryOf(1080, 1728);
      logInfo(`sizeSummaryOf(width=1080, height=1728): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0180
     * @tc.name      WindowRatio_SizeSummaryOf_0180
     * @tc.desc      sizeSummaryOf(width=1080, height=1824) returns "1080 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0180 begin`);
      const actual: string = sizeSummaryOf(1080, 1824);
      logInfo(`sizeSummaryOf(width=1080, height=1824): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0181
     * @tc.name      WindowRatio_SizeSummaryOf_0181
     * @tc.desc      sizeSummaryOf(width=1920, height=0) returns "1920 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0181 begin`);
      const actual: string = sizeSummaryOf(1920, 0);
      logInfo(`sizeSummaryOf(width=1920, height=0): actual=${actual}`);
      expect(actual).assertEqual('1920 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0182
     * @tc.name      WindowRatio_SizeSummaryOf_0182
     * @tc.desc      sizeSummaryOf(width=1920, height=1) returns "1920 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0182 begin`);
      const actual: string = sizeSummaryOf(1920, 1);
      logInfo(`sizeSummaryOf(width=1920, height=1): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0183
     * @tc.name      WindowRatio_SizeSummaryOf_0183
     * @tc.desc      sizeSummaryOf(width=1920, height=100) returns "1920 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0183 begin`);
      const actual: string = sizeSummaryOf(1920, 100);
      logInfo(`sizeSummaryOf(width=1920, height=100): actual=${actual}`);
      expect(actual).assertEqual('1920 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0184
     * @tc.name      WindowRatio_SizeSummaryOf_0184
     * @tc.desc      sizeSummaryOf(width=1920, height=360) returns "1920 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0184 begin`);
      const actual: string = sizeSummaryOf(1920, 360);
      logInfo(`sizeSummaryOf(width=1920, height=360): actual=${actual}`);
      expect(actual).assertEqual('1920 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0185
     * @tc.name      WindowRatio_SizeSummaryOf_0185
     * @tc.desc      sizeSummaryOf(width=1920, height=720) returns "1920 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0185 begin`);
      const actual: string = sizeSummaryOf(1920, 720);
      logInfo(`sizeSummaryOf(width=1920, height=720): actual=${actual}`);
      expect(actual).assertEqual('1920 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0186
     * @tc.name      WindowRatio_SizeSummaryOf_0186
     * @tc.desc      sizeSummaryOf(width=1920, height=1080) returns "1920 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0186 begin`);
      const actual: string = sizeSummaryOf(1920, 1080);
      logInfo(`sizeSummaryOf(width=1920, height=1080): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0187
     * @tc.name      WindowRatio_SizeSummaryOf_0187
     * @tc.desc      sizeSummaryOf(width=1920, height=1920) returns "1920 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0187 begin`);
      const actual: string = sizeSummaryOf(1920, 1920);
      logInfo(`sizeSummaryOf(width=1920, height=1920): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0188
     * @tc.name      WindowRatio_SizeSummaryOf_0188
     * @tc.desc      sizeSummaryOf(width=1920, height=-1) returns "1920 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0188 begin`);
      const actual: string = sizeSummaryOf(1920, -1);
      logInfo(`sizeSummaryOf(width=1920, height=-1): actual=${actual}`);
      expect(actual).assertEqual('1920 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0189
     * @tc.name      WindowRatio_SizeSummaryOf_0189
     * @tc.desc      sizeSummaryOf(width=1920, height=2) returns "1920 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0189 begin`);
      const actual: string = sizeSummaryOf(1920, 2);
      logInfo(`sizeSummaryOf(width=1920, height=2): actual=${actual}`);
      expect(actual).assertEqual('1920 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0190
     * @tc.name      WindowRatio_SizeSummaryOf_0190
     * @tc.desc      sizeSummaryOf(width=1920, height=3) returns "1920 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0190 begin`);
      const actual: string = sizeSummaryOf(1920, 3);
      logInfo(`sizeSummaryOf(width=1920, height=3): actual=${actual}`);
      expect(actual).assertEqual('1920 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0191
     * @tc.name      WindowRatio_SizeSummaryOf_0191
     * @tc.desc      sizeSummaryOf(width=1920, height=10) returns "1920 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0191 begin`);
      const actual: string = sizeSummaryOf(1920, 10);
      logInfo(`sizeSummaryOf(width=1920, height=10): actual=${actual}`);
      expect(actual).assertEqual('1920 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0192
     * @tc.name      WindowRatio_SizeSummaryOf_0192
     * @tc.desc      sizeSummaryOf(width=1920, height=96) returns "1920 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0192 begin`);
      const actual: string = sizeSummaryOf(1920, 96);
      logInfo(`sizeSummaryOf(width=1920, height=96): actual=${actual}`);
      expect(actual).assertEqual('1920 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0192 end`);
    });
  });
}
