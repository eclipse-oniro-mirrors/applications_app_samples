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

/** Logic checks for roundedHeightForWidth (96 cases). */
export default function roundedHeightForWidth3Test(): void {
  describe('RoundedHeightForWidth3Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0193
     * @tc.name      WindowRatio_RoundedHeightForWidth_0193
     * @tc.desc      roundedHeightForWidth(width=1, ratio=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0193 begin`);
      const actual: number = roundedHeightForWidth(1, 70);
      logInfo(`roundedHeightForWidth(width=1, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0194
     * @tc.name      WindowRatio_RoundedHeightForWidth_0194
     * @tc.desc      roundedHeightForWidth(width=1, ratio=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0194 begin`);
      const actual: number = roundedHeightForWidth(1, 75);
      logInfo(`roundedHeightForWidth(width=1, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0195
     * @tc.name      WindowRatio_RoundedHeightForWidth_0195
     * @tc.desc      roundedHeightForWidth(width=1, ratio=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0195 begin`);
      const actual: number = roundedHeightForWidth(1, 80);
      logInfo(`roundedHeightForWidth(width=1, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0196
     * @tc.name      WindowRatio_RoundedHeightForWidth_0196
     * @tc.desc      roundedHeightForWidth(width=1, ratio=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0196 begin`);
      const actual: number = roundedHeightForWidth(1, 85);
      logInfo(`roundedHeightForWidth(width=1, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0197
     * @tc.name      WindowRatio_RoundedHeightForWidth_0197
     * @tc.desc      roundedHeightForWidth(width=1, ratio=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0197 begin`);
      const actual: number = roundedHeightForWidth(1, 90);
      logInfo(`roundedHeightForWidth(width=1, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0198
     * @tc.name      WindowRatio_RoundedHeightForWidth_0198
     * @tc.desc      roundedHeightForWidth(width=1, ratio=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0198 begin`);
      const actual: number = roundedHeightForWidth(1, 95);
      logInfo(`roundedHeightForWidth(width=1, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0199
     * @tc.name      WindowRatio_RoundedHeightForWidth_0199
     * @tc.desc      roundedHeightForWidth(width=1, ratio=77.45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0199 begin`);
      const actual: number = roundedHeightForWidth(1, 77.45);
      logInfo(`roundedHeightForWidth(width=1, ratio=77.45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0200
     * @tc.name      WindowRatio_RoundedHeightForWidth_0200
     * @tc.desc      roundedHeightForWidth(width=1, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0200 begin`);
      const actual: number = roundedHeightForWidth(1, -52);
      logInfo(`roundedHeightForWidth(width=1, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0201
     * @tc.name      WindowRatio_RoundedHeightForWidth_0201
     * @tc.desc      roundedHeightForWidth(width=100, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0201 begin`);
      const actual: number = roundedHeightForWidth(100, 0);
      logInfo(`roundedHeightForWidth(width=100, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0202
     * @tc.name      WindowRatio_RoundedHeightForWidth_0202
     * @tc.desc      roundedHeightForWidth(width=100, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0202 begin`);
      const actual: number = roundedHeightForWidth(100, -1);
      logInfo(`roundedHeightForWidth(width=100, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0203
     * @tc.name      WindowRatio_RoundedHeightForWidth_0203
     * @tc.desc      roundedHeightForWidth(width=100, ratio=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0203 begin`);
      const actual: number = roundedHeightForWidth(100, 100);
      logInfo(`roundedHeightForWidth(width=100, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0204
     * @tc.name      WindowRatio_RoundedHeightForWidth_0204
     * @tc.desc      roundedHeightForWidth(width=100, ratio=25) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0204 begin`);
      const actual: number = roundedHeightForWidth(100, 25);
      logInfo(`roundedHeightForWidth(width=100, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0205
     * @tc.name      WindowRatio_RoundedHeightForWidth_0205
     * @tc.desc      roundedHeightForWidth(width=100, ratio=35) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0205 begin`);
      const actual: number = roundedHeightForWidth(100, 35);
      logInfo(`roundedHeightForWidth(width=100, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0206
     * @tc.name      WindowRatio_RoundedHeightForWidth_0206
     * @tc.desc      roundedHeightForWidth(width=100, ratio=40) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0206 begin`);
      const actual: number = roundedHeightForWidth(100, 40);
      logInfo(`roundedHeightForWidth(width=100, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0207
     * @tc.name      WindowRatio_RoundedHeightForWidth_0207
     * @tc.desc      roundedHeightForWidth(width=100, ratio=45) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0207 begin`);
      const actual: number = roundedHeightForWidth(100, 45);
      logInfo(`roundedHeightForWidth(width=100, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0208
     * @tc.name      WindowRatio_RoundedHeightForWidth_0208
     * @tc.desc      roundedHeightForWidth(width=100, ratio=50) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0208 begin`);
      const actual: number = roundedHeightForWidth(100, 50);
      logInfo(`roundedHeightForWidth(width=100, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0209
     * @tc.name      WindowRatio_RoundedHeightForWidth_0209
     * @tc.desc      roundedHeightForWidth(width=100, ratio=55) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0209 begin`);
      const actual: number = roundedHeightForWidth(100, 55);
      logInfo(`roundedHeightForWidth(width=100, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0210
     * @tc.name      WindowRatio_RoundedHeightForWidth_0210
     * @tc.desc      roundedHeightForWidth(width=100, ratio=60) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0210 begin`);
      const actual: number = roundedHeightForWidth(100, 60);
      logInfo(`roundedHeightForWidth(width=100, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0211
     * @tc.name      WindowRatio_RoundedHeightForWidth_0211
     * @tc.desc      roundedHeightForWidth(width=100, ratio=65) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0211 begin`);
      const actual: number = roundedHeightForWidth(100, 65);
      logInfo(`roundedHeightForWidth(width=100, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0212
     * @tc.name      WindowRatio_RoundedHeightForWidth_0212
     * @tc.desc      roundedHeightForWidth(width=100, ratio=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0212 begin`);
      const actual: number = roundedHeightForWidth(100, 70);
      logInfo(`roundedHeightForWidth(width=100, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0213
     * @tc.name      WindowRatio_RoundedHeightForWidth_0213
     * @tc.desc      roundedHeightForWidth(width=100, ratio=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0213 begin`);
      const actual: number = roundedHeightForWidth(100, 75);
      logInfo(`roundedHeightForWidth(width=100, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0214
     * @tc.name      WindowRatio_RoundedHeightForWidth_0214
     * @tc.desc      roundedHeightForWidth(width=100, ratio=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0214 begin`);
      const actual: number = roundedHeightForWidth(100, 80);
      logInfo(`roundedHeightForWidth(width=100, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0215
     * @tc.name      WindowRatio_RoundedHeightForWidth_0215
     * @tc.desc      roundedHeightForWidth(width=100, ratio=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0215 begin`);
      const actual: number = roundedHeightForWidth(100, 85);
      logInfo(`roundedHeightForWidth(width=100, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0216
     * @tc.name      WindowRatio_RoundedHeightForWidth_0216
     * @tc.desc      roundedHeightForWidth(width=100, ratio=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0216 begin`);
      const actual: number = roundedHeightForWidth(100, 90);
      logInfo(`roundedHeightForWidth(width=100, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0217
     * @tc.name      WindowRatio_RoundedHeightForWidth_0217
     * @tc.desc      roundedHeightForWidth(width=100, ratio=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0217 begin`);
      const actual: number = roundedHeightForWidth(100, 95);
      logInfo(`roundedHeightForWidth(width=100, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0218
     * @tc.name      WindowRatio_RoundedHeightForWidth_0218
     * @tc.desc      roundedHeightForWidth(width=100, ratio=77.45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0218 begin`);
      const actual: number = roundedHeightForWidth(100, 77.45);
      logInfo(`roundedHeightForWidth(width=100, ratio=77...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0219
     * @tc.name      WindowRatio_RoundedHeightForWidth_0219
     * @tc.desc      roundedHeightForWidth(width=100, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0219 begin`);
      const actual: number = roundedHeightForWidth(100, -52);
      logInfo(`roundedHeightForWidth(width=100, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0220
     * @tc.name      WindowRatio_RoundedHeightForWidth_0220
     * @tc.desc      roundedHeightForWidth(width=360, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0220 begin`);
      const actual: number = roundedHeightForWidth(360, 0);
      logInfo(`roundedHeightForWidth(width=360, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0221
     * @tc.name      WindowRatio_RoundedHeightForWidth_0221
     * @tc.desc      roundedHeightForWidth(width=360, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0221 begin`);
      const actual: number = roundedHeightForWidth(360, -1);
      logInfo(`roundedHeightForWidth(width=360, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0222
     * @tc.name      WindowRatio_RoundedHeightForWidth_0222
     * @tc.desc      roundedHeightForWidth(width=360, ratio=100) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0222 begin`);
      const actual: number = roundedHeightForWidth(360, 100);
      logInfo(`roundedHeightForWidth(width=360, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0223
     * @tc.name      WindowRatio_RoundedHeightForWidth_0223
     * @tc.desc      roundedHeightForWidth(width=360, ratio=35) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0223 begin`);
      const actual: number = roundedHeightForWidth(360, 35);
      logInfo(`roundedHeightForWidth(width=360, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0224
     * @tc.name      WindowRatio_RoundedHeightForWidth_0224
     * @tc.desc      roundedHeightForWidth(width=360, ratio=50) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0224 begin`);
      const actual: number = roundedHeightForWidth(360, 50);
      logInfo(`roundedHeightForWidth(width=360, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0225
     * @tc.name      WindowRatio_RoundedHeightForWidth_0225
     * @tc.desc      roundedHeightForWidth(width=360, ratio=55) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0225 begin`);
      const actual: number = roundedHeightForWidth(360, 55);
      logInfo(`roundedHeightForWidth(width=360, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0226
     * @tc.name      WindowRatio_RoundedHeightForWidth_0226
     * @tc.desc      roundedHeightForWidth(width=360, ratio=65) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0226 begin`);
      const actual: number = roundedHeightForWidth(360, 65);
      logInfo(`roundedHeightForWidth(width=360, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0227
     * @tc.name      WindowRatio_RoundedHeightForWidth_0227
     * @tc.desc      roundedHeightForWidth(width=360, ratio=70) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0227 begin`);
      const actual: number = roundedHeightForWidth(360, 70);
      logInfo(`roundedHeightForWidth(width=360, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0228
     * @tc.name      WindowRatio_RoundedHeightForWidth_0228
     * @tc.desc      roundedHeightForWidth(width=360, ratio=75) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0228 begin`);
      const actual: number = roundedHeightForWidth(360, 75);
      logInfo(`roundedHeightForWidth(width=360, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0229
     * @tc.name      WindowRatio_RoundedHeightForWidth_0229
     * @tc.desc      roundedHeightForWidth(width=360, ratio=80) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0229 begin`);
      const actual: number = roundedHeightForWidth(360, 80);
      logInfo(`roundedHeightForWidth(width=360, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0230
     * @tc.name      WindowRatio_RoundedHeightForWidth_0230
     * @tc.desc      roundedHeightForWidth(width=360, ratio=85) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0230 begin`);
      const actual: number = roundedHeightForWidth(360, 85);
      logInfo(`roundedHeightForWidth(width=360, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0231
     * @tc.name      WindowRatio_RoundedHeightForWidth_0231
     * @tc.desc      roundedHeightForWidth(width=360, ratio=90) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0231 begin`);
      const actual: number = roundedHeightForWidth(360, 90);
      logInfo(`roundedHeightForWidth(width=360, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0232
     * @tc.name      WindowRatio_RoundedHeightForWidth_0232
     * @tc.desc      roundedHeightForWidth(width=360, ratio=95) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0232 begin`);
      const actual: number = roundedHeightForWidth(360, 95);
      logInfo(`roundedHeightForWidth(width=360, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0233
     * @tc.name      WindowRatio_RoundedHeightForWidth_0233
     * @tc.desc      roundedHeightForWidth(width=360, ratio=77.45) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0233 begin`);
      const actual: number = roundedHeightForWidth(360, 77.45);
      logInfo(`roundedHeightForWidth(width=360, ratio=77...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0234
     * @tc.name      WindowRatio_RoundedHeightForWidth_0234
     * @tc.desc      roundedHeightForWidth(width=360, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0234 begin`);
      const actual: number = roundedHeightForWidth(360, -52);
      logInfo(`roundedHeightForWidth(width=360, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0235
     * @tc.name      WindowRatio_RoundedHeightForWidth_0235
     * @tc.desc      roundedHeightForWidth(width=720, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0235 begin`);
      const actual: number = roundedHeightForWidth(720, 0);
      logInfo(`roundedHeightForWidth(width=720, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0236
     * @tc.name      WindowRatio_RoundedHeightForWidth_0236
     * @tc.desc      roundedHeightForWidth(width=720, ratio=0.5) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0236 begin`);
      const actual: number = roundedHeightForWidth(720, 0.5);
      logInfo(`roundedHeightForWidth(width=720, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0237
     * @tc.name      WindowRatio_RoundedHeightForWidth_0237
     * @tc.desc      roundedHeightForWidth(width=720, ratio=1) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0237 begin`);
      const actual: number = roundedHeightForWidth(720, 1);
      logInfo(`roundedHeightForWidth(width=720, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0238
     * @tc.name      WindowRatio_RoundedHeightForWidth_0238
     * @tc.desc      roundedHeightForWidth(width=720, ratio=2) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0238 begin`);
      const actual: number = roundedHeightForWidth(720, 2);
      logInfo(`roundedHeightForWidth(width=720, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0239
     * @tc.name      WindowRatio_RoundedHeightForWidth_0239
     * @tc.desc      roundedHeightForWidth(width=720, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0239 begin`);
      const actual: number = roundedHeightForWidth(720, -1);
      logInfo(`roundedHeightForWidth(width=720, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0240
     * @tc.name      WindowRatio_RoundedHeightForWidth_0240
     * @tc.desc      roundedHeightForWidth(width=720, ratio=3) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0240 begin`);
      const actual: number = roundedHeightForWidth(720, 3);
      logInfo(`roundedHeightForWidth(width=720, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0241
     * @tc.name      WindowRatio_RoundedHeightForWidth_0241
     * @tc.desc      roundedHeightForWidth(width=720, ratio=10) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0241 begin`);
      const actual: number = roundedHeightForWidth(720, 10);
      logInfo(`roundedHeightForWidth(width=720, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0242
     * @tc.name      WindowRatio_RoundedHeightForWidth_0242
     * @tc.desc      roundedHeightForWidth(width=720, ratio=100) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0242 begin`);
      const actual: number = roundedHeightForWidth(720, 100);
      logInfo(`roundedHeightForWidth(width=720, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0243
     * @tc.name      WindowRatio_RoundedHeightForWidth_0243
     * @tc.desc      roundedHeightForWidth(width=720, ratio=20) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0243 begin`);
      const actual: number = roundedHeightForWidth(720, 20);
      logInfo(`roundedHeightForWidth(width=720, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0244
     * @tc.name      WindowRatio_RoundedHeightForWidth_0244
     * @tc.desc      roundedHeightForWidth(width=720, ratio=30) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0244 begin`);
      const actual: number = roundedHeightForWidth(720, 30);
      logInfo(`roundedHeightForWidth(width=720, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0244 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0245
     * @tc.name      WindowRatio_RoundedHeightForWidth_0245
     * @tc.desc      roundedHeightForWidth(width=720, ratio=40) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0245 begin`);
      const actual: number = roundedHeightForWidth(720, 40);
      logInfo(`roundedHeightForWidth(width=720, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0245 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0246
     * @tc.name      WindowRatio_RoundedHeightForWidth_0246
     * @tc.desc      roundedHeightForWidth(width=720, ratio=50) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0246 begin`);
      const actual: number = roundedHeightForWidth(720, 50);
      logInfo(`roundedHeightForWidth(width=720, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0246 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0247
     * @tc.name      WindowRatio_RoundedHeightForWidth_0247
     * @tc.desc      roundedHeightForWidth(width=720, ratio=60) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0247 begin`);
      const actual: number = roundedHeightForWidth(720, 60);
      logInfo(`roundedHeightForWidth(width=720, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0247 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0248
     * @tc.name      WindowRatio_RoundedHeightForWidth_0248
     * @tc.desc      roundedHeightForWidth(width=720, ratio=70) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0248 begin`);
      const actual: number = roundedHeightForWidth(720, 70);
      logInfo(`roundedHeightForWidth(width=720, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0248 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0249
     * @tc.name      WindowRatio_RoundedHeightForWidth_0249
     * @tc.desc      roundedHeightForWidth(width=720, ratio=75) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0249 begin`);
      const actual: number = roundedHeightForWidth(720, 75);
      logInfo(`roundedHeightForWidth(width=720, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0249 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0250
     * @tc.name      WindowRatio_RoundedHeightForWidth_0250
     * @tc.desc      roundedHeightForWidth(width=720, ratio=80) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0250 begin`);
      const actual: number = roundedHeightForWidth(720, 80);
      logInfo(`roundedHeightForWidth(width=720, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0250 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0251
     * @tc.name      WindowRatio_RoundedHeightForWidth_0251
     * @tc.desc      roundedHeightForWidth(width=720, ratio=85) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0251 begin`);
      const actual: number = roundedHeightForWidth(720, 85);
      logInfo(`roundedHeightForWidth(width=720, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0251 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0252
     * @tc.name      WindowRatio_RoundedHeightForWidth_0252
     * @tc.desc      roundedHeightForWidth(width=720, ratio=90) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0252 begin`);
      const actual: number = roundedHeightForWidth(720, 90);
      logInfo(`roundedHeightForWidth(width=720, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0252 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0253
     * @tc.name      WindowRatio_RoundedHeightForWidth_0253
     * @tc.desc      roundedHeightForWidth(width=720, ratio=95) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0253 begin`);
      const actual: number = roundedHeightForWidth(720, 95);
      logInfo(`roundedHeightForWidth(width=720, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0253 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0254
     * @tc.name      WindowRatio_RoundedHeightForWidth_0254
     * @tc.desc      roundedHeightForWidth(width=720, ratio=77.45) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0254 begin`);
      const actual: number = roundedHeightForWidth(720, 77.45);
      logInfo(`roundedHeightForWidth(width=720, ratio=77...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0254 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0255
     * @tc.name      WindowRatio_RoundedHeightForWidth_0255
     * @tc.desc      roundedHeightForWidth(width=720, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0255 begin`);
      const actual: number = roundedHeightForWidth(720, -52);
      logInfo(`roundedHeightForWidth(width=720, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0255 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0256
     * @tc.name      WindowRatio_RoundedHeightForWidth_0256
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0256 begin`);
      const actual: number = roundedHeightForWidth(1080, 0);
      logInfo(`roundedHeightForWidth(width=1080, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0256 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0257
     * @tc.name      WindowRatio_RoundedHeightForWidth_0257
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=1.5) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0257 begin`);
      const actual: number = roundedHeightForWidth(1080, 1.5);
      logInfo(`roundedHeightForWidth(width=1080, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0257 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0258
     * @tc.name      WindowRatio_RoundedHeightForWidth_0258
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0258 begin`);
      const actual: number = roundedHeightForWidth(1080, -1);
      logInfo(`roundedHeightForWidth(width=1080, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0258 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0259
     * @tc.name      WindowRatio_RoundedHeightForWidth_0259
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=3) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0259 begin`);
      const actual: number = roundedHeightForWidth(1080, 3);
      logInfo(`roundedHeightForWidth(width=1080, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0259 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0260
     * @tc.name      WindowRatio_RoundedHeightForWidth_0260
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=100) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0260 begin`);
      const actual: number = roundedHeightForWidth(1080, 100);
      logInfo(`roundedHeightForWidth(width=1080, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0260 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0261
     * @tc.name      WindowRatio_RoundedHeightForWidth_0261
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=15) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0261 begin`);
      const actual: number = roundedHeightForWidth(1080, 15);
      logInfo(`roundedHeightForWidth(width=1080, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0261 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0262
     * @tc.name      WindowRatio_RoundedHeightForWidth_0262
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=30) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0262 begin`);
      const actual: number = roundedHeightForWidth(1080, 30);
      logInfo(`roundedHeightForWidth(width=1080, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0262 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0263
     * @tc.name      WindowRatio_RoundedHeightForWidth_0263
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=45) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0263 begin`);
      const actual: number = roundedHeightForWidth(1080, 45);
      logInfo(`roundedHeightForWidth(width=1080, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0263 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0264
     * @tc.name      WindowRatio_RoundedHeightForWidth_0264
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=55) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0264 begin`);
      const actual: number = roundedHeightForWidth(1080, 55);
      logInfo(`roundedHeightForWidth(width=1080, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0264 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0265
     * @tc.name      WindowRatio_RoundedHeightForWidth_0265
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=60) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0265 begin`);
      const actual: number = roundedHeightForWidth(1080, 60);
      logInfo(`roundedHeightForWidth(width=1080, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0265 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0266
     * @tc.name      WindowRatio_RoundedHeightForWidth_0266
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=75) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0266 begin`);
      const actual: number = roundedHeightForWidth(1080, 75);
      logInfo(`roundedHeightForWidth(width=1080, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0266 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0267
     * @tc.name      WindowRatio_RoundedHeightForWidth_0267
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=80) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0267 begin`);
      const actual: number = roundedHeightForWidth(1080, 80);
      logInfo(`roundedHeightForWidth(width=1080, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0267 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0268
     * @tc.name      WindowRatio_RoundedHeightForWidth_0268
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=85) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0268 begin`);
      const actual: number = roundedHeightForWidth(1080, 85);
      logInfo(`roundedHeightForWidth(width=1080, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0268 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0269
     * @tc.name      WindowRatio_RoundedHeightForWidth_0269
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=90) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0269 begin`);
      const actual: number = roundedHeightForWidth(1080, 90);
      logInfo(`roundedHeightForWidth(width=1080, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0269 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0270
     * @tc.name      WindowRatio_RoundedHeightForWidth_0270
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=95) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0270 begin`);
      const actual: number = roundedHeightForWidth(1080, 95);
      logInfo(`roundedHeightForWidth(width=1080, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0270 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0271
     * @tc.name      WindowRatio_RoundedHeightForWidth_0271
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=77.45) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0271 begin`);
      const actual: number = roundedHeightForWidth(1080, 77.45);
      logInfo(`roundedHeightForWidth(width=1080, ratio=7...: actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0271 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0272
     * @tc.name      WindowRatio_RoundedHeightForWidth_0272
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0272 begin`);
      const actual: number = roundedHeightForWidth(1080, -52);
      logInfo(`roundedHeightForWidth(width=1080, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0272 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0273
     * @tc.name      WindowRatio_RoundedHeightForWidth_0273
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0273 begin`);
      const actual: number = roundedHeightForWidth(1920, 0);
      logInfo(`roundedHeightForWidth(width=1920, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0273 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0274
     * @tc.name      WindowRatio_RoundedHeightForWidth_0274
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0274 begin`);
      const actual: number = roundedHeightForWidth(1920, -1);
      logInfo(`roundedHeightForWidth(width=1920, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0274 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0275
     * @tc.name      WindowRatio_RoundedHeightForWidth_0275
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=40) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0275 begin`);
      const actual: number = roundedHeightForWidth(1920, 40);
      logInfo(`roundedHeightForWidth(width=1920, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0275 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0276
     * @tc.name      WindowRatio_RoundedHeightForWidth_0276
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=45) returns 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0276 begin`);
      const actual: number = roundedHeightForWidth(1920, 45);
      logInfo(`roundedHeightForWidth(width=1920, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0276 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0277
     * @tc.name      WindowRatio_RoundedHeightForWidth_0277
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=70) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0277 begin`);
      const actual: number = roundedHeightForWidth(1920, 70);
      logInfo(`roundedHeightForWidth(width=1920, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0277 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0278
     * @tc.name      WindowRatio_RoundedHeightForWidth_0278
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=80) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0278 begin`);
      const actual: number = roundedHeightForWidth(1920, 80);
      logInfo(`roundedHeightForWidth(width=1920, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0278 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0279
     * @tc.name      WindowRatio_RoundedHeightForWidth_0279
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=90) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0279 begin`);
      const actual: number = roundedHeightForWidth(1920, 90);
      logInfo(`roundedHeightForWidth(width=1920, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0279 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0280
     * @tc.name      WindowRatio_RoundedHeightForWidth_0280
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=95) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0280 begin`);
      const actual: number = roundedHeightForWidth(1920, 95);
      logInfo(`roundedHeightForWidth(width=1920, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0280 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0281
     * @tc.name      WindowRatio_RoundedHeightForWidth_0281
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0281 begin`);
      const actual: number = roundedHeightForWidth(1920, -52);
      logInfo(`roundedHeightForWidth(width=1920, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0281 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0282
     * @tc.name      WindowRatio_RoundedHeightForWidth_0282
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0282 begin`);
      const actual: number = roundedHeightForWidth(-1, 0);
      logInfo(`roundedHeightForWidth(width=-1, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0282 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0283
     * @tc.name      WindowRatio_RoundedHeightForWidth_0283
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=1.5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0283 begin`);
      const actual: number = roundedHeightForWidth(-1, 1.5);
      logInfo(`roundedHeightForWidth(width=-1, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0283 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0284
     * @tc.name      WindowRatio_RoundedHeightForWidth_0284
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0284 begin`);
      const actual: number = roundedHeightForWidth(-1, 2);
      logInfo(`roundedHeightForWidth(width=-1, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0284 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0285
     * @tc.name      WindowRatio_RoundedHeightForWidth_0285
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0285 begin`);
      const actual: number = roundedHeightForWidth(-1, -1);
      logInfo(`roundedHeightForWidth(width=-1, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0285 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0286
     * @tc.name      WindowRatio_RoundedHeightForWidth_0286
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0286 begin`);
      const actual: number = roundedHeightForWidth(-1, 3);
      logInfo(`roundedHeightForWidth(width=-1, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0286 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0287
     * @tc.name      WindowRatio_RoundedHeightForWidth_0287
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0287 begin`);
      const actual: number = roundedHeightForWidth(-1, 10);
      logInfo(`roundedHeightForWidth(width=-1, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0287 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0288
     * @tc.name      WindowRatio_RoundedHeightForWidth_0288
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0288 begin`);
      const actual: number = roundedHeightForWidth(-1, 100);
      logInfo(`roundedHeightForWidth(width=-1, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0288 end`);
    });
  });
}
