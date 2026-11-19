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
import { heightForWidth } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for heightForWidth (26 cases). */
export default function heightForWidth4Test(): void {
  describe('HeightForWidth4Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0289
     * @tc.name      WindowRatio_HeightForWidth_0289
     * @tc.desc      heightForWidth(width=576, ratio=65) returns 8.861538461538462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0289 begin`);
      const actual: number = heightForWidth(576, 65);
      logInfo(`heightForWidth(width=576, ratio=65): actual=${actual}`);
      expect(actual).assertClose(8.861538461538462, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0289 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0290
     * @tc.name      WindowRatio_HeightForWidth_0290
     * @tc.desc      heightForWidth(width=576, ratio=85) returns 6.776470588235294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0290 begin`);
      const actual: number = heightForWidth(576, 85);
      logInfo(`heightForWidth(width=576, ratio=85): actual=${actual}`);
      expect(actual).assertClose(6.776470588235294, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0290 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0291
     * @tc.name      WindowRatio_HeightForWidth_0291
     * @tc.desc      heightForWidth(width=576, ratio=95) returns 6.063157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0291 begin`);
      const actual: number = heightForWidth(576, 95);
      logInfo(`heightForWidth(width=576, ratio=95): actual=${actual}`);
      expect(actual).assertClose(6.063157894736842, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0291 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0292
     * @tc.name      WindowRatio_HeightForWidth_0292
     * @tc.desc      heightForWidth(width=576, ratio=37) returns 15.567567567567568
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0292 begin`);
      const actual: number = heightForWidth(576, 37);
      logInfo(`heightForWidth(width=576, ratio=37): actual=${actual}`);
      expect(actual).assertClose(15.567567567567568, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0292 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0293
     * @tc.name      WindowRatio_HeightForWidth_0293
     * @tc.desc      heightForWidth(width=576, ratio=138) returns 4.173913043478261
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0293 begin`);
      const actual: number = heightForWidth(576, 138);
      logInfo(`heightForWidth(width=576, ratio=138): actual=${actual}`);
      expect(actual).assertClose(4.173913043478261, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0293 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0294
     * @tc.name      WindowRatio_HeightForWidth_0294
     * @tc.desc      heightForWidth(width=672, ratio=0.25) returns 2688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0294 begin`);
      const actual: number = heightForWidth(672, 0.25);
      logInfo(`heightForWidth(width=672, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(2688);
      logInfo(`${BUNDLE}HeightForWidth_0294 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0295
     * @tc.name      WindowRatio_HeightForWidth_0295
     * @tc.desc      heightForWidth(width=672, ratio=1) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0295 begin`);
      const actual: number = heightForWidth(672, 1);
      logInfo(`heightForWidth(width=672, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}HeightForWidth_0295 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0296
     * @tc.name      WindowRatio_HeightForWidth_0296
     * @tc.desc      heightForWidth(width=672, ratio=0.5) returns 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0296 begin`);
      const actual: number = heightForWidth(672, 0.5);
      logInfo(`heightForWidth(width=672, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}HeightForWidth_0296 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0297
     * @tc.name      WindowRatio_HeightForWidth_0297
     * @tc.desc      heightForWidth(width=672, ratio=1.5) returns 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0297 begin`);
      const actual: number = heightForWidth(672, 1.5);
      logInfo(`heightForWidth(width=672, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(448);
      logInfo(`${BUNDLE}HeightForWidth_0297 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0298
     * @tc.name      WindowRatio_HeightForWidth_0298
     * @tc.desc      heightForWidth(width=672, ratio=2) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0298 begin`);
      const actual: number = heightForWidth(672, 2);
      logInfo(`heightForWidth(width=672, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}HeightForWidth_0298 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0299
     * @tc.name      WindowRatio_HeightForWidth_0299
     * @tc.desc      heightForWidth(width=672, ratio=3) returns 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0299 begin`);
      const actual: number = heightForWidth(672, 3);
      logInfo(`heightForWidth(width=672, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(224);
      logInfo(`${BUNDLE}HeightForWidth_0299 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0300
     * @tc.name      WindowRatio_HeightForWidth_0300
     * @tc.desc      heightForWidth(width=672, ratio=10) returns 67.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0300 begin`);
      const actual: number = heightForWidth(672, 10);
      logInfo(`heightForWidth(width=672, ratio=10): actual=${actual}`);
      expect(actual).assertClose(67.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0300 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0301
     * @tc.name      WindowRatio_HeightForWidth_0301
     * @tc.desc      heightForWidth(width=672, ratio=100) returns 6.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0301 begin`);
      const actual: number = heightForWidth(672, 100);
      logInfo(`heightForWidth(width=672, ratio=100): actual=${actual}`);
      expect(actual).assertClose(6.72, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0301 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0302
     * @tc.name      WindowRatio_HeightForWidth_0302
     * @tc.desc      heightForWidth(width=672, ratio=5) returns 134.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0302 begin`);
      const actual: number = heightForWidth(672, 5);
      logInfo(`heightForWidth(width=672, ratio=5): actual=${actual}`);
      expect(actual).assertClose(134.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0302 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0303
     * @tc.name      WindowRatio_HeightForWidth_0303
     * @tc.desc      heightForWidth(width=672, ratio=15) returns 44.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0303 begin`);
      const actual: number = heightForWidth(672, 15);
      logInfo(`heightForWidth(width=672, ratio=15): actual=${actual}`);
      expect(actual).assertClose(44.8, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0303 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0304
     * @tc.name      WindowRatio_HeightForWidth_0304
     * @tc.desc      heightForWidth(width=672, ratio=20) returns 33.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0304 begin`);
      const actual: number = heightForWidth(672, 20);
      logInfo(`heightForWidth(width=672, ratio=20): actual=${actual}`);
      expect(actual).assertClose(33.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0304 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0305
     * @tc.name      WindowRatio_HeightForWidth_0305
     * @tc.desc      heightForWidth(width=672, ratio=25) returns 26.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0305 begin`);
      const actual: number = heightForWidth(672, 25);
      logInfo(`heightForWidth(width=672, ratio=25): actual=${actual}`);
      expect(actual).assertClose(26.88, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0305 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0306
     * @tc.name      WindowRatio_HeightForWidth_0306
     * @tc.desc      heightForWidth(width=672, ratio=30) returns 22.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0306 begin`);
      const actual: number = heightForWidth(672, 30);
      logInfo(`heightForWidth(width=672, ratio=30): actual=${actual}`);
      expect(actual).assertClose(22.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0306 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0307
     * @tc.name      WindowRatio_HeightForWidth_0307
     * @tc.desc      heightForWidth(width=672, ratio=40) returns 16.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0307 begin`);
      const actual: number = heightForWidth(672, 40);
      logInfo(`heightForWidth(width=672, ratio=40): actual=${actual}`);
      expect(actual).assertClose(16.8, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0307 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0308
     * @tc.name      WindowRatio_HeightForWidth_0308
     * @tc.desc      heightForWidth(width=672, ratio=45) returns 14.933333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0308 begin`);
      const actual: number = heightForWidth(672, 45);
      logInfo(`heightForWidth(width=672, ratio=45): actual=${actual}`);
      expect(actual).assertClose(14.933333333333334, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0308 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0309
     * @tc.name      WindowRatio_HeightForWidth_0309
     * @tc.desc      heightForWidth(width=672, ratio=50) returns 13.44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0309 begin`);
      const actual: number = heightForWidth(672, 50);
      logInfo(`heightForWidth(width=672, ratio=50): actual=${actual}`);
      expect(actual).assertClose(13.44, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0309 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0310
     * @tc.name      WindowRatio_HeightForWidth_0310
     * @tc.desc      heightForWidth(width=672, ratio=55) returns 12.218181818181819
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0310 begin`);
      const actual: number = heightForWidth(672, 55);
      logInfo(`heightForWidth(width=672, ratio=55): actual=${actual}`);
      expect(actual).assertClose(12.218181818181819, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0310 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0311
     * @tc.name      WindowRatio_HeightForWidth_0311
     * @tc.desc      heightForWidth(width=672, ratio=60) returns 11.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0311 begin`);
      const actual: number = heightForWidth(672, 60);
      logInfo(`heightForWidth(width=672, ratio=60): actual=${actual}`);
      expect(actual).assertClose(11.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0311 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0312
     * @tc.name      WindowRatio_HeightForWidth_0312
     * @tc.desc      heightForWidth(width=672, ratio=65) returns 10.338461538461539
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0312 begin`);
      const actual: number = heightForWidth(672, 65);
      logInfo(`heightForWidth(width=672, ratio=65): actual=${actual}`);
      expect(actual).assertClose(10.338461538461539, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0313
     * @tc.name      WindowRatio_HeightForWidth_0313
     * @tc.desc      heightForWidth(width=672, ratio=75) returns 8.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0313 begin`);
      const actual: number = heightForWidth(672, 75);
      logInfo(`heightForWidth(width=672, ratio=75): actual=${actual}`);
      expect(actual).assertClose(8.96, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0314
     * @tc.name      WindowRatio_HeightForWidth_0314
     * @tc.desc      heightForWidth(width=672, ratio=80) returns 8.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0314 begin`);
      const actual: number = heightForWidth(672, 80);
      logInfo(`heightForWidth(width=672, ratio=80): actual=${actual}`);
      expect(actual).assertClose(8.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0314 end`);
    });
  });
}
