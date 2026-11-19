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

/** Logic checks for widthForHeight (96 cases). */
export default function widthForHeight3Test(): void {
  describe('WidthForHeight3Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0193
     * @tc.name      WindowRatio_WidthForHeight_0193
     * @tc.desc      widthForHeight(height=10, ratio=0.25) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0193 begin`);
      const actual: number = widthForHeight(10, 0.25);
      logInfo(`widthForHeight(height=10, ratio=0.25): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0194
     * @tc.name      WindowRatio_WidthForHeight_0194
     * @tc.desc      widthForHeight(height=10, ratio=25) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0194 begin`);
      const actual: number = widthForHeight(10, 25);
      logInfo(`widthForHeight(height=10, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}WidthForHeight_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0195
     * @tc.name      WindowRatio_WidthForHeight_0195
     * @tc.desc      widthForHeight(height=10, ratio=35) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0195 begin`);
      const actual: number = widthForHeight(10, 35);
      logInfo(`widthForHeight(height=10, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}WidthForHeight_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0196
     * @tc.name      WindowRatio_WidthForHeight_0196
     * @tc.desc      widthForHeight(height=10, ratio=40) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0196 begin`);
      const actual: number = widthForHeight(10, 40);
      logInfo(`widthForHeight(height=10, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}WidthForHeight_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0197
     * @tc.name      WindowRatio_WidthForHeight_0197
     * @tc.desc      widthForHeight(height=10, ratio=45) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0197 begin`);
      const actual: number = widthForHeight(10, 45);
      logInfo(`widthForHeight(height=10, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(450);
      logInfo(`${BUNDLE}WidthForHeight_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0198
     * @tc.name      WindowRatio_WidthForHeight_0198
     * @tc.desc      widthForHeight(height=10, ratio=55) returns 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0198 begin`);
      const actual: number = widthForHeight(10, 55);
      logInfo(`widthForHeight(height=10, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(550);
      logInfo(`${BUNDLE}WidthForHeight_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0199
     * @tc.name      WindowRatio_WidthForHeight_0199
     * @tc.desc      widthForHeight(height=10, ratio=60) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0199 begin`);
      const actual: number = widthForHeight(10, 60);
      logInfo(`widthForHeight(height=10, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}WidthForHeight_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0200
     * @tc.name      WindowRatio_WidthForHeight_0200
     * @tc.desc      widthForHeight(height=10, ratio=65) returns 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0200 begin`);
      const actual: number = widthForHeight(10, 65);
      logInfo(`widthForHeight(height=10, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(650);
      logInfo(`${BUNDLE}WidthForHeight_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0201
     * @tc.name      WindowRatio_WidthForHeight_0201
     * @tc.desc      widthForHeight(height=10, ratio=70) returns 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0201 begin`);
      const actual: number = widthForHeight(10, 70);
      logInfo(`widthForHeight(height=10, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(700);
      logInfo(`${BUNDLE}WidthForHeight_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0202
     * @tc.name      WindowRatio_WidthForHeight_0202
     * @tc.desc      widthForHeight(height=10, ratio=75) returns 750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0202 begin`);
      const actual: number = widthForHeight(10, 75);
      logInfo(`widthForHeight(height=10, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(750);
      logInfo(`${BUNDLE}WidthForHeight_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0203
     * @tc.name      WindowRatio_WidthForHeight_0203
     * @tc.desc      widthForHeight(height=10, ratio=80) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0203 begin`);
      const actual: number = widthForHeight(10, 80);
      logInfo(`widthForHeight(height=10, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}WidthForHeight_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0204
     * @tc.name      WindowRatio_WidthForHeight_0204
     * @tc.desc      widthForHeight(height=10, ratio=85) returns 850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0204 begin`);
      const actual: number = widthForHeight(10, 85);
      logInfo(`widthForHeight(height=10, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(850);
      logInfo(`${BUNDLE}WidthForHeight_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0205
     * @tc.name      WindowRatio_WidthForHeight_0205
     * @tc.desc      widthForHeight(height=10, ratio=90) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0205 begin`);
      const actual: number = widthForHeight(10, 90);
      logInfo(`widthForHeight(height=10, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}WidthForHeight_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0206
     * @tc.name      WindowRatio_WidthForHeight_0206
     * @tc.desc      widthForHeight(height=10, ratio=95) returns 950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0206 begin`);
      const actual: number = widthForHeight(10, 95);
      logInfo(`widthForHeight(height=10, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(950);
      logInfo(`${BUNDLE}WidthForHeight_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0207
     * @tc.name      WindowRatio_WidthForHeight_0207
     * @tc.desc      widthForHeight(height=10, ratio=88.49) returns 884.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0207 begin`);
      const actual: number = widthForHeight(10, 88.49);
      logInfo(`widthForHeight(height=10, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(884.9, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0208
     * @tc.name      WindowRatio_WidthForHeight_0208
     * @tc.desc      widthForHeight(height=10, ratio=29) returns 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0208 begin`);
      const actual: number = widthForHeight(10, 29);
      logInfo(`widthForHeight(height=10, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(290);
      logInfo(`${BUNDLE}WidthForHeight_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0209
     * @tc.name      WindowRatio_WidthForHeight_0209
     * @tc.desc      widthForHeight(height=96, ratio=0.25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0209 begin`);
      const actual: number = widthForHeight(96, 0.25);
      logInfo(`widthForHeight(height=96, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}WidthForHeight_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0210
     * @tc.name      WindowRatio_WidthForHeight_0210
     * @tc.desc      widthForHeight(height=96, ratio=0.5) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0210 begin`);
      const actual: number = widthForHeight(96, 0.5);
      logInfo(`widthForHeight(height=96, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}WidthForHeight_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0211
     * @tc.name      WindowRatio_WidthForHeight_0211
     * @tc.desc      widthForHeight(height=96, ratio=1) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0211 begin`);
      const actual: number = widthForHeight(96, 1);
      logInfo(`widthForHeight(height=96, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}WidthForHeight_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0212
     * @tc.name      WindowRatio_WidthForHeight_0212
     * @tc.desc      widthForHeight(height=96, ratio=1.5) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0212 begin`);
      const actual: number = widthForHeight(96, 1.5);
      logInfo(`widthForHeight(height=96, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}WidthForHeight_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0213
     * @tc.name      WindowRatio_WidthForHeight_0213
     * @tc.desc      widthForHeight(height=96, ratio=2) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0213 begin`);
      const actual: number = widthForHeight(96, 2);
      logInfo(`widthForHeight(height=96, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}WidthForHeight_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0214
     * @tc.name      WindowRatio_WidthForHeight_0214
     * @tc.desc      widthForHeight(height=96, ratio=-1) returns -96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0214 begin`);
      const actual: number = widthForHeight(96, -1);
      logInfo(`widthForHeight(height=96, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-96);
      logInfo(`${BUNDLE}WidthForHeight_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0215
     * @tc.name      WindowRatio_WidthForHeight_0215
     * @tc.desc      widthForHeight(height=96, ratio=3) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0215 begin`);
      const actual: number = widthForHeight(96, 3);
      logInfo(`widthForHeight(height=96, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}WidthForHeight_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0216
     * @tc.name      WindowRatio_WidthForHeight_0216
     * @tc.desc      widthForHeight(height=96, ratio=25) returns 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0216 begin`);
      const actual: number = widthForHeight(96, 25);
      logInfo(`widthForHeight(height=96, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}WidthForHeight_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0217
     * @tc.name      WindowRatio_WidthForHeight_0217
     * @tc.desc      widthForHeight(height=96, ratio=35) returns 3360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0217 begin`);
      const actual: number = widthForHeight(96, 35);
      logInfo(`widthForHeight(height=96, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(3360);
      logInfo(`${BUNDLE}WidthForHeight_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0218
     * @tc.name      WindowRatio_WidthForHeight_0218
     * @tc.desc      widthForHeight(height=96, ratio=45) returns 4320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0218 begin`);
      const actual: number = widthForHeight(96, 45);
      logInfo(`widthForHeight(height=96, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(4320);
      logInfo(`${BUNDLE}WidthForHeight_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0219
     * @tc.name      WindowRatio_WidthForHeight_0219
     * @tc.desc      widthForHeight(height=96, ratio=50) returns 4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0219 begin`);
      const actual: number = widthForHeight(96, 50);
      logInfo(`widthForHeight(height=96, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(4800);
      logInfo(`${BUNDLE}WidthForHeight_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0220
     * @tc.name      WindowRatio_WidthForHeight_0220
     * @tc.desc      widthForHeight(height=96, ratio=55) returns 5280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0220 begin`);
      const actual: number = widthForHeight(96, 55);
      logInfo(`widthForHeight(height=96, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(5280);
      logInfo(`${BUNDLE}WidthForHeight_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0221
     * @tc.name      WindowRatio_WidthForHeight_0221
     * @tc.desc      widthForHeight(height=96, ratio=65) returns 6240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0221 begin`);
      const actual: number = widthForHeight(96, 65);
      logInfo(`widthForHeight(height=96, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(6240);
      logInfo(`${BUNDLE}WidthForHeight_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0222
     * @tc.name      WindowRatio_WidthForHeight_0222
     * @tc.desc      widthForHeight(height=96, ratio=70) returns 6720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0222 begin`);
      const actual: number = widthForHeight(96, 70);
      logInfo(`widthForHeight(height=96, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(6720);
      logInfo(`${BUNDLE}WidthForHeight_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0223
     * @tc.name      WindowRatio_WidthForHeight_0223
     * @tc.desc      widthForHeight(height=96, ratio=80) returns 7680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0223 begin`);
      const actual: number = widthForHeight(96, 80);
      logInfo(`widthForHeight(height=96, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(7680);
      logInfo(`${BUNDLE}WidthForHeight_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0224
     * @tc.name      WindowRatio_WidthForHeight_0224
     * @tc.desc      widthForHeight(height=96, ratio=85) returns 8160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0224 begin`);
      const actual: number = widthForHeight(96, 85);
      logInfo(`widthForHeight(height=96, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(8160);
      logInfo(`${BUNDLE}WidthForHeight_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0225
     * @tc.name      WindowRatio_WidthForHeight_0225
     * @tc.desc      widthForHeight(height=96, ratio=90) returns 8640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0225 begin`);
      const actual: number = widthForHeight(96, 90);
      logInfo(`widthForHeight(height=96, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(8640);
      logInfo(`${BUNDLE}WidthForHeight_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0226
     * @tc.name      WindowRatio_WidthForHeight_0226
     * @tc.desc      widthForHeight(height=96, ratio=95) returns 9120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0226 begin`);
      const actual: number = widthForHeight(96, 95);
      logInfo(`widthForHeight(height=96, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(9120);
      logInfo(`${BUNDLE}WidthForHeight_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0227
     * @tc.name      WindowRatio_WidthForHeight_0227
     * @tc.desc      widthForHeight(height=96, ratio=88.49) returns 8495.039999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0227 begin`);
      const actual: number = widthForHeight(96, 88.49);
      logInfo(`widthForHeight(height=96, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(8495.039999999999, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0228
     * @tc.name      WindowRatio_WidthForHeight_0228
     * @tc.desc      widthForHeight(height=96, ratio=29) returns 2784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0228 begin`);
      const actual: number = widthForHeight(96, 29);
      logInfo(`widthForHeight(height=96, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(2784);
      logInfo(`${BUNDLE}WidthForHeight_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0229
     * @tc.name      WindowRatio_WidthForHeight_0229
     * @tc.desc      widthForHeight(height=192, ratio=2) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0229 begin`);
      const actual: number = widthForHeight(192, 2);
      logInfo(`widthForHeight(height=192, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}WidthForHeight_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0230
     * @tc.name      WindowRatio_WidthForHeight_0230
     * @tc.desc      widthForHeight(height=192, ratio=-1) returns -192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0230 begin`);
      const actual: number = widthForHeight(192, -1);
      logInfo(`widthForHeight(height=192, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-192);
      logInfo(`${BUNDLE}WidthForHeight_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0231
     * @tc.name      WindowRatio_WidthForHeight_0231
     * @tc.desc      widthForHeight(height=192, ratio=3) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0231 begin`);
      const actual: number = widthForHeight(192, 3);
      logInfo(`widthForHeight(height=192, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}WidthForHeight_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0232
     * @tc.name      WindowRatio_WidthForHeight_0232
     * @tc.desc      widthForHeight(height=192, ratio=55) returns 10560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0232 begin`);
      const actual: number = widthForHeight(192, 55);
      logInfo(`widthForHeight(height=192, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(10560);
      logInfo(`${BUNDLE}WidthForHeight_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0233
     * @tc.name      WindowRatio_WidthForHeight_0233
     * @tc.desc      widthForHeight(height=192, ratio=60) returns 11520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0233 begin`);
      const actual: number = widthForHeight(192, 60);
      logInfo(`widthForHeight(height=192, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(11520);
      logInfo(`${BUNDLE}WidthForHeight_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0234
     * @tc.name      WindowRatio_WidthForHeight_0234
     * @tc.desc      widthForHeight(height=192, ratio=65) returns 12480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0234 begin`);
      const actual: number = widthForHeight(192, 65);
      logInfo(`widthForHeight(height=192, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(12480);
      logInfo(`${BUNDLE}WidthForHeight_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0235
     * @tc.name      WindowRatio_WidthForHeight_0235
     * @tc.desc      widthForHeight(height=192, ratio=70) returns 13440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0235 begin`);
      const actual: number = widthForHeight(192, 70);
      logInfo(`widthForHeight(height=192, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(13440);
      logInfo(`${BUNDLE}WidthForHeight_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0236
     * @tc.name      WindowRatio_WidthForHeight_0236
     * @tc.desc      widthForHeight(height=192, ratio=80) returns 15360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0236 begin`);
      const actual: number = widthForHeight(192, 80);
      logInfo(`widthForHeight(height=192, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(15360);
      logInfo(`${BUNDLE}WidthForHeight_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0237
     * @tc.name      WindowRatio_WidthForHeight_0237
     * @tc.desc      widthForHeight(height=192, ratio=85) returns 16320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0237 begin`);
      const actual: number = widthForHeight(192, 85);
      logInfo(`widthForHeight(height=192, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(16320);
      logInfo(`${BUNDLE}WidthForHeight_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0238
     * @tc.name      WindowRatio_WidthForHeight_0238
     * @tc.desc      widthForHeight(height=192, ratio=90) returns 17280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0238 begin`);
      const actual: number = widthForHeight(192, 90);
      logInfo(`widthForHeight(height=192, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(17280);
      logInfo(`${BUNDLE}WidthForHeight_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0239
     * @tc.name      WindowRatio_WidthForHeight_0239
     * @tc.desc      widthForHeight(height=192, ratio=95) returns 18240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0239 begin`);
      const actual: number = widthForHeight(192, 95);
      logInfo(`widthForHeight(height=192, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(18240);
      logInfo(`${BUNDLE}WidthForHeight_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0240
     * @tc.name      WindowRatio_WidthForHeight_0240
     * @tc.desc      widthForHeight(height=192, ratio=88.49) returns 16990.079999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0240 begin`);
      const actual: number = widthForHeight(192, 88.49);
      logInfo(`widthForHeight(height=192, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(16990.079999999998, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0241
     * @tc.name      WindowRatio_WidthForHeight_0241
     * @tc.desc      widthForHeight(height=192, ratio=29) returns 5568
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0241 begin`);
      const actual: number = widthForHeight(192, 29);
      logInfo(`widthForHeight(height=192, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(5568);
      logInfo(`${BUNDLE}WidthForHeight_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0242
     * @tc.name      WindowRatio_WidthForHeight_0242
     * @tc.desc      widthForHeight(height=288, ratio=0.25) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0242 begin`);
      const actual: number = widthForHeight(288, 0.25);
      logInfo(`widthForHeight(height=288, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}WidthForHeight_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0243
     * @tc.name      WindowRatio_WidthForHeight_0243
     * @tc.desc      widthForHeight(height=288, ratio=1.5) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0243 begin`);
      const actual: number = widthForHeight(288, 1.5);
      logInfo(`widthForHeight(height=288, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}WidthForHeight_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0244
     * @tc.name      WindowRatio_WidthForHeight_0244
     * @tc.desc      widthForHeight(height=288, ratio=-1) returns -288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0244 begin`);
      const actual: number = widthForHeight(288, -1);
      logInfo(`widthForHeight(height=288, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-288);
      logInfo(`${BUNDLE}WidthForHeight_0244 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0245
     * @tc.name      WindowRatio_WidthForHeight_0245
     * @tc.desc      widthForHeight(height=288, ratio=3) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0245 begin`);
      const actual: number = widthForHeight(288, 3);
      logInfo(`widthForHeight(height=288, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}WidthForHeight_0245 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0246
     * @tc.name      WindowRatio_WidthForHeight_0246
     * @tc.desc      widthForHeight(height=288, ratio=35) returns 10080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0246 begin`);
      const actual: number = widthForHeight(288, 35);
      logInfo(`widthForHeight(height=288, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(10080);
      logInfo(`${BUNDLE}WidthForHeight_0246 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0247
     * @tc.name      WindowRatio_WidthForHeight_0247
     * @tc.desc      widthForHeight(height=288, ratio=45) returns 12960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0247 begin`);
      const actual: number = widthForHeight(288, 45);
      logInfo(`widthForHeight(height=288, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(12960);
      logInfo(`${BUNDLE}WidthForHeight_0247 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0248
     * @tc.name      WindowRatio_WidthForHeight_0248
     * @tc.desc      widthForHeight(height=288, ratio=55) returns 15840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0248 begin`);
      const actual: number = widthForHeight(288, 55);
      logInfo(`widthForHeight(height=288, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(15840);
      logInfo(`${BUNDLE}WidthForHeight_0248 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0249
     * @tc.name      WindowRatio_WidthForHeight_0249
     * @tc.desc      widthForHeight(height=288, ratio=65) returns 18720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0249 begin`);
      const actual: number = widthForHeight(288, 65);
      logInfo(`widthForHeight(height=288, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(18720);
      logInfo(`${BUNDLE}WidthForHeight_0249 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0250
     * @tc.name      WindowRatio_WidthForHeight_0250
     * @tc.desc      widthForHeight(height=288, ratio=70) returns 20160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0250 begin`);
      const actual: number = widthForHeight(288, 70);
      logInfo(`widthForHeight(height=288, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(20160);
      logInfo(`${BUNDLE}WidthForHeight_0250 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0251
     * @tc.name      WindowRatio_WidthForHeight_0251
     * @tc.desc      widthForHeight(height=288, ratio=80) returns 23040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0251 begin`);
      const actual: number = widthForHeight(288, 80);
      logInfo(`widthForHeight(height=288, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(23040);
      logInfo(`${BUNDLE}WidthForHeight_0251 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0252
     * @tc.name      WindowRatio_WidthForHeight_0252
     * @tc.desc      widthForHeight(height=288, ratio=85) returns 24480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0252 begin`);
      const actual: number = widthForHeight(288, 85);
      logInfo(`widthForHeight(height=288, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(24480);
      logInfo(`${BUNDLE}WidthForHeight_0252 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0253
     * @tc.name      WindowRatio_WidthForHeight_0253
     * @tc.desc      widthForHeight(height=288, ratio=90) returns 25920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0253 begin`);
      const actual: number = widthForHeight(288, 90);
      logInfo(`widthForHeight(height=288, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(25920);
      logInfo(`${BUNDLE}WidthForHeight_0253 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0254
     * @tc.name      WindowRatio_WidthForHeight_0254
     * @tc.desc      widthForHeight(height=288, ratio=95) returns 27360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0254 begin`);
      const actual: number = widthForHeight(288, 95);
      logInfo(`widthForHeight(height=288, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(27360);
      logInfo(`${BUNDLE}WidthForHeight_0254 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0255
     * @tc.name      WindowRatio_WidthForHeight_0255
     * @tc.desc      widthForHeight(height=288, ratio=88.49) returns 25485.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0255 begin`);
      const actual: number = widthForHeight(288, 88.49);
      logInfo(`widthForHeight(height=288, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(25485.12, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0255 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0256
     * @tc.name      WindowRatio_WidthForHeight_0256
     * @tc.desc      widthForHeight(height=288, ratio=29) returns 8352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0256 begin`);
      const actual: number = widthForHeight(288, 29);
      logInfo(`widthForHeight(height=288, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(8352);
      logInfo(`${BUNDLE}WidthForHeight_0256 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0257
     * @tc.name      WindowRatio_WidthForHeight_0257
     * @tc.desc      widthForHeight(height=384, ratio=2) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0257 begin`);
      const actual: number = widthForHeight(384, 2);
      logInfo(`widthForHeight(height=384, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}WidthForHeight_0257 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0258
     * @tc.name      WindowRatio_WidthForHeight_0258
     * @tc.desc      widthForHeight(height=384, ratio=-1) returns -384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0258 begin`);
      const actual: number = widthForHeight(384, -1);
      logInfo(`widthForHeight(height=384, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-384);
      logInfo(`${BUNDLE}WidthForHeight_0258 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0259
     * @tc.name      WindowRatio_WidthForHeight_0259
     * @tc.desc      widthForHeight(height=384, ratio=3) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0259 begin`);
      const actual: number = widthForHeight(384, 3);
      logInfo(`widthForHeight(height=384, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}WidthForHeight_0259 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0260
     * @tc.name      WindowRatio_WidthForHeight_0260
     * @tc.desc      widthForHeight(height=384, ratio=55) returns 21120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0260 begin`);
      const actual: number = widthForHeight(384, 55);
      logInfo(`widthForHeight(height=384, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(21120);
      logInfo(`${BUNDLE}WidthForHeight_0260 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0261
     * @tc.name      WindowRatio_WidthForHeight_0261
     * @tc.desc      widthForHeight(height=384, ratio=65) returns 24960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0261 begin`);
      const actual: number = widthForHeight(384, 65);
      logInfo(`widthForHeight(height=384, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(24960);
      logInfo(`${BUNDLE}WidthForHeight_0261 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0262
     * @tc.name      WindowRatio_WidthForHeight_0262
     * @tc.desc      widthForHeight(height=384, ratio=70) returns 26880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0262 begin`);
      const actual: number = widthForHeight(384, 70);
      logInfo(`widthForHeight(height=384, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(26880);
      logInfo(`${BUNDLE}WidthForHeight_0262 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0263
     * @tc.name      WindowRatio_WidthForHeight_0263
     * @tc.desc      widthForHeight(height=384, ratio=80) returns 30720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0263 begin`);
      const actual: number = widthForHeight(384, 80);
      logInfo(`widthForHeight(height=384, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(30720);
      logInfo(`${BUNDLE}WidthForHeight_0263 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0264
     * @tc.name      WindowRatio_WidthForHeight_0264
     * @tc.desc      widthForHeight(height=384, ratio=85) returns 32640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0264 begin`);
      const actual: number = widthForHeight(384, 85);
      logInfo(`widthForHeight(height=384, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(32640);
      logInfo(`${BUNDLE}WidthForHeight_0264 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0265
     * @tc.name      WindowRatio_WidthForHeight_0265
     * @tc.desc      widthForHeight(height=384, ratio=90) returns 34560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0265 begin`);
      const actual: number = widthForHeight(384, 90);
      logInfo(`widthForHeight(height=384, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(34560);
      logInfo(`${BUNDLE}WidthForHeight_0265 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0266
     * @tc.name      WindowRatio_WidthForHeight_0266
     * @tc.desc      widthForHeight(height=384, ratio=95) returns 36480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0266 begin`);
      const actual: number = widthForHeight(384, 95);
      logInfo(`widthForHeight(height=384, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(36480);
      logInfo(`${BUNDLE}WidthForHeight_0266 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0267
     * @tc.name      WindowRatio_WidthForHeight_0267
     * @tc.desc      widthForHeight(height=384, ratio=88.49) returns 33980.159999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0267 begin`);
      const actual: number = widthForHeight(384, 88.49);
      logInfo(`widthForHeight(height=384, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(33980.159999999996, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0267 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0268
     * @tc.name      WindowRatio_WidthForHeight_0268
     * @tc.desc      widthForHeight(height=384, ratio=29) returns 11136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0268 begin`);
      const actual: number = widthForHeight(384, 29);
      logInfo(`widthForHeight(height=384, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(11136);
      logInfo(`${BUNDLE}WidthForHeight_0268 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0269
     * @tc.name      WindowRatio_WidthForHeight_0269
     * @tc.desc      widthForHeight(height=480, ratio=-1) returns -480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0269 begin`);
      const actual: number = widthForHeight(480, -1);
      logInfo(`widthForHeight(height=480, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-480);
      logInfo(`${BUNDLE}WidthForHeight_0269 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0270
     * @tc.name      WindowRatio_WidthForHeight_0270
     * @tc.desc      widthForHeight(height=480, ratio=25) returns 12000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0270 begin`);
      const actual: number = widthForHeight(480, 25);
      logInfo(`widthForHeight(height=480, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(12000);
      logInfo(`${BUNDLE}WidthForHeight_0270 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0271
     * @tc.name      WindowRatio_WidthForHeight_0271
     * @tc.desc      widthForHeight(height=480, ratio=35) returns 16800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0271 begin`);
      const actual: number = widthForHeight(480, 35);
      logInfo(`widthForHeight(height=480, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(16800);
      logInfo(`${BUNDLE}WidthForHeight_0271 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0272
     * @tc.name      WindowRatio_WidthForHeight_0272
     * @tc.desc      widthForHeight(height=480, ratio=50) returns 24000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0272 begin`);
      const actual: number = widthForHeight(480, 50);
      logInfo(`widthForHeight(height=480, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(24000);
      logInfo(`${BUNDLE}WidthForHeight_0272 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0273
     * @tc.name      WindowRatio_WidthForHeight_0273
     * @tc.desc      widthForHeight(height=480, ratio=55) returns 26400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0273 begin`);
      const actual: number = widthForHeight(480, 55);
      logInfo(`widthForHeight(height=480, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(26400);
      logInfo(`${BUNDLE}WidthForHeight_0273 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0274
     * @tc.name      WindowRatio_WidthForHeight_0274
     * @tc.desc      widthForHeight(height=480, ratio=65) returns 31200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0274 begin`);
      const actual: number = widthForHeight(480, 65);
      logInfo(`widthForHeight(height=480, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(31200);
      logInfo(`${BUNDLE}WidthForHeight_0274 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0275
     * @tc.name      WindowRatio_WidthForHeight_0275
     * @tc.desc      widthForHeight(height=480, ratio=70) returns 33600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0275 begin`);
      const actual: number = widthForHeight(480, 70);
      logInfo(`widthForHeight(height=480, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(33600);
      logInfo(`${BUNDLE}WidthForHeight_0275 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0276
     * @tc.name      WindowRatio_WidthForHeight_0276
     * @tc.desc      widthForHeight(height=480, ratio=85) returns 40800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0276 begin`);
      const actual: number = widthForHeight(480, 85);
      logInfo(`widthForHeight(height=480, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(40800);
      logInfo(`${BUNDLE}WidthForHeight_0276 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0277
     * @tc.name      WindowRatio_WidthForHeight_0277
     * @tc.desc      widthForHeight(height=480, ratio=95) returns 45600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0277 begin`);
      const actual: number = widthForHeight(480, 95);
      logInfo(`widthForHeight(height=480, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(45600);
      logInfo(`${BUNDLE}WidthForHeight_0277 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0278
     * @tc.name      WindowRatio_WidthForHeight_0278
     * @tc.desc      widthForHeight(height=480, ratio=88.49) returns 42475.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0278 begin`);
      const actual: number = widthForHeight(480, 88.49);
      logInfo(`widthForHeight(height=480, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(42475.2, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0278 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0279
     * @tc.name      WindowRatio_WidthForHeight_0279
     * @tc.desc      widthForHeight(height=480, ratio=29) returns 13920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0279 begin`);
      const actual: number = widthForHeight(480, 29);
      logInfo(`widthForHeight(height=480, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(13920);
      logInfo(`${BUNDLE}WidthForHeight_0279 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0280
     * @tc.name      WindowRatio_WidthForHeight_0280
     * @tc.desc      widthForHeight(height=576, ratio=-1) returns -576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0280 begin`);
      const actual: number = widthForHeight(576, -1);
      logInfo(`widthForHeight(height=576, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-576);
      logInfo(`${BUNDLE}WidthForHeight_0280 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0281
     * @tc.name      WindowRatio_WidthForHeight_0281
     * @tc.desc      widthForHeight(height=576, ratio=3) returns 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0281 begin`);
      const actual: number = widthForHeight(576, 3);
      logInfo(`widthForHeight(height=576, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}WidthForHeight_0281 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0282
     * @tc.name      WindowRatio_WidthForHeight_0282
     * @tc.desc      widthForHeight(height=576, ratio=55) returns 31680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0282 begin`);
      const actual: number = widthForHeight(576, 55);
      logInfo(`widthForHeight(height=576, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(31680);
      logInfo(`${BUNDLE}WidthForHeight_0282 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0283
     * @tc.name      WindowRatio_WidthForHeight_0283
     * @tc.desc      widthForHeight(height=576, ratio=65) returns 37440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0283 begin`);
      const actual: number = widthForHeight(576, 65);
      logInfo(`widthForHeight(height=576, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(37440);
      logInfo(`${BUNDLE}WidthForHeight_0283 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0284
     * @tc.name      WindowRatio_WidthForHeight_0284
     * @tc.desc      widthForHeight(height=576, ratio=70) returns 40320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0284 begin`);
      const actual: number = widthForHeight(576, 70);
      logInfo(`widthForHeight(height=576, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(40320);
      logInfo(`${BUNDLE}WidthForHeight_0284 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0285
     * @tc.name      WindowRatio_WidthForHeight_0285
     * @tc.desc      widthForHeight(height=576, ratio=80) returns 46080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0285 begin`);
      const actual: number = widthForHeight(576, 80);
      logInfo(`widthForHeight(height=576, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(46080);
      logInfo(`${BUNDLE}WidthForHeight_0285 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0286
     * @tc.name      WindowRatio_WidthForHeight_0286
     * @tc.desc      widthForHeight(height=576, ratio=85) returns 48960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0286 begin`);
      const actual: number = widthForHeight(576, 85);
      logInfo(`widthForHeight(height=576, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(48960);
      logInfo(`${BUNDLE}WidthForHeight_0286 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0287
     * @tc.name      WindowRatio_WidthForHeight_0287
     * @tc.desc      widthForHeight(height=576, ratio=90) returns 51840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0287 begin`);
      const actual: number = widthForHeight(576, 90);
      logInfo(`widthForHeight(height=576, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(51840);
      logInfo(`${BUNDLE}WidthForHeight_0287 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0288
     * @tc.name      WindowRatio_WidthForHeight_0288
     * @tc.desc      widthForHeight(height=576, ratio=95) returns 54720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0288 begin`);
      const actual: number = widthForHeight(576, 95);
      logInfo(`widthForHeight(height=576, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(54720);
      logInfo(`${BUNDLE}WidthForHeight_0288 end`);
    });
  });
}
