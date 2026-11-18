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
export default function sizeSummaryOf3Test(): void {
  describe('SizeSummaryOf3Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0193
     * @tc.name      WindowRatio_SizeSummaryOf_0193
     * @tc.desc      sizeSummaryOf(width=1920, height=192) returns "1920 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0193 begin`);
      const actual: string = sizeSummaryOf(1920, 192);
      logInfo(`sizeSummaryOf(width=1920, height=192): actual=${actual}`);
      expect(actual).assertEqual('1920 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0194
     * @tc.name      WindowRatio_SizeSummaryOf_0194
     * @tc.desc      sizeSummaryOf(width=1920, height=288) returns "1920 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0194 begin`);
      const actual: string = sizeSummaryOf(1920, 288);
      logInfo(`sizeSummaryOf(width=1920, height=288): actual=${actual}`);
      expect(actual).assertEqual('1920 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0195
     * @tc.name      WindowRatio_SizeSummaryOf_0195
     * @tc.desc      sizeSummaryOf(width=1920, height=384) returns "1920 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0195 begin`);
      const actual: string = sizeSummaryOf(1920, 384);
      logInfo(`sizeSummaryOf(width=1920, height=384): actual=${actual}`);
      expect(actual).assertEqual('1920 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0196
     * @tc.name      WindowRatio_SizeSummaryOf_0196
     * @tc.desc      sizeSummaryOf(width=1920, height=480) returns "1920 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0196 begin`);
      const actual: string = sizeSummaryOf(1920, 480);
      logInfo(`sizeSummaryOf(width=1920, height=480): actual=${actual}`);
      expect(actual).assertEqual('1920 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0197
     * @tc.name      WindowRatio_SizeSummaryOf_0197
     * @tc.desc      sizeSummaryOf(width=1920, height=576) returns "1920 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0197 begin`);
      const actual: string = sizeSummaryOf(1920, 576);
      logInfo(`sizeSummaryOf(width=1920, height=576): actual=${actual}`);
      expect(actual).assertEqual('1920 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0198
     * @tc.name      WindowRatio_SizeSummaryOf_0198
     * @tc.desc      sizeSummaryOf(width=1920, height=672) returns "1920 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0198 begin`);
      const actual: string = sizeSummaryOf(1920, 672);
      logInfo(`sizeSummaryOf(width=1920, height=672): actual=${actual}`);
      expect(actual).assertEqual('1920 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0199
     * @tc.name      WindowRatio_SizeSummaryOf_0199
     * @tc.desc      sizeSummaryOf(width=1920, height=768) returns "1920 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0199 begin`);
      const actual: string = sizeSummaryOf(1920, 768);
      logInfo(`sizeSummaryOf(width=1920, height=768): actual=${actual}`);
      expect(actual).assertEqual('1920 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0200
     * @tc.name      WindowRatio_SizeSummaryOf_0200
     * @tc.desc      sizeSummaryOf(width=1920, height=864) returns "1920 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0200 begin`);
      const actual: string = sizeSummaryOf(1920, 864);
      logInfo(`sizeSummaryOf(width=1920, height=864): actual=${actual}`);
      expect(actual).assertEqual('1920 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0201
     * @tc.name      WindowRatio_SizeSummaryOf_0201
     * @tc.desc      sizeSummaryOf(width=1920, height=960) returns "1920 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0201 begin`);
      const actual: string = sizeSummaryOf(1920, 960);
      logInfo(`sizeSummaryOf(width=1920, height=960): actual=${actual}`);
      expect(actual).assertEqual('1920 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0202
     * @tc.name      WindowRatio_SizeSummaryOf_0202
     * @tc.desc      sizeSummaryOf(width=1920, height=1056) returns "1920 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0202 begin`);
      const actual: string = sizeSummaryOf(1920, 1056);
      logInfo(`sizeSummaryOf(width=1920, height=1056): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0203
     * @tc.name      WindowRatio_SizeSummaryOf_0203
     * @tc.desc      sizeSummaryOf(width=1920, height=1152) returns "1920 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0203 begin`);
      const actual: string = sizeSummaryOf(1920, 1152);
      logInfo(`sizeSummaryOf(width=1920, height=1152): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0204
     * @tc.name      WindowRatio_SizeSummaryOf_0204
     * @tc.desc      sizeSummaryOf(width=1920, height=1248) returns "1920 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0204 begin`);
      const actual: string = sizeSummaryOf(1920, 1248);
      logInfo(`sizeSummaryOf(width=1920, height=1248): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0205
     * @tc.name      WindowRatio_SizeSummaryOf_0205
     * @tc.desc      sizeSummaryOf(width=1920, height=1344) returns "1920 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0205 begin`);
      const actual: string = sizeSummaryOf(1920, 1344);
      logInfo(`sizeSummaryOf(width=1920, height=1344): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0206
     * @tc.name      WindowRatio_SizeSummaryOf_0206
     * @tc.desc      sizeSummaryOf(width=1920, height=1440) returns "1920 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0206 begin`);
      const actual: string = sizeSummaryOf(1920, 1440);
      logInfo(`sizeSummaryOf(width=1920, height=1440): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0207
     * @tc.name      WindowRatio_SizeSummaryOf_0207
     * @tc.desc      sizeSummaryOf(width=1920, height=1536) returns "1920 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0207 begin`);
      const actual: string = sizeSummaryOf(1920, 1536);
      logInfo(`sizeSummaryOf(width=1920, height=1536): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0208
     * @tc.name      WindowRatio_SizeSummaryOf_0208
     * @tc.desc      sizeSummaryOf(width=1920, height=1632) returns "1920 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0208 begin`);
      const actual: string = sizeSummaryOf(1920, 1632);
      logInfo(`sizeSummaryOf(width=1920, height=1632): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0209
     * @tc.name      WindowRatio_SizeSummaryOf_0209
     * @tc.desc      sizeSummaryOf(width=1920, height=1728) returns "1920 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0209 begin`);
      const actual: string = sizeSummaryOf(1920, 1728);
      logInfo(`sizeSummaryOf(width=1920, height=1728): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0210
     * @tc.name      WindowRatio_SizeSummaryOf_0210
     * @tc.desc      sizeSummaryOf(width=1920, height=1824) returns "1920 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0210 begin`);
      const actual: string = sizeSummaryOf(1920, 1824);
      logInfo(`sizeSummaryOf(width=1920, height=1824): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0211
     * @tc.name      WindowRatio_SizeSummaryOf_0211
     * @tc.desc      sizeSummaryOf(width=-1, height=0) returns "-1 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0211 begin`);
      const actual: string = sizeSummaryOf(-1, 0);
      logInfo(`sizeSummaryOf(width=-1, height=0): actual=${actual}`);
      expect(actual).assertEqual('-1 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0212
     * @tc.name      WindowRatio_SizeSummaryOf_0212
     * @tc.desc      sizeSummaryOf(width=-1, height=1) returns "-1 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0212 begin`);
      const actual: string = sizeSummaryOf(-1, 1);
      logInfo(`sizeSummaryOf(width=-1, height=1): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0213
     * @tc.name      WindowRatio_SizeSummaryOf_0213
     * @tc.desc      sizeSummaryOf(width=-1, height=100) returns "-1 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0213 begin`);
      const actual: string = sizeSummaryOf(-1, 100);
      logInfo(`sizeSummaryOf(width=-1, height=100): actual=${actual}`);
      expect(actual).assertEqual('-1 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0214
     * @tc.name      WindowRatio_SizeSummaryOf_0214
     * @tc.desc      sizeSummaryOf(width=-1, height=360) returns "-1 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0214 begin`);
      const actual: string = sizeSummaryOf(-1, 360);
      logInfo(`sizeSummaryOf(width=-1, height=360): actual=${actual}`);
      expect(actual).assertEqual('-1 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0215
     * @tc.name      WindowRatio_SizeSummaryOf_0215
     * @tc.desc      sizeSummaryOf(width=-1, height=720) returns "-1 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0215 begin`);
      const actual: string = sizeSummaryOf(-1, 720);
      logInfo(`sizeSummaryOf(width=-1, height=720): actual=${actual}`);
      expect(actual).assertEqual('-1 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0216
     * @tc.name      WindowRatio_SizeSummaryOf_0216
     * @tc.desc      sizeSummaryOf(width=-1, height=1080) returns "-1 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0216 begin`);
      const actual: string = sizeSummaryOf(-1, 1080);
      logInfo(`sizeSummaryOf(width=-1, height=1080): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0217
     * @tc.name      WindowRatio_SizeSummaryOf_0217
     * @tc.desc      sizeSummaryOf(width=-1, height=1920) returns "-1 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0217 begin`);
      const actual: string = sizeSummaryOf(-1, 1920);
      logInfo(`sizeSummaryOf(width=-1, height=1920): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0218
     * @tc.name      WindowRatio_SizeSummaryOf_0218
     * @tc.desc      sizeSummaryOf(width=-1, height=-1) returns "-1 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0218 begin`);
      const actual: string = sizeSummaryOf(-1, -1);
      logInfo(`sizeSummaryOf(width=-1, height=-1): actual=${actual}`);
      expect(actual).assertEqual('-1 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0219
     * @tc.name      WindowRatio_SizeSummaryOf_0219
     * @tc.desc      sizeSummaryOf(width=-1, height=2) returns "-1 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0219 begin`);
      const actual: string = sizeSummaryOf(-1, 2);
      logInfo(`sizeSummaryOf(width=-1, height=2): actual=${actual}`);
      expect(actual).assertEqual('-1 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0220
     * @tc.name      WindowRatio_SizeSummaryOf_0220
     * @tc.desc      sizeSummaryOf(width=-1, height=3) returns "-1 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0220 begin`);
      const actual: string = sizeSummaryOf(-1, 3);
      logInfo(`sizeSummaryOf(width=-1, height=3): actual=${actual}`);
      expect(actual).assertEqual('-1 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0221
     * @tc.name      WindowRatio_SizeSummaryOf_0221
     * @tc.desc      sizeSummaryOf(width=-1, height=10) returns "-1 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0221 begin`);
      const actual: string = sizeSummaryOf(-1, 10);
      logInfo(`sizeSummaryOf(width=-1, height=10): actual=${actual}`);
      expect(actual).assertEqual('-1 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0222
     * @tc.name      WindowRatio_SizeSummaryOf_0222
     * @tc.desc      sizeSummaryOf(width=-1, height=96) returns "-1 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0222 begin`);
      const actual: string = sizeSummaryOf(-1, 96);
      logInfo(`sizeSummaryOf(width=-1, height=96): actual=${actual}`);
      expect(actual).assertEqual('-1 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0223
     * @tc.name      WindowRatio_SizeSummaryOf_0223
     * @tc.desc      sizeSummaryOf(width=-1, height=192) returns "-1 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0223 begin`);
      const actual: string = sizeSummaryOf(-1, 192);
      logInfo(`sizeSummaryOf(width=-1, height=192): actual=${actual}`);
      expect(actual).assertEqual('-1 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0224
     * @tc.name      WindowRatio_SizeSummaryOf_0224
     * @tc.desc      sizeSummaryOf(width=-1, height=288) returns "-1 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0224 begin`);
      const actual: string = sizeSummaryOf(-1, 288);
      logInfo(`sizeSummaryOf(width=-1, height=288): actual=${actual}`);
      expect(actual).assertEqual('-1 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0225
     * @tc.name      WindowRatio_SizeSummaryOf_0225
     * @tc.desc      sizeSummaryOf(width=-1, height=384) returns "-1 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0225 begin`);
      const actual: string = sizeSummaryOf(-1, 384);
      logInfo(`sizeSummaryOf(width=-1, height=384): actual=${actual}`);
      expect(actual).assertEqual('-1 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0226
     * @tc.name      WindowRatio_SizeSummaryOf_0226
     * @tc.desc      sizeSummaryOf(width=-1, height=480) returns "-1 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0226 begin`);
      const actual: string = sizeSummaryOf(-1, 480);
      logInfo(`sizeSummaryOf(width=-1, height=480): actual=${actual}`);
      expect(actual).assertEqual('-1 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0227
     * @tc.name      WindowRatio_SizeSummaryOf_0227
     * @tc.desc      sizeSummaryOf(width=-1, height=576) returns "-1 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0227 begin`);
      const actual: string = sizeSummaryOf(-1, 576);
      logInfo(`sizeSummaryOf(width=-1, height=576): actual=${actual}`);
      expect(actual).assertEqual('-1 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0228
     * @tc.name      WindowRatio_SizeSummaryOf_0228
     * @tc.desc      sizeSummaryOf(width=-1, height=672) returns "-1 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0228 begin`);
      const actual: string = sizeSummaryOf(-1, 672);
      logInfo(`sizeSummaryOf(width=-1, height=672): actual=${actual}`);
      expect(actual).assertEqual('-1 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0229
     * @tc.name      WindowRatio_SizeSummaryOf_0229
     * @tc.desc      sizeSummaryOf(width=-1, height=768) returns "-1 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0229 begin`);
      const actual: string = sizeSummaryOf(-1, 768);
      logInfo(`sizeSummaryOf(width=-1, height=768): actual=${actual}`);
      expect(actual).assertEqual('-1 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0230
     * @tc.name      WindowRatio_SizeSummaryOf_0230
     * @tc.desc      sizeSummaryOf(width=-1, height=864) returns "-1 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0230 begin`);
      const actual: string = sizeSummaryOf(-1, 864);
      logInfo(`sizeSummaryOf(width=-1, height=864): actual=${actual}`);
      expect(actual).assertEqual('-1 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0231
     * @tc.name      WindowRatio_SizeSummaryOf_0231
     * @tc.desc      sizeSummaryOf(width=-1, height=960) returns "-1 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0231 begin`);
      const actual: string = sizeSummaryOf(-1, 960);
      logInfo(`sizeSummaryOf(width=-1, height=960): actual=${actual}`);
      expect(actual).assertEqual('-1 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0232
     * @tc.name      WindowRatio_SizeSummaryOf_0232
     * @tc.desc      sizeSummaryOf(width=-1, height=1056) returns "-1 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0232 begin`);
      const actual: string = sizeSummaryOf(-1, 1056);
      logInfo(`sizeSummaryOf(width=-1, height=1056): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0233
     * @tc.name      WindowRatio_SizeSummaryOf_0233
     * @tc.desc      sizeSummaryOf(width=-1, height=1152) returns "-1 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0233 begin`);
      const actual: string = sizeSummaryOf(-1, 1152);
      logInfo(`sizeSummaryOf(width=-1, height=1152): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0234
     * @tc.name      WindowRatio_SizeSummaryOf_0234
     * @tc.desc      sizeSummaryOf(width=-1, height=1248) returns "-1 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0234 begin`);
      const actual: string = sizeSummaryOf(-1, 1248);
      logInfo(`sizeSummaryOf(width=-1, height=1248): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0235
     * @tc.name      WindowRatio_SizeSummaryOf_0235
     * @tc.desc      sizeSummaryOf(width=-1, height=1344) returns "-1 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0235 begin`);
      const actual: string = sizeSummaryOf(-1, 1344);
      logInfo(`sizeSummaryOf(width=-1, height=1344): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0236
     * @tc.name      WindowRatio_SizeSummaryOf_0236
     * @tc.desc      sizeSummaryOf(width=-1, height=1440) returns "-1 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0236 begin`);
      const actual: string = sizeSummaryOf(-1, 1440);
      logInfo(`sizeSummaryOf(width=-1, height=1440): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0237
     * @tc.name      WindowRatio_SizeSummaryOf_0237
     * @tc.desc      sizeSummaryOf(width=-1, height=1536) returns "-1 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0237 begin`);
      const actual: string = sizeSummaryOf(-1, 1536);
      logInfo(`sizeSummaryOf(width=-1, height=1536): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0238
     * @tc.name      WindowRatio_SizeSummaryOf_0238
     * @tc.desc      sizeSummaryOf(width=-1, height=1632) returns "-1 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0238 begin`);
      const actual: string = sizeSummaryOf(-1, 1632);
      logInfo(`sizeSummaryOf(width=-1, height=1632): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0239
     * @tc.name      WindowRatio_SizeSummaryOf_0239
     * @tc.desc      sizeSummaryOf(width=-1, height=1728) returns "-1 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0239 begin`);
      const actual: string = sizeSummaryOf(-1, 1728);
      logInfo(`sizeSummaryOf(width=-1, height=1728): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0240
     * @tc.name      WindowRatio_SizeSummaryOf_0240
     * @tc.desc      sizeSummaryOf(width=-1, height=1824) returns "-1 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0240 begin`);
      const actual: string = sizeSummaryOf(-1, 1824);
      logInfo(`sizeSummaryOf(width=-1, height=1824): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0241
     * @tc.name      WindowRatio_SizeSummaryOf_0241
     * @tc.desc      sizeSummaryOf(width=2, height=0) returns "2 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0241 begin`);
      const actual: string = sizeSummaryOf(2, 0);
      logInfo(`sizeSummaryOf(width=2, height=0): actual=${actual}`);
      expect(actual).assertEqual('2 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0242
     * @tc.name      WindowRatio_SizeSummaryOf_0242
     * @tc.desc      sizeSummaryOf(width=2, height=1) returns "2 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0242 begin`);
      const actual: string = sizeSummaryOf(2, 1);
      logInfo(`sizeSummaryOf(width=2, height=1): actual=${actual}`);
      expect(actual).assertEqual('2 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0243
     * @tc.name      WindowRatio_SizeSummaryOf_0243
     * @tc.desc      sizeSummaryOf(width=2, height=100) returns "2 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0243 begin`);
      const actual: string = sizeSummaryOf(2, 100);
      logInfo(`sizeSummaryOf(width=2, height=100): actual=${actual}`);
      expect(actual).assertEqual('2 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0244
     * @tc.name      WindowRatio_SizeSummaryOf_0244
     * @tc.desc      sizeSummaryOf(width=2, height=360) returns "2 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0244 begin`);
      const actual: string = sizeSummaryOf(2, 360);
      logInfo(`sizeSummaryOf(width=2, height=360): actual=${actual}`);
      expect(actual).assertEqual('2 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0244 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0245
     * @tc.name      WindowRatio_SizeSummaryOf_0245
     * @tc.desc      sizeSummaryOf(width=2, height=720) returns "2 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0245 begin`);
      const actual: string = sizeSummaryOf(2, 720);
      logInfo(`sizeSummaryOf(width=2, height=720): actual=${actual}`);
      expect(actual).assertEqual('2 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0245 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0246
     * @tc.name      WindowRatio_SizeSummaryOf_0246
     * @tc.desc      sizeSummaryOf(width=2, height=1080) returns "2 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0246 begin`);
      const actual: string = sizeSummaryOf(2, 1080);
      logInfo(`sizeSummaryOf(width=2, height=1080): actual=${actual}`);
      expect(actual).assertEqual('2 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0246 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0247
     * @tc.name      WindowRatio_SizeSummaryOf_0247
     * @tc.desc      sizeSummaryOf(width=2, height=1920) returns "2 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0247 begin`);
      const actual: string = sizeSummaryOf(2, 1920);
      logInfo(`sizeSummaryOf(width=2, height=1920): actual=${actual}`);
      expect(actual).assertEqual('2 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0247 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0248
     * @tc.name      WindowRatio_SizeSummaryOf_0248
     * @tc.desc      sizeSummaryOf(width=2, height=-1) returns "2 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0248 begin`);
      const actual: string = sizeSummaryOf(2, -1);
      logInfo(`sizeSummaryOf(width=2, height=-1): actual=${actual}`);
      expect(actual).assertEqual('2 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0248 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0249
     * @tc.name      WindowRatio_SizeSummaryOf_0249
     * @tc.desc      sizeSummaryOf(width=2, height=2) returns "2 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0249 begin`);
      const actual: string = sizeSummaryOf(2, 2);
      logInfo(`sizeSummaryOf(width=2, height=2): actual=${actual}`);
      expect(actual).assertEqual('2 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0249 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0250
     * @tc.name      WindowRatio_SizeSummaryOf_0250
     * @tc.desc      sizeSummaryOf(width=2, height=3) returns "2 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0250 begin`);
      const actual: string = sizeSummaryOf(2, 3);
      logInfo(`sizeSummaryOf(width=2, height=3): actual=${actual}`);
      expect(actual).assertEqual('2 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0250 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0251
     * @tc.name      WindowRatio_SizeSummaryOf_0251
     * @tc.desc      sizeSummaryOf(width=2, height=10) returns "2 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0251 begin`);
      const actual: string = sizeSummaryOf(2, 10);
      logInfo(`sizeSummaryOf(width=2, height=10): actual=${actual}`);
      expect(actual).assertEqual('2 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0251 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0252
     * @tc.name      WindowRatio_SizeSummaryOf_0252
     * @tc.desc      sizeSummaryOf(width=2, height=96) returns "2 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0252 begin`);
      const actual: string = sizeSummaryOf(2, 96);
      logInfo(`sizeSummaryOf(width=2, height=96): actual=${actual}`);
      expect(actual).assertEqual('2 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0252 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0253
     * @tc.name      WindowRatio_SizeSummaryOf_0253
     * @tc.desc      sizeSummaryOf(width=2, height=192) returns "2 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0253 begin`);
      const actual: string = sizeSummaryOf(2, 192);
      logInfo(`sizeSummaryOf(width=2, height=192): actual=${actual}`);
      expect(actual).assertEqual('2 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0253 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0254
     * @tc.name      WindowRatio_SizeSummaryOf_0254
     * @tc.desc      sizeSummaryOf(width=2, height=288) returns "2 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0254 begin`);
      const actual: string = sizeSummaryOf(2, 288);
      logInfo(`sizeSummaryOf(width=2, height=288): actual=${actual}`);
      expect(actual).assertEqual('2 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0254 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0255
     * @tc.name      WindowRatio_SizeSummaryOf_0255
     * @tc.desc      sizeSummaryOf(width=2, height=384) returns "2 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0255 begin`);
      const actual: string = sizeSummaryOf(2, 384);
      logInfo(`sizeSummaryOf(width=2, height=384): actual=${actual}`);
      expect(actual).assertEqual('2 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0255 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0256
     * @tc.name      WindowRatio_SizeSummaryOf_0256
     * @tc.desc      sizeSummaryOf(width=2, height=480) returns "2 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0256 begin`);
      const actual: string = sizeSummaryOf(2, 480);
      logInfo(`sizeSummaryOf(width=2, height=480): actual=${actual}`);
      expect(actual).assertEqual('2 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0256 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0257
     * @tc.name      WindowRatio_SizeSummaryOf_0257
     * @tc.desc      sizeSummaryOf(width=2, height=576) returns "2 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0257 begin`);
      const actual: string = sizeSummaryOf(2, 576);
      logInfo(`sizeSummaryOf(width=2, height=576): actual=${actual}`);
      expect(actual).assertEqual('2 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0257 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0258
     * @tc.name      WindowRatio_SizeSummaryOf_0258
     * @tc.desc      sizeSummaryOf(width=2, height=672) returns "2 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0258 begin`);
      const actual: string = sizeSummaryOf(2, 672);
      logInfo(`sizeSummaryOf(width=2, height=672): actual=${actual}`);
      expect(actual).assertEqual('2 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0258 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0259
     * @tc.name      WindowRatio_SizeSummaryOf_0259
     * @tc.desc      sizeSummaryOf(width=2, height=768) returns "2 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0259 begin`);
      const actual: string = sizeSummaryOf(2, 768);
      logInfo(`sizeSummaryOf(width=2, height=768): actual=${actual}`);
      expect(actual).assertEqual('2 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0259 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0260
     * @tc.name      WindowRatio_SizeSummaryOf_0260
     * @tc.desc      sizeSummaryOf(width=2, height=864) returns "2 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0260 begin`);
      const actual: string = sizeSummaryOf(2, 864);
      logInfo(`sizeSummaryOf(width=2, height=864): actual=${actual}`);
      expect(actual).assertEqual('2 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0260 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0261
     * @tc.name      WindowRatio_SizeSummaryOf_0261
     * @tc.desc      sizeSummaryOf(width=2, height=960) returns "2 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0261 begin`);
      const actual: string = sizeSummaryOf(2, 960);
      logInfo(`sizeSummaryOf(width=2, height=960): actual=${actual}`);
      expect(actual).assertEqual('2 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0261 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0262
     * @tc.name      WindowRatio_SizeSummaryOf_0262
     * @tc.desc      sizeSummaryOf(width=2, height=1056) returns "2 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0262 begin`);
      const actual: string = sizeSummaryOf(2, 1056);
      logInfo(`sizeSummaryOf(width=2, height=1056): actual=${actual}`);
      expect(actual).assertEqual('2 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0262 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0263
     * @tc.name      WindowRatio_SizeSummaryOf_0263
     * @tc.desc      sizeSummaryOf(width=2, height=1152) returns "2 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0263 begin`);
      const actual: string = sizeSummaryOf(2, 1152);
      logInfo(`sizeSummaryOf(width=2, height=1152): actual=${actual}`);
      expect(actual).assertEqual('2 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0263 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0264
     * @tc.name      WindowRatio_SizeSummaryOf_0264
     * @tc.desc      sizeSummaryOf(width=2, height=1248) returns "2 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0264 begin`);
      const actual: string = sizeSummaryOf(2, 1248);
      logInfo(`sizeSummaryOf(width=2, height=1248): actual=${actual}`);
      expect(actual).assertEqual('2 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0264 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0265
     * @tc.name      WindowRatio_SizeSummaryOf_0265
     * @tc.desc      sizeSummaryOf(width=2, height=1344) returns "2 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0265 begin`);
      const actual: string = sizeSummaryOf(2, 1344);
      logInfo(`sizeSummaryOf(width=2, height=1344): actual=${actual}`);
      expect(actual).assertEqual('2 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0265 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0266
     * @tc.name      WindowRatio_SizeSummaryOf_0266
     * @tc.desc      sizeSummaryOf(width=2, height=1440) returns "2 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0266 begin`);
      const actual: string = sizeSummaryOf(2, 1440);
      logInfo(`sizeSummaryOf(width=2, height=1440): actual=${actual}`);
      expect(actual).assertEqual('2 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0266 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0267
     * @tc.name      WindowRatio_SizeSummaryOf_0267
     * @tc.desc      sizeSummaryOf(width=2, height=1536) returns "2 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0267 begin`);
      const actual: string = sizeSummaryOf(2, 1536);
      logInfo(`sizeSummaryOf(width=2, height=1536): actual=${actual}`);
      expect(actual).assertEqual('2 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0267 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0268
     * @tc.name      WindowRatio_SizeSummaryOf_0268
     * @tc.desc      sizeSummaryOf(width=2, height=1632) returns "2 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0268 begin`);
      const actual: string = sizeSummaryOf(2, 1632);
      logInfo(`sizeSummaryOf(width=2, height=1632): actual=${actual}`);
      expect(actual).assertEqual('2 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0268 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0269
     * @tc.name      WindowRatio_SizeSummaryOf_0269
     * @tc.desc      sizeSummaryOf(width=2, height=1728) returns "2 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0269 begin`);
      const actual: string = sizeSummaryOf(2, 1728);
      logInfo(`sizeSummaryOf(width=2, height=1728): actual=${actual}`);
      expect(actual).assertEqual('2 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0269 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0270
     * @tc.name      WindowRatio_SizeSummaryOf_0270
     * @tc.desc      sizeSummaryOf(width=2, height=1824) returns "2 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0270 begin`);
      const actual: string = sizeSummaryOf(2, 1824);
      logInfo(`sizeSummaryOf(width=2, height=1824): actual=${actual}`);
      expect(actual).assertEqual('2 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0270 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0271
     * @tc.name      WindowRatio_SizeSummaryOf_0271
     * @tc.desc      sizeSummaryOf(width=3, height=0) returns "3 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0271 begin`);
      const actual: string = sizeSummaryOf(3, 0);
      logInfo(`sizeSummaryOf(width=3, height=0): actual=${actual}`);
      expect(actual).assertEqual('3 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0271 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0272
     * @tc.name      WindowRatio_SizeSummaryOf_0272
     * @tc.desc      sizeSummaryOf(width=3, height=1) returns "3 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0272 begin`);
      const actual: string = sizeSummaryOf(3, 1);
      logInfo(`sizeSummaryOf(width=3, height=1): actual=${actual}`);
      expect(actual).assertEqual('3 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0272 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0273
     * @tc.name      WindowRatio_SizeSummaryOf_0273
     * @tc.desc      sizeSummaryOf(width=3, height=100) returns "3 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0273 begin`);
      const actual: string = sizeSummaryOf(3, 100);
      logInfo(`sizeSummaryOf(width=3, height=100): actual=${actual}`);
      expect(actual).assertEqual('3 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0273 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0274
     * @tc.name      WindowRatio_SizeSummaryOf_0274
     * @tc.desc      sizeSummaryOf(width=3, height=360) returns "3 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0274 begin`);
      const actual: string = sizeSummaryOf(3, 360);
      logInfo(`sizeSummaryOf(width=3, height=360): actual=${actual}`);
      expect(actual).assertEqual('3 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0274 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0275
     * @tc.name      WindowRatio_SizeSummaryOf_0275
     * @tc.desc      sizeSummaryOf(width=3, height=720) returns "3 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0275 begin`);
      const actual: string = sizeSummaryOf(3, 720);
      logInfo(`sizeSummaryOf(width=3, height=720): actual=${actual}`);
      expect(actual).assertEqual('3 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0275 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0276
     * @tc.name      WindowRatio_SizeSummaryOf_0276
     * @tc.desc      sizeSummaryOf(width=3, height=1080) returns "3 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0276 begin`);
      const actual: string = sizeSummaryOf(3, 1080);
      logInfo(`sizeSummaryOf(width=3, height=1080): actual=${actual}`);
      expect(actual).assertEqual('3 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0276 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0277
     * @tc.name      WindowRatio_SizeSummaryOf_0277
     * @tc.desc      sizeSummaryOf(width=3, height=1920) returns "3 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0277 begin`);
      const actual: string = sizeSummaryOf(3, 1920);
      logInfo(`sizeSummaryOf(width=3, height=1920): actual=${actual}`);
      expect(actual).assertEqual('3 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0277 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0278
     * @tc.name      WindowRatio_SizeSummaryOf_0278
     * @tc.desc      sizeSummaryOf(width=3, height=-1) returns "3 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0278 begin`);
      const actual: string = sizeSummaryOf(3, -1);
      logInfo(`sizeSummaryOf(width=3, height=-1): actual=${actual}`);
      expect(actual).assertEqual('3 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0278 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0279
     * @tc.name      WindowRatio_SizeSummaryOf_0279
     * @tc.desc      sizeSummaryOf(width=3, height=2) returns "3 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0279 begin`);
      const actual: string = sizeSummaryOf(3, 2);
      logInfo(`sizeSummaryOf(width=3, height=2): actual=${actual}`);
      expect(actual).assertEqual('3 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0279 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0280
     * @tc.name      WindowRatio_SizeSummaryOf_0280
     * @tc.desc      sizeSummaryOf(width=3, height=3) returns "3 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0280 begin`);
      const actual: string = sizeSummaryOf(3, 3);
      logInfo(`sizeSummaryOf(width=3, height=3): actual=${actual}`);
      expect(actual).assertEqual('3 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0280 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0281
     * @tc.name      WindowRatio_SizeSummaryOf_0281
     * @tc.desc      sizeSummaryOf(width=3, height=10) returns "3 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0281 begin`);
      const actual: string = sizeSummaryOf(3, 10);
      logInfo(`sizeSummaryOf(width=3, height=10): actual=${actual}`);
      expect(actual).assertEqual('3 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0281 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0282
     * @tc.name      WindowRatio_SizeSummaryOf_0282
     * @tc.desc      sizeSummaryOf(width=3, height=96) returns "3 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0282 begin`);
      const actual: string = sizeSummaryOf(3, 96);
      logInfo(`sizeSummaryOf(width=3, height=96): actual=${actual}`);
      expect(actual).assertEqual('3 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0282 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0283
     * @tc.name      WindowRatio_SizeSummaryOf_0283
     * @tc.desc      sizeSummaryOf(width=3, height=192) returns "3 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0283 begin`);
      const actual: string = sizeSummaryOf(3, 192);
      logInfo(`sizeSummaryOf(width=3, height=192): actual=${actual}`);
      expect(actual).assertEqual('3 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0283 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0284
     * @tc.name      WindowRatio_SizeSummaryOf_0284
     * @tc.desc      sizeSummaryOf(width=3, height=288) returns "3 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0284 begin`);
      const actual: string = sizeSummaryOf(3, 288);
      logInfo(`sizeSummaryOf(width=3, height=288): actual=${actual}`);
      expect(actual).assertEqual('3 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0284 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0285
     * @tc.name      WindowRatio_SizeSummaryOf_0285
     * @tc.desc      sizeSummaryOf(width=3, height=384) returns "3 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0285 begin`);
      const actual: string = sizeSummaryOf(3, 384);
      logInfo(`sizeSummaryOf(width=3, height=384): actual=${actual}`);
      expect(actual).assertEqual('3 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0285 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0286
     * @tc.name      WindowRatio_SizeSummaryOf_0286
     * @tc.desc      sizeSummaryOf(width=3, height=480) returns "3 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0286 begin`);
      const actual: string = sizeSummaryOf(3, 480);
      logInfo(`sizeSummaryOf(width=3, height=480): actual=${actual}`);
      expect(actual).assertEqual('3 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0286 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0287
     * @tc.name      WindowRatio_SizeSummaryOf_0287
     * @tc.desc      sizeSummaryOf(width=3, height=576) returns "3 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0287 begin`);
      const actual: string = sizeSummaryOf(3, 576);
      logInfo(`sizeSummaryOf(width=3, height=576): actual=${actual}`);
      expect(actual).assertEqual('3 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0287 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0288
     * @tc.name      WindowRatio_SizeSummaryOf_0288
     * @tc.desc      sizeSummaryOf(width=3, height=672) returns "3 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0288 begin`);
      const actual: string = sizeSummaryOf(3, 672);
      logInfo(`sizeSummaryOf(width=3, height=672): actual=${actual}`);
      expect(actual).assertEqual('3 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0288 end`);
    });
  });
}
