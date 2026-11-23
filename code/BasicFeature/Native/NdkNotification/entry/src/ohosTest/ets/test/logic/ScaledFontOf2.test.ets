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
export default function scaledFontOf2Test(): void {
  describe('ScaledFontOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0097
     * @tc.name      NdkNotification_ScaledFontOf_0097
     * @tc.desc      scaledFontOf(fontSizeFp=100, fontScale=95) returns 9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0097 begin`);
      const actual: number = scaledFontOf(100, 95);
      logInfo(`scaledFontOf(fontSizeFp=100, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(9500);
      logInfo(`${BUNDLE}ScaledFontOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0098
     * @tc.name      NdkNotification_ScaledFontOf_0098
     * @tc.desc      scaledFontOf(fontSizeFp=100, fontScale=81.12) returns 8112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0098 begin`);
      const actual: number = scaledFontOf(100, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=100, fontScale=81...: actual=${actual}`);
      expect(actual).assertEqual(8112);
      logInfo(`${BUNDLE}ScaledFontOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0099
     * @tc.name      NdkNotification_ScaledFontOf_0099
     * @tc.desc      scaledFontOf(fontSizeFp=100, fontScale=6.82) returns 682
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0099 begin`);
      const actual: number = scaledFontOf(100, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=100, fontScale=6.82): actual=${actual}`);
      expect(actual).assertEqual(682);
      logInfo(`${BUNDLE}ScaledFontOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0100
     * @tc.name      NdkNotification_ScaledFontOf_0100
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=0.25) returns -0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0100 begin`);
      const actual: number = scaledFontOf(-1, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(-0.25, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0101
     * @tc.name      NdkNotification_ScaledFontOf_0101
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=0.5) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0101 begin`);
      const actual: number = scaledFontOf(-1, 0.5);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=0.5): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0102
     * @tc.name      NdkNotification_ScaledFontOf_0102
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=1.5) returns -1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0102 begin`);
      const actual: number = scaledFontOf(-1, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(-1.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0103
     * @tc.name      NdkNotification_ScaledFontOf_0103
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0103 begin`);
      const actual: number = scaledFontOf(-1, 3);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=3): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}ScaledFontOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0104
     * @tc.name      NdkNotification_ScaledFontOf_0104
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0104 begin`);
      const actual: number = scaledFontOf(-1, 15);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=15): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ScaledFontOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0105
     * @tc.name      NdkNotification_ScaledFontOf_0105
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=20) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0105 begin`);
      const actual: number = scaledFontOf(-1, 20);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=20): actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ScaledFontOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0106
     * @tc.name      NdkNotification_ScaledFontOf_0106
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0106 begin`);
      const actual: number = scaledFontOf(-1, 25);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=25): actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ScaledFontOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0107
     * @tc.name      NdkNotification_ScaledFontOf_0107
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=30) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0107 begin`);
      const actual: number = scaledFontOf(-1, 30);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=30): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ScaledFontOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0108
     * @tc.name      NdkNotification_ScaledFontOf_0108
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=35) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0108 begin`);
      const actual: number = scaledFontOf(-1, 35);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=35): actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}ScaledFontOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0109
     * @tc.name      NdkNotification_ScaledFontOf_0109
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=40) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0109 begin`);
      const actual: number = scaledFontOf(-1, 40);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=40): actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}ScaledFontOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0110
     * @tc.name      NdkNotification_ScaledFontOf_0110
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0110 begin`);
      const actual: number = scaledFontOf(-1, 45);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}ScaledFontOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0111
     * @tc.name      NdkNotification_ScaledFontOf_0111
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=50) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0111 begin`);
      const actual: number = scaledFontOf(-1, 50);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=50): actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}ScaledFontOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0112
     * @tc.name      NdkNotification_ScaledFontOf_0112
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=55) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0112 begin`);
      const actual: number = scaledFontOf(-1, 55);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}ScaledFontOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0113
     * @tc.name      NdkNotification_ScaledFontOf_0113
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=60) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0113 begin`);
      const actual: number = scaledFontOf(-1, 60);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=60): actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}ScaledFontOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0114
     * @tc.name      NdkNotification_ScaledFontOf_0114
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=65) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0114 begin`);
      const actual: number = scaledFontOf(-1, 65);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}ScaledFontOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0115
     * @tc.name      NdkNotification_ScaledFontOf_0115
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=70) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0115 begin`);
      const actual: number = scaledFontOf(-1, 70);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}ScaledFontOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0116
     * @tc.name      NdkNotification_ScaledFontOf_0116
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=75) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0116 begin`);
      const actual: number = scaledFontOf(-1, 75);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}ScaledFontOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0117
     * @tc.name      NdkNotification_ScaledFontOf_0117
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=80) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0117 begin`);
      const actual: number = scaledFontOf(-1, 80);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}ScaledFontOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0118
     * @tc.name      NdkNotification_ScaledFontOf_0118
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=85) returns -85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0118 begin`);
      const actual: number = scaledFontOf(-1, 85);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(-85);
      logInfo(`${BUNDLE}ScaledFontOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0119
     * @tc.name      NdkNotification_ScaledFontOf_0119
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=90) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0119 begin`);
      const actual: number = scaledFontOf(-1, 90);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}ScaledFontOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0120
     * @tc.name      NdkNotification_ScaledFontOf_0120
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=95) returns -95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0120 begin`);
      const actual: number = scaledFontOf(-1, 95);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(-95);
      logInfo(`${BUNDLE}ScaledFontOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0121
     * @tc.name      NdkNotification_ScaledFontOf_0121
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=81.12) returns -81.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0121 begin`);
      const actual: number = scaledFontOf(-1, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(-81.12, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0122
     * @tc.name      NdkNotification_ScaledFontOf_0122
     * @tc.desc      scaledFontOf(fontSizeFp=-1, fontScale=6.82) returns -6.82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ScaledFontOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0122 begin`);
      const actual: number = scaledFontOf(-1, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=-1, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(-6.82, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0123
     * @tc.name      NdkNotification_ScaledFontOf_0123
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=0.25) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0123 begin`);
      const actual: number = scaledFontOf(3, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0124
     * @tc.name      NdkNotification_ScaledFontOf_0124
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=1.5) returns 4.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0124 begin`);
      const actual: number = scaledFontOf(3, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(4.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0125
     * @tc.name      NdkNotification_ScaledFontOf_0125
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=3) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0125 begin`);
      const actual: number = scaledFontOf(3, 3);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=3): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}ScaledFontOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0126
     * @tc.name      NdkNotification_ScaledFontOf_0126
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=35) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0126 begin`);
      const actual: number = scaledFontOf(3, 35);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=35): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}ScaledFontOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0127
     * @tc.name      NdkNotification_ScaledFontOf_0127
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=45) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0127 begin`);
      const actual: number = scaledFontOf(3, 45);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=45): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}ScaledFontOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0128
     * @tc.name      NdkNotification_ScaledFontOf_0128
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=55) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0128 begin`);
      const actual: number = scaledFontOf(3, 55);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}ScaledFontOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0129
     * @tc.name      NdkNotification_ScaledFontOf_0129
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=65) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0129 begin`);
      const actual: number = scaledFontOf(3, 65);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}ScaledFontOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0130
     * @tc.name      NdkNotification_ScaledFontOf_0130
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=70) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0130 begin`);
      const actual: number = scaledFontOf(3, 70);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}ScaledFontOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0131
     * @tc.name      NdkNotification_ScaledFontOf_0131
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=80) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0131 begin`);
      const actual: number = scaledFontOf(3, 80);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}ScaledFontOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0132
     * @tc.name      NdkNotification_ScaledFontOf_0132
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=85) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0132 begin`);
      const actual: number = scaledFontOf(3, 85);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(255);
      logInfo(`${BUNDLE}ScaledFontOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0133
     * @tc.name      NdkNotification_ScaledFontOf_0133
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=90) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0133 begin`);
      const actual: number = scaledFontOf(3, 90);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}ScaledFontOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0134
     * @tc.name      NdkNotification_ScaledFontOf_0134
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=95) returns 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0134 begin`);
      const actual: number = scaledFontOf(3, 95);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(285);
      logInfo(`${BUNDLE}ScaledFontOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0135
     * @tc.name      NdkNotification_ScaledFontOf_0135
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=81.12) returns 243.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0135 begin`);
      const actual: number = scaledFontOf(3, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(243.36, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0136
     * @tc.name      NdkNotification_ScaledFontOf_0136
     * @tc.desc      scaledFontOf(fontSizeFp=3, fontScale=6.82) returns 20.46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0136 begin`);
      const actual: number = scaledFontOf(3, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=3, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(20.46, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0137
     * @tc.name      NdkNotification_ScaledFontOf_0137
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=0.25) returns 3.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0137 begin`);
      const actual: number = scaledFontOf(15, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(3.75, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0138
     * @tc.name      NdkNotification_ScaledFontOf_0138
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=1.5) returns 22.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0138 begin`);
      const actual: number = scaledFontOf(15, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0139
     * @tc.name      NdkNotification_ScaledFontOf_0139
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=35) returns 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0139 begin`);
      const actual: number = scaledFontOf(15, 35);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=35): actual=${actual}`);
      expect(actual).assertEqual(525);
      logInfo(`${BUNDLE}ScaledFontOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0140
     * @tc.name      NdkNotification_ScaledFontOf_0140
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=45) returns 675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0140 begin`);
      const actual: number = scaledFontOf(15, 45);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=45): actual=${actual}`);
      expect(actual).assertEqual(675);
      logInfo(`${BUNDLE}ScaledFontOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0141
     * @tc.name      NdkNotification_ScaledFontOf_0141
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=55) returns 825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0141 begin`);
      const actual: number = scaledFontOf(15, 55);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(825);
      logInfo(`${BUNDLE}ScaledFontOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0142
     * @tc.name      NdkNotification_ScaledFontOf_0142
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=65) returns 975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0142 begin`);
      const actual: number = scaledFontOf(15, 65);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(975);
      logInfo(`${BUNDLE}ScaledFontOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0143
     * @tc.name      NdkNotification_ScaledFontOf_0143
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=70) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0143 begin`);
      const actual: number = scaledFontOf(15, 70);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(1050);
      logInfo(`${BUNDLE}ScaledFontOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0144
     * @tc.name      NdkNotification_ScaledFontOf_0144
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=75) returns 1125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0144 begin`);
      const actual: number = scaledFontOf(15, 75);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(1125);
      logInfo(`${BUNDLE}ScaledFontOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0145
     * @tc.name      NdkNotification_ScaledFontOf_0145
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=80) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0145 begin`);
      const actual: number = scaledFontOf(15, 80);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}ScaledFontOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0146
     * @tc.name      NdkNotification_ScaledFontOf_0146
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=85) returns 1275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0146 begin`);
      const actual: number = scaledFontOf(15, 85);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(1275);
      logInfo(`${BUNDLE}ScaledFontOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0147
     * @tc.name      NdkNotification_ScaledFontOf_0147
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=90) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0147 begin`);
      const actual: number = scaledFontOf(15, 90);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}ScaledFontOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0148
     * @tc.name      NdkNotification_ScaledFontOf_0148
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=95) returns 1425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0148 begin`);
      const actual: number = scaledFontOf(15, 95);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(1425);
      logInfo(`${BUNDLE}ScaledFontOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0149
     * @tc.name      NdkNotification_ScaledFontOf_0149
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=81.12) returns 1216.8000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0149 begin`);
      const actual: number = scaledFontOf(15, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(1216.8000000000002, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0150
     * @tc.name      NdkNotification_ScaledFontOf_0150
     * @tc.desc      scaledFontOf(fontSizeFp=15, fontScale=6.82) returns 102.30000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0150 begin`);
      const actual: number = scaledFontOf(15, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=15, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(102.30000000000001, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0151
     * @tc.name      NdkNotification_ScaledFontOf_0151
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=55) returns 1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0151 begin`);
      const actual: number = scaledFontOf(20, 55);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}ScaledFontOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0152
     * @tc.name      NdkNotification_ScaledFontOf_0152
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=65) returns 1300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0152 begin`);
      const actual: number = scaledFontOf(20, 65);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(1300);
      logInfo(`${BUNDLE}ScaledFontOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0153
     * @tc.name      NdkNotification_ScaledFontOf_0153
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=70) returns 1400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0153 begin`);
      const actual: number = scaledFontOf(20, 70);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(1400);
      logInfo(`${BUNDLE}ScaledFontOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0154
     * @tc.name      NdkNotification_ScaledFontOf_0154
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=80) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0154 begin`);
      const actual: number = scaledFontOf(20, 80);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}ScaledFontOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0155
     * @tc.name      NdkNotification_ScaledFontOf_0155
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=85) returns 1700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0155 begin`);
      const actual: number = scaledFontOf(20, 85);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(1700);
      logInfo(`${BUNDLE}ScaledFontOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0156
     * @tc.name      NdkNotification_ScaledFontOf_0156
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=90) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0156 begin`);
      const actual: number = scaledFontOf(20, 90);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}ScaledFontOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0157
     * @tc.name      NdkNotification_ScaledFontOf_0157
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=95) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0157 begin`);
      const actual: number = scaledFontOf(20, 95);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}ScaledFontOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0158
     * @tc.name      NdkNotification_ScaledFontOf_0158
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=81.12) returns 1622.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0158 begin`);
      const actual: number = scaledFontOf(20, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(1622.4, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0159
     * @tc.name      NdkNotification_ScaledFontOf_0159
     * @tc.desc      scaledFontOf(fontSizeFp=20, fontScale=6.82) returns 136.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0159 begin`);
      const actual: number = scaledFontOf(20, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=20, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(136.4, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0160
     * @tc.name      NdkNotification_ScaledFontOf_0160
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=0.25) returns 6.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0160 begin`);
      const actual: number = scaledFontOf(25, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(6.25, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0161
     * @tc.name      NdkNotification_ScaledFontOf_0161
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=0.5) returns 12.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0161 begin`);
      const actual: number = scaledFontOf(25, 0.5);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=0.5): actual=${actual}`);
      expect(actual).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0162
     * @tc.name      NdkNotification_ScaledFontOf_0162
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=1.5) returns 37.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0162 begin`);
      const actual: number = scaledFontOf(25, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0163
     * @tc.name      NdkNotification_ScaledFontOf_0163
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=25) returns 625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0163 begin`);
      const actual: number = scaledFontOf(25, 25);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=25): actual=${actual}`);
      expect(actual).assertEqual(625);
      logInfo(`${BUNDLE}ScaledFontOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0164
     * @tc.name      NdkNotification_ScaledFontOf_0164
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=35) returns 875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0164 begin`);
      const actual: number = scaledFontOf(25, 35);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=35): actual=${actual}`);
      expect(actual).assertEqual(875);
      logInfo(`${BUNDLE}ScaledFontOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0165
     * @tc.name      NdkNotification_ScaledFontOf_0165
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=50) returns 1250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0165 begin`);
      const actual: number = scaledFontOf(25, 50);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=50): actual=${actual}`);
      expect(actual).assertEqual(1250);
      logInfo(`${BUNDLE}ScaledFontOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0166
     * @tc.name      NdkNotification_ScaledFontOf_0166
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=55) returns 1375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0166 begin`);
      const actual: number = scaledFontOf(25, 55);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(1375);
      logInfo(`${BUNDLE}ScaledFontOf_0166 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0167
     * @tc.name      NdkNotification_ScaledFontOf_0167
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=65) returns 1625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0167 begin`);
      const actual: number = scaledFontOf(25, 65);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(1625);
      logInfo(`${BUNDLE}ScaledFontOf_0167 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0168
     * @tc.name      NdkNotification_ScaledFontOf_0168
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=70) returns 1750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0168 begin`);
      const actual: number = scaledFontOf(25, 70);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(1750);
      logInfo(`${BUNDLE}ScaledFontOf_0168 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0169
     * @tc.name      NdkNotification_ScaledFontOf_0169
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=75) returns 1875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0169 begin`);
      const actual: number = scaledFontOf(25, 75);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(1875);
      logInfo(`${BUNDLE}ScaledFontOf_0169 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0170
     * @tc.name      NdkNotification_ScaledFontOf_0170
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=85) returns 2125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0170 begin`);
      const actual: number = scaledFontOf(25, 85);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(2125);
      logInfo(`${BUNDLE}ScaledFontOf_0170 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0171
     * @tc.name      NdkNotification_ScaledFontOf_0171
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=90) returns 2250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0171 begin`);
      const actual: number = scaledFontOf(25, 90);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(2250);
      logInfo(`${BUNDLE}ScaledFontOf_0171 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0172
     * @tc.name      NdkNotification_ScaledFontOf_0172
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=95) returns 2375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0172 begin`);
      const actual: number = scaledFontOf(25, 95);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(2375);
      logInfo(`${BUNDLE}ScaledFontOf_0172 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0173
     * @tc.name      NdkNotification_ScaledFontOf_0173
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=81.12) returns 2028
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0173 begin`);
      const actual: number = scaledFontOf(25, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=81.12): actual=${actual}`);
      expect(actual).assertEqual(2028);
      logInfo(`${BUNDLE}ScaledFontOf_0173 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0174
     * @tc.name      NdkNotification_ScaledFontOf_0174
     * @tc.desc      scaledFontOf(fontSizeFp=25, fontScale=6.82) returns 170.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0174 begin`);
      const actual: number = scaledFontOf(25, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=25, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(170.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0174 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0175
     * @tc.name      NdkNotification_ScaledFontOf_0175
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=55) returns 1650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0175 begin`);
      const actual: number = scaledFontOf(30, 55);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(1650);
      logInfo(`${BUNDLE}ScaledFontOf_0175 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0176
     * @tc.name      NdkNotification_ScaledFontOf_0176
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=65) returns 1950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0176 begin`);
      const actual: number = scaledFontOf(30, 65);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(1950);
      logInfo(`${BUNDLE}ScaledFontOf_0176 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0177
     * @tc.name      NdkNotification_ScaledFontOf_0177
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=70) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0177 begin`);
      const actual: number = scaledFontOf(30, 70);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}ScaledFontOf_0177 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0178
     * @tc.name      NdkNotification_ScaledFontOf_0178
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=80) returns 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0178 begin`);
      const actual: number = scaledFontOf(30, 80);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=80): actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}ScaledFontOf_0178 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0179
     * @tc.name      NdkNotification_ScaledFontOf_0179
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=85) returns 2550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0179 begin`);
      const actual: number = scaledFontOf(30, 85);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=85): actual=${actual}`);
      expect(actual).assertEqual(2550);
      logInfo(`${BUNDLE}ScaledFontOf_0179 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0180
     * @tc.name      NdkNotification_ScaledFontOf_0180
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=90) returns 2700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0180 begin`);
      const actual: number = scaledFontOf(30, 90);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=90): actual=${actual}`);
      expect(actual).assertEqual(2700);
      logInfo(`${BUNDLE}ScaledFontOf_0180 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0181
     * @tc.name      NdkNotification_ScaledFontOf_0181
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=95) returns 2850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0181 begin`);
      const actual: number = scaledFontOf(30, 95);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=95): actual=${actual}`);
      expect(actual).assertEqual(2850);
      logInfo(`${BUNDLE}ScaledFontOf_0181 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0182
     * @tc.name      NdkNotification_ScaledFontOf_0182
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=81.12) returns 2433.6000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0182 begin`);
      const actual: number = scaledFontOf(30, 81.12);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=81.12): actual=${actual}`);
      expect(actual).assertClose(2433.6000000000004, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0182 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0183
     * @tc.name      NdkNotification_ScaledFontOf_0183
     * @tc.desc      scaledFontOf(fontSizeFp=30, fontScale=6.82) returns 204.60000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0183 begin`);
      const actual: number = scaledFontOf(30, 6.82);
      logInfo(`scaledFontOf(fontSizeFp=30, fontScale=6.82): actual=${actual}`);
      expect(actual).assertClose(204.60000000000002, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0183 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0184
     * @tc.name      NdkNotification_ScaledFontOf_0184
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=0.25) returns 8.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0184 begin`);
      const actual: number = scaledFontOf(35, 0.25);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=0.25): actual=${actual}`);
      expect(actual).assertClose(8.75, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0184 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0185
     * @tc.name      NdkNotification_ScaledFontOf_0185
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=0.5) returns 17.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0185 begin`);
      const actual: number = scaledFontOf(35, 0.5);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=0.5): actual=${actual}`);
      expect(actual).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0185 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0186
     * @tc.name      NdkNotification_ScaledFontOf_0186
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=1.5) returns 52.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0186 begin`);
      const actual: number = scaledFontOf(35, 1.5);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=1.5): actual=${actual}`);
      expect(actual).assertClose(52.5, PRECISION);
      logInfo(`${BUNDLE}ScaledFontOf_0186 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0187
     * @tc.name      NdkNotification_ScaledFontOf_0187
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=35) returns 1225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0187 begin`);
      const actual: number = scaledFontOf(35, 35);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=35): actual=${actual}`);
      expect(actual).assertEqual(1225);
      logInfo(`${BUNDLE}ScaledFontOf_0187 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0188
     * @tc.name      NdkNotification_ScaledFontOf_0188
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=45) returns 1575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0188 begin`);
      const actual: number = scaledFontOf(35, 45);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=45): actual=${actual}`);
      expect(actual).assertEqual(1575);
      logInfo(`${BUNDLE}ScaledFontOf_0188 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0189
     * @tc.name      NdkNotification_ScaledFontOf_0189
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=55) returns 1925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0189 begin`);
      const actual: number = scaledFontOf(35, 55);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=55): actual=${actual}`);
      expect(actual).assertEqual(1925);
      logInfo(`${BUNDLE}ScaledFontOf_0189 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0190
     * @tc.name      NdkNotification_ScaledFontOf_0190
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=65) returns 2275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0190 begin`);
      const actual: number = scaledFontOf(35, 65);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=65): actual=${actual}`);
      expect(actual).assertEqual(2275);
      logInfo(`${BUNDLE}ScaledFontOf_0190 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0191
     * @tc.name      NdkNotification_ScaledFontOf_0191
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=70) returns 2450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0191 begin`);
      const actual: number = scaledFontOf(35, 70);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=70): actual=${actual}`);
      expect(actual).assertEqual(2450);
      logInfo(`${BUNDLE}ScaledFontOf_0191 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_SCALED_FONT_OF_0192
     * @tc.name      NdkNotification_ScaledFontOf_0192
     * @tc.desc      scaledFontOf(fontSizeFp=35, fontScale=75) returns 2625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ScaledFontOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaledFontOf_0192 begin`);
      const actual: number = scaledFontOf(35, 75);
      logInfo(`scaledFontOf(fontSizeFp=35, fontScale=75): actual=${actual}`);
      expect(actual).assertEqual(2625);
      logInfo(`${BUNDLE}ScaledFontOf_0192 end`);
    });
  });
}
