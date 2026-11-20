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

/** Logic checks for heightForWidth (96 cases). */
export default function heightForWidth3Test(): void {
  describe('HeightForWidth3Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0193
     * @tc.name      WindowRatio_HeightForWidth_0193
     * @tc.desc      heightForWidth(width=3, ratio=65) returns 0.046153846153846156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0193 begin`);
      const actual: number = heightForWidth(3, 65);
      logInfo(`heightForWidth(width=3, ratio=65): actual=${actual}`);
      expect(actual).assertClose(0.046153846153846156, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0194
     * @tc.name      WindowRatio_HeightForWidth_0194
     * @tc.desc      heightForWidth(width=3, ratio=70) returns 0.04285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0194 begin`);
      const actual: number = heightForWidth(3, 70);
      logInfo(`heightForWidth(width=3, ratio=70): actual=${actual}`);
      expect(actual).assertClose(0.04285714285714286, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0195
     * @tc.name      WindowRatio_HeightForWidth_0195
     * @tc.desc      heightForWidth(width=3, ratio=80) returns 0.0375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0195 begin`);
      const actual: number = heightForWidth(3, 80);
      logInfo(`heightForWidth(width=3, ratio=80): actual=${actual}`);
      expect(actual).assertClose(0.0375, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0196
     * @tc.name      WindowRatio_HeightForWidth_0196
     * @tc.desc      heightForWidth(width=3, ratio=85) returns 0.03529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0196 begin`);
      const actual: number = heightForWidth(3, 85);
      logInfo(`heightForWidth(width=3, ratio=85): actual=${actual}`);
      expect(actual).assertClose(0.03529411764705882, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0197
     * @tc.name      WindowRatio_HeightForWidth_0197
     * @tc.desc      heightForWidth(width=3, ratio=95) returns 0.031578947368421054
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0197 begin`);
      const actual: number = heightForWidth(3, 95);
      logInfo(`heightForWidth(width=3, ratio=95): actual=${actual}`);
      expect(actual).assertClose(0.031578947368421054, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0198
     * @tc.name      WindowRatio_HeightForWidth_0198
     * @tc.desc      heightForWidth(width=3, ratio=37) returns 0.08108108108108109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0198 begin`);
      const actual: number = heightForWidth(3, 37);
      logInfo(`heightForWidth(width=3, ratio=37): actual=${actual}`);
      expect(actual).assertClose(0.08108108108108109, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0199
     * @tc.name      WindowRatio_HeightForWidth_0199
     * @tc.desc      heightForWidth(width=3, ratio=138) returns 0.021739130434782608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0199 begin`);
      const actual: number = heightForWidth(3, 138);
      logInfo(`heightForWidth(width=3, ratio=138): actual=${actual}`);
      expect(actual).assertClose(0.021739130434782608, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0200
     * @tc.name      WindowRatio_HeightForWidth_0200
     * @tc.desc      heightForWidth(width=10, ratio=0.25) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0200 begin`);
      const actual: number = heightForWidth(10, 0.25);
      logInfo(`heightForWidth(width=10, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}HeightForWidth_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0201
     * @tc.name      WindowRatio_HeightForWidth_0201
     * @tc.desc      heightForWidth(width=10, ratio=35) returns 0.2857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0201 begin`);
      const actual: number = heightForWidth(10, 35);
      logInfo(`heightForWidth(width=10, ratio=35): actual=${actual}`);
      expect(actual).assertClose(0.2857142857142857, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0202
     * @tc.name      WindowRatio_HeightForWidth_0202
     * @tc.desc      heightForWidth(width=10, ratio=40) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0202 begin`);
      const actual: number = heightForWidth(10, 40);
      logInfo(`heightForWidth(width=10, ratio=40): actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0203
     * @tc.name      WindowRatio_HeightForWidth_0203
     * @tc.desc      heightForWidth(width=10, ratio=45) returns 0.2222222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0203 begin`);
      const actual: number = heightForWidth(10, 45);
      logInfo(`heightForWidth(width=10, ratio=45): actual=${actual}`);
      expect(actual).assertClose(0.2222222222222222, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0204
     * @tc.name      WindowRatio_HeightForWidth_0204
     * @tc.desc      heightForWidth(width=10, ratio=55) returns 0.18181818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0204 begin`);
      const actual: number = heightForWidth(10, 55);
      logInfo(`heightForWidth(width=10, ratio=55): actual=${actual}`);
      expect(actual).assertClose(0.18181818181818182, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0205
     * @tc.name      WindowRatio_HeightForWidth_0205
     * @tc.desc      heightForWidth(width=10, ratio=60) returns 0.16666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0205 begin`);
      const actual: number = heightForWidth(10, 60);
      logInfo(`heightForWidth(width=10, ratio=60): actual=${actual}`);
      expect(actual).assertClose(0.16666666666666666, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0206
     * @tc.name      WindowRatio_HeightForWidth_0206
     * @tc.desc      heightForWidth(width=10, ratio=65) returns 0.15384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0206 begin`);
      const actual: number = heightForWidth(10, 65);
      logInfo(`heightForWidth(width=10, ratio=65): actual=${actual}`);
      expect(actual).assertClose(0.15384615384615385, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0207
     * @tc.name      WindowRatio_HeightForWidth_0207
     * @tc.desc      heightForWidth(width=10, ratio=70) returns 0.14285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0207 begin`);
      const actual: number = heightForWidth(10, 70);
      logInfo(`heightForWidth(width=10, ratio=70): actual=${actual}`);
      expect(actual).assertClose(0.14285714285714285, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0208
     * @tc.name      WindowRatio_HeightForWidth_0208
     * @tc.desc      heightForWidth(width=10, ratio=80) returns 0.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0208 begin`);
      const actual: number = heightForWidth(10, 80);
      logInfo(`heightForWidth(width=10, ratio=80): actual=${actual}`);
      expect(actual).assertClose(0.125, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0209
     * @tc.name      WindowRatio_HeightForWidth_0209
     * @tc.desc      heightForWidth(width=10, ratio=85) returns 0.11764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0209 begin`);
      const actual: number = heightForWidth(10, 85);
      logInfo(`heightForWidth(width=10, ratio=85): actual=${actual}`);
      expect(actual).assertClose(0.11764705882352941, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0210
     * @tc.name      WindowRatio_HeightForWidth_0210
     * @tc.desc      heightForWidth(width=10, ratio=90) returns 0.1111111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0210 begin`);
      const actual: number = heightForWidth(10, 90);
      logInfo(`heightForWidth(width=10, ratio=90): actual=${actual}`);
      expect(actual).assertClose(0.1111111111111111, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0211
     * @tc.name      WindowRatio_HeightForWidth_0211
     * @tc.desc      heightForWidth(width=10, ratio=95) returns 0.10526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0211 begin`);
      const actual: number = heightForWidth(10, 95);
      logInfo(`heightForWidth(width=10, ratio=95): actual=${actual}`);
      expect(actual).assertClose(0.10526315789473684, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0212
     * @tc.name      WindowRatio_HeightForWidth_0212
     * @tc.desc      heightForWidth(width=10, ratio=37) returns 0.2702702702702703
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0212 begin`);
      const actual: number = heightForWidth(10, 37);
      logInfo(`heightForWidth(width=10, ratio=37): actual=${actual}`);
      expect(actual).assertClose(0.2702702702702703, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0213
     * @tc.name      WindowRatio_HeightForWidth_0213
     * @tc.desc      heightForWidth(width=10, ratio=138) returns 0.07246376811594203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0213 begin`);
      const actual: number = heightForWidth(10, 138);
      logInfo(`heightForWidth(width=10, ratio=138): actual=${actual}`);
      expect(actual).assertClose(0.07246376811594203, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0214
     * @tc.name      WindowRatio_HeightForWidth_0214
     * @tc.desc      heightForWidth(width=96, ratio=100) returns 0.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0214 begin`);
      const actual: number = heightForWidth(96, 100);
      logInfo(`heightForWidth(width=96, ratio=100): actual=${actual}`);
      expect(actual).assertClose(0.96, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0215
     * @tc.name      WindowRatio_HeightForWidth_0215
     * @tc.desc      heightForWidth(width=96, ratio=15) returns 6.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0215 begin`);
      const actual: number = heightForWidth(96, 15);
      logInfo(`heightForWidth(width=96, ratio=15): actual=${actual}`);
      expect(actual).assertClose(6.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0216
     * @tc.name      WindowRatio_HeightForWidth_0216
     * @tc.desc      heightForWidth(width=96, ratio=25) returns 3.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0216 begin`);
      const actual: number = heightForWidth(96, 25);
      logInfo(`heightForWidth(width=96, ratio=25): actual=${actual}`);
      expect(actual).assertClose(3.84, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0217
     * @tc.name      WindowRatio_HeightForWidth_0217
     * @tc.desc      heightForWidth(width=96, ratio=30) returns 3.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0217 begin`);
      const actual: number = heightForWidth(96, 30);
      logInfo(`heightForWidth(width=96, ratio=30): actual=${actual}`);
      expect(actual).assertClose(3.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0218
     * @tc.name      WindowRatio_HeightForWidth_0218
     * @tc.desc      heightForWidth(width=96, ratio=35) returns 2.742857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0218 begin`);
      const actual: number = heightForWidth(96, 35);
      logInfo(`heightForWidth(width=96, ratio=35): actual=${actual}`);
      expect(actual).assertClose(2.742857142857143, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0219
     * @tc.name      WindowRatio_HeightForWidth_0219
     * @tc.desc      heightForWidth(width=96, ratio=40) returns 2.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0219 begin`);
      const actual: number = heightForWidth(96, 40);
      logInfo(`heightForWidth(width=96, ratio=40): actual=${actual}`);
      expect(actual).assertClose(2.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0220
     * @tc.name      WindowRatio_HeightForWidth_0220
     * @tc.desc      heightForWidth(width=96, ratio=45) returns 2.1333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0220 begin`);
      const actual: number = heightForWidth(96, 45);
      logInfo(`heightForWidth(width=96, ratio=45): actual=${actual}`);
      expect(actual).assertClose(2.1333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0221
     * @tc.name      WindowRatio_HeightForWidth_0221
     * @tc.desc      heightForWidth(width=96, ratio=50) returns 1.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0221 begin`);
      const actual: number = heightForWidth(96, 50);
      logInfo(`heightForWidth(width=96, ratio=50): actual=${actual}`);
      expect(actual).assertClose(1.92, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0222
     * @tc.name      WindowRatio_HeightForWidth_0222
     * @tc.desc      heightForWidth(width=96, ratio=55) returns 1.7454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0222 begin`);
      const actual: number = heightForWidth(96, 55);
      logInfo(`heightForWidth(width=96, ratio=55): actual=${actual}`);
      expect(actual).assertClose(1.7454545454545454, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0223
     * @tc.name      WindowRatio_HeightForWidth_0223
     * @tc.desc      heightForWidth(width=96, ratio=60) returns 1.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0223 begin`);
      const actual: number = heightForWidth(96, 60);
      logInfo(`heightForWidth(width=96, ratio=60): actual=${actual}`);
      expect(actual).assertClose(1.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0224
     * @tc.name      WindowRatio_HeightForWidth_0224
     * @tc.desc      heightForWidth(width=96, ratio=65) returns 1.476923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0224 begin`);
      const actual: number = heightForWidth(96, 65);
      logInfo(`heightForWidth(width=96, ratio=65): actual=${actual}`);
      expect(actual).assertClose(1.476923076923077, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0225
     * @tc.name      WindowRatio_HeightForWidth_0225
     * @tc.desc      heightForWidth(width=96, ratio=70) returns 1.3714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0225 begin`);
      const actual: number = heightForWidth(96, 70);
      logInfo(`heightForWidth(width=96, ratio=70): actual=${actual}`);
      expect(actual).assertClose(1.3714285714285714, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0226
     * @tc.name      WindowRatio_HeightForWidth_0226
     * @tc.desc      heightForWidth(width=96, ratio=75) returns 1.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0226 begin`);
      const actual: number = heightForWidth(96, 75);
      logInfo(`heightForWidth(width=96, ratio=75): actual=${actual}`);
      expect(actual).assertClose(1.28, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0227
     * @tc.name      WindowRatio_HeightForWidth_0227
     * @tc.desc      heightForWidth(width=96, ratio=80) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0227 begin`);
      const actual: number = heightForWidth(96, 80);
      logInfo(`heightForWidth(width=96, ratio=80): actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0228
     * @tc.name      WindowRatio_HeightForWidth_0228
     * @tc.desc      heightForWidth(width=96, ratio=85) returns 1.1294117647058823
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0228 begin`);
      const actual: number = heightForWidth(96, 85);
      logInfo(`heightForWidth(width=96, ratio=85): actual=${actual}`);
      expect(actual).assertClose(1.1294117647058823, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0229
     * @tc.name      WindowRatio_HeightForWidth_0229
     * @tc.desc      heightForWidth(width=96, ratio=90) returns 1.0666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0229 begin`);
      const actual: number = heightForWidth(96, 90);
      logInfo(`heightForWidth(width=96, ratio=90): actual=${actual}`);
      expect(actual).assertClose(1.0666666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0230
     * @tc.name      WindowRatio_HeightForWidth_0230
     * @tc.desc      heightForWidth(width=96, ratio=95) returns 1.0105263157894737
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0230 begin`);
      const actual: number = heightForWidth(96, 95);
      logInfo(`heightForWidth(width=96, ratio=95): actual=${actual}`);
      expect(actual).assertClose(1.0105263157894737, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0231
     * @tc.name      WindowRatio_HeightForWidth_0231
     * @tc.desc      heightForWidth(width=96, ratio=37) returns 2.5945945945945947
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0231 begin`);
      const actual: number = heightForWidth(96, 37);
      logInfo(`heightForWidth(width=96, ratio=37): actual=${actual}`);
      expect(actual).assertClose(2.5945945945945947, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0232
     * @tc.name      WindowRatio_HeightForWidth_0232
     * @tc.desc      heightForWidth(width=96, ratio=138) returns 0.6956521739130435
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0232 begin`);
      const actual: number = heightForWidth(96, 138);
      logInfo(`heightForWidth(width=96, ratio=138): actual=${actual}`);
      expect(actual).assertClose(0.6956521739130435, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0233
     * @tc.name      WindowRatio_HeightForWidth_0233
     * @tc.desc      heightForWidth(width=192, ratio=0.25) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0233 begin`);
      const actual: number = heightForWidth(192, 0.25);
      logInfo(`heightForWidth(width=192, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}HeightForWidth_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0234
     * @tc.name      WindowRatio_HeightForWidth_0234
     * @tc.desc      heightForWidth(width=192, ratio=15) returns 12.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0234 begin`);
      const actual: number = heightForWidth(192, 15);
      logInfo(`heightForWidth(width=192, ratio=15): actual=${actual}`);
      expect(actual).assertClose(12.8, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0235
     * @tc.name      WindowRatio_HeightForWidth_0235
     * @tc.desc      heightForWidth(width=192, ratio=25) returns 7.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0235 begin`);
      const actual: number = heightForWidth(192, 25);
      logInfo(`heightForWidth(width=192, ratio=25): actual=${actual}`);
      expect(actual).assertClose(7.68, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0236
     * @tc.name      WindowRatio_HeightForWidth_0236
     * @tc.desc      heightForWidth(width=192, ratio=35) returns 5.485714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0236 begin`);
      const actual: number = heightForWidth(192, 35);
      logInfo(`heightForWidth(width=192, ratio=35): actual=${actual}`);
      expect(actual).assertClose(5.485714285714286, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0237
     * @tc.name      WindowRatio_HeightForWidth_0237
     * @tc.desc      heightForWidth(width=192, ratio=45) returns 4.266666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0237 begin`);
      const actual: number = heightForWidth(192, 45);
      logInfo(`heightForWidth(width=192, ratio=45): actual=${actual}`);
      expect(actual).assertClose(4.266666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0238
     * @tc.name      WindowRatio_HeightForWidth_0238
     * @tc.desc      heightForWidth(width=192, ratio=55) returns 3.4909090909090907
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0238 begin`);
      const actual: number = heightForWidth(192, 55);
      logInfo(`heightForWidth(width=192, ratio=55): actual=${actual}`);
      expect(actual).assertClose(3.4909090909090907, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0239
     * @tc.name      WindowRatio_HeightForWidth_0239
     * @tc.desc      heightForWidth(width=192, ratio=65) returns 2.953846153846154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0239 begin`);
      const actual: number = heightForWidth(192, 65);
      logInfo(`heightForWidth(width=192, ratio=65): actual=${actual}`);
      expect(actual).assertClose(2.953846153846154, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0240
     * @tc.name      WindowRatio_HeightForWidth_0240
     * @tc.desc      heightForWidth(width=192, ratio=75) returns 2.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0240 begin`);
      const actual: number = heightForWidth(192, 75);
      logInfo(`heightForWidth(width=192, ratio=75): actual=${actual}`);
      expect(actual).assertClose(2.56, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0241
     * @tc.name      WindowRatio_HeightForWidth_0241
     * @tc.desc      heightForWidth(width=192, ratio=85) returns 2.2588235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0241 begin`);
      const actual: number = heightForWidth(192, 85);
      logInfo(`heightForWidth(width=192, ratio=85): actual=${actual}`);
      expect(actual).assertClose(2.2588235294117647, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0242
     * @tc.name      WindowRatio_HeightForWidth_0242
     * @tc.desc      heightForWidth(width=192, ratio=95) returns 2.0210526315789474
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0242 begin`);
      const actual: number = heightForWidth(192, 95);
      logInfo(`heightForWidth(width=192, ratio=95): actual=${actual}`);
      expect(actual).assertClose(2.0210526315789474, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0243
     * @tc.name      WindowRatio_HeightForWidth_0243
     * @tc.desc      heightForWidth(width=192, ratio=37) returns 5.1891891891891895
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0243 begin`);
      const actual: number = heightForWidth(192, 37);
      logInfo(`heightForWidth(width=192, ratio=37): actual=${actual}`);
      expect(actual).assertClose(5.1891891891891895, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0244
     * @tc.name      WindowRatio_HeightForWidth_0244
     * @tc.desc      heightForWidth(width=192, ratio=138) returns 1.391304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0244 begin`);
      const actual: number = heightForWidth(192, 138);
      logInfo(`heightForWidth(width=192, ratio=138): actual=${actual}`);
      expect(actual).assertClose(1.391304347826087, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0244 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0245
     * @tc.name      WindowRatio_HeightForWidth_0245
     * @tc.desc      heightForWidth(width=288, ratio=0.25) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0245 begin`);
      const actual: number = heightForWidth(288, 0.25);
      logInfo(`heightForWidth(width=288, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}HeightForWidth_0245 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0246
     * @tc.name      WindowRatio_HeightForWidth_0246
     * @tc.desc      heightForWidth(width=288, ratio=1) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0246 begin`);
      const actual: number = heightForWidth(288, 1);
      logInfo(`heightForWidth(width=288, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}HeightForWidth_0246 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0247
     * @tc.name      WindowRatio_HeightForWidth_0247
     * @tc.desc      heightForWidth(width=288, ratio=0.5) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0247 begin`);
      const actual: number = heightForWidth(288, 0.5);
      logInfo(`heightForWidth(width=288, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}HeightForWidth_0247 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0248
     * @tc.name      WindowRatio_HeightForWidth_0248
     * @tc.desc      heightForWidth(width=288, ratio=100) returns 2.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0248 begin`);
      const actual: number = heightForWidth(288, 100);
      logInfo(`heightForWidth(width=288, ratio=100): actual=${actual}`);
      expect(actual).assertClose(2.88, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0248 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0249
     * @tc.name      WindowRatio_HeightForWidth_0249
     * @tc.desc      heightForWidth(width=288, ratio=5) returns 57.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0249 begin`);
      const actual: number = heightForWidth(288, 5);
      logInfo(`heightForWidth(width=288, ratio=5): actual=${actual}`);
      expect(actual).assertClose(57.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0249 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0250
     * @tc.name      WindowRatio_HeightForWidth_0250
     * @tc.desc      heightForWidth(width=288, ratio=25) returns 11.52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0250 begin`);
      const actual: number = heightForWidth(288, 25);
      logInfo(`heightForWidth(width=288, ratio=25): actual=${actual}`);
      expect(actual).assertClose(11.52, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0250 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0251
     * @tc.name      WindowRatio_HeightForWidth_0251
     * @tc.desc      heightForWidth(width=288, ratio=35) returns 8.228571428571428
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0251 begin`);
      const actual: number = heightForWidth(288, 35);
      logInfo(`heightForWidth(width=288, ratio=35): actual=${actual}`);
      expect(actual).assertClose(8.228571428571428, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0251 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0252
     * @tc.name      WindowRatio_HeightForWidth_0252
     * @tc.desc      heightForWidth(width=288, ratio=50) returns 5.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0252 begin`);
      const actual: number = heightForWidth(288, 50);
      logInfo(`heightForWidth(width=288, ratio=50): actual=${actual}`);
      expect(actual).assertClose(5.76, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0252 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0253
     * @tc.name      WindowRatio_HeightForWidth_0253
     * @tc.desc      heightForWidth(width=288, ratio=55) returns 5.236363636363636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0253 begin`);
      const actual: number = heightForWidth(288, 55);
      logInfo(`heightForWidth(width=288, ratio=55): actual=${actual}`);
      expect(actual).assertClose(5.236363636363636, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0253 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0254
     * @tc.name      WindowRatio_HeightForWidth_0254
     * @tc.desc      heightForWidth(width=288, ratio=65) returns 4.430769230769231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0254 begin`);
      const actual: number = heightForWidth(288, 65);
      logInfo(`heightForWidth(width=288, ratio=65): actual=${actual}`);
      expect(actual).assertClose(4.430769230769231, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0254 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0255
     * @tc.name      WindowRatio_HeightForWidth_0255
     * @tc.desc      heightForWidth(width=288, ratio=70) returns 4.114285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0255 begin`);
      const actual: number = heightForWidth(288, 70);
      logInfo(`heightForWidth(width=288, ratio=70): actual=${actual}`);
      expect(actual).assertClose(4.114285714285714, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0255 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0256
     * @tc.name      WindowRatio_HeightForWidth_0256
     * @tc.desc      heightForWidth(width=288, ratio=85) returns 3.388235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0256 begin`);
      const actual: number = heightForWidth(288, 85);
      logInfo(`heightForWidth(width=288, ratio=85): actual=${actual}`);
      expect(actual).assertClose(3.388235294117647, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0256 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0257
     * @tc.name      WindowRatio_HeightForWidth_0257
     * @tc.desc      heightForWidth(width=288, ratio=95) returns 3.031578947368421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0257 begin`);
      const actual: number = heightForWidth(288, 95);
      logInfo(`heightForWidth(width=288, ratio=95): actual=${actual}`);
      expect(actual).assertClose(3.031578947368421, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0257 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0258
     * @tc.name      WindowRatio_HeightForWidth_0258
     * @tc.desc      heightForWidth(width=288, ratio=37) returns 7.783783783783784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0258 begin`);
      const actual: number = heightForWidth(288, 37);
      logInfo(`heightForWidth(width=288, ratio=37): actual=${actual}`);
      expect(actual).assertClose(7.783783783783784, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0258 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0259
     * @tc.name      WindowRatio_HeightForWidth_0259
     * @tc.desc      heightForWidth(width=288, ratio=138) returns 2.0869565217391304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0259 begin`);
      const actual: number = heightForWidth(288, 138);
      logInfo(`heightForWidth(width=288, ratio=138): actual=${actual}`);
      expect(actual).assertClose(2.0869565217391304, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0259 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0260
     * @tc.name      WindowRatio_HeightForWidth_0260
     * @tc.desc      heightForWidth(width=384, ratio=0.25) returns 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0260 begin`);
      const actual: number = heightForWidth(384, 0.25);
      logInfo(`heightForWidth(width=384, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}HeightForWidth_0260 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0261
     * @tc.name      WindowRatio_HeightForWidth_0261
     * @tc.desc      heightForWidth(width=384, ratio=1.5) returns 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0261 begin`);
      const actual: number = heightForWidth(384, 1.5);
      logInfo(`heightForWidth(width=384, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(256);
      logInfo(`${BUNDLE}HeightForWidth_0261 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0262
     * @tc.name      WindowRatio_HeightForWidth_0262
     * @tc.desc      heightForWidth(width=384, ratio=25) returns 15.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0262 begin`);
      const actual: number = heightForWidth(384, 25);
      logInfo(`heightForWidth(width=384, ratio=25): actual=${actual}`);
      expect(actual).assertClose(15.36, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0262 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0263
     * @tc.name      WindowRatio_HeightForWidth_0263
     * @tc.desc      heightForWidth(width=384, ratio=35) returns 10.971428571428572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0263 begin`);
      const actual: number = heightForWidth(384, 35);
      logInfo(`heightForWidth(width=384, ratio=35): actual=${actual}`);
      expect(actual).assertClose(10.971428571428572, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0263 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0264
     * @tc.name      WindowRatio_HeightForWidth_0264
     * @tc.desc      heightForWidth(width=384, ratio=45) returns 8.533333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0264 begin`);
      const actual: number = heightForWidth(384, 45);
      logInfo(`heightForWidth(width=384, ratio=45): actual=${actual}`);
      expect(actual).assertClose(8.533333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0264 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0265
     * @tc.name      WindowRatio_HeightForWidth_0265
     * @tc.desc      heightForWidth(width=384, ratio=55) returns 6.9818181818181815
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0265 begin`);
      const actual: number = heightForWidth(384, 55);
      logInfo(`heightForWidth(width=384, ratio=55): actual=${actual}`);
      expect(actual).assertClose(6.9818181818181815, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0265 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0266
     * @tc.name      WindowRatio_HeightForWidth_0266
     * @tc.desc      heightForWidth(width=384, ratio=65) returns 5.907692307692308
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0266 begin`);
      const actual: number = heightForWidth(384, 65);
      logInfo(`heightForWidth(width=384, ratio=65): actual=${actual}`);
      expect(actual).assertClose(5.907692307692308, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0266 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0267
     * @tc.name      WindowRatio_HeightForWidth_0267
     * @tc.desc      heightForWidth(width=384, ratio=75) returns 5.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0267 begin`);
      const actual: number = heightForWidth(384, 75);
      logInfo(`heightForWidth(width=384, ratio=75): actual=${actual}`);
      expect(actual).assertClose(5.12, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0267 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0268
     * @tc.name      WindowRatio_HeightForWidth_0268
     * @tc.desc      heightForWidth(width=384, ratio=85) returns 4.517647058823529
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0268 begin`);
      const actual: number = heightForWidth(384, 85);
      logInfo(`heightForWidth(width=384, ratio=85): actual=${actual}`);
      expect(actual).assertClose(4.517647058823529, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0268 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0269
     * @tc.name      WindowRatio_HeightForWidth_0269
     * @tc.desc      heightForWidth(width=384, ratio=95) returns 4.042105263157895
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0269 begin`);
      const actual: number = heightForWidth(384, 95);
      logInfo(`heightForWidth(width=384, ratio=95): actual=${actual}`);
      expect(actual).assertClose(4.042105263157895, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0269 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0270
     * @tc.name      WindowRatio_HeightForWidth_0270
     * @tc.desc      heightForWidth(width=384, ratio=37) returns 10.378378378378379
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0270 begin`);
      const actual: number = heightForWidth(384, 37);
      logInfo(`heightForWidth(width=384, ratio=37): actual=${actual}`);
      expect(actual).assertClose(10.378378378378379, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0270 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0271
     * @tc.name      WindowRatio_HeightForWidth_0271
     * @tc.desc      heightForWidth(width=384, ratio=138) returns 2.782608695652174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0271 begin`);
      const actual: number = heightForWidth(384, 138);
      logInfo(`heightForWidth(width=384, ratio=138): actual=${actual}`);
      expect(actual).assertClose(2.782608695652174, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0271 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0272
     * @tc.name      WindowRatio_HeightForWidth_0272
     * @tc.desc      heightForWidth(width=480, ratio=1.5) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0272 begin`);
      const actual: number = heightForWidth(480, 1.5);
      logInfo(`heightForWidth(width=480, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}HeightForWidth_0272 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0273
     * @tc.name      WindowRatio_HeightForWidth_0273
     * @tc.desc      heightForWidth(width=480, ratio=3) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0273 begin`);
      const actual: number = heightForWidth(480, 3);
      logInfo(`heightForWidth(width=480, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}HeightForWidth_0273 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0274
     * @tc.name      WindowRatio_HeightForWidth_0274
     * @tc.desc      heightForWidth(width=480, ratio=35) returns 13.714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0274 begin`);
      const actual: number = heightForWidth(480, 35);
      logInfo(`heightForWidth(width=480, ratio=35): actual=${actual}`);
      expect(actual).assertClose(13.714285714285714, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0274 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0275
     * @tc.name      WindowRatio_HeightForWidth_0275
     * @tc.desc      heightForWidth(width=480, ratio=45) returns 10.666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0275 begin`);
      const actual: number = heightForWidth(480, 45);
      logInfo(`heightForWidth(width=480, ratio=45): actual=${actual}`);
      expect(actual).assertClose(10.666666666666666, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0275 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0276
     * @tc.name      WindowRatio_HeightForWidth_0276
     * @tc.desc      heightForWidth(width=480, ratio=55) returns 8.727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0276 begin`);
      const actual: number = heightForWidth(480, 55);
      logInfo(`heightForWidth(width=480, ratio=55): actual=${actual}`);
      expect(actual).assertClose(8.727272727272727, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0276 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0277
     * @tc.name      WindowRatio_HeightForWidth_0277
     * @tc.desc      heightForWidth(width=480, ratio=65) returns 7.384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0277 begin`);
      const actual: number = heightForWidth(480, 65);
      logInfo(`heightForWidth(width=480, ratio=65): actual=${actual}`);
      expect(actual).assertClose(7.384615384615385, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0277 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0278
     * @tc.name      WindowRatio_HeightForWidth_0278
     * @tc.desc      heightForWidth(width=480, ratio=70) returns 6.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0278 begin`);
      const actual: number = heightForWidth(480, 70);
      logInfo(`heightForWidth(width=480, ratio=70): actual=${actual}`);
      expect(actual).assertClose(6.857142857142857, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0278 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0279
     * @tc.name      WindowRatio_HeightForWidth_0279
     * @tc.desc      heightForWidth(width=480, ratio=85) returns 5.647058823529412
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0279 begin`);
      const actual: number = heightForWidth(480, 85);
      logInfo(`heightForWidth(width=480, ratio=85): actual=${actual}`);
      expect(actual).assertClose(5.647058823529412, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0279 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0280
     * @tc.name      WindowRatio_HeightForWidth_0280
     * @tc.desc      heightForWidth(width=480, ratio=90) returns 5.333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0280 begin`);
      const actual: number = heightForWidth(480, 90);
      logInfo(`heightForWidth(width=480, ratio=90): actual=${actual}`);
      expect(actual).assertClose(5.333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0280 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0281
     * @tc.name      WindowRatio_HeightForWidth_0281
     * @tc.desc      heightForWidth(width=480, ratio=95) returns 5.052631578947368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0281 begin`);
      const actual: number = heightForWidth(480, 95);
      logInfo(`heightForWidth(width=480, ratio=95): actual=${actual}`);
      expect(actual).assertClose(5.052631578947368, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0281 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0282
     * @tc.name      WindowRatio_HeightForWidth_0282
     * @tc.desc      heightForWidth(width=480, ratio=37) returns 12.972972972972974
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0282 begin`);
      const actual: number = heightForWidth(480, 37);
      logInfo(`heightForWidth(width=480, ratio=37): actual=${actual}`);
      expect(actual).assertClose(12.972972972972974, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0282 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0283
     * @tc.name      WindowRatio_HeightForWidth_0283
     * @tc.desc      heightForWidth(width=480, ratio=138) returns 3.4782608695652173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0283 begin`);
      const actual: number = heightForWidth(480, 138);
      logInfo(`heightForWidth(width=480, ratio=138): actual=${actual}`);
      expect(actual).assertClose(3.4782608695652173, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0283 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0284
     * @tc.name      WindowRatio_HeightForWidth_0284
     * @tc.desc      heightForWidth(width=576, ratio=0.25) returns 2304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0284 begin`);
      const actual: number = heightForWidth(576, 0.25);
      logInfo(`heightForWidth(width=576, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(2304);
      logInfo(`${BUNDLE}HeightForWidth_0284 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0285
     * @tc.name      WindowRatio_HeightForWidth_0285
     * @tc.desc      heightForWidth(width=576, ratio=5) returns 115.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0285 begin`);
      const actual: number = heightForWidth(576, 5);
      logInfo(`heightForWidth(width=576, ratio=5): actual=${actual}`);
      expect(actual).assertClose(115.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0285 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0286
     * @tc.name      WindowRatio_HeightForWidth_0286
     * @tc.desc      heightForWidth(width=576, ratio=25) returns 23.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0286 begin`);
      const actual: number = heightForWidth(576, 25);
      logInfo(`heightForWidth(width=576, ratio=25): actual=${actual}`);
      expect(actual).assertClose(23.04, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0286 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0287
     * @tc.name      WindowRatio_HeightForWidth_0287
     * @tc.desc      heightForWidth(width=576, ratio=35) returns 16.457142857142856
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0287 begin`);
      const actual: number = heightForWidth(576, 35);
      logInfo(`heightForWidth(width=576, ratio=35): actual=${actual}`);
      expect(actual).assertClose(16.457142857142856, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0287 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0288
     * @tc.name      WindowRatio_HeightForWidth_0288
     * @tc.desc      heightForWidth(width=576, ratio=55) returns 10.472727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0288 begin`);
      const actual: number = heightForWidth(576, 55);
      logInfo(`heightForWidth(width=576, ratio=55): actual=${actual}`);
      expect(actual).assertClose(10.472727272727273, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0288 end`);
    });
  });
}
