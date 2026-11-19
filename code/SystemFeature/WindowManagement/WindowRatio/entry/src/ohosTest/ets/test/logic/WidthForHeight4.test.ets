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
import { widthForHeight } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for widthForHeight (26 cases). */
export default function widthForHeight4Test(): void {
  describe('WidthForHeight4Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0289
     * @tc.name      WindowRatio_WidthForHeight_0289
     * @tc.desc      widthForHeight(height=576, ratio=88.49) returns 50970.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0289 begin`);
      const actual: number = widthForHeight(576, 88.49);
      logInfo(`widthForHeight(height=576, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(50970.24, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0289 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0290
     * @tc.name      WindowRatio_WidthForHeight_0290
     * @tc.desc      widthForHeight(height=576, ratio=29) returns 16704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0290 begin`);
      const actual: number = widthForHeight(576, 29);
      logInfo(`widthForHeight(height=576, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(16704);
      logInfo(`${BUNDLE}WidthForHeight_0290 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0291
     * @tc.name      WindowRatio_WidthForHeight_0291
     * @tc.desc      widthForHeight(height=672, ratio=0.25) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0291 begin`);
      const actual: number = widthForHeight(672, 0.25);
      logInfo(`widthForHeight(height=672, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}WidthForHeight_0291 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0292
     * @tc.name      WindowRatio_WidthForHeight_0292
     * @tc.desc      widthForHeight(height=672, ratio=0.5) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0292 begin`);
      const actual: number = widthForHeight(672, 0.5);
      logInfo(`widthForHeight(height=672, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}WidthForHeight_0292 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0293
     * @tc.name      WindowRatio_WidthForHeight_0293
     * @tc.desc      widthForHeight(height=672, ratio=1) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0293 begin`);
      const actual: number = widthForHeight(672, 1);
      logInfo(`widthForHeight(height=672, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}WidthForHeight_0293 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0294
     * @tc.name      WindowRatio_WidthForHeight_0294
     * @tc.desc      widthForHeight(height=672, ratio=1.5) returns 1008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0294 begin`);
      const actual: number = widthForHeight(672, 1.5);
      logInfo(`widthForHeight(height=672, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(1008);
      logInfo(`${BUNDLE}WidthForHeight_0294 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0295
     * @tc.name      WindowRatio_WidthForHeight_0295
     * @tc.desc      widthForHeight(height=672, ratio=2) returns 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0295 begin`);
      const actual: number = widthForHeight(672, 2);
      logInfo(`widthForHeight(height=672, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}WidthForHeight_0295 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0296
     * @tc.name      WindowRatio_WidthForHeight_0296
     * @tc.desc      widthForHeight(height=672, ratio=-1) returns -672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0296 begin`);
      const actual: number = widthForHeight(672, -1);
      logInfo(`widthForHeight(height=672, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-672);
      logInfo(`${BUNDLE}WidthForHeight_0296 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0297
     * @tc.name      WindowRatio_WidthForHeight_0297
     * @tc.desc      widthForHeight(height=672, ratio=3) returns 2016
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0297 begin`);
      const actual: number = widthForHeight(672, 3);
      logInfo(`widthForHeight(height=672, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(2016);
      logInfo(`${BUNDLE}WidthForHeight_0297 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0298
     * @tc.name      WindowRatio_WidthForHeight_0298
     * @tc.desc      widthForHeight(height=672, ratio=35) returns 23520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0298 begin`);
      const actual: number = widthForHeight(672, 35);
      logInfo(`widthForHeight(height=672, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(23520);
      logInfo(`${BUNDLE}WidthForHeight_0298 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0299
     * @tc.name      WindowRatio_WidthForHeight_0299
     * @tc.desc      widthForHeight(height=672, ratio=45) returns 30240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0299 begin`);
      const actual: number = widthForHeight(672, 45);
      logInfo(`widthForHeight(height=672, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(30240);
      logInfo(`${BUNDLE}WidthForHeight_0299 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0300
     * @tc.name      WindowRatio_WidthForHeight_0300
     * @tc.desc      widthForHeight(height=672, ratio=55) returns 36960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0300 begin`);
      const actual: number = widthForHeight(672, 55);
      logInfo(`widthForHeight(height=672, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(36960);
      logInfo(`${BUNDLE}WidthForHeight_0300 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0301
     * @tc.name      WindowRatio_WidthForHeight_0301
     * @tc.desc      widthForHeight(height=672, ratio=65) returns 43680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0301 begin`);
      const actual: number = widthForHeight(672, 65);
      logInfo(`widthForHeight(height=672, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(43680);
      logInfo(`${BUNDLE}WidthForHeight_0301 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0302
     * @tc.name      WindowRatio_WidthForHeight_0302
     * @tc.desc      widthForHeight(height=672, ratio=70) returns 47040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0302 begin`);
      const actual: number = widthForHeight(672, 70);
      logInfo(`widthForHeight(height=672, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(47040);
      logInfo(`${BUNDLE}WidthForHeight_0302 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0303
     * @tc.name      WindowRatio_WidthForHeight_0303
     * @tc.desc      widthForHeight(height=672, ratio=80) returns 53760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0303 begin`);
      const actual: number = widthForHeight(672, 80);
      logInfo(`widthForHeight(height=672, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(53760);
      logInfo(`${BUNDLE}WidthForHeight_0303 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0304
     * @tc.name      WindowRatio_WidthForHeight_0304
     * @tc.desc      widthForHeight(height=672, ratio=85) returns 57120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0304 begin`);
      const actual: number = widthForHeight(672, 85);
      logInfo(`widthForHeight(height=672, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(57120);
      logInfo(`${BUNDLE}WidthForHeight_0304 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0305
     * @tc.name      WindowRatio_WidthForHeight_0305
     * @tc.desc      widthForHeight(height=672, ratio=90) returns 60480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0305 begin`);
      const actual: number = widthForHeight(672, 90);
      logInfo(`widthForHeight(height=672, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(60480);
      logInfo(`${BUNDLE}WidthForHeight_0305 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0306
     * @tc.name      WindowRatio_WidthForHeight_0306
     * @tc.desc      widthForHeight(height=672, ratio=95) returns 63840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0306 begin`);
      const actual: number = widthForHeight(672, 95);
      logInfo(`widthForHeight(height=672, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(63840);
      logInfo(`${BUNDLE}WidthForHeight_0306 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0307
     * @tc.name      WindowRatio_WidthForHeight_0307
     * @tc.desc      widthForHeight(height=672, ratio=88.49) returns 59465.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0307 begin`);
      const actual: number = widthForHeight(672, 88.49);
      logInfo(`widthForHeight(height=672, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(59465.28, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0307 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0308
     * @tc.name      WindowRatio_WidthForHeight_0308
     * @tc.desc      widthForHeight(height=672, ratio=29) returns 19488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0308 begin`);
      const actual: number = widthForHeight(672, 29);
      logInfo(`widthForHeight(height=672, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(19488);
      logInfo(`${BUNDLE}WidthForHeight_0308 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0309
     * @tc.name      WindowRatio_WidthForHeight_0309
     * @tc.desc      widthForHeight(height=768, ratio=2) returns 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0309 begin`);
      const actual: number = widthForHeight(768, 2);
      logInfo(`widthForHeight(height=768, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}WidthForHeight_0309 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0310
     * @tc.name      WindowRatio_WidthForHeight_0310
     * @tc.desc      widthForHeight(height=768, ratio=-1) returns -768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0310 begin`);
      const actual: number = widthForHeight(768, -1);
      logInfo(`widthForHeight(height=768, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-768);
      logInfo(`${BUNDLE}WidthForHeight_0310 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0311
     * @tc.name      WindowRatio_WidthForHeight_0311
     * @tc.desc      widthForHeight(height=768, ratio=3) returns 2304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0311 begin`);
      const actual: number = widthForHeight(768, 3);
      logInfo(`widthForHeight(height=768, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(2304);
      logInfo(`${BUNDLE}WidthForHeight_0311 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0312
     * @tc.name      WindowRatio_WidthForHeight_0312
     * @tc.desc      widthForHeight(height=768, ratio=55) returns 42240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0312 begin`);
      const actual: number = widthForHeight(768, 55);
      logInfo(`widthForHeight(height=768, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(42240);
      logInfo(`${BUNDLE}WidthForHeight_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0313
     * @tc.name      WindowRatio_WidthForHeight_0313
     * @tc.desc      widthForHeight(height=768, ratio=65) returns 49920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0313 begin`);
      const actual: number = widthForHeight(768, 65);
      logInfo(`widthForHeight(height=768, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(49920);
      logInfo(`${BUNDLE}WidthForHeight_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0314
     * @tc.name      WindowRatio_WidthForHeight_0314
     * @tc.desc      widthForHeight(height=768, ratio=80) returns 61440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0314 begin`);
      const actual: number = widthForHeight(768, 80);
      logInfo(`widthForHeight(height=768, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(61440);
      logInfo(`${BUNDLE}WidthForHeight_0314 end`);
    });
  });
}
