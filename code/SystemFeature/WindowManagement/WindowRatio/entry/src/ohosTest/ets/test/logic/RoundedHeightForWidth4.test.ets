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
import { roundedHeightForWidth } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for roundedHeightForWidth (26 cases). */
export default function roundedHeightForWidth4Test(): void {
  describe('RoundedHeightForWidth4Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0289
     * @tc.name      WindowRatio_RoundedHeightForWidth_0289
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0289 begin`);
      const actual: number = roundedHeightForWidth(-1, 5);
      logInfo(`roundedHeightForWidth(width=-1, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0289 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0290
     * @tc.name      WindowRatio_RoundedHeightForWidth_0290
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0290 begin`);
      const actual: number = roundedHeightForWidth(-1, 15);
      logInfo(`roundedHeightForWidth(width=-1, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0290 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0291
     * @tc.name      WindowRatio_RoundedHeightForWidth_0291
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0291 begin`);
      const actual: number = roundedHeightForWidth(-1, 20);
      logInfo(`roundedHeightForWidth(width=-1, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0291 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0292
     * @tc.name      WindowRatio_RoundedHeightForWidth_0292
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0292 begin`);
      const actual: number = roundedHeightForWidth(-1, 25);
      logInfo(`roundedHeightForWidth(width=-1, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0292 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0293
     * @tc.name      WindowRatio_RoundedHeightForWidth_0293
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0293 begin`);
      const actual: number = roundedHeightForWidth(-1, 30);
      logInfo(`roundedHeightForWidth(width=-1, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0293 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0294
     * @tc.name      WindowRatio_RoundedHeightForWidth_0294
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0294 begin`);
      const actual: number = roundedHeightForWidth(-1, 35);
      logInfo(`roundedHeightForWidth(width=-1, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0294 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0295
     * @tc.name      WindowRatio_RoundedHeightForWidth_0295
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0295 begin`);
      const actual: number = roundedHeightForWidth(-1, 40);
      logInfo(`roundedHeightForWidth(width=-1, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0295 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0296
     * @tc.name      WindowRatio_RoundedHeightForWidth_0296
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0296 begin`);
      const actual: number = roundedHeightForWidth(-1, 45);
      logInfo(`roundedHeightForWidth(width=-1, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0296 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0297
     * @tc.name      WindowRatio_RoundedHeightForWidth_0297
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0297 begin`);
      const actual: number = roundedHeightForWidth(-1, 50);
      logInfo(`roundedHeightForWidth(width=-1, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0297 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0298
     * @tc.name      WindowRatio_RoundedHeightForWidth_0298
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0298 begin`);
      const actual: number = roundedHeightForWidth(-1, 55);
      logInfo(`roundedHeightForWidth(width=-1, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0298 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0299
     * @tc.name      WindowRatio_RoundedHeightForWidth_0299
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0299 begin`);
      const actual: number = roundedHeightForWidth(-1, 60);
      logInfo(`roundedHeightForWidth(width=-1, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0299 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0300
     * @tc.name      WindowRatio_RoundedHeightForWidth_0300
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0300 begin`);
      const actual: number = roundedHeightForWidth(-1, 65);
      logInfo(`roundedHeightForWidth(width=-1, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0300 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0301
     * @tc.name      WindowRatio_RoundedHeightForWidth_0301
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0301 begin`);
      const actual: number = roundedHeightForWidth(-1, 70);
      logInfo(`roundedHeightForWidth(width=-1, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0301 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0302
     * @tc.name      WindowRatio_RoundedHeightForWidth_0302
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0302 begin`);
      const actual: number = roundedHeightForWidth(-1, 75);
      logInfo(`roundedHeightForWidth(width=-1, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0302 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0303
     * @tc.name      WindowRatio_RoundedHeightForWidth_0303
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0303 begin`);
      const actual: number = roundedHeightForWidth(-1, 80);
      logInfo(`roundedHeightForWidth(width=-1, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0303 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0304
     * @tc.name      WindowRatio_RoundedHeightForWidth_0304
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0304 begin`);
      const actual: number = roundedHeightForWidth(-1, 85);
      logInfo(`roundedHeightForWidth(width=-1, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0304 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0305
     * @tc.name      WindowRatio_RoundedHeightForWidth_0305
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0305 begin`);
      const actual: number = roundedHeightForWidth(-1, 90);
      logInfo(`roundedHeightForWidth(width=-1, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0305 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0306
     * @tc.name      WindowRatio_RoundedHeightForWidth_0306
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0306 begin`);
      const actual: number = roundedHeightForWidth(-1, 95);
      logInfo(`roundedHeightForWidth(width=-1, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0306 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0307
     * @tc.name      WindowRatio_RoundedHeightForWidth_0307
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=77.45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0307 begin`);
      const actual: number = roundedHeightForWidth(-1, 77.45);
      logInfo(`roundedHeightForWidth(width=-1, ratio=77.45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0307 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0308
     * @tc.name      WindowRatio_RoundedHeightForWidth_0308
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0308 begin`);
      const actual: number = roundedHeightForWidth(-1, -52);
      logInfo(`roundedHeightForWidth(width=-1, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0308 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0309
     * @tc.name      WindowRatio_RoundedHeightForWidth_0309
     * @tc.desc      roundedHeightForWidth(width=2, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0309 begin`);
      const actual: number = roundedHeightForWidth(2, 0);
      logInfo(`roundedHeightForWidth(width=2, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0309 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0310
     * @tc.name      WindowRatio_RoundedHeightForWidth_0310
     * @tc.desc      roundedHeightForWidth(width=2, ratio=0.25) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0310 begin`);
      const actual: number = roundedHeightForWidth(2, 0.25);
      logInfo(`roundedHeightForWidth(width=2, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0310 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0311
     * @tc.name      WindowRatio_RoundedHeightForWidth_0311
     * @tc.desc      roundedHeightForWidth(width=2, ratio=0.5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0311 begin`);
      const actual: number = roundedHeightForWidth(2, 0.5);
      logInfo(`roundedHeightForWidth(width=2, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0311 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0312
     * @tc.name      WindowRatio_RoundedHeightForWidth_0312
     * @tc.desc      roundedHeightForWidth(width=2, ratio=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0312 begin`);
      const actual: number = roundedHeightForWidth(2, 1);
      logInfo(`roundedHeightForWidth(width=2, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0313
     * @tc.name      WindowRatio_RoundedHeightForWidth_0313
     * @tc.desc      roundedHeightForWidth(width=2, ratio=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0313 begin`);
      const actual: number = roundedHeightForWidth(2, 1.5);
      logInfo(`roundedHeightForWidth(width=2, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0314
     * @tc.name      WindowRatio_RoundedHeightForWidth_0314
     * @tc.desc      roundedHeightForWidth(width=2, ratio=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0314 begin`);
      const actual: number = roundedHeightForWidth(2, 2);
      logInfo(`roundedHeightForWidth(width=2, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0314 end`);
    });
  });
}
