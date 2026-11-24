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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { scaledFontOf } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for scaledFontOf (96 cases). */
export default function scaledFontOf3Test(): void {
  describe('ScaledFontOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0193
     * @tc.name      NdkNotification_ScaledFontOf_0193
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=80) returns 2800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0193 begin`);
      const actual: number = scaledFontOf(35, 80);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(2800);
      logInfo(`${BUNDLE}ScaledFontOf_0193 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0194
     * @tc.name      NdkNotification_ScaledFontOf_0194
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=85) returns 2975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0194 begin`);
      const actual: number = scaledFontOf(35, 85);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(2975);
      logInfo(`${BUNDLE}ScaledFontOf_0194 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0195
     * @tc.name      NdkNotification_ScaledFontOf_0195
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=90) returns 3150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0195 begin`);
      const actual: number = scaledFontOf(35, 90);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(3150);
      logInfo(`${BUNDLE}ScaledFontOf_0195 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0196
     * @tc.name      NdkNotification_ScaledFontOf_0196
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=95) returns 3325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0196 begin`);
      const actual: number = scaledFontOf(35, 95);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(3325);
      logInfo(`${BUNDLE}ScaledFontOf_0196 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0197
     * @tc.name      NdkNotification_ScaledFontOf_0197
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=81.12) returns 2839.2000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0197 begin`);
      const actual: number = scaledFontOf(35, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(2839.2000000000003, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0197 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0198
     * @tc.name      NdkNotification_ScaledFontOf_0198
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=6.82) returns 238.70000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0198 begin`);
      const actual: number = scaledFontOf(35, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(238.70000000000002, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0198 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0199
     * @tc.name      NdkNotification_ScaledFontOf_0199
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=55) returns 2200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0199 begin`);
      const actual: number = scaledFontOf(40, 55);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(2200);
      logInfo(`${BUNDLE}ScaledFontOf_0199 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0200
     * @tc.name      NdkNotification_ScaledFontOf_0200
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=65) returns 2600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0200 begin`);
      const actual: number = scaledFontOf(40, 65);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(2600);
      logInfo(`${BUNDLE}ScaledFontOf_0200 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0201
     * @tc.name      NdkNotification_ScaledFontOf_0201
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=80) returns 3200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0201 begin`);
      const actual: number = scaledFontOf(40, 80);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(3200);
      logInfo(`${BUNDLE}ScaledFontOf_0201 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0202
     * @tc.name      NdkNotification_ScaledFontOf_0202
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=85) returns 3400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0202 begin`);
      const actual: number = scaledFontOf(40, 85);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(3400);
      logInfo(`${BUNDLE}ScaledFontOf_0202 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0203
     * @tc.name      NdkNotification_ScaledFontOf_0203
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=90) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0203 begin`);
      const actual: number = scaledFontOf(40, 90);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}ScaledFontOf_0203 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0204
     * @tc.name      NdkNotification_ScaledFontOf_0204
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=95) returns 3800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0204 begin`);
      const actual: number = scaledFontOf(40, 95);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(3800);
      logInfo(`${BUNDLE}ScaledFontOf_0204 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0205
     * @tc.name      NdkNotification_ScaledFontOf_0205
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=81.12) returns 3244.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0205 begin`);
      const actual: number = scaledFontOf(40, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(3244.8, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0205 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0206
     * @tc.name      NdkNotification_ScaledFontOf_0206
     * @tc.desc      scaledFontOf(fontSizeFp=40, fontScale=6.82) returns 272.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0206 begin`);
      const actual: number = scaledFontOf(40, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=40, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(272.8, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0206 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0207
     * @tc.name      NdkNotification_ScaledFontOf_0207
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=0.25) returns 11.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0207 begin`);
      const actual: number = scaledFontOf(45, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(11.25, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0207 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0208
     * @tc.name      NdkNotification_ScaledFontOf_0208
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=1.5) returns 67.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0208 begin`);
      const actual: number = scaledFontOf(45, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(67.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0208 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0209
     * @tc.name      NdkNotification_ScaledFontOf_0209
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=45) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0209 begin`);
      const actual: number = scaledFontOf(45, 45);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=45): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}ScaledFontOf_0209 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0210
     * @tc.name      NdkNotification_ScaledFontOf_0210
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=55) returns 2475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0210 begin`);
      const actual: number = scaledFontOf(45, 55);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(2475);
      logInfo(`${BUNDLE}ScaledFontOf_0210 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0211
     * @tc.name      NdkNotification_ScaledFontOf_0211
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=65) returns 2925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0211 begin`);
      const actual: number = scaledFontOf(45, 65);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(2925);
      logInfo(`${BUNDLE}ScaledFontOf_0211 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0212
     * @tc.name      NdkNotification_ScaledFontOf_0212
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=75) returns 3375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0212 begin`);
      const actual: number = scaledFontOf(45, 75);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(3375);
      logInfo(`${BUNDLE}ScaledFontOf_0212 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0213
     * @tc.name      NdkNotification_ScaledFontOf_0213
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=85) returns 3825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0213 begin`);
      const actual: number = scaledFontOf(45, 85);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(3825);
      logInfo(`${BUNDLE}ScaledFontOf_0213 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0214
     * @tc.name      NdkNotification_ScaledFontOf_0214
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=90) returns 4050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0214 begin`);
      const actual: number = scaledFontOf(45, 90);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(4050);
      logInfo(`${BUNDLE}ScaledFontOf_0214 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0215
     * @tc.name      NdkNotification_ScaledFontOf_0215
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=95) returns 4275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0215 begin`);
      const actual: number = scaledFontOf(45, 95);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(4275);
      logInfo(`${BUNDLE}ScaledFontOf_0215 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0216
     * @tc.name      NdkNotification_ScaledFontOf_0216
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=81.12) returns 3650.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0216 begin`);
      const actual: number = scaledFontOf(45, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(3650.4, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0216 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0217
     * @tc.name      NdkNotification_ScaledFontOf_0217
     * @tc.desc      scaledFontOf(fontSizeFp=45, fontScale=6.82) returns 306.90000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0217 begin`);
      const actual: number = scaledFontOf(45, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=45, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(306.90000000000003, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0217 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0218
     * @tc.name      NdkNotification_ScaledFontOf_0218
     * @tc.desc      scaledFontOf(fontSizeFp=50, fontScale=55) returns 2750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0218 begin`);
      const actual: number = scaledFontOf(50, 55);
      logInfo(`scaledFontOf(fontSizeFp=50, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(2750);
      logInfo(`${BUNDLE}ScaledFontOf_0218 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0219
     * @tc.name      NdkNotification_ScaledFontOf_0219
     * @tc.desc      scaledFontOf(fontSizeFp=50, fontScale=65) returns 3250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0219 begin`);
      const actual: number = scaledFontOf(50, 65);
      logInfo(`scaledFontOf(fontSizeFp=50, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(3250);
      logInfo(`${BUNDLE}ScaledFontOf_0219 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0220
     * @tc.name      NdkNotification_ScaledFontOf_0220
     * @tc.desc      scaledFontOf(fontSizeFp=50, fontScale=75) returns 3750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0220 begin`);
      const actual: number = scaledFontOf(50, 75);
      logInfo(`scaledFontOf(fontSizeFp=50, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(3750);
      logInfo(`${BUNDLE}ScaledFontOf_0220 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0221
     * @tc.name      NdkNotification_ScaledFontOf_0221
     * @tc.desc      scaledFontOf(fontSizeFp=50, fontScale=85) returns 4250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0221 begin`);
      const actual: number = scaledFontOf(50, 85);
      logInfo(`scaledFontOf(fontSizeFp=50, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(4250);
      logInfo(`${BUNDLE}ScaledFontOf_0221 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0222
     * @tc.name      NdkNotification_ScaledFontOf_0222
     * @tc.desc      scaledFontOf(fontSizeFp=50, fontScale=95) returns 4750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0222 begin`);
      const actual: number = scaledFontOf(50, 95);
      logInfo(`scaledFontOf(fontSizeFp=50, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(4750);
      logInfo(`${BUNDLE}ScaledFontOf_0222 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0223
     * @tc.name      NdkNotification_ScaledFontOf_0223
     * @tc.desc      scaledFontOf(fontSizeFp=50, fontScale=81.12) returns 4056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0223 begin`);
      const actual: number = scaledFontOf(50, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=50, fontScale=81.12): actual=${actual}`);
      expect(actual).assertEqual(4056);
      logInfo(`${BUNDLE}ScaledFontOf_0223 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0224
     * @tc.name      NdkNotification_ScaledFontOf_0224
     * @tc.desc      scaledFontOf(fontSizeFp=50, fontScale=6.82) returns 341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0224 begin`);
      const actual: number = scaledFontOf(50, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=50, fontScale=6.82): actual=${actual}`);
      expect(actual).assertEqual(341);
      logInfo(`${BUNDLE}ScaledFontOf_0224 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0225
     * @tc.name      NdkNotification_ScaledFontOf_0225
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=0.25) returns 13.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0225 begin`);
      const actual: number = scaledFontOf(55, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(13.75, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0225 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0226
     * @tc.name      NdkNotification_ScaledFontOf_0226
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=0.5) returns 27.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0226 begin`);
      const actual: number = scaledFontOf(55, 0.5);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=0.5): actual=${actual}`);
      expect(actual).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0226 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0227
     * @tc.name      NdkNotification_ScaledFontOf_0227
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=1.5) returns 82.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0227 begin`);
      const actual: number = scaledFontOf(55, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(82.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0227 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0228
     * @tc.name      NdkNotification_ScaledFontOf_0228
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=55) returns 3025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0228 begin`);
      const actual: number = scaledFontOf(55, 55);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(3025);
      logInfo(`${BUNDLE}ScaledFontOf_0228 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0229
     * @tc.name      NdkNotification_ScaledFontOf_0229
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=60) returns 3300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0229 begin`);
      const actual: number = scaledFontOf(55, 60);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=60): actual=${actual}`);
      expect(actual).assertEqual(3300);
      logInfo(`${BUNDLE}ScaledFontOf_0229 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0230
     * @tc.name      NdkNotification_ScaledFontOf_0230
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=65) returns 3575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0230 begin`);
      const actual: number = scaledFontOf(55, 65);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(3575);
      logInfo(`${BUNDLE}ScaledFontOf_0230 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0231
     * @tc.name      NdkNotification_ScaledFontOf_0231
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=70) returns 3850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0231 begin`);
      const actual: number = scaledFontOf(55, 70);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(3850);
      logInfo(`${BUNDLE}ScaledFontOf_0231 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0232
     * @tc.name      NdkNotification_ScaledFontOf_0232
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=75) returns 4125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0232 begin`);
      const actual: number = scaledFontOf(55, 75);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(4125);
      logInfo(`${BUNDLE}ScaledFontOf_0232 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0233
     * @tc.name      NdkNotification_ScaledFontOf_0233
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=80) returns 4400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0233 begin`);
      const actual: number = scaledFontOf(55, 80);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(4400);
      logInfo(`${BUNDLE}ScaledFontOf_0233 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0234
     * @tc.name      NdkNotification_ScaledFontOf_0234
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=85) returns 4675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0234 begin`);
      const actual: number = scaledFontOf(55, 85);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(4675);
      logInfo(`${BUNDLE}ScaledFontOf_0234 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0235
     * @tc.name      NdkNotification_ScaledFontOf_0235
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=90) returns 4950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0235 begin`);
      const actual: number = scaledFontOf(55, 90);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(4950);
      logInfo(`${BUNDLE}ScaledFontOf_0235 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0236
     * @tc.name      NdkNotification_ScaledFontOf_0236
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=95) returns 5225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0236 begin`);
      const actual: number = scaledFontOf(55, 95);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(5225);
      logInfo(`${BUNDLE}ScaledFontOf_0236 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0237
     * @tc.name      NdkNotification_ScaledFontOf_0237
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=81.12) returns 4461.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0237 begin`);
      const actual: number = scaledFontOf(55, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(4461.6, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0237 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0238
     * @tc.name      NdkNotification_ScaledFontOf_0238
     * @tc.desc      scaledFontOf(fontSizeFp=55, fontScale=6.82) returns 375.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0238 begin`);
      const actual: number = scaledFontOf(55, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=55, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(375.1, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0238 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0239
     * @tc.name      NdkNotification_ScaledFontOf_0239
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=65) returns 3900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0239 begin`);
      const actual: number = scaledFontOf(60, 65);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(3900);
      logInfo(`${BUNDLE}ScaledFontOf_0239 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0240
     * @tc.name      NdkNotification_ScaledFontOf_0240
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=70) returns 4200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0240 begin`);
      const actual: number = scaledFontOf(60, 70);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(4200);
      logInfo(`${BUNDLE}ScaledFontOf_0240 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0241
     * @tc.name      NdkNotification_ScaledFontOf_0241
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=80) returns 4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0241 begin`);
      const actual: number = scaledFontOf(60, 80);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(4800);
      logInfo(`${BUNDLE}ScaledFontOf_0241 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0242
     * @tc.name      NdkNotification_ScaledFontOf_0242
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=85) returns 5100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0242 begin`);
      const actual: number = scaledFontOf(60, 85);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(5100);
      logInfo(`${BUNDLE}ScaledFontOf_0242 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0243
     * @tc.name      NdkNotification_ScaledFontOf_0243
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=90) returns 5400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0243 begin`);
      const actual: number = scaledFontOf(60, 90);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(5400);
      logInfo(`${BUNDLE}ScaledFontOf_0243 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0244
     * @tc.name      NdkNotification_ScaledFontOf_0244
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=95) returns 5700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0244 begin`);
      const actual: number = scaledFontOf(60, 95);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(5700);
      logInfo(`${BUNDLE}ScaledFontOf_0244 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0245
     * @tc.name      NdkNotification_ScaledFontOf_0245
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=81.12) returns 4867.200000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0245 begin`);
      const actual: number = scaledFontOf(60, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(4867.200000000001, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0245 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0246
     * @tc.name      NdkNotification_ScaledFontOf_0246
     * @tc.desc      scaledFontOf(fontSizeFp=60, fontScale=6.82) returns 409.20000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0246 begin`);
      const actual: number = scaledFontOf(60, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=60, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(409.20000000000005, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0246 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0247
     * @tc.name      NdkNotification_ScaledFontOf_0247
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=0.25) returns 16.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0247 begin`);
      const actual: number = scaledFontOf(65, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(16.25, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0247 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0248
     * @tc.name      NdkNotification_ScaledFontOf_0248
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=0.5) returns 32.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0248 begin`);
      const actual: number = scaledFontOf(65, 0.5);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=0.5): actual=${actual}`);
      expect(actual).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0248 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0249
     * @tc.name      NdkNotification_ScaledFontOf_0249
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=1.5) returns 97.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0249 begin`);
      const actual: number = scaledFontOf(65, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(97.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0249 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0250
     * @tc.name      NdkNotification_ScaledFontOf_0250
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=65) returns 4225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0250 begin`);
      const actual: number = scaledFontOf(65, 65);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(4225);
      logInfo(`${BUNDLE}ScaledFontOf_0250 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0251
     * @tc.name      NdkNotification_ScaledFontOf_0251
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=70) returns 4550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0251 begin`);
      const actual: number = scaledFontOf(65, 70);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(4550);
      logInfo(`${BUNDLE}ScaledFontOf_0251 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0252
     * @tc.name      NdkNotification_ScaledFontOf_0252
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=75) returns 4875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0252 begin`);
      const actual: number = scaledFontOf(65, 75);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(4875);
      logInfo(`${BUNDLE}ScaledFontOf_0252 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0253
     * @tc.name      NdkNotification_ScaledFontOf_0253
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=80) returns 5200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0253 begin`);
      const actual: number = scaledFontOf(65, 80);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(5200);
      logInfo(`${BUNDLE}ScaledFontOf_0253 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0254
     * @tc.name      NdkNotification_ScaledFontOf_0254
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=85) returns 5525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0254 begin`);
      const actual: number = scaledFontOf(65, 85);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(5525);
      logInfo(`${BUNDLE}ScaledFontOf_0254 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0255
     * @tc.name      NdkNotification_ScaledFontOf_0255
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=90) returns 5850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0255 begin`);
      const actual: number = scaledFontOf(65, 90);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(5850);
      logInfo(`${BUNDLE}ScaledFontOf_0255 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0256
     * @tc.name      NdkNotification_ScaledFontOf_0256
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=95) returns 6175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0256 begin`);
      const actual: number = scaledFontOf(65, 95);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(6175);
      logInfo(`${BUNDLE}ScaledFontOf_0256 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0257
     * @tc.name      NdkNotification_ScaledFontOf_0257
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=81.12) returns 5272.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0257 begin`);
      const actual: number = scaledFontOf(65, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(5272.8, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0257 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0258
     * @tc.name      NdkNotification_ScaledFontOf_0258
     * @tc.desc      scaledFontOf(fontSizeFp=65, fontScale=6.82) returns 443.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0258 begin`);
      const actual: number = scaledFontOf(65, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=65, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(443.3, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0258 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0259
     * @tc.name      NdkNotification_ScaledFontOf_0259
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=70) returns 4900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0259 begin`);
      const actual: number = scaledFontOf(70, 70);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(4900);
      logInfo(`${BUNDLE}ScaledFontOf_0259 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0260
     * @tc.name      NdkNotification_ScaledFontOf_0260
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=75) returns 5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0260 begin`);
      const actual: number = scaledFontOf(70, 75);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(5250);
      logInfo(`${BUNDLE}ScaledFontOf_0260 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0261
     * @tc.name      NdkNotification_ScaledFontOf_0261
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=80) returns 5600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0261 begin`);
      const actual: number = scaledFontOf(70, 80);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(5600);
      logInfo(`${BUNDLE}ScaledFontOf_0261 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0262
     * @tc.name      NdkNotification_ScaledFontOf_0262
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=85) returns 5950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0262 begin`);
      const actual: number = scaledFontOf(70, 85);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(5950);
      logInfo(`${BUNDLE}ScaledFontOf_0262 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0263
     * @tc.name      NdkNotification_ScaledFontOf_0263
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=90) returns 6300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0263 begin`);
      const actual: number = scaledFontOf(70, 90);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(6300);
      logInfo(`${BUNDLE}ScaledFontOf_0263 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0264
     * @tc.name      NdkNotification_ScaledFontOf_0264
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=95) returns 6650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0264 begin`);
      const actual: number = scaledFontOf(70, 95);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(6650);
      logInfo(`${BUNDLE}ScaledFontOf_0264 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0265
     * @tc.name      NdkNotification_ScaledFontOf_0265
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=81.12) returns 5678.400000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0265 begin`);
      const actual: number = scaledFontOf(70, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(5678.400000000001, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0265 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0266
     * @tc.name      NdkNotification_ScaledFontOf_0266
     * @tc.desc      scaledFontOf(fontSizeFp=70, fontScale=6.82) returns 477.40000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0266 begin`);
      const actual: number = scaledFontOf(70, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=70, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(477.40000000000003, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0266 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0267
     * @tc.name      NdkNotification_ScaledFontOf_0267
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=0.25) returns 18.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0267 begin`);
      const actual: number = scaledFontOf(75, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(18.75, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0267 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0268
     * @tc.name      NdkNotification_ScaledFontOf_0268
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=1.5) returns 112.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0268 begin`);
      const actual: number = scaledFontOf(75, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(112.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0268 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0269
     * @tc.name      NdkNotification_ScaledFontOf_0269
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=75) returns 5625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0269 begin`);
      const actual: number = scaledFontOf(75, 75);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(5625);
      logInfo(`${BUNDLE}ScaledFontOf_0269 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0270
     * @tc.name      NdkNotification_ScaledFontOf_0270
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=85) returns 6375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0270 begin`);
      const actual: number = scaledFontOf(75, 85);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(6375);
      logInfo(`${BUNDLE}ScaledFontOf_0270 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0271
     * @tc.name      NdkNotification_ScaledFontOf_0271
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=90) returns 6750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0271 begin`);
      const actual: number = scaledFontOf(75, 90);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(6750);
      logInfo(`${BUNDLE}ScaledFontOf_0271 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0272
     * @tc.name      NdkNotification_ScaledFontOf_0272
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=95) returns 7125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0272 begin`);
      const actual: number = scaledFontOf(75, 95);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(7125);
      logInfo(`${BUNDLE}ScaledFontOf_0272 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0273
     * @tc.name      NdkNotification_ScaledFontOf_0273
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=81.12) returns 6084
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0273 begin`);
      const actual: number = scaledFontOf(75, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=81.12): actual=${actual}`);
      expect(actual).assertEqual(6084);
      logInfo(`${BUNDLE}ScaledFontOf_0273 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0274
     * @tc.name      NdkNotification_ScaledFontOf_0274
     * @tc.desc      scaledFontOf(fontSizeFp=75, fontScale=6.82) returns 511.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0274 begin`);
      const actual: number = scaledFontOf(75, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=75, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(511.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0274 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0275
     * @tc.name      NdkNotification_ScaledFontOf_0275
     * @tc.desc      scaledFontOf(fontSizeFp=80, fontScale=80) returns 6400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0275 begin`);
      const actual: number = scaledFontOf(80, 80);
      logInfo(`scaledFontOf(fontSizeFp=80, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(6400);
      logInfo(`${BUNDLE}ScaledFontOf_0275 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0276
     * @tc.name      NdkNotification_ScaledFontOf_0276
     * @tc.desc      scaledFontOf(fontSizeFp=80, fontScale=85) returns 6800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0276 begin`);
      const actual: number = scaledFontOf(80, 85);
      logInfo(`scaledFontOf(fontSizeFp=80, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(6800);
      logInfo(`${BUNDLE}ScaledFontOf_0276 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0277
     * @tc.name      NdkNotification_ScaledFontOf_0277
     * @tc.desc      scaledFontOf(fontSizeFp=80, fontScale=90) returns 7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0277 begin`);
      const actual: number = scaledFontOf(80, 90);
      logInfo(`scaledFontOf(fontSizeFp=80, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(7200);
      logInfo(`${BUNDLE}ScaledFontOf_0277 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0278
     * @tc.name      NdkNotification_ScaledFontOf_0278
     * @tc.desc      scaledFontOf(fontSizeFp=80, fontScale=95) returns 7600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0278 begin`);
      const actual: number = scaledFontOf(80, 95);
      logInfo(`scaledFontOf(fontSizeFp=80, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(7600);
      logInfo(`${BUNDLE}ScaledFontOf_0278 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0279
     * @tc.name      NdkNotification_ScaledFontOf_0279
     * @tc.desc      scaledFontOf(fontSizeFp=80, fontScale=81.12) returns 6489.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0279 begin`);
      const actual: number = scaledFontOf(80, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=80, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(6489.6, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0279 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0280
     * @tc.name      NdkNotification_ScaledFontOf_0280
     * @tc.desc      scaledFontOf(fontSizeFp=80, fontScale=6.82) returns 545.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0280 begin`);
      const actual: number = scaledFontOf(80, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=80, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(545.6, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0280 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0281
     * @tc.name      NdkNotification_ScaledFontOf_0281
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=0.25) returns 21.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0281 begin`);
      const actual: number = scaledFontOf(85, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(21.25, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0281 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0282
     * @tc.name      NdkNotification_ScaledFontOf_0282
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=0.5) returns 42.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0282 begin`);
      const actual: number = scaledFontOf(85, 0.5);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=0.5): actual=${actual}`);
      expect(actual).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0282 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0283
     * @tc.name      NdkNotification_ScaledFontOf_0283
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=1.5) returns 127.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0283 begin`);
      const actual: number = scaledFontOf(85, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(127.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0283 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0284
     * @tc.name      NdkNotification_ScaledFontOf_0284
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=85) returns 7225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0284 begin`);
      const actual: number = scaledFontOf(85, 85);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(7225);
      logInfo(`${BUNDLE}ScaledFontOf_0284 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0285
     * @tc.name      NdkNotification_ScaledFontOf_0285
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=90) returns 7650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0285 begin`);
      const actual: number = scaledFontOf(85, 90);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(7650);
      logInfo(`${BUNDLE}ScaledFontOf_0285 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0286
     * @tc.name      NdkNotification_ScaledFontOf_0286
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=95) returns 8075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0286 begin`);
      const actual: number = scaledFontOf(85, 95);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(8075);
      logInfo(`${BUNDLE}ScaledFontOf_0286 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0287
     * @tc.name      NdkNotification_ScaledFontOf_0287
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=81.12) returns 6895.200000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0287 begin`);
      const actual: number = scaledFontOf(85, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(6895.200000000001, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0287 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0288
     * @tc.name      NdkNotification_ScaledFontOf_0288
     * @tc.desc      scaledFontOf(fontSizeFp=85, fontScale=6.82) returns 579.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0288 begin`);
      const actual: number = scaledFontOf(85, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=85, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(579.7, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0288 end`);
    });
  });
}
