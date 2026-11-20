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

/** Logic checks for sizeSummaryOf (26 cases). */
export default function sizeSummaryOf4Test(): void {
  describe('SizeSummaryOf4Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0289
     * @tc.name      WindowRatio_SizeSummaryOf_0289
     * @tc.desc      sizeSummaryOf(width=3, height=768) returns "3 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0289 begin`);
      const actual: string = sizeSummaryOf(3, 768);
      logInfo(`sizeSummaryOf(width=3, height=768): actual=${actual}`);
      expect(actual).assertEqual('3 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0289 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0290
     * @tc.name      WindowRatio_SizeSummaryOf_0290
     * @tc.desc      sizeSummaryOf(width=3, height=864) returns "3 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0290 begin`);
      const actual: string = sizeSummaryOf(3, 864);
      logInfo(`sizeSummaryOf(width=3, height=864): actual=${actual}`);
      expect(actual).assertEqual('3 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0290 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0291
     * @tc.name      WindowRatio_SizeSummaryOf_0291
     * @tc.desc      sizeSummaryOf(width=3, height=960) returns "3 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0291 begin`);
      const actual: string = sizeSummaryOf(3, 960);
      logInfo(`sizeSummaryOf(width=3, height=960): actual=${actual}`);
      expect(actual).assertEqual('3 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0291 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0292
     * @tc.name      WindowRatio_SizeSummaryOf_0292
     * @tc.desc      sizeSummaryOf(width=3, height=1056) returns "3 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0292 begin`);
      const actual: string = sizeSummaryOf(3, 1056);
      logInfo(`sizeSummaryOf(width=3, height=1056): actual=${actual}`);
      expect(actual).assertEqual('3 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0292 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0293
     * @tc.name      WindowRatio_SizeSummaryOf_0293
     * @tc.desc      sizeSummaryOf(width=3, height=1152) returns "3 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0293 begin`);
      const actual: string = sizeSummaryOf(3, 1152);
      logInfo(`sizeSummaryOf(width=3, height=1152): actual=${actual}`);
      expect(actual).assertEqual('3 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0293 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0294
     * @tc.name      WindowRatio_SizeSummaryOf_0294
     * @tc.desc      sizeSummaryOf(width=3, height=1248) returns "3 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0294 begin`);
      const actual: string = sizeSummaryOf(3, 1248);
      logInfo(`sizeSummaryOf(width=3, height=1248): actual=${actual}`);
      expect(actual).assertEqual('3 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0294 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0295
     * @tc.name      WindowRatio_SizeSummaryOf_0295
     * @tc.desc      sizeSummaryOf(width=3, height=1344) returns "3 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0295 begin`);
      const actual: string = sizeSummaryOf(3, 1344);
      logInfo(`sizeSummaryOf(width=3, height=1344): actual=${actual}`);
      expect(actual).assertEqual('3 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0295 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0296
     * @tc.name      WindowRatio_SizeSummaryOf_0296
     * @tc.desc      sizeSummaryOf(width=3, height=1440) returns "3 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0296 begin`);
      const actual: string = sizeSummaryOf(3, 1440);
      logInfo(`sizeSummaryOf(width=3, height=1440): actual=${actual}`);
      expect(actual).assertEqual('3 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0296 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0297
     * @tc.name      WindowRatio_SizeSummaryOf_0297
     * @tc.desc      sizeSummaryOf(width=3, height=1536) returns "3 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0297 begin`);
      const actual: string = sizeSummaryOf(3, 1536);
      logInfo(`sizeSummaryOf(width=3, height=1536): actual=${actual}`);
      expect(actual).assertEqual('3 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0297 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0298
     * @tc.name      WindowRatio_SizeSummaryOf_0298
     * @tc.desc      sizeSummaryOf(width=3, height=1632) returns "3 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0298 begin`);
      const actual: string = sizeSummaryOf(3, 1632);
      logInfo(`sizeSummaryOf(width=3, height=1632): actual=${actual}`);
      expect(actual).assertEqual('3 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0298 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0299
     * @tc.name      WindowRatio_SizeSummaryOf_0299
     * @tc.desc      sizeSummaryOf(width=3, height=1728) returns "3 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0299 begin`);
      const actual: string = sizeSummaryOf(3, 1728);
      logInfo(`sizeSummaryOf(width=3, height=1728): actual=${actual}`);
      expect(actual).assertEqual('3 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0299 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0300
     * @tc.name      WindowRatio_SizeSummaryOf_0300
     * @tc.desc      sizeSummaryOf(width=3, height=1824) returns "3 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0300 begin`);
      const actual: string = sizeSummaryOf(3, 1824);
      logInfo(`sizeSummaryOf(width=3, height=1824): actual=${actual}`);
      expect(actual).assertEqual('3 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0300 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0301
     * @tc.name      WindowRatio_SizeSummaryOf_0301
     * @tc.desc      sizeSummaryOf(width=10, height=0) returns "10 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0301 begin`);
      const actual: string = sizeSummaryOf(10, 0);
      logInfo(`sizeSummaryOf(width=10, height=0): actual=${actual}`);
      expect(actual).assertEqual('10 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0301 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0302
     * @tc.name      WindowRatio_SizeSummaryOf_0302
     * @tc.desc      sizeSummaryOf(width=10, height=1) returns "10 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0302 begin`);
      const actual: string = sizeSummaryOf(10, 1);
      logInfo(`sizeSummaryOf(width=10, height=1): actual=${actual}`);
      expect(actual).assertEqual('10 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0302 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0303
     * @tc.name      WindowRatio_SizeSummaryOf_0303
     * @tc.desc      sizeSummaryOf(width=10, height=100) returns "10 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0303 begin`);
      const actual: string = sizeSummaryOf(10, 100);
      logInfo(`sizeSummaryOf(width=10, height=100): actual=${actual}`);
      expect(actual).assertEqual('10 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0303 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0304
     * @tc.name      WindowRatio_SizeSummaryOf_0304
     * @tc.desc      sizeSummaryOf(width=10, height=360) returns "10 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0304 begin`);
      const actual: string = sizeSummaryOf(10, 360);
      logInfo(`sizeSummaryOf(width=10, height=360): actual=${actual}`);
      expect(actual).assertEqual('10 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0304 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0305
     * @tc.name      WindowRatio_SizeSummaryOf_0305
     * @tc.desc      sizeSummaryOf(width=10, height=720) returns "10 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0305 begin`);
      const actual: string = sizeSummaryOf(10, 720);
      logInfo(`sizeSummaryOf(width=10, height=720): actual=${actual}`);
      expect(actual).assertEqual('10 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0305 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0306
     * @tc.name      WindowRatio_SizeSummaryOf_0306
     * @tc.desc      sizeSummaryOf(width=10, height=1080) returns "10 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0306 begin`);
      const actual: string = sizeSummaryOf(10, 1080);
      logInfo(`sizeSummaryOf(width=10, height=1080): actual=${actual}`);
      expect(actual).assertEqual('10 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0306 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0307
     * @tc.name      WindowRatio_SizeSummaryOf_0307
     * @tc.desc      sizeSummaryOf(width=10, height=1920) returns "10 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0307 begin`);
      const actual: string = sizeSummaryOf(10, 1920);
      logInfo(`sizeSummaryOf(width=10, height=1920): actual=${actual}`);
      expect(actual).assertEqual('10 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0307 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0308
     * @tc.name      WindowRatio_SizeSummaryOf_0308
     * @tc.desc      sizeSummaryOf(width=10, height=-1) returns "10 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0308 begin`);
      const actual: string = sizeSummaryOf(10, -1);
      logInfo(`sizeSummaryOf(width=10, height=-1): actual=${actual}`);
      expect(actual).assertEqual('10 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0308 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0309
     * @tc.name      WindowRatio_SizeSummaryOf_0309
     * @tc.desc      sizeSummaryOf(width=10, height=2) returns "10 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0309 begin`);
      const actual: string = sizeSummaryOf(10, 2);
      logInfo(`sizeSummaryOf(width=10, height=2): actual=${actual}`);
      expect(actual).assertEqual('10 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0309 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0310
     * @tc.name      WindowRatio_SizeSummaryOf_0310
     * @tc.desc      sizeSummaryOf(width=10, height=3) returns "10 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0310 begin`);
      const actual: string = sizeSummaryOf(10, 3);
      logInfo(`sizeSummaryOf(width=10, height=3): actual=${actual}`);
      expect(actual).assertEqual('10 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0310 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0311
     * @tc.name      WindowRatio_SizeSummaryOf_0311
     * @tc.desc      sizeSummaryOf(width=10, height=10) returns "10 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0311 begin`);
      const actual: string = sizeSummaryOf(10, 10);
      logInfo(`sizeSummaryOf(width=10, height=10): actual=${actual}`);
      expect(actual).assertEqual('10 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0311 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0312
     * @tc.name      WindowRatio_SizeSummaryOf_0312
     * @tc.desc      sizeSummaryOf(width=10, height=96) returns "10 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0312 begin`);
      const actual: string = sizeSummaryOf(10, 96);
      logInfo(`sizeSummaryOf(width=10, height=96): actual=${actual}`);
      expect(actual).assertEqual('10 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0313
     * @tc.name      WindowRatio_SizeSummaryOf_0313
     * @tc.desc      sizeSummaryOf(width=10, height=192) returns "10 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0313 begin`);
      const actual: string = sizeSummaryOf(10, 192);
      logInfo(`sizeSummaryOf(width=10, height=192): actual=${actual}`);
      expect(actual).assertEqual('10 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0314
     * @tc.name      WindowRatio_SizeSummaryOf_0314
     * @tc.desc      sizeSummaryOf(width=10, height=288) returns "10 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0314 begin`);
      const actual: string = sizeSummaryOf(10, 288);
      logInfo(`sizeSummaryOf(width=10, height=288): actual=${actual}`);
      expect(actual).assertEqual('10 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0314 end`);
    });
  });
}
