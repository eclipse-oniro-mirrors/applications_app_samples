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
export default function roundedHeightForWidth2Test(): void {
  describe('RoundedHeightForWidth2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0097
     * @tc.name      WindowRatio_RoundedHeightForWidth_0097
     * @tc.desc      roundedHeightForWidth(width=672, ratio=20) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0097 begin`);
      const actual: number = roundedHeightForWidth(672, 20);
      logInfo(`roundedHeightForWidth(width=672, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0098
     * @tc.name      WindowRatio_RoundedHeightForWidth_0098
     * @tc.desc      roundedHeightForWidth(width=768, ratio=0.25) returns 3072
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0098 begin`);
      const actual: number = roundedHeightForWidth(768, 0.25);
      logInfo(`roundedHeightForWidth(width=768, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(3072);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0099
     * @tc.name      WindowRatio_RoundedHeightForWidth_0099
     * @tc.desc      roundedHeightForWidth(width=768, ratio=1.5) returns 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0099 begin`);
      const actual: number = roundedHeightForWidth(768, 1.5);
      logInfo(`roundedHeightForWidth(width=768, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(512);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0100
     * @tc.name      WindowRatio_RoundedHeightForWidth_0100
     * @tc.desc      roundedHeightForWidth(width=768, ratio=5) returns 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0100 begin`);
      const actual: number = roundedHeightForWidth(768, 5);
      logInfo(`roundedHeightForWidth(width=768, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(154);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0101
     * @tc.name      WindowRatio_RoundedHeightForWidth_0101
     * @tc.desc      roundedHeightForWidth(width=768, ratio=15) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0101 begin`);
      const actual: number = roundedHeightForWidth(768, 15);
      logInfo(`roundedHeightForWidth(width=768, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0102
     * @tc.name      WindowRatio_RoundedHeightForWidth_0102
     * @tc.desc      roundedHeightForWidth(width=864, ratio=0.25) returns 3456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0102 begin`);
      const actual: number = roundedHeightForWidth(864, 0.25);
      logInfo(`roundedHeightForWidth(width=864, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(3456);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0103
     * @tc.name      WindowRatio_RoundedHeightForWidth_0103
     * @tc.desc      roundedHeightForWidth(width=864, ratio=0.5) returns 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0103 begin`);
      const actual: number = roundedHeightForWidth(864, 0.5);
      logInfo(`roundedHeightForWidth(width=864, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0104
     * @tc.name      WindowRatio_RoundedHeightForWidth_0104
     * @tc.desc      roundedHeightForWidth(width=864, ratio=1) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0104 begin`);
      const actual: number = roundedHeightForWidth(864, 1);
      logInfo(`roundedHeightForWidth(width=864, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0105
     * @tc.name      WindowRatio_RoundedHeightForWidth_0105
     * @tc.desc      roundedHeightForWidth(width=864, ratio=2) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0105 begin`);
      const actual: number = roundedHeightForWidth(864, 2);
      logInfo(`roundedHeightForWidth(width=864, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0106
     * @tc.name      WindowRatio_RoundedHeightForWidth_0106
     * @tc.desc      roundedHeightForWidth(width=864, ratio=10) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0106 begin`);
      const actual: number = roundedHeightForWidth(864, 10);
      logInfo(`roundedHeightForWidth(width=864, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0107
     * @tc.name      WindowRatio_RoundedHeightForWidth_0107
     * @tc.desc      roundedHeightForWidth(width=864, ratio=5) returns 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0107 begin`);
      const actual: number = roundedHeightForWidth(864, 5);
      logInfo(`roundedHeightForWidth(width=864, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(173);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0108
     * @tc.name      WindowRatio_RoundedHeightForWidth_0108
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=0.25) returns 4224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0108 begin`);
      const actual: number = roundedHeightForWidth(1056, 0.25);
      logInfo(`roundedHeightForWidth(width=1056, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(4224);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0109
     * @tc.name      WindowRatio_RoundedHeightForWidth_0109
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=0.5) returns 2112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0109 begin`);
      const actual: number = roundedHeightForWidth(1056, 0.5);
      logInfo(`roundedHeightForWidth(width=1056, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(2112);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0110
     * @tc.name      WindowRatio_RoundedHeightForWidth_0110
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=1) returns 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0110 begin`);
      const actual: number = roundedHeightForWidth(1056, 1);
      logInfo(`roundedHeightForWidth(width=1056, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1056);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0111
     * @tc.name      WindowRatio_RoundedHeightForWidth_0111
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=1.5) returns 704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0111 begin`);
      const actual: number = roundedHeightForWidth(1056, 1.5);
      logInfo(`roundedHeightForWidth(width=1056, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(704);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0112
     * @tc.name      WindowRatio_RoundedHeightForWidth_0112
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=2) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0112 begin`);
      const actual: number = roundedHeightForWidth(1056, 2);
      logInfo(`roundedHeightForWidth(width=1056, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0113
     * @tc.name      WindowRatio_RoundedHeightForWidth_0113
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=3) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0113 begin`);
      const actual: number = roundedHeightForWidth(1056, 3);
      logInfo(`roundedHeightForWidth(width=1056, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(352);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0114
     * @tc.name      WindowRatio_RoundedHeightForWidth_0114
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=10) returns 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0114 begin`);
      const actual: number = roundedHeightForWidth(1056, 10);
      logInfo(`roundedHeightForWidth(width=1056, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(106);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0115
     * @tc.name      WindowRatio_RoundedHeightForWidth_0115
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=5) returns 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0115 begin`);
      const actual: number = roundedHeightForWidth(1056, 5);
      logInfo(`roundedHeightForWidth(width=1056, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(211);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0116
     * @tc.name      WindowRatio_RoundedHeightForWidth_0116
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=15) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0116 begin`);
      const actual: number = roundedHeightForWidth(1056, 15);
      logInfo(`roundedHeightForWidth(width=1056, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0117
     * @tc.name      WindowRatio_RoundedHeightForWidth_0117
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=20) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0117 begin`);
      const actual: number = roundedHeightForWidth(1056, 20);
      logInfo(`roundedHeightForWidth(width=1056, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0118
     * @tc.name      WindowRatio_RoundedHeightForWidth_0118
     * @tc.desc      roundedHeightForWidth(width=1056, ratio=25) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0118 begin`);
      const actual: number = roundedHeightForWidth(1056, 25);
      logInfo(`roundedHeightForWidth(width=1056, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0119
     * @tc.name      WindowRatio_RoundedHeightForWidth_0119
     * @tc.desc      roundedHeightForWidth(width=1152, ratio=0.25) returns 4608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0119 begin`);
      const actual: number = roundedHeightForWidth(1152, 0.25);
      logInfo(`roundedHeightForWidth(width=1152, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(4608);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0120
     * @tc.name      WindowRatio_RoundedHeightForWidth_0120
     * @tc.desc      roundedHeightForWidth(width=1152, ratio=5) returns 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0120 begin`);
      const actual: number = roundedHeightForWidth(1152, 5);
      logInfo(`roundedHeightForWidth(width=1152, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(230);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0121
     * @tc.name      WindowRatio_RoundedHeightForWidth_0121
     * @tc.desc      roundedHeightForWidth(width=1152, ratio=25) returns 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0121 begin`);
      const actual: number = roundedHeightForWidth(1152, 25);
      logInfo(`roundedHeightForWidth(width=1152, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0122
     * @tc.name      WindowRatio_RoundedHeightForWidth_0122
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=0.25) returns 4992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0122 begin`);
      const actual: number = roundedHeightForWidth(1248, 0.25);
      logInfo(`roundedHeightForWidth(width=1248, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(4992);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0123
     * @tc.name      WindowRatio_RoundedHeightForWidth_0123
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=0.5) returns 2496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0123 begin`);
      const actual: number = roundedHeightForWidth(1248, 0.5);
      logInfo(`roundedHeightForWidth(width=1248, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(2496);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0124
     * @tc.name      WindowRatio_RoundedHeightForWidth_0124
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=1) returns 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0124 begin`);
      const actual: number = roundedHeightForWidth(1248, 1);
      logInfo(`roundedHeightForWidth(width=1248, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1248);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0125
     * @tc.name      WindowRatio_RoundedHeightForWidth_0125
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=1.5) returns 832
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0125 begin`);
      const actual: number = roundedHeightForWidth(1248, 1.5);
      logInfo(`roundedHeightForWidth(width=1248, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(832);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0126
     * @tc.name      WindowRatio_RoundedHeightForWidth_0126
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=2) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0126 begin`);
      const actual: number = roundedHeightForWidth(1248, 2);
      logInfo(`roundedHeightForWidth(width=1248, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0127
     * @tc.name      WindowRatio_RoundedHeightForWidth_0127
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=3) returns 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0127 begin`);
      const actual: number = roundedHeightForWidth(1248, 3);
      logInfo(`roundedHeightForWidth(width=1248, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(416);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0128
     * @tc.name      WindowRatio_RoundedHeightForWidth_0128
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=10) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0128 begin`);
      const actual: number = roundedHeightForWidth(1248, 10);
      logInfo(`roundedHeightForWidth(width=1248, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0129
     * @tc.name      WindowRatio_RoundedHeightForWidth_0129
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=5) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0129 begin`);
      const actual: number = roundedHeightForWidth(1248, 5);
      logInfo(`roundedHeightForWidth(width=1248, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0130
     * @tc.name      WindowRatio_RoundedHeightForWidth_0130
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=15) returns 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0130 begin`);
      const actual: number = roundedHeightForWidth(1248, 15);
      logInfo(`roundedHeightForWidth(width=1248, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(83);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0131
     * @tc.name      WindowRatio_RoundedHeightForWidth_0131
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=20) returns 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0131 begin`);
      const actual: number = roundedHeightForWidth(1248, 20);
      logInfo(`roundedHeightForWidth(width=1248, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(62);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0132
     * @tc.name      WindowRatio_RoundedHeightForWidth_0132
     * @tc.desc      roundedHeightForWidth(width=1248, ratio=45) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0132 begin`);
      const actual: number = roundedHeightForWidth(1248, 45);
      logInfo(`roundedHeightForWidth(width=1248, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0133
     * @tc.name      WindowRatio_RoundedHeightForWidth_0133
     * @tc.desc      roundedHeightForWidth(width=1344, ratio=0.25) returns 5376
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0133 begin`);
      const actual: number = roundedHeightForWidth(1344, 0.25);
      logInfo(`roundedHeightForWidth(width=1344, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(5376);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0134
     * @tc.name      WindowRatio_RoundedHeightForWidth_0134
     * @tc.desc      roundedHeightForWidth(width=1344, ratio=1.5) returns 896
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0134 begin`);
      const actual: number = roundedHeightForWidth(1344, 1.5);
      logInfo(`roundedHeightForWidth(width=1344, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(896);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0135
     * @tc.name      WindowRatio_RoundedHeightForWidth_0135
     * @tc.desc      roundedHeightForWidth(width=1344, ratio=5) returns 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0135 begin`);
      const actual: number = roundedHeightForWidth(1344, 5);
      logInfo(`roundedHeightForWidth(width=1344, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(269);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0136
     * @tc.name      WindowRatio_RoundedHeightForWidth_0136
     * @tc.desc      roundedHeightForWidth(width=1344, ratio=15) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0136 begin`);
      const actual: number = roundedHeightForWidth(1344, 15);
      logInfo(`roundedHeightForWidth(width=1344, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0137
     * @tc.name      WindowRatio_RoundedHeightForWidth_0137
     * @tc.desc      roundedHeightForWidth(width=1440, ratio=0.25) returns 5760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0137 begin`);
      const actual: number = roundedHeightForWidth(1440, 0.25);
      logInfo(`roundedHeightForWidth(width=1440, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(5760);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0138
     * @tc.name      WindowRatio_RoundedHeightForWidth_0138
     * @tc.desc      roundedHeightForWidth(width=1440, ratio=35) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0138 begin`);
      const actual: number = roundedHeightForWidth(1440, 35);
      logInfo(`roundedHeightForWidth(width=1440, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0139
     * @tc.name      WindowRatio_RoundedHeightForWidth_0139
     * @tc.desc      roundedHeightForWidth(width=1536, ratio=0.25) returns 6144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0139 begin`);
      const actual: number = roundedHeightForWidth(1536, 0.25);
      logInfo(`roundedHeightForWidth(width=1536, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(6144);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0140
     * @tc.name      WindowRatio_RoundedHeightForWidth_0140
     * @tc.desc      roundedHeightForWidth(width=1536, ratio=1.5) returns 1024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0140 begin`);
      const actual: number = roundedHeightForWidth(1536, 1.5);
      logInfo(`roundedHeightForWidth(width=1536, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(1024);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0141
     * @tc.name      WindowRatio_RoundedHeightForWidth_0141
     * @tc.desc      roundedHeightForWidth(width=1536, ratio=5) returns 307
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0141 begin`);
      const actual: number = roundedHeightForWidth(1536, 5);
      logInfo(`roundedHeightForWidth(width=1536, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(307);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0142
     * @tc.name      WindowRatio_RoundedHeightForWidth_0142
     * @tc.desc      roundedHeightForWidth(width=1536, ratio=15) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0142 begin`);
      const actual: number = roundedHeightForWidth(1536, 15);
      logInfo(`roundedHeightForWidth(width=1536, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0143
     * @tc.name      WindowRatio_RoundedHeightForWidth_0143
     * @tc.desc      roundedHeightForWidth(width=1536, ratio=25) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0143 begin`);
      const actual: number = roundedHeightForWidth(1536, 25);
      logInfo(`roundedHeightForWidth(width=1536, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0144
     * @tc.name      WindowRatio_RoundedHeightForWidth_0144
     * @tc.desc      roundedHeightForWidth(width=1536, ratio=35) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0144 begin`);
      const actual: number = roundedHeightForWidth(1536, 35);
      logInfo(`roundedHeightForWidth(width=1536, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0145
     * @tc.name      WindowRatio_RoundedHeightForWidth_0145
     * @tc.desc      roundedHeightForWidth(width=0, ratio=0.25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0145 begin`);
      const actual: number = roundedHeightForWidth(0, 0.25);
      logInfo(`roundedHeightForWidth(width=0, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0146
     * @tc.name      WindowRatio_RoundedHeightForWidth_0146
     * @tc.desc      roundedHeightForWidth(width=0, ratio=0.5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0146 begin`);
      const actual: number = roundedHeightForWidth(0, 0.5);
      logInfo(`roundedHeightForWidth(width=0, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0147
     * @tc.name      WindowRatio_RoundedHeightForWidth_0147
     * @tc.desc      roundedHeightForWidth(width=0, ratio=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0147 begin`);
      const actual: number = roundedHeightForWidth(0, 1);
      logInfo(`roundedHeightForWidth(width=0, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0148
     * @tc.name      WindowRatio_RoundedHeightForWidth_0148
     * @tc.desc      roundedHeightForWidth(width=0, ratio=1.5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0148 begin`);
      const actual: number = roundedHeightForWidth(0, 1.5);
      logInfo(`roundedHeightForWidth(width=0, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0149
     * @tc.name      WindowRatio_RoundedHeightForWidth_0149
     * @tc.desc      roundedHeightForWidth(width=0, ratio=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0149 begin`);
      const actual: number = roundedHeightForWidth(0, 2);
      logInfo(`roundedHeightForWidth(width=0, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0150
     * @tc.name      WindowRatio_RoundedHeightForWidth_0150
     * @tc.desc      roundedHeightForWidth(width=0, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0150 begin`);
      const actual: number = roundedHeightForWidth(0, -1);
      logInfo(`roundedHeightForWidth(width=0, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0151
     * @tc.name      WindowRatio_RoundedHeightForWidth_0151
     * @tc.desc      roundedHeightForWidth(width=0, ratio=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0151 begin`);
      const actual: number = roundedHeightForWidth(0, 3);
      logInfo(`roundedHeightForWidth(width=0, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0152
     * @tc.name      WindowRatio_RoundedHeightForWidth_0152
     * @tc.desc      roundedHeightForWidth(width=0, ratio=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0152 begin`);
      const actual: number = roundedHeightForWidth(0, 10);
      logInfo(`roundedHeightForWidth(width=0, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0153
     * @tc.name      WindowRatio_RoundedHeightForWidth_0153
     * @tc.desc      roundedHeightForWidth(width=0, ratio=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0153 begin`);
      const actual: number = roundedHeightForWidth(0, 100);
      logInfo(`roundedHeightForWidth(width=0, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0154
     * @tc.name      WindowRatio_RoundedHeightForWidth_0154
     * @tc.desc      roundedHeightForWidth(width=0, ratio=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0154 begin`);
      const actual: number = roundedHeightForWidth(0, 5);
      logInfo(`roundedHeightForWidth(width=0, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0155
     * @tc.name      WindowRatio_RoundedHeightForWidth_0155
     * @tc.desc      roundedHeightForWidth(width=0, ratio=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0155 begin`);
      const actual: number = roundedHeightForWidth(0, 15);
      logInfo(`roundedHeightForWidth(width=0, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0156
     * @tc.name      WindowRatio_RoundedHeightForWidth_0156
     * @tc.desc      roundedHeightForWidth(width=0, ratio=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0156 begin`);
      const actual: number = roundedHeightForWidth(0, 20);
      logInfo(`roundedHeightForWidth(width=0, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0157
     * @tc.name      WindowRatio_RoundedHeightForWidth_0157
     * @tc.desc      roundedHeightForWidth(width=0, ratio=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0157 begin`);
      const actual: number = roundedHeightForWidth(0, 25);
      logInfo(`roundedHeightForWidth(width=0, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0158
     * @tc.name      WindowRatio_RoundedHeightForWidth_0158
     * @tc.desc      roundedHeightForWidth(width=0, ratio=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0158 begin`);
      const actual: number = roundedHeightForWidth(0, 30);
      logInfo(`roundedHeightForWidth(width=0, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0159
     * @tc.name      WindowRatio_RoundedHeightForWidth_0159
     * @tc.desc      roundedHeightForWidth(width=0, ratio=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0159 begin`);
      const actual: number = roundedHeightForWidth(0, 35);
      logInfo(`roundedHeightForWidth(width=0, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0160
     * @tc.name      WindowRatio_RoundedHeightForWidth_0160
     * @tc.desc      roundedHeightForWidth(width=0, ratio=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0160 begin`);
      const actual: number = roundedHeightForWidth(0, 40);
      logInfo(`roundedHeightForWidth(width=0, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0161
     * @tc.name      WindowRatio_RoundedHeightForWidth_0161
     * @tc.desc      roundedHeightForWidth(width=0, ratio=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0161 begin`);
      const actual: number = roundedHeightForWidth(0, 45);
      logInfo(`roundedHeightForWidth(width=0, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0162
     * @tc.name      WindowRatio_RoundedHeightForWidth_0162
     * @tc.desc      roundedHeightForWidth(width=0, ratio=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0162 begin`);
      const actual: number = roundedHeightForWidth(0, 50);
      logInfo(`roundedHeightForWidth(width=0, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0163
     * @tc.name      WindowRatio_RoundedHeightForWidth_0163
     * @tc.desc      roundedHeightForWidth(width=0, ratio=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0163 begin`);
      const actual: number = roundedHeightForWidth(0, 55);
      logInfo(`roundedHeightForWidth(width=0, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0164
     * @tc.name      WindowRatio_RoundedHeightForWidth_0164
     * @tc.desc      roundedHeightForWidth(width=0, ratio=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0164 begin`);
      const actual: number = roundedHeightForWidth(0, 60);
      logInfo(`roundedHeightForWidth(width=0, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0165
     * @tc.name      WindowRatio_RoundedHeightForWidth_0165
     * @tc.desc      roundedHeightForWidth(width=0, ratio=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0165 begin`);
      const actual: number = roundedHeightForWidth(0, 65);
      logInfo(`roundedHeightForWidth(width=0, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0166
     * @tc.name      WindowRatio_RoundedHeightForWidth_0166
     * @tc.desc      roundedHeightForWidth(width=0, ratio=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0166 begin`);
      const actual: number = roundedHeightForWidth(0, 70);
      logInfo(`roundedHeightForWidth(width=0, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0167
     * @tc.name      WindowRatio_RoundedHeightForWidth_0167
     * @tc.desc      roundedHeightForWidth(width=0, ratio=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0167 begin`);
      const actual: number = roundedHeightForWidth(0, 75);
      logInfo(`roundedHeightForWidth(width=0, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0168
     * @tc.name      WindowRatio_RoundedHeightForWidth_0168
     * @tc.desc      roundedHeightForWidth(width=0, ratio=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0168 begin`);
      const actual: number = roundedHeightForWidth(0, 80);
      logInfo(`roundedHeightForWidth(width=0, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0169
     * @tc.name      WindowRatio_RoundedHeightForWidth_0169
     * @tc.desc      roundedHeightForWidth(width=0, ratio=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0169 begin`);
      const actual: number = roundedHeightForWidth(0, 85);
      logInfo(`roundedHeightForWidth(width=0, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0170
     * @tc.name      WindowRatio_RoundedHeightForWidth_0170
     * @tc.desc      roundedHeightForWidth(width=0, ratio=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0170 begin`);
      const actual: number = roundedHeightForWidth(0, 90);
      logInfo(`roundedHeightForWidth(width=0, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0171
     * @tc.name      WindowRatio_RoundedHeightForWidth_0171
     * @tc.desc      roundedHeightForWidth(width=0, ratio=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0171 begin`);
      const actual: number = roundedHeightForWidth(0, 95);
      logInfo(`roundedHeightForWidth(width=0, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0172
     * @tc.name      WindowRatio_RoundedHeightForWidth_0172
     * @tc.desc      roundedHeightForWidth(width=0, ratio=77.45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0172 begin`);
      const actual: number = roundedHeightForWidth(0, 77.45);
      logInfo(`roundedHeightForWidth(width=0, ratio=77.45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0173
     * @tc.name      WindowRatio_RoundedHeightForWidth_0173
     * @tc.desc      roundedHeightForWidth(width=0, ratio=-52) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0173 begin`);
      const actual: number = roundedHeightForWidth(0, -52);
      logInfo(`roundedHeightForWidth(width=0, ratio=-52): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0174
     * @tc.name      WindowRatio_RoundedHeightForWidth_0174
     * @tc.desc      roundedHeightForWidth(width=1, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0174 begin`);
      const actual: number = roundedHeightForWidth(1, 0);
      logInfo(`roundedHeightForWidth(width=1, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0175
     * @tc.name      WindowRatio_RoundedHeightForWidth_0175
     * @tc.desc      roundedHeightForWidth(width=1, ratio=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0175 begin`);
      const actual: number = roundedHeightForWidth(1, 1.5);
      logInfo(`roundedHeightForWidth(width=1, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0176
     * @tc.name      WindowRatio_RoundedHeightForWidth_0176
     * @tc.desc      roundedHeightForWidth(width=1, ratio=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0176 begin`);
      const actual: number = roundedHeightForWidth(1, 2);
      logInfo(`roundedHeightForWidth(width=1, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0177
     * @tc.name      WindowRatio_RoundedHeightForWidth_0177
     * @tc.desc      roundedHeightForWidth(width=1, ratio=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0177 begin`);
      const actual: number = roundedHeightForWidth(1, -1);
      logInfo(`roundedHeightForWidth(width=1, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0178
     * @tc.name      WindowRatio_RoundedHeightForWidth_0178
     * @tc.desc      roundedHeightForWidth(width=1, ratio=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0178 begin`);
      const actual: number = roundedHeightForWidth(1, 3);
      logInfo(`roundedHeightForWidth(width=1, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0179
     * @tc.name      WindowRatio_RoundedHeightForWidth_0179
     * @tc.desc      roundedHeightForWidth(width=1, ratio=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0179 begin`);
      const actual: number = roundedHeightForWidth(1, 10);
      logInfo(`roundedHeightForWidth(width=1, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0180
     * @tc.name      WindowRatio_RoundedHeightForWidth_0180
     * @tc.desc      roundedHeightForWidth(width=1, ratio=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0180 begin`);
      const actual: number = roundedHeightForWidth(1, 100);
      logInfo(`roundedHeightForWidth(width=1, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0181
     * @tc.name      WindowRatio_RoundedHeightForWidth_0181
     * @tc.desc      roundedHeightForWidth(width=1, ratio=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0181 begin`);
      const actual: number = roundedHeightForWidth(1, 5);
      logInfo(`roundedHeightForWidth(width=1, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0182
     * @tc.name      WindowRatio_RoundedHeightForWidth_0182
     * @tc.desc      roundedHeightForWidth(width=1, ratio=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0182 begin`);
      const actual: number = roundedHeightForWidth(1, 15);
      logInfo(`roundedHeightForWidth(width=1, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0183
     * @tc.name      WindowRatio_RoundedHeightForWidth_0183
     * @tc.desc      roundedHeightForWidth(width=1, ratio=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0183 begin`);
      const actual: number = roundedHeightForWidth(1, 20);
      logInfo(`roundedHeightForWidth(width=1, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0184
     * @tc.name      WindowRatio_RoundedHeightForWidth_0184
     * @tc.desc      roundedHeightForWidth(width=1, ratio=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0184 begin`);
      const actual: number = roundedHeightForWidth(1, 25);
      logInfo(`roundedHeightForWidth(width=1, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0185
     * @tc.name      WindowRatio_RoundedHeightForWidth_0185
     * @tc.desc      roundedHeightForWidth(width=1, ratio=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0185 begin`);
      const actual: number = roundedHeightForWidth(1, 30);
      logInfo(`roundedHeightForWidth(width=1, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0186
     * @tc.name      WindowRatio_RoundedHeightForWidth_0186
     * @tc.desc      roundedHeightForWidth(width=1, ratio=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0186 begin`);
      const actual: number = roundedHeightForWidth(1, 35);
      logInfo(`roundedHeightForWidth(width=1, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0187
     * @tc.name      WindowRatio_RoundedHeightForWidth_0187
     * @tc.desc      roundedHeightForWidth(width=1, ratio=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0187 begin`);
      const actual: number = roundedHeightForWidth(1, 40);
      logInfo(`roundedHeightForWidth(width=1, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0188
     * @tc.name      WindowRatio_RoundedHeightForWidth_0188
     * @tc.desc      roundedHeightForWidth(width=1, ratio=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0188 begin`);
      const actual: number = roundedHeightForWidth(1, 45);
      logInfo(`roundedHeightForWidth(width=1, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0189
     * @tc.name      WindowRatio_RoundedHeightForWidth_0189
     * @tc.desc      roundedHeightForWidth(width=1, ratio=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0189 begin`);
      const actual: number = roundedHeightForWidth(1, 50);
      logInfo(`roundedHeightForWidth(width=1, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0190
     * @tc.name      WindowRatio_RoundedHeightForWidth_0190
     * @tc.desc      roundedHeightForWidth(width=1, ratio=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0190 begin`);
      const actual: number = roundedHeightForWidth(1, 55);
      logInfo(`roundedHeightForWidth(width=1, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0191
     * @tc.name      WindowRatio_RoundedHeightForWidth_0191
     * @tc.desc      roundedHeightForWidth(width=1, ratio=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0191 begin`);
      const actual: number = roundedHeightForWidth(1, 60);
      logInfo(`roundedHeightForWidth(width=1, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0192
     * @tc.name      WindowRatio_RoundedHeightForWidth_0192
     * @tc.desc      roundedHeightForWidth(width=1, ratio=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0192 begin`);
      const actual: number = roundedHeightForWidth(1, 65);
      logInfo(`roundedHeightForWidth(width=1, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0192 end`);
    });
  });
}
