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
export default function widthForHeight2Test(): void {
  describe('WidthForHeight2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0097
     * @tc.name      WindowRatio_WidthForHeight_0097
     * @tc.desc      widthForHeight(height=720, ratio=88.49) returns 63712.799999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0097 begin`);
      const actual: number = widthForHeight(720, 88.49);
      logInfo(`widthForHeight(height=720, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(63712.799999999996, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0098
     * @tc.name      WindowRatio_WidthForHeight_0098
     * @tc.desc      widthForHeight(height=720, ratio=29) returns 20880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0098 begin`);
      const actual: number = widthForHeight(720, 29);
      logInfo(`widthForHeight(height=720, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(20880);
      logInfo(`${BUNDLE}WidthForHeight_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0099
     * @tc.name      WindowRatio_WidthForHeight_0099
     * @tc.desc      widthForHeight(height=1080, ratio=0.25) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0099 begin`);
      const actual: number = widthForHeight(1080, 0.25);
      logInfo(`widthForHeight(height=1080, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}WidthForHeight_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0100
     * @tc.name      WindowRatio_WidthForHeight_0100
     * @tc.desc      widthForHeight(height=1080, ratio=1.5) returns 1620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0100 begin`);
      const actual: number = widthForHeight(1080, 1.5);
      logInfo(`widthForHeight(height=1080, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(1620);
      logInfo(`${BUNDLE}WidthForHeight_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0101
     * @tc.name      WindowRatio_WidthForHeight_0101
     * @tc.desc      widthForHeight(height=1080, ratio=-1) returns -1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0101 begin`);
      const actual: number = widthForHeight(1080, -1);
      logInfo(`widthForHeight(height=1080, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-1080);
      logInfo(`${BUNDLE}WidthForHeight_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0102
     * @tc.name      WindowRatio_WidthForHeight_0102
     * @tc.desc      widthForHeight(height=1080, ratio=3) returns 3240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0102 begin`);
      const actual: number = widthForHeight(1080, 3);
      logInfo(`widthForHeight(height=1080, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(3240);
      logInfo(`${BUNDLE}WidthForHeight_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0103
     * @tc.name      WindowRatio_WidthForHeight_0103
     * @tc.desc      widthForHeight(height=1080, ratio=100) returns 108000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0103 begin`);
      const actual: number = widthForHeight(1080, 100);
      logInfo(`widthForHeight(height=1080, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(108000);
      logInfo(`${BUNDLE}WidthForHeight_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0104
     * @tc.name      WindowRatio_WidthForHeight_0104
     * @tc.desc      widthForHeight(height=1080, ratio=35) returns 37800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0104 begin`);
      const actual: number = widthForHeight(1080, 35);
      logInfo(`widthForHeight(height=1080, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(37800);
      logInfo(`${BUNDLE}WidthForHeight_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0105
     * @tc.name      WindowRatio_WidthForHeight_0105
     * @tc.desc      widthForHeight(height=1080, ratio=45) returns 48600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0105 begin`);
      const actual: number = widthForHeight(1080, 45);
      logInfo(`widthForHeight(height=1080, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(48600);
      logInfo(`${BUNDLE}WidthForHeight_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0106
     * @tc.name      WindowRatio_WidthForHeight_0106
     * @tc.desc      widthForHeight(height=1080, ratio=55) returns 59400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0106 begin`);
      const actual: number = widthForHeight(1080, 55);
      logInfo(`widthForHeight(height=1080, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(59400);
      logInfo(`${BUNDLE}WidthForHeight_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0107
     * @tc.name      WindowRatio_WidthForHeight_0107
     * @tc.desc      widthForHeight(height=1080, ratio=65) returns 70200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0107 begin`);
      const actual: number = widthForHeight(1080, 65);
      logInfo(`widthForHeight(height=1080, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(70200);
      logInfo(`${BUNDLE}WidthForHeight_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0108
     * @tc.name      WindowRatio_WidthForHeight_0108
     * @tc.desc      widthForHeight(height=1080, ratio=70) returns 75600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0108 begin`);
      const actual: number = widthForHeight(1080, 70);
      logInfo(`widthForHeight(height=1080, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(75600);
      logInfo(`${BUNDLE}WidthForHeight_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0109
     * @tc.name      WindowRatio_WidthForHeight_0109
     * @tc.desc      widthForHeight(height=1080, ratio=75) returns 81000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0109 begin`);
      const actual: number = widthForHeight(1080, 75);
      logInfo(`widthForHeight(height=1080, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(81000);
      logInfo(`${BUNDLE}WidthForHeight_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0110
     * @tc.name      WindowRatio_WidthForHeight_0110
     * @tc.desc      widthForHeight(height=1080, ratio=80) returns 86400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0110 begin`);
      const actual: number = widthForHeight(1080, 80);
      logInfo(`widthForHeight(height=1080, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(86400);
      logInfo(`${BUNDLE}WidthForHeight_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0111
     * @tc.name      WindowRatio_WidthForHeight_0111
     * @tc.desc      widthForHeight(height=1080, ratio=85) returns 91800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0111 begin`);
      const actual: number = widthForHeight(1080, 85);
      logInfo(`widthForHeight(height=1080, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(91800);
      logInfo(`${BUNDLE}WidthForHeight_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0112
     * @tc.name      WindowRatio_WidthForHeight_0112
     * @tc.desc      widthForHeight(height=1080, ratio=90) returns 97200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0112 begin`);
      const actual: number = widthForHeight(1080, 90);
      logInfo(`widthForHeight(height=1080, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(97200);
      logInfo(`${BUNDLE}WidthForHeight_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0113
     * @tc.name      WindowRatio_WidthForHeight_0113
     * @tc.desc      widthForHeight(height=1080, ratio=95) returns 102600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0113 begin`);
      const actual: number = widthForHeight(1080, 95);
      logInfo(`widthForHeight(height=1080, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(102600);
      logInfo(`${BUNDLE}WidthForHeight_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0114
     * @tc.name      WindowRatio_WidthForHeight_0114
     * @tc.desc      widthForHeight(height=1080, ratio=88.49) returns 95569.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0114 begin`);
      const actual: number = widthForHeight(1080, 88.49);
      logInfo(`widthForHeight(height=1080, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(95569.2, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0115
     * @tc.name      WindowRatio_WidthForHeight_0115
     * @tc.desc      widthForHeight(height=1080, ratio=29) returns 31320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0115 begin`);
      const actual: number = widthForHeight(1080, 29);
      logInfo(`widthForHeight(height=1080, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(31320);
      logInfo(`${BUNDLE}WidthForHeight_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0116
     * @tc.name      WindowRatio_WidthForHeight_0116
     * @tc.desc      widthForHeight(height=1920, ratio=0.25) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0116 begin`);
      const actual: number = widthForHeight(1920, 0.25);
      logInfo(`widthForHeight(height=1920, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}WidthForHeight_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0117
     * @tc.name      WindowRatio_WidthForHeight_0117
     * @tc.desc      widthForHeight(height=1920, ratio=0.5) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0117 begin`);
      const actual: number = widthForHeight(1920, 0.5);
      logInfo(`widthForHeight(height=1920, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}WidthForHeight_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0118
     * @tc.name      WindowRatio_WidthForHeight_0118
     * @tc.desc      widthForHeight(height=1920, ratio=1) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0118 begin`);
      const actual: number = widthForHeight(1920, 1);
      logInfo(`widthForHeight(height=1920, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}WidthForHeight_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0119
     * @tc.name      WindowRatio_WidthForHeight_0119
     * @tc.desc      widthForHeight(height=1920, ratio=1.5) returns 2880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0119 begin`);
      const actual: number = widthForHeight(1920, 1.5);
      logInfo(`widthForHeight(height=1920, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(2880);
      logInfo(`${BUNDLE}WidthForHeight_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0120
     * @tc.name      WindowRatio_WidthForHeight_0120
     * @tc.desc      widthForHeight(height=1920, ratio=2) returns 3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0120 begin`);
      const actual: number = widthForHeight(1920, 2);
      logInfo(`widthForHeight(height=1920, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(3840);
      logInfo(`${BUNDLE}WidthForHeight_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0121
     * @tc.name      WindowRatio_WidthForHeight_0121
     * @tc.desc      widthForHeight(height=1920, ratio=-1) returns -1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0121 begin`);
      const actual: number = widthForHeight(1920, -1);
      logInfo(`widthForHeight(height=1920, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-1920);
      logInfo(`${BUNDLE}WidthForHeight_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0122
     * @tc.name      WindowRatio_WidthForHeight_0122
     * @tc.desc      widthForHeight(height=1920, ratio=3) returns 5760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0122 begin`);
      const actual: number = widthForHeight(1920, 3);
      logInfo(`widthForHeight(height=1920, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(5760);
      logInfo(`${BUNDLE}WidthForHeight_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0123
     * @tc.name      WindowRatio_WidthForHeight_0123
     * @tc.desc      widthForHeight(height=1920, ratio=10) returns 19200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0123 begin`);
      const actual: number = widthForHeight(1920, 10);
      logInfo(`widthForHeight(height=1920, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(19200);
      logInfo(`${BUNDLE}WidthForHeight_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0124
     * @tc.name      WindowRatio_WidthForHeight_0124
     * @tc.desc      widthForHeight(height=1920, ratio=100) returns 192000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0124 begin`);
      const actual: number = widthForHeight(1920, 100);
      logInfo(`widthForHeight(height=1920, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(192000);
      logInfo(`${BUNDLE}WidthForHeight_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0125
     * @tc.name      WindowRatio_WidthForHeight_0125
     * @tc.desc      widthForHeight(height=1920, ratio=5) returns 9600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0125 begin`);
      const actual: number = widthForHeight(1920, 5);
      logInfo(`widthForHeight(height=1920, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(9600);
      logInfo(`${BUNDLE}WidthForHeight_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0126
     * @tc.name      WindowRatio_WidthForHeight_0126
     * @tc.desc      widthForHeight(height=1920, ratio=20) returns 38400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0126 begin`);
      const actual: number = widthForHeight(1920, 20);
      logInfo(`widthForHeight(height=1920, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(38400);
      logInfo(`${BUNDLE}WidthForHeight_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0127
     * @tc.name      WindowRatio_WidthForHeight_0127
     * @tc.desc      widthForHeight(height=1920, ratio=25) returns 48000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0127 begin`);
      const actual: number = widthForHeight(1920, 25);
      logInfo(`widthForHeight(height=1920, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(48000);
      logInfo(`${BUNDLE}WidthForHeight_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0128
     * @tc.name      WindowRatio_WidthForHeight_0128
     * @tc.desc      widthForHeight(height=1920, ratio=35) returns 67200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0128 begin`);
      const actual: number = widthForHeight(1920, 35);
      logInfo(`widthForHeight(height=1920, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(67200);
      logInfo(`${BUNDLE}WidthForHeight_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0129
     * @tc.name      WindowRatio_WidthForHeight_0129
     * @tc.desc      widthForHeight(height=1920, ratio=40) returns 76800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0129 begin`);
      const actual: number = widthForHeight(1920, 40);
      logInfo(`widthForHeight(height=1920, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(76800);
      logInfo(`${BUNDLE}WidthForHeight_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0130
     * @tc.name      WindowRatio_WidthForHeight_0130
     * @tc.desc      widthForHeight(height=1920, ratio=50) returns 96000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0130 begin`);
      const actual: number = widthForHeight(1920, 50);
      logInfo(`widthForHeight(height=1920, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(96000);
      logInfo(`${BUNDLE}WidthForHeight_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0131
     * @tc.name      WindowRatio_WidthForHeight_0131
     * @tc.desc      widthForHeight(height=1920, ratio=55) returns 105600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0131 begin`);
      const actual: number = widthForHeight(1920, 55);
      logInfo(`widthForHeight(height=1920, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(105600);
      logInfo(`${BUNDLE}WidthForHeight_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0132
     * @tc.name      WindowRatio_WidthForHeight_0132
     * @tc.desc      widthForHeight(height=1920, ratio=60) returns 115200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0132 begin`);
      const actual: number = widthForHeight(1920, 60);
      logInfo(`widthForHeight(height=1920, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(115200);
      logInfo(`${BUNDLE}WidthForHeight_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0133
     * @tc.name      WindowRatio_WidthForHeight_0133
     * @tc.desc      widthForHeight(height=1920, ratio=65) returns 124800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0133 begin`);
      const actual: number = widthForHeight(1920, 65);
      logInfo(`widthForHeight(height=1920, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(124800);
      logInfo(`${BUNDLE}WidthForHeight_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0134
     * @tc.name      WindowRatio_WidthForHeight_0134
     * @tc.desc      widthForHeight(height=1920, ratio=70) returns 134400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0134 begin`);
      const actual: number = widthForHeight(1920, 70);
      logInfo(`widthForHeight(height=1920, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(134400);
      logInfo(`${BUNDLE}WidthForHeight_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0135
     * @tc.name      WindowRatio_WidthForHeight_0135
     * @tc.desc      widthForHeight(height=1920, ratio=75) returns 144000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0135 begin`);
      const actual: number = widthForHeight(1920, 75);
      logInfo(`widthForHeight(height=1920, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(144000);
      logInfo(`${BUNDLE}WidthForHeight_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0136
     * @tc.name      WindowRatio_WidthForHeight_0136
     * @tc.desc      widthForHeight(height=1920, ratio=80) returns 153600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0136 begin`);
      const actual: number = widthForHeight(1920, 80);
      logInfo(`widthForHeight(height=1920, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(153600);
      logInfo(`${BUNDLE}WidthForHeight_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0137
     * @tc.name      WindowRatio_WidthForHeight_0137
     * @tc.desc      widthForHeight(height=1920, ratio=85) returns 163200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0137 begin`);
      const actual: number = widthForHeight(1920, 85);
      logInfo(`widthForHeight(height=1920, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(163200);
      logInfo(`${BUNDLE}WidthForHeight_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0138
     * @tc.name      WindowRatio_WidthForHeight_0138
     * @tc.desc      widthForHeight(height=1920, ratio=90) returns 172800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0138 begin`);
      const actual: number = widthForHeight(1920, 90);
      logInfo(`widthForHeight(height=1920, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(172800);
      logInfo(`${BUNDLE}WidthForHeight_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0139
     * @tc.name      WindowRatio_WidthForHeight_0139
     * @tc.desc      widthForHeight(height=1920, ratio=95) returns 182400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0139 begin`);
      const actual: number = widthForHeight(1920, 95);
      logInfo(`widthForHeight(height=1920, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(182400);
      logInfo(`${BUNDLE}WidthForHeight_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0140
     * @tc.name      WindowRatio_WidthForHeight_0140
     * @tc.desc      widthForHeight(height=1920, ratio=88.49) returns 169900.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0140 begin`);
      const actual: number = widthForHeight(1920, 88.49);
      logInfo(`widthForHeight(height=1920, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(169900.8, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0141
     * @tc.name      WindowRatio_WidthForHeight_0141
     * @tc.desc      widthForHeight(height=1920, ratio=29) returns 55680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0141 begin`);
      const actual: number = widthForHeight(1920, 29);
      logInfo(`widthForHeight(height=1920, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(55680);
      logInfo(`${BUNDLE}WidthForHeight_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0142
     * @tc.name      WindowRatio_WidthForHeight_0142
     * @tc.desc      widthForHeight(height=-1, ratio=0.25) returns -0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0142 begin`);
      const actual: number = widthForHeight(-1, 0.25);
      logInfo(`widthForHeight(height=-1, ratio=0.25): actual=${actual}`);
      expect(actual).assertClose(-0.25, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0143
     * @tc.name      WindowRatio_WidthForHeight_0143
     * @tc.desc      widthForHeight(height=-1, ratio=0.5) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0143 begin`);
      const actual: number = widthForHeight(-1, 0.5);
      logInfo(`widthForHeight(height=-1, ratio=0.5): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0144
     * @tc.name      WindowRatio_WidthForHeight_0144
     * @tc.desc      widthForHeight(height=-1, ratio=1.5) returns -1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0144 begin`);
      const actual: number = widthForHeight(-1, 1.5);
      logInfo(`widthForHeight(height=-1, ratio=1.5): actual=${actual}`);
      expect(actual).assertClose(-1.5, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0145
     * @tc.name      WindowRatio_WidthForHeight_0145
     * @tc.desc      widthForHeight(height=-1, ratio=2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0145 begin`);
      const actual: number = widthForHeight(-1, 2);
      logInfo(`widthForHeight(height=-1, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}WidthForHeight_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0146
     * @tc.name      WindowRatio_WidthForHeight_0146
     * @tc.desc      widthForHeight(height=-1, ratio=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0146 begin`);
      const actual: number = widthForHeight(-1, 3);
      logInfo(`widthForHeight(height=-1, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}WidthForHeight_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0147
     * @tc.name      WindowRatio_WidthForHeight_0147
     * @tc.desc      widthForHeight(height=-1, ratio=10) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0147 begin`);
      const actual: number = widthForHeight(-1, 10);
      logInfo(`widthForHeight(height=-1, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}WidthForHeight_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0148
     * @tc.name      WindowRatio_WidthForHeight_0148
     * @tc.desc      widthForHeight(height=-1, ratio=5) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0148 begin`);
      const actual: number = widthForHeight(-1, 5);
      logInfo(`widthForHeight(height=-1, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}WidthForHeight_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0149
     * @tc.name      WindowRatio_WidthForHeight_0149
     * @tc.desc      widthForHeight(height=-1, ratio=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0149 begin`);
      const actual: number = widthForHeight(-1, 15);
      logInfo(`widthForHeight(height=-1, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}WidthForHeight_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0150
     * @tc.name      WindowRatio_WidthForHeight_0150
     * @tc.desc      widthForHeight(height=-1, ratio=20) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0150 begin`);
      const actual: number = widthForHeight(-1, 20);
      logInfo(`widthForHeight(height=-1, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}WidthForHeight_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0151
     * @tc.name      WindowRatio_WidthForHeight_0151
     * @tc.desc      widthForHeight(height=-1, ratio=25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0151 begin`);
      const actual: number = widthForHeight(-1, 25);
      logInfo(`widthForHeight(height=-1, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}WidthForHeight_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0152
     * @tc.name      WindowRatio_WidthForHeight_0152
     * @tc.desc      widthForHeight(height=-1, ratio=30) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0152 begin`);
      const actual: number = widthForHeight(-1, 30);
      logInfo(`widthForHeight(height=-1, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}WidthForHeight_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0153
     * @tc.name      WindowRatio_WidthForHeight_0153
     * @tc.desc      widthForHeight(height=-1, ratio=35) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0153 begin`);
      const actual: number = widthForHeight(-1, 35);
      logInfo(`widthForHeight(height=-1, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}WidthForHeight_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0154
     * @tc.name      WindowRatio_WidthForHeight_0154
     * @tc.desc      widthForHeight(height=-1, ratio=40) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0154 begin`);
      const actual: number = widthForHeight(-1, 40);
      logInfo(`widthForHeight(height=-1, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}WidthForHeight_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0155
     * @tc.name      WindowRatio_WidthForHeight_0155
     * @tc.desc      widthForHeight(height=-1, ratio=45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0155 begin`);
      const actual: number = widthForHeight(-1, 45);
      logInfo(`widthForHeight(height=-1, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}WidthForHeight_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0156
     * @tc.name      WindowRatio_WidthForHeight_0156
     * @tc.desc      widthForHeight(height=-1, ratio=50) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0156 begin`);
      const actual: number = widthForHeight(-1, 50);
      logInfo(`widthForHeight(height=-1, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}WidthForHeight_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0157
     * @tc.name      WindowRatio_WidthForHeight_0157
     * @tc.desc      widthForHeight(height=-1, ratio=55) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0157 begin`);
      const actual: number = widthForHeight(-1, 55);
      logInfo(`widthForHeight(height=-1, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}WidthForHeight_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0158
     * @tc.name      WindowRatio_WidthForHeight_0158
     * @tc.desc      widthForHeight(height=-1, ratio=60) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0158 begin`);
      const actual: number = widthForHeight(-1, 60);
      logInfo(`widthForHeight(height=-1, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}WidthForHeight_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0159
     * @tc.name      WindowRatio_WidthForHeight_0159
     * @tc.desc      widthForHeight(height=-1, ratio=65) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0159 begin`);
      const actual: number = widthForHeight(-1, 65);
      logInfo(`widthForHeight(height=-1, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}WidthForHeight_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0160
     * @tc.name      WindowRatio_WidthForHeight_0160
     * @tc.desc      widthForHeight(height=-1, ratio=70) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0160 begin`);
      const actual: number = widthForHeight(-1, 70);
      logInfo(`widthForHeight(height=-1, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}WidthForHeight_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0161
     * @tc.name      WindowRatio_WidthForHeight_0161
     * @tc.desc      widthForHeight(height=-1, ratio=75) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0161 begin`);
      const actual: number = widthForHeight(-1, 75);
      logInfo(`widthForHeight(height=-1, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}WidthForHeight_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0162
     * @tc.name      WindowRatio_WidthForHeight_0162
     * @tc.desc      widthForHeight(height=-1, ratio=80) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0162 begin`);
      const actual: number = widthForHeight(-1, 80);
      logInfo(`widthForHeight(height=-1, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}WidthForHeight_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0163
     * @tc.name      WindowRatio_WidthForHeight_0163
     * @tc.desc      widthForHeight(height=-1, ratio=85) returns -85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0163 begin`);
      const actual: number = widthForHeight(-1, 85);
      logInfo(`widthForHeight(height=-1, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(-85);
      logInfo(`${BUNDLE}WidthForHeight_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0164
     * @tc.name      WindowRatio_WidthForHeight_0164
     * @tc.desc      widthForHeight(height=-1, ratio=90) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0164 begin`);
      const actual: number = widthForHeight(-1, 90);
      logInfo(`widthForHeight(height=-1, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}WidthForHeight_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0165
     * @tc.name      WindowRatio_WidthForHeight_0165
     * @tc.desc      widthForHeight(height=-1, ratio=95) returns -95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0165 begin`);
      const actual: number = widthForHeight(-1, 95);
      logInfo(`widthForHeight(height=-1, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(-95);
      logInfo(`${BUNDLE}WidthForHeight_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0166
     * @tc.name      WindowRatio_WidthForHeight_0166
     * @tc.desc      widthForHeight(height=-1, ratio=88.49) returns -88.49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0166 begin`);
      const actual: number = widthForHeight(-1, 88.49);
      logInfo(`widthForHeight(height=-1, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(-88.49, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0167
     * @tc.name      WindowRatio_WidthForHeight_0167
     * @tc.desc      widthForHeight(height=-1, ratio=29) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0167 begin`);
      const actual: number = widthForHeight(-1, 29);
      logInfo(`widthForHeight(height=-1, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}WidthForHeight_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0168
     * @tc.name      WindowRatio_WidthForHeight_0168
     * @tc.desc      widthForHeight(height=2, ratio=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0168 begin`);
      const actual: number = widthForHeight(2, 2);
      logInfo(`widthForHeight(height=2, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}WidthForHeight_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0169
     * @tc.name      WindowRatio_WidthForHeight_0169
     * @tc.desc      widthForHeight(height=2, ratio=3) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0169 begin`);
      const actual: number = widthForHeight(2, 3);
      logInfo(`widthForHeight(height=2, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WidthForHeight_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0170
     * @tc.name      WindowRatio_WidthForHeight_0170
     * @tc.desc      widthForHeight(height=2, ratio=55) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0170 begin`);
      const actual: number = widthForHeight(2, 55);
      logInfo(`widthForHeight(height=2, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}WidthForHeight_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0171
     * @tc.name      WindowRatio_WidthForHeight_0171
     * @tc.desc      widthForHeight(height=2, ratio=60) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0171 begin`);
      const actual: number = widthForHeight(2, 60);
      logInfo(`widthForHeight(height=2, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}WidthForHeight_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0172
     * @tc.name      WindowRatio_WidthForHeight_0172
     * @tc.desc      widthForHeight(height=2, ratio=65) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0172 begin`);
      const actual: number = widthForHeight(2, 65);
      logInfo(`widthForHeight(height=2, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}WidthForHeight_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0173
     * @tc.name      WindowRatio_WidthForHeight_0173
     * @tc.desc      widthForHeight(height=2, ratio=70) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0173 begin`);
      const actual: number = widthForHeight(2, 70);
      logInfo(`widthForHeight(height=2, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}WidthForHeight_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0174
     * @tc.name      WindowRatio_WidthForHeight_0174
     * @tc.desc      widthForHeight(height=2, ratio=80) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0174 begin`);
      const actual: number = widthForHeight(2, 80);
      logInfo(`widthForHeight(height=2, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}WidthForHeight_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0175
     * @tc.name      WindowRatio_WidthForHeight_0175
     * @tc.desc      widthForHeight(height=2, ratio=85) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0175 begin`);
      const actual: number = widthForHeight(2, 85);
      logInfo(`widthForHeight(height=2, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}WidthForHeight_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0176
     * @tc.name      WindowRatio_WidthForHeight_0176
     * @tc.desc      widthForHeight(height=2, ratio=95) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0176 begin`);
      const actual: number = widthForHeight(2, 95);
      logInfo(`widthForHeight(height=2, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}WidthForHeight_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0177
     * @tc.name      WindowRatio_WidthForHeight_0177
     * @tc.desc      widthForHeight(height=2, ratio=88.49) returns 176.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0177 begin`);
      const actual: number = widthForHeight(2, 88.49);
      logInfo(`widthForHeight(height=2, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(176.98, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0178
     * @tc.name      WindowRatio_WidthForHeight_0178
     * @tc.desc      widthForHeight(height=2, ratio=29) returns 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0178 begin`);
      const actual: number = widthForHeight(2, 29);
      logInfo(`widthForHeight(height=2, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(58);
      logInfo(`${BUNDLE}WidthForHeight_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0179
     * @tc.name      WindowRatio_WidthForHeight_0179
     * @tc.desc      widthForHeight(height=3, ratio=0.25) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0179 begin`);
      const actual: number = widthForHeight(3, 0.25);
      logInfo(`widthForHeight(height=3, ratio=0.25): actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0180
     * @tc.name      WindowRatio_WidthForHeight_0180
     * @tc.desc      widthForHeight(height=3, ratio=1.5) returns 4.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0180 begin`);
      const actual: number = widthForHeight(3, 1.5);
      logInfo(`widthForHeight(height=3, ratio=1.5): actual=${actual}`);
      expect(actual).assertClose(4.5, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0181
     * @tc.name      WindowRatio_WidthForHeight_0181
     * @tc.desc      widthForHeight(height=3, ratio=3) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0181 begin`);
      const actual: number = widthForHeight(3, 3);
      logInfo(`widthForHeight(height=3, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WidthForHeight_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0182
     * @tc.name      WindowRatio_WidthForHeight_0182
     * @tc.desc      widthForHeight(height=3, ratio=35) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0182 begin`);
      const actual: number = widthForHeight(3, 35);
      logInfo(`widthForHeight(height=3, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}WidthForHeight_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0183
     * @tc.name      WindowRatio_WidthForHeight_0183
     * @tc.desc      widthForHeight(height=3, ratio=45) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0183 begin`);
      const actual: number = widthForHeight(3, 45);
      logInfo(`widthForHeight(height=3, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}WidthForHeight_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0184
     * @tc.name      WindowRatio_WidthForHeight_0184
     * @tc.desc      widthForHeight(height=3, ratio=55) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0184 begin`);
      const actual: number = widthForHeight(3, 55);
      logInfo(`widthForHeight(height=3, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}WidthForHeight_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0185
     * @tc.name      WindowRatio_WidthForHeight_0185
     * @tc.desc      widthForHeight(height=3, ratio=65) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0185 begin`);
      const actual: number = widthForHeight(3, 65);
      logInfo(`widthForHeight(height=3, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}WidthForHeight_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0186
     * @tc.name      WindowRatio_WidthForHeight_0186
     * @tc.desc      widthForHeight(height=3, ratio=70) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0186 begin`);
      const actual: number = widthForHeight(3, 70);
      logInfo(`widthForHeight(height=3, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}WidthForHeight_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0187
     * @tc.name      WindowRatio_WidthForHeight_0187
     * @tc.desc      widthForHeight(height=3, ratio=75) returns 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0187 begin`);
      const actual: number = widthForHeight(3, 75);
      logInfo(`widthForHeight(height=3, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(225);
      logInfo(`${BUNDLE}WidthForHeight_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0188
     * @tc.name      WindowRatio_WidthForHeight_0188
     * @tc.desc      widthForHeight(height=3, ratio=80) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0188 begin`);
      const actual: number = widthForHeight(3, 80);
      logInfo(`widthForHeight(height=3, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}WidthForHeight_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0189
     * @tc.name      WindowRatio_WidthForHeight_0189
     * @tc.desc      widthForHeight(height=3, ratio=85) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0189 begin`);
      const actual: number = widthForHeight(3, 85);
      logInfo(`widthForHeight(height=3, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(255);
      logInfo(`${BUNDLE}WidthForHeight_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0190
     * @tc.name      WindowRatio_WidthForHeight_0190
     * @tc.desc      widthForHeight(height=3, ratio=95) returns 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0190 begin`);
      const actual: number = widthForHeight(3, 95);
      logInfo(`widthForHeight(height=3, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(285);
      logInfo(`${BUNDLE}WidthForHeight_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0191
     * @tc.name      WindowRatio_WidthForHeight_0191
     * @tc.desc      widthForHeight(height=3, ratio=88.49) returns 265.46999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0191 begin`);
      const actual: number = widthForHeight(3, 88.49);
      logInfo(`widthForHeight(height=3, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(265.46999999999997, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0192
     * @tc.name      WindowRatio_WidthForHeight_0192
     * @tc.desc      widthForHeight(height=3, ratio=29) returns 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0192 begin`);
      const actual: number = widthForHeight(3, 29);
      logInfo(`widthForHeight(height=3, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(87);
      logInfo(`${BUNDLE}WidthForHeight_0192 end`);
    });
  });
}
