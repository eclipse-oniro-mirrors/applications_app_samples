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
export default function heightForWidth2Test(): void {
  describe('HeightForWidth2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0097
     * @tc.name      WindowRatio_HeightForWidth_0097
     * @tc.desc      heightForWidth(width=360, ratio=40) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0097 begin`);
      const actual: number = heightForWidth(360, 40);
      logInfo(`heightForWidth(width=360, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}HeightForWidth_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0098
     * @tc.name      WindowRatio_HeightForWidth_0098
     * @tc.desc      heightForWidth(width=360, ratio=45) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0098 begin`);
      const actual: number = heightForWidth(360, 45);
      logInfo(`heightForWidth(width=360, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}HeightForWidth_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0099
     * @tc.name      WindowRatio_HeightForWidth_0099
     * @tc.desc      heightForWidth(width=360, ratio=50) returns 7.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0099 begin`);
      const actual: number = heightForWidth(360, 50);
      logInfo(`heightForWidth(width=360, ratio=50): actual=${actual}`);
      expect(actual).assertClose(7.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0100
     * @tc.name      WindowRatio_HeightForWidth_0100
     * @tc.desc      heightForWidth(width=360, ratio=55) returns 6.545454545454546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0100 begin`);
      const actual: number = heightForWidth(360, 55);
      logInfo(`heightForWidth(width=360, ratio=55): actual=${actual}`);
      expect(actual).assertClose(6.545454545454546, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0101
     * @tc.name      WindowRatio_HeightForWidth_0101
     * @tc.desc      heightForWidth(width=360, ratio=60) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0101 begin`);
      const actual: number = heightForWidth(360, 60);
      logInfo(`heightForWidth(width=360, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}HeightForWidth_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0102
     * @tc.name      WindowRatio_HeightForWidth_0102
     * @tc.desc      heightForWidth(width=360, ratio=65) returns 5.538461538461538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0102 begin`);
      const actual: number = heightForWidth(360, 65);
      logInfo(`heightForWidth(width=360, ratio=65): actual=${actual}`);
      expect(actual).assertClose(5.538461538461538, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0103
     * @tc.name      WindowRatio_HeightForWidth_0103
     * @tc.desc      heightForWidth(width=360, ratio=70) returns 5.142857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0103 begin`);
      const actual: number = heightForWidth(360, 70);
      logInfo(`heightForWidth(width=360, ratio=70): actual=${actual}`);
      expect(actual).assertClose(5.142857142857143, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0104
     * @tc.name      WindowRatio_HeightForWidth_0104
     * @tc.desc      heightForWidth(width=360, ratio=75) returns 4.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0104 begin`);
      const actual: number = heightForWidth(360, 75);
      logInfo(`heightForWidth(width=360, ratio=75): actual=${actual}`);
      expect(actual).assertClose(4.8, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0105
     * @tc.name      WindowRatio_HeightForWidth_0105
     * @tc.desc      heightForWidth(width=360, ratio=80) returns 4.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0105 begin`);
      const actual: number = heightForWidth(360, 80);
      logInfo(`heightForWidth(width=360, ratio=80): actual=${actual}`);
      expect(actual).assertClose(4.5, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0106
     * @tc.name      WindowRatio_HeightForWidth_0106
     * @tc.desc      heightForWidth(width=360, ratio=85) returns 4.235294117647059
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0106 begin`);
      const actual: number = heightForWidth(360, 85);
      logInfo(`heightForWidth(width=360, ratio=85): actual=${actual}`);
      expect(actual).assertClose(4.235294117647059, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0107
     * @tc.name      WindowRatio_HeightForWidth_0107
     * @tc.desc      heightForWidth(width=360, ratio=95) returns 3.789473684210526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0107 begin`);
      const actual: number = heightForWidth(360, 95);
      logInfo(`heightForWidth(width=360, ratio=95): actual=${actual}`);
      expect(actual).assertClose(3.789473684210526, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0108
     * @tc.name      WindowRatio_HeightForWidth_0108
     * @tc.desc      heightForWidth(width=360, ratio=37) returns 9.72972972972973
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0108 begin`);
      const actual: number = heightForWidth(360, 37);
      logInfo(`heightForWidth(width=360, ratio=37): actual=${actual}`);
      expect(actual).assertClose(9.72972972972973, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0109
     * @tc.name      WindowRatio_HeightForWidth_0109
     * @tc.desc      heightForWidth(width=360, ratio=138) returns 2.608695652173913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0109 begin`);
      const actual: number = heightForWidth(360, 138);
      logInfo(`heightForWidth(width=360, ratio=138): actual=${actual}`);
      expect(actual).assertClose(2.608695652173913, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0110
     * @tc.name      WindowRatio_HeightForWidth_0110
     * @tc.desc      heightForWidth(width=720, ratio=0.25) returns 2880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0110 begin`);
      const actual: number = heightForWidth(720, 0.25);
      logInfo(`heightForWidth(width=720, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(2880);
      logInfo(`${BUNDLE}HeightForWidth_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0111
     * @tc.name      WindowRatio_HeightForWidth_0111
     * @tc.desc      heightForWidth(width=720, ratio=1.5) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0111 begin`);
      const actual: number = heightForWidth(720, 1.5);
      logInfo(`heightForWidth(width=720, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}HeightForWidth_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0112
     * @tc.name      WindowRatio_HeightForWidth_0112
     * @tc.desc      heightForWidth(width=720, ratio=5) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0112 begin`);
      const actual: number = heightForWidth(720, 5);
      logInfo(`heightForWidth(width=720, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}HeightForWidth_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0113
     * @tc.name      WindowRatio_HeightForWidth_0113
     * @tc.desc      heightForWidth(width=720, ratio=15) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0113 begin`);
      const actual: number = heightForWidth(720, 15);
      logInfo(`heightForWidth(width=720, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}HeightForWidth_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0114
     * @tc.name      WindowRatio_HeightForWidth_0114
     * @tc.desc      heightForWidth(width=720, ratio=25) returns 28.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0114 begin`);
      const actual: number = heightForWidth(720, 25);
      logInfo(`heightForWidth(width=720, ratio=25): actual=${actual}`);
      expect(actual).assertClose(28.8, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0115
     * @tc.name      WindowRatio_HeightForWidth_0115
     * @tc.desc      heightForWidth(width=720, ratio=35) returns 20.571428571428573
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0115 begin`);
      const actual: number = heightForWidth(720, 35);
      logInfo(`heightForWidth(width=720, ratio=35): actual=${actual}`);
      expect(actual).assertClose(20.571428571428573, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0116
     * @tc.name      WindowRatio_HeightForWidth_0116
     * @tc.desc      heightForWidth(width=720, ratio=45) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0116 begin`);
      const actual: number = heightForWidth(720, 45);
      logInfo(`heightForWidth(width=720, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}HeightForWidth_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0117
     * @tc.name      WindowRatio_HeightForWidth_0117
     * @tc.desc      heightForWidth(width=720, ratio=55) returns 13.090909090909092
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0117 begin`);
      const actual: number = heightForWidth(720, 55);
      logInfo(`heightForWidth(width=720, ratio=55): actual=${actual}`);
      expect(actual).assertClose(13.090909090909092, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0118
     * @tc.name      WindowRatio_HeightForWidth_0118
     * @tc.desc      heightForWidth(width=720, ratio=65) returns 11.076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0118 begin`);
      const actual: number = heightForWidth(720, 65);
      logInfo(`heightForWidth(width=720, ratio=65): actual=${actual}`);
      expect(actual).assertClose(11.076923076923077, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0119
     * @tc.name      WindowRatio_HeightForWidth_0119
     * @tc.desc      heightForWidth(width=720, ratio=75) returns 9.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0119 begin`);
      const actual: number = heightForWidth(720, 75);
      logInfo(`heightForWidth(width=720, ratio=75): actual=${actual}`);
      expect(actual).assertClose(9.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0120
     * @tc.name      WindowRatio_HeightForWidth_0120
     * @tc.desc      heightForWidth(width=720, ratio=85) returns 8.470588235294118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0120 begin`);
      const actual: number = heightForWidth(720, 85);
      logInfo(`heightForWidth(width=720, ratio=85): actual=${actual}`);
      expect(actual).assertClose(8.470588235294118, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0121
     * @tc.name      WindowRatio_HeightForWidth_0121
     * @tc.desc      heightForWidth(width=720, ratio=95) returns 7.578947368421052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0121 begin`);
      const actual: number = heightForWidth(720, 95);
      logInfo(`heightForWidth(width=720, ratio=95): actual=${actual}`);
      expect(actual).assertClose(7.578947368421052, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0122
     * @tc.name      WindowRatio_HeightForWidth_0122
     * @tc.desc      heightForWidth(width=720, ratio=37) returns 19.45945945945946
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0122 begin`);
      const actual: number = heightForWidth(720, 37);
      logInfo(`heightForWidth(width=720, ratio=37): actual=${actual}`);
      expect(actual).assertClose(19.45945945945946, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0123
     * @tc.name      WindowRatio_HeightForWidth_0123
     * @tc.desc      heightForWidth(width=720, ratio=138) returns 5.217391304347826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0123 begin`);
      const actual: number = heightForWidth(720, 138);
      logInfo(`heightForWidth(width=720, ratio=138): actual=${actual}`);
      expect(actual).assertClose(5.217391304347826, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0124
     * @tc.name      WindowRatio_HeightForWidth_0124
     * @tc.desc      heightForWidth(width=1080, ratio=0.25) returns 4320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0124 begin`);
      const actual: number = heightForWidth(1080, 0.25);
      logInfo(`heightForWidth(width=1080, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(4320);
      logInfo(`${BUNDLE}HeightForWidth_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0125
     * @tc.name      WindowRatio_HeightForWidth_0125
     * @tc.desc      heightForWidth(width=1080, ratio=1) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0125 begin`);
      const actual: number = heightForWidth(1080, 1);
      logInfo(`heightForWidth(width=1080, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}HeightForWidth_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0126
     * @tc.name      WindowRatio_HeightForWidth_0126
     * @tc.desc      heightForWidth(width=1080, ratio=0.5) returns 2160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0126 begin`);
      const actual: number = heightForWidth(1080, 0.5);
      logInfo(`heightForWidth(width=1080, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(2160);
      logInfo(`${BUNDLE}HeightForWidth_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0127
     * @tc.name      WindowRatio_HeightForWidth_0127
     * @tc.desc      heightForWidth(width=1080, ratio=2) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0127 begin`);
      const actual: number = heightForWidth(1080, 2);
      logInfo(`heightForWidth(width=1080, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}HeightForWidth_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0128
     * @tc.name      WindowRatio_HeightForWidth_0128
     * @tc.desc      heightForWidth(width=1080, ratio=10) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0128 begin`);
      const actual: number = heightForWidth(1080, 10);
      logInfo(`heightForWidth(width=1080, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}HeightForWidth_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0129
     * @tc.name      WindowRatio_HeightForWidth_0129
     * @tc.desc      heightForWidth(width=1080, ratio=100) returns 10.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0129 begin`);
      const actual: number = heightForWidth(1080, 100);
      logInfo(`heightForWidth(width=1080, ratio=100): actual=${actual}`);
      expect(actual).assertClose(10.8, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0130
     * @tc.name      WindowRatio_HeightForWidth_0130
     * @tc.desc      heightForWidth(width=1080, ratio=5) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0130 begin`);
      const actual: number = heightForWidth(1080, 5);
      logInfo(`heightForWidth(width=1080, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}HeightForWidth_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0131
     * @tc.name      WindowRatio_HeightForWidth_0131
     * @tc.desc      heightForWidth(width=1080, ratio=20) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0131 begin`);
      const actual: number = heightForWidth(1080, 20);
      logInfo(`heightForWidth(width=1080, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}HeightForWidth_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0132
     * @tc.name      WindowRatio_HeightForWidth_0132
     * @tc.desc      heightForWidth(width=1080, ratio=25) returns 43.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0132 begin`);
      const actual: number = heightForWidth(1080, 25);
      logInfo(`heightForWidth(width=1080, ratio=25): actual=${actual}`);
      expect(actual).assertClose(43.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0133
     * @tc.name      WindowRatio_HeightForWidth_0133
     * @tc.desc      heightForWidth(width=1080, ratio=35) returns 30.857142857142858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0133 begin`);
      const actual: number = heightForWidth(1080, 35);
      logInfo(`heightForWidth(width=1080, ratio=35): actual=${actual}`);
      expect(actual).assertClose(30.857142857142858, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0134
     * @tc.name      WindowRatio_HeightForWidth_0134
     * @tc.desc      heightForWidth(width=1080, ratio=40) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0134 begin`);
      const actual: number = heightForWidth(1080, 40);
      logInfo(`heightForWidth(width=1080, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}HeightForWidth_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0135
     * @tc.name      WindowRatio_HeightForWidth_0135
     * @tc.desc      heightForWidth(width=1080, ratio=50) returns 21.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0135 begin`);
      const actual: number = heightForWidth(1080, 50);
      logInfo(`heightForWidth(width=1080, ratio=50): actual=${actual}`);
      expect(actual).assertClose(21.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0136
     * @tc.name      WindowRatio_HeightForWidth_0136
     * @tc.desc      heightForWidth(width=1080, ratio=55) returns 19.636363636363637
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0136 begin`);
      const actual: number = heightForWidth(1080, 55);
      logInfo(`heightForWidth(width=1080, ratio=55): actual=${actual}`);
      expect(actual).assertClose(19.636363636363637, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0137
     * @tc.name      WindowRatio_HeightForWidth_0137
     * @tc.desc      heightForWidth(width=1080, ratio=65) returns 16.615384615384617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0137 begin`);
      const actual: number = heightForWidth(1080, 65);
      logInfo(`heightForWidth(width=1080, ratio=65): actual=${actual}`);
      expect(actual).assertClose(16.615384615384617, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0138
     * @tc.name      WindowRatio_HeightForWidth_0138
     * @tc.desc      heightForWidth(width=1080, ratio=70) returns 15.428571428571429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0138 begin`);
      const actual: number = heightForWidth(1080, 70);
      logInfo(`heightForWidth(width=1080, ratio=70): actual=${actual}`);
      expect(actual).assertClose(15.428571428571429, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0139
     * @tc.name      WindowRatio_HeightForWidth_0139
     * @tc.desc      heightForWidth(width=1080, ratio=80) returns 13.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0139 begin`);
      const actual: number = heightForWidth(1080, 80);
      logInfo(`heightForWidth(width=1080, ratio=80): actual=${actual}`);
      expect(actual).assertClose(13.5, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0140
     * @tc.name      WindowRatio_HeightForWidth_0140
     * @tc.desc      heightForWidth(width=1080, ratio=85) returns 12.705882352941176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0140 begin`);
      const actual: number = heightForWidth(1080, 85);
      logInfo(`heightForWidth(width=1080, ratio=85): actual=${actual}`);
      expect(actual).assertClose(12.705882352941176, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0141
     * @tc.name      WindowRatio_HeightForWidth_0141
     * @tc.desc      heightForWidth(width=1080, ratio=95) returns 11.368421052631579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0141 begin`);
      const actual: number = heightForWidth(1080, 95);
      logInfo(`heightForWidth(width=1080, ratio=95): actual=${actual}`);
      expect(actual).assertClose(11.368421052631579, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0142
     * @tc.name      WindowRatio_HeightForWidth_0142
     * @tc.desc      heightForWidth(width=1080, ratio=37) returns 29.18918918918919
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0142 begin`);
      const actual: number = heightForWidth(1080, 37);
      logInfo(`heightForWidth(width=1080, ratio=37): actual=${actual}`);
      expect(actual).assertClose(29.18918918918919, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0143
     * @tc.name      WindowRatio_HeightForWidth_0143
     * @tc.desc      heightForWidth(width=1080, ratio=138) returns 7.826086956521739
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0143 begin`);
      const actual: number = heightForWidth(1080, 138);
      logInfo(`heightForWidth(width=1080, ratio=138): actual=${actual}`);
      expect(actual).assertClose(7.826086956521739, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0144
     * @tc.name      WindowRatio_HeightForWidth_0144
     * @tc.desc      heightForWidth(width=1920, ratio=0.25) returns 7680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0144 begin`);
      const actual: number = heightForWidth(1920, 0.25);
      logInfo(`heightForWidth(width=1920, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(7680);
      logInfo(`${BUNDLE}HeightForWidth_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0145
     * @tc.name      WindowRatio_HeightForWidth_0145
     * @tc.desc      heightForWidth(width=1920, ratio=1) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0145 begin`);
      const actual: number = heightForWidth(1920, 1);
      logInfo(`heightForWidth(width=1920, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}HeightForWidth_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0146
     * @tc.name      WindowRatio_HeightForWidth_0146
     * @tc.desc      heightForWidth(width=1920, ratio=0.5) returns 3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0146 begin`);
      const actual: number = heightForWidth(1920, 0.5);
      logInfo(`heightForWidth(width=1920, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(3840);
      logInfo(`${BUNDLE}HeightForWidth_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0147
     * @tc.name      WindowRatio_HeightForWidth_0147
     * @tc.desc      heightForWidth(width=1920, ratio=1.5) returns 1280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0147 begin`);
      const actual: number = heightForWidth(1920, 1.5);
      logInfo(`heightForWidth(width=1920, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(1280);
      logInfo(`${BUNDLE}HeightForWidth_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0148
     * @tc.name      WindowRatio_HeightForWidth_0148
     * @tc.desc      heightForWidth(width=1920, ratio=2) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0148 begin`);
      const actual: number = heightForWidth(1920, 2);
      logInfo(`heightForWidth(width=1920, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}HeightForWidth_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0149
     * @tc.name      WindowRatio_HeightForWidth_0149
     * @tc.desc      heightForWidth(width=1920, ratio=3) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0149 begin`);
      const actual: number = heightForWidth(1920, 3);
      logInfo(`heightForWidth(width=1920, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}HeightForWidth_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0150
     * @tc.name      WindowRatio_HeightForWidth_0150
     * @tc.desc      heightForWidth(width=1920, ratio=10) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0150 begin`);
      const actual: number = heightForWidth(1920, 10);
      logInfo(`heightForWidth(width=1920, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}HeightForWidth_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0151
     * @tc.name      WindowRatio_HeightForWidth_0151
     * @tc.desc      heightForWidth(width=1920, ratio=100) returns 19.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0151 begin`);
      const actual: number = heightForWidth(1920, 100);
      logInfo(`heightForWidth(width=1920, ratio=100): actual=${actual}`);
      expect(actual).assertClose(19.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0152
     * @tc.name      WindowRatio_HeightForWidth_0152
     * @tc.desc      heightForWidth(width=1920, ratio=5) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0152 begin`);
      const actual: number = heightForWidth(1920, 5);
      logInfo(`heightForWidth(width=1920, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}HeightForWidth_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0153
     * @tc.name      WindowRatio_HeightForWidth_0153
     * @tc.desc      heightForWidth(width=1920, ratio=15) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0153 begin`);
      const actual: number = heightForWidth(1920, 15);
      logInfo(`heightForWidth(width=1920, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}HeightForWidth_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0154
     * @tc.name      WindowRatio_HeightForWidth_0154
     * @tc.desc      heightForWidth(width=1920, ratio=20) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0154 begin`);
      const actual: number = heightForWidth(1920, 20);
      logInfo(`heightForWidth(width=1920, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}HeightForWidth_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0155
     * @tc.name      WindowRatio_HeightForWidth_0155
     * @tc.desc      heightForWidth(width=1920, ratio=25) returns 76.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0155 begin`);
      const actual: number = heightForWidth(1920, 25);
      logInfo(`heightForWidth(width=1920, ratio=25): actual=${actual}`);
      expect(actual).assertClose(76.8, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0156
     * @tc.name      WindowRatio_HeightForWidth_0156
     * @tc.desc      heightForWidth(width=1920, ratio=30) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0156 begin`);
      const actual: number = heightForWidth(1920, 30);
      logInfo(`heightForWidth(width=1920, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}HeightForWidth_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0157
     * @tc.name      WindowRatio_HeightForWidth_0157
     * @tc.desc      heightForWidth(width=1920, ratio=35) returns 54.857142857142854
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0157 begin`);
      const actual: number = heightForWidth(1920, 35);
      logInfo(`heightForWidth(width=1920, ratio=35): actual=${actual}`);
      expect(actual).assertClose(54.857142857142854, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0158
     * @tc.name      WindowRatio_HeightForWidth_0158
     * @tc.desc      heightForWidth(width=1920, ratio=45) returns 42.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0158 begin`);
      const actual: number = heightForWidth(1920, 45);
      logInfo(`heightForWidth(width=1920, ratio=45): actual=${actual}`);
      expect(actual).assertClose(42.666666666666664, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0159
     * @tc.name      WindowRatio_HeightForWidth_0159
     * @tc.desc      heightForWidth(width=1920, ratio=50) returns 38.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0159 begin`);
      const actual: number = heightForWidth(1920, 50);
      logInfo(`heightForWidth(width=1920, ratio=50): actual=${actual}`);
      expect(actual).assertClose(38.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0160
     * @tc.name      WindowRatio_HeightForWidth_0160
     * @tc.desc      heightForWidth(width=1920, ratio=55) returns 34.90909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0160 begin`);
      const actual: number = heightForWidth(1920, 55);
      logInfo(`heightForWidth(width=1920, ratio=55): actual=${actual}`);
      expect(actual).assertClose(34.90909090909091, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0161
     * @tc.name      WindowRatio_HeightForWidth_0161
     * @tc.desc      heightForWidth(width=1920, ratio=60) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0161 begin`);
      const actual: number = heightForWidth(1920, 60);
      logInfo(`heightForWidth(width=1920, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}HeightForWidth_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0162
     * @tc.name      WindowRatio_HeightForWidth_0162
     * @tc.desc      heightForWidth(width=1920, ratio=65) returns 29.53846153846154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0162 begin`);
      const actual: number = heightForWidth(1920, 65);
      logInfo(`heightForWidth(width=1920, ratio=65): actual=${actual}`);
      expect(actual).assertClose(29.53846153846154, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0163
     * @tc.name      WindowRatio_HeightForWidth_0163
     * @tc.desc      heightForWidth(width=1920, ratio=70) returns 27.428571428571427
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0163 begin`);
      const actual: number = heightForWidth(1920, 70);
      logInfo(`heightForWidth(width=1920, ratio=70): actual=${actual}`);
      expect(actual).assertClose(27.428571428571427, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0164
     * @tc.name      WindowRatio_HeightForWidth_0164
     * @tc.desc      heightForWidth(width=1920, ratio=75) returns 25.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0164 begin`);
      const actual: number = heightForWidth(1920, 75);
      logInfo(`heightForWidth(width=1920, ratio=75): actual=${actual}`);
      expect(actual).assertClose(25.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0165
     * @tc.name      WindowRatio_HeightForWidth_0165
     * @tc.desc      heightForWidth(width=1920, ratio=85) returns 22.58823529411765
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0165 begin`);
      const actual: number = heightForWidth(1920, 85);
      logInfo(`heightForWidth(width=1920, ratio=85): actual=${actual}`);
      expect(actual).assertClose(22.58823529411765, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0166
     * @tc.name      WindowRatio_HeightForWidth_0166
     * @tc.desc      heightForWidth(width=1920, ratio=90) returns 21.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0166 begin`);
      const actual: number = heightForWidth(1920, 90);
      logInfo(`heightForWidth(width=1920, ratio=90): actual=${actual}`);
      expect(actual).assertClose(21.333333333333332, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0167
     * @tc.name      WindowRatio_HeightForWidth_0167
     * @tc.desc      heightForWidth(width=1920, ratio=95) returns 20.210526315789473
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0167 begin`);
      const actual: number = heightForWidth(1920, 95);
      logInfo(`heightForWidth(width=1920, ratio=95): actual=${actual}`);
      expect(actual).assertClose(20.210526315789473, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0168
     * @tc.name      WindowRatio_HeightForWidth_0168
     * @tc.desc      heightForWidth(width=1920, ratio=37) returns 51.891891891891895
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0168 begin`);
      const actual: number = heightForWidth(1920, 37);
      logInfo(`heightForWidth(width=1920, ratio=37): actual=${actual}`);
      expect(actual).assertClose(51.891891891891895, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0169
     * @tc.name      WindowRatio_HeightForWidth_0169
     * @tc.desc      heightForWidth(width=1920, ratio=138) returns 13.91304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0169 begin`);
      const actual: number = heightForWidth(1920, 138);
      logInfo(`heightForWidth(width=1920, ratio=138): actual=${actual}`);
      expect(actual).assertClose(13.91304347826087, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0170
     * @tc.name      WindowRatio_HeightForWidth_0170
     * @tc.desc      heightForWidth(width=2, ratio=5) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0170 begin`);
      const actual: number = heightForWidth(2, 5);
      logInfo(`heightForWidth(width=2, ratio=5): actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0171
     * @tc.name      WindowRatio_HeightForWidth_0171
     * @tc.desc      heightForWidth(width=2, ratio=15) returns 0.13333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0171 begin`);
      const actual: number = heightForWidth(2, 15);
      logInfo(`heightForWidth(width=2, ratio=15): actual=${actual}`);
      expect(actual).assertClose(0.13333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0172
     * @tc.name      WindowRatio_HeightForWidth_0172
     * @tc.desc      heightForWidth(width=2, ratio=25) returns 0.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0172 begin`);
      const actual: number = heightForWidth(2, 25);
      logInfo(`heightForWidth(width=2, ratio=25): actual=${actual}`);
      expect(actual).assertClose(0.08, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0173
     * @tc.name      WindowRatio_HeightForWidth_0173
     * @tc.desc      heightForWidth(width=2, ratio=35) returns 0.05714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0173 begin`);
      const actual: number = heightForWidth(2, 35);
      logInfo(`heightForWidth(width=2, ratio=35): actual=${actual}`);
      expect(actual).assertClose(0.05714285714285714, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0174
     * @tc.name      WindowRatio_HeightForWidth_0174
     * @tc.desc      heightForWidth(width=2, ratio=45) returns 0.044444444444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0174 begin`);
      const actual: number = heightForWidth(2, 45);
      logInfo(`heightForWidth(width=2, ratio=45): actual=${actual}`);
      expect(actual).assertClose(0.044444444444444446, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0175
     * @tc.name      WindowRatio_HeightForWidth_0175
     * @tc.desc      heightForWidth(width=2, ratio=55) returns 0.03636363636363636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0175 begin`);
      const actual: number = heightForWidth(2, 55);
      logInfo(`heightForWidth(width=2, ratio=55): actual=${actual}`);
      expect(actual).assertClose(0.03636363636363636, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0176
     * @tc.name      WindowRatio_HeightForWidth_0176
     * @tc.desc      heightForWidth(width=2, ratio=65) returns 0.03076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0176 begin`);
      const actual: number = heightForWidth(2, 65);
      logInfo(`heightForWidth(width=2, ratio=65): actual=${actual}`);
      expect(actual).assertClose(0.03076923076923077, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0177
     * @tc.name      WindowRatio_HeightForWidth_0177
     * @tc.desc      heightForWidth(width=2, ratio=75) returns 0.02666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0177 begin`);
      const actual: number = heightForWidth(2, 75);
      logInfo(`heightForWidth(width=2, ratio=75): actual=${actual}`);
      expect(actual).assertClose(0.02666666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0178
     * @tc.name      WindowRatio_HeightForWidth_0178
     * @tc.desc      heightForWidth(width=2, ratio=85) returns 0.023529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0178 begin`);
      const actual: number = heightForWidth(2, 85);
      logInfo(`heightForWidth(width=2, ratio=85): actual=${actual}`);
      expect(actual).assertClose(0.023529411764705882, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0179
     * @tc.name      WindowRatio_HeightForWidth_0179
     * @tc.desc      heightForWidth(width=2, ratio=95) returns 0.021052631578947368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0179 begin`);
      const actual: number = heightForWidth(2, 95);
      logInfo(`heightForWidth(width=2, ratio=95): actual=${actual}`);
      expect(actual).assertClose(0.021052631578947368, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0180
     * @tc.name      WindowRatio_HeightForWidth_0180
     * @tc.desc      heightForWidth(width=2, ratio=37) returns 0.05405405405405406
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0180 begin`);
      const actual: number = heightForWidth(2, 37);
      logInfo(`heightForWidth(width=2, ratio=37): actual=${actual}`);
      expect(actual).assertClose(0.05405405405405406, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0181
     * @tc.name      WindowRatio_HeightForWidth_0181
     * @tc.desc      heightForWidth(width=2, ratio=138) returns 0.014492753623188406
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0181 begin`);
      const actual: number = heightForWidth(2, 138);
      logInfo(`heightForWidth(width=2, ratio=138): actual=${actual}`);
      expect(actual).assertClose(0.014492753623188406, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0182
     * @tc.name      WindowRatio_HeightForWidth_0182
     * @tc.desc      heightForWidth(width=3, ratio=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0182 begin`);
      const actual: number = heightForWidth(3, 1);
      logInfo(`heightForWidth(width=3, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}HeightForWidth_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0183
     * @tc.name      WindowRatio_HeightForWidth_0183
     * @tc.desc      heightForWidth(width=3, ratio=2) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0183 begin`);
      const actual: number = heightForWidth(3, 2);
      logInfo(`heightForWidth(width=3, ratio=2): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0184
     * @tc.name      WindowRatio_HeightForWidth_0184
     * @tc.desc      heightForWidth(width=3, ratio=10) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0184 begin`);
      const actual: number = heightForWidth(3, 10);
      logInfo(`heightForWidth(width=3, ratio=10): actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0185
     * @tc.name      WindowRatio_HeightForWidth_0185
     * @tc.desc      heightForWidth(width=3, ratio=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0185 begin`);
      const actual: number = heightForWidth(3, 100);
      logInfo(`heightForWidth(width=3, ratio=100): actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0186
     * @tc.name      WindowRatio_HeightForWidth_0186
     * @tc.desc      heightForWidth(width=3, ratio=5) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0186 begin`);
      const actual: number = heightForWidth(3, 5);
      logInfo(`heightForWidth(width=3, ratio=5): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0187
     * @tc.name      WindowRatio_HeightForWidth_0187
     * @tc.desc      heightForWidth(width=3, ratio=20) returns 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0187 begin`);
      const actual: number = heightForWidth(3, 20);
      logInfo(`heightForWidth(width=3, ratio=20): actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0188
     * @tc.name      WindowRatio_HeightForWidth_0188
     * @tc.desc      heightForWidth(width=3, ratio=25) returns 0.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0188 begin`);
      const actual: number = heightForWidth(3, 25);
      logInfo(`heightForWidth(width=3, ratio=25): actual=${actual}`);
      expect(actual).assertClose(0.12, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0189
     * @tc.name      WindowRatio_HeightForWidth_0189
     * @tc.desc      heightForWidth(width=3, ratio=35) returns 0.08571428571428572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0189 begin`);
      const actual: number = heightForWidth(3, 35);
      logInfo(`heightForWidth(width=3, ratio=35): actual=${actual}`);
      expect(actual).assertClose(0.08571428571428572, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0190
     * @tc.name      WindowRatio_HeightForWidth_0190
     * @tc.desc      heightForWidth(width=3, ratio=40) returns 0.075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0190 begin`);
      const actual: number = heightForWidth(3, 40);
      logInfo(`heightForWidth(width=3, ratio=40): actual=${actual}`);
      expect(actual).assertClose(0.075, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0191
     * @tc.name      WindowRatio_HeightForWidth_0191
     * @tc.desc      heightForWidth(width=3, ratio=50) returns 0.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0191 begin`);
      const actual: number = heightForWidth(3, 50);
      logInfo(`heightForWidth(width=3, ratio=50): actual=${actual}`);
      expect(actual).assertClose(0.06, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0192
     * @tc.name      WindowRatio_HeightForWidth_0192
     * @tc.desc      heightForWidth(width=3, ratio=55) returns 0.05454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0192 begin`);
      const actual: number = heightForWidth(3, 55);
      logInfo(`heightForWidth(width=3, ratio=55): actual=${actual}`);
      expect(actual).assertClose(0.05454545454545454, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0192 end`);
    });
  });
}
