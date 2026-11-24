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

/** Logic checks for scaledFontOf (11 cases). */
export default function scaledFontOf4Test(): void {
  describe('ScaledFontOf4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0289
     * @tc.name      NdkNotification_ScaledFontOf_0289
     * @tc.desc      scaledFontOf(fontSizeFp=90, fontScale=90) returns 8100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0289 begin`);
      const actual: number = scaledFontOf(90, 90);
      logInfo(`scaledFontOf(fontSizeFp=90, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(8100);
      logInfo(`${BUNDLE}ScaledFontOf_0289 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0290
     * @tc.name      NdkNotification_ScaledFontOf_0290
     * @tc.desc      scaledFontOf(fontSizeFp=90, fontScale=95) returns 8550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0290 begin`);
      const actual: number = scaledFontOf(90, 95);
      logInfo(`scaledFontOf(fontSizeFp=90, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(8550);
      logInfo(`${BUNDLE}ScaledFontOf_0290 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0291
     * @tc.name      NdkNotification_ScaledFontOf_0291
     * @tc.desc      scaledFontOf(fontSizeFp=90, fontScale=81.12) returns 7300.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0291 begin`);
      const actual: number = scaledFontOf(90, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=90, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(7300.8, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0291 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0292
     * @tc.name      NdkNotification_ScaledFontOf_0292
     * @tc.desc      scaledFontOf(fontSizeFp=90, fontScale=6.82) returns 613.8000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0292 begin`);
      const actual: number = scaledFontOf(90, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=90, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(613.8000000000001, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0292 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0293
     * @tc.name      NdkNotification_ScaledFontOf_0293
     * @tc.desc      scaledFontOf(fontSizeFp=95, fontScale=0.25) returns 23.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0293 begin`);
      const actual: number = scaledFontOf(95, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=95, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(23.75, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0293 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0294
     * @tc.name      NdkNotification_ScaledFontOf_0294
     * @tc.desc      scaledFontOf(fontSizeFp=95, fontScale=0.5) returns 47.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0294 begin`);
      const actual: number = scaledFontOf(95, 0.5);
      logInfo(`scaledFontOf(fontSizeFp=95, fontScale=0.5): actual=${actual}`);
      expect(actual).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0294 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0295
     * @tc.name      NdkNotification_ScaledFontOf_0295
     * @tc.desc      scaledFontOf(fontSizeFp=95, fontScale=1.5) returns 142.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0295 begin`);
      const actual: number = scaledFontOf(95, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=95, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(142.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0295 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0296
     * @tc.name      NdkNotification_ScaledFontOf_0296
     * @tc.desc      scaledFontOf(fontSizeFp=95, fontScale=95) returns 9025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0296 begin`);
      const actual: number = scaledFontOf(95, 95);
      logInfo(`scaledFontOf(fontSizeFp=95, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(9025);
      logInfo(`${BUNDLE}ScaledFontOf_0296 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0297
     * @tc.name      NdkNotification_ScaledFontOf_0297
     * @tc.desc      scaledFontOf(fontSizeFp=95, fontScale=81.12) returns 7706.400000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0297 begin`);
      const actual: number = scaledFontOf(95, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=95, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(7706.400000000001, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0297 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0298
     * @tc.name      NdkNotification_ScaledFontOf_0298
     * @tc.desc      scaledFontOf(fontSizeFp=95, fontScale=6.82) returns 647.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0298 begin`);
      const actual: number = scaledFontOf(95, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=95, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(647.9, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0298 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0299
     * @tc.name      NdkNotification_ScaledFontOf_0299
     * @tc.desc      scaledFontOf(fontSizeFp=105, fontScale=0.25) returns 26.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0299 begin`);
      const actual: number = scaledFontOf(105, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=105, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(26.25, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0299 end`);
    });
  });
}
