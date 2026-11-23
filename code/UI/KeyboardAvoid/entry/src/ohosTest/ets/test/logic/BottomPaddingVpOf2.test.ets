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
import { bottomPaddingVpOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for bottomPaddingVpOf (96 cases). */
export default function bottomPaddingVpOf2Test(): void {
  describe('BottomPaddingVpOf2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0097
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0097
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=55) returns 0.9090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0097 begin`);
      const actual: number = bottomPaddingVpOf(50, 55);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.9090909090909091, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0098
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0098
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=60) returns 0.8333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0098 begin`);
      const actual: number = bottomPaddingVpOf(50, 60);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.8333333333333334, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0099
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0099
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=65) returns 0.7692307692307693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0099 begin`);
      const actual: number = bottomPaddingVpOf(50, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.7692307692307693, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0100
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0100
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=70) returns 0.7142857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0100 begin`);
      const actual: number = bottomPaddingVpOf(50, 70);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.7142857142857143, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0101
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0101
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=75) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0101 begin`);
      const actual: number = bottomPaddingVpOf(50, 75);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0102
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0102
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=80) returns 0.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0102 begin`);
      const actual: number = bottomPaddingVpOf(50, 80);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.625, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0103
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0103
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=85) returns 0.5882352941176471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0103 begin`);
      const actual: number = bottomPaddingVpOf(50, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.5882352941176471, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0104
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0104
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=90) returns 0.5555555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0104 begin`);
      const actual: number = bottomPaddingVpOf(50, 90);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.5555555555555556, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0105
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0105
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=95) returns 0.5263157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0105 begin`);
      const actual: number = bottomPaddingVpOf(50, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.5263157894736842, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0106
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0106
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=105) returns 0.47619047619047616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0106 begin`);
      const actual: number = bottomPaddingVpOf(50, 105);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.47619047619047616, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0107
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0107
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=110) returns 0.45454545454545453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0107 begin`);
      const actual: number = bottomPaddingVpOf(50, 110);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.45454545454545453, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0108
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0108
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=115) returns 0.43478260869565216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0108 begin`);
      const actual: number = bottomPaddingVpOf(50, 115);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.43478260869565216, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0109
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0109
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=78) returns 0.6410256410256411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0109 begin`);
      const actual: number = bottomPaddingVpOf(50, 78);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.6410256410256411, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0110
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0110
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=50, density=174) returns 0.28735632183908044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0110 begin`);
      const actual: number = bottomPaddingVpOf(50, 174);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=50, d...: actual=${actual}`);
      expect(actual).assertClose(0.28735632183908044, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0111
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0111
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0111 begin`);
      const actual: number = bottomPaddingVpOf(100, 1);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0112
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0112
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=3) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0112 begin`);
      const actual: number = bottomPaddingVpOf(100, 3);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0113
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0113
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0113 begin`);
      const actual: number = bottomPaddingVpOf(100, 5);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0114
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0114
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=15) returns 6.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0114 begin`);
      const actual: number = bottomPaddingVpOf(100, 15);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(6.666666666666667, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0115
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0115
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=25) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0115 begin`);
      const actual: number = bottomPaddingVpOf(100, 25);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0116
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0116
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=35) returns 2.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0116 begin`);
      const actual: number = bottomPaddingVpOf(100, 35);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(2.857142857142857, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0117
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0117
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=45) returns 2.2222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0117 begin`);
      const actual: number = bottomPaddingVpOf(100, 45);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(2.2222222222222223, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0118
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0118
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=55) returns 1.8181818181818181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0118 begin`);
      const actual: number = bottomPaddingVpOf(100, 55);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(1.8181818181818181, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0119
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0119
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=65) returns 1.5384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0119 begin`);
      const actual: number = bottomPaddingVpOf(100, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(1.5384615384615385, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0120
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0120
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=75) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0120 begin`);
      const actual: number = bottomPaddingVpOf(100, 75);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0121
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0121
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=85) returns 1.1764705882352942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0121 begin`);
      const actual: number = bottomPaddingVpOf(100, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(1.1764705882352942, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0122
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0122
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=95) returns 1.0526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0122 begin`);
      const actual: number = bottomPaddingVpOf(100, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(1.0526315789473684, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0123
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0123
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=105) returns 0.9523809523809523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0123 begin`);
      const actual: number = bottomPaddingVpOf(100, 105);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(0.9523809523809523, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0124
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0124
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=115) returns 0.8695652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0124 begin`);
      const actual: number = bottomPaddingVpOf(100, 115);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(0.8695652173913043, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0125
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0125
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=78) returns 1.2820512820512822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0125 begin`);
      const actual: number = bottomPaddingVpOf(100, 78);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(1.2820512820512822, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0126
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0126
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=100, density=174) returns 0.5747126436781609
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0126 begin`);
      const actual: number = bottomPaddingVpOf(100, 174);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=100, ...: actual=${actual}`);
      expect(actual).assertClose(0.5747126436781609, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0127
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0127
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=5) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0127 begin`);
      const actual: number = bottomPaddingVpOf(2, 5);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0128
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0128
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=15) returns 0.13333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0128 begin`);
      const actual: number = bottomPaddingVpOf(2, 15);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.13333333333333333, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0129
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0129
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=25) returns 0.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0129 begin`);
      const actual: number = bottomPaddingVpOf(2, 25);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.08, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0130
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0130
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=35) returns 0.05714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0130 begin`);
      const actual: number = bottomPaddingVpOf(2, 35);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.05714285714285714, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0131
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0131
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=45) returns 0.044444444444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0131 begin`);
      const actual: number = bottomPaddingVpOf(2, 45);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.044444444444444446, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0132
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0132
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=55) returns 0.03636363636363636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0132 begin`);
      const actual: number = bottomPaddingVpOf(2, 55);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.03636363636363636, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0133
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0133
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=65) returns 0.03076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0133 begin`);
      const actual: number = bottomPaddingVpOf(2, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.03076923076923077, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0134
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0134
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=75) returns 0.02666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0134 begin`);
      const actual: number = bottomPaddingVpOf(2, 75);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.02666666666666667, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0135
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0135
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=85) returns 0.023529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0135 begin`);
      const actual: number = bottomPaddingVpOf(2, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.023529411764705882, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0136
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0136
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=95) returns 0.021052631578947368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0136 begin`);
      const actual: number = bottomPaddingVpOf(2, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.021052631578947368, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0137
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0137
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=105) returns 0.01904761904761905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0137 begin`);
      const actual: number = bottomPaddingVpOf(2, 105);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.01904761904761905, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0138
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0138
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=115) returns 0.017391304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0138 begin`);
      const actual: number = bottomPaddingVpOf(2, 115);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.017391304347826087, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0139
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0139
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=78) returns 0.02564102564102564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0139 begin`);
      const actual: number = bottomPaddingVpOf(2, 78);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.02564102564102564, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0140
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0140
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=2, density=174) returns 0.011494252873563218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0140 begin`);
      const actual: number = bottomPaddingVpOf(2, 174);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=2, de...: actual=${actual}`);
      expect(actual).assertClose(0.011494252873563218, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0141
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0141
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0141 begin`);
      const actual: number = bottomPaddingVpOf(3, 1);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0142
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0142
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=2) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0142 begin`);
      const actual: number = bottomPaddingVpOf(3, 2);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0143
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0143
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=10) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0143 begin`);
      const actual: number = bottomPaddingVpOf(3, 10);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0144
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0144
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0144 begin`);
      const actual: number = bottomPaddingVpOf(3, 100);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0145
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0145
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=5) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0145 begin`);
      const actual: number = bottomPaddingVpOf(3, 5);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0146
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0146
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=20) returns 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0146 begin`);
      const actual: number = bottomPaddingVpOf(3, 20);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0147
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0147
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=25) returns 0.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0147 begin`);
      const actual: number = bottomPaddingVpOf(3, 25);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.12, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0148
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0148
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=35) returns 0.08571428571428572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0148 begin`);
      const actual: number = bottomPaddingVpOf(3, 35);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.08571428571428572, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0149
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0149
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=40) returns 0.075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0149 begin`);
      const actual: number = bottomPaddingVpOf(3, 40);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.075, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0149 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0150
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0150
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=50) returns 0.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0150 begin`);
      const actual: number = bottomPaddingVpOf(3, 50);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.06, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0151
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0151
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=55) returns 0.05454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0151 begin`);
      const actual: number = bottomPaddingVpOf(3, 55);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.05454545454545454, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0152
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0152
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=65) returns 0.046153846153846156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0152 begin`);
      const actual: number = bottomPaddingVpOf(3, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.046153846153846156, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0153
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0153
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=70) returns 0.04285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0153 begin`);
      const actual: number = bottomPaddingVpOf(3, 70);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.04285714285714286, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0154
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0154
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=80) returns 0.0375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0154 begin`);
      const actual: number = bottomPaddingVpOf(3, 80);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.0375, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0155
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0155
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=85) returns 0.03529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0155 begin`);
      const actual: number = bottomPaddingVpOf(3, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.03529411764705882, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0156
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0156
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=95) returns 0.031578947368421054
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0156 begin`);
      const actual: number = bottomPaddingVpOf(3, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.031578947368421054, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0157
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0157
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=110) returns 0.02727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0157 begin`);
      const actual: number = bottomPaddingVpOf(3, 110);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.02727272727272727, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0158
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0158
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=115) returns 0.02608695652173913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0158 begin`);
      const actual: number = bottomPaddingVpOf(3, 115);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.02608695652173913, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0159
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0159
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=78) returns 0.038461538461538464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0159 begin`);
      const actual: number = bottomPaddingVpOf(3, 78);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.038461538461538464, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0160
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0160
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=3, density=174) returns 0.017241379310344827
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0160 begin`);
      const actual: number = bottomPaddingVpOf(3, 174);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=3, de...: actual=${actual}`);
      expect(actual).assertClose(0.017241379310344827, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0160 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0161
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0161
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=35) returns 0.2857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0161 begin`);
      const actual: number = bottomPaddingVpOf(10, 35);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.2857142857142857, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0162
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0162
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=40) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0162 begin`);
      const actual: number = bottomPaddingVpOf(10, 40);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0163
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0163
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=45) returns 0.2222222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0163 begin`);
      const actual: number = bottomPaddingVpOf(10, 45);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.2222222222222222, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0164
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0164
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=55) returns 0.18181818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0164 begin`);
      const actual: number = bottomPaddingVpOf(10, 55);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.18181818181818182, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0165
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0165
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=60) returns 0.16666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0165 begin`);
      const actual: number = bottomPaddingVpOf(10, 60);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.16666666666666666, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0166
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0166
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=65) returns 0.15384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0166 begin`);
      const actual: number = bottomPaddingVpOf(10, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.15384615384615385, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0167
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0167
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=70) returns 0.14285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0167 begin`);
      const actual: number = bottomPaddingVpOf(10, 70);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.14285714285714285, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0168
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0168
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=80) returns 0.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0168 begin`);
      const actual: number = bottomPaddingVpOf(10, 80);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.125, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0169
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0169
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=85) returns 0.11764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0169 begin`);
      const actual: number = bottomPaddingVpOf(10, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.11764705882352941, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0170
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0170
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=90) returns 0.1111111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0170 begin`);
      const actual: number = bottomPaddingVpOf(10, 90);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.1111111111111111, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0171
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0171
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=95) returns 0.10526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0171 begin`);
      const actual: number = bottomPaddingVpOf(10, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.10526315789473684, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0172
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0172
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=105) returns 0.09523809523809523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0172 begin`);
      const actual: number = bottomPaddingVpOf(10, 105);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.09523809523809523, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0173
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0173
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=110) returns 0.09090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0173 begin`);
      const actual: number = bottomPaddingVpOf(10, 110);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.09090909090909091, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0174
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0174
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=115) returns 0.08695652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0174 begin`);
      const actual: number = bottomPaddingVpOf(10, 115);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.08695652173913043, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0175
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0175
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=78) returns 0.1282051282051282
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0175 begin`);
      const actual: number = bottomPaddingVpOf(10, 78);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.1282051282051282, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0176
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0176
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=10, density=174) returns 0.05747126436781609
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0176 begin`);
      const actual: number = bottomPaddingVpOf(10, 174);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=10, d...: actual=${actual}`);
      expect(actual).assertClose(0.05747126436781609, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0177
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0177
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=60) returns 0.08333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0177 begin`);
      const actual: number = bottomPaddingVpOf(5, 60);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.08333333333333333, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0178
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0178
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=65) returns 0.07692307692307693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0178 begin`);
      const actual: number = bottomPaddingVpOf(5, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.07692307692307693, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0179
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0179
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=70) returns 0.07142857142857142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0179 begin`);
      const actual: number = bottomPaddingVpOf(5, 70);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.07142857142857142, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0180
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0180
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=80) returns 0.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0180 begin`);
      const actual: number = bottomPaddingVpOf(5, 80);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.0625, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0181
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0181
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=85) returns 0.058823529411764705
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0181 begin`);
      const actual: number = bottomPaddingVpOf(5, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.058823529411764705, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0182
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0182
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=90) returns 0.05555555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0182 begin`);
      const actual: number = bottomPaddingVpOf(5, 90);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.05555555555555555, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0183
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0183
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=95) returns 0.05263157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0183 begin`);
      const actual: number = bottomPaddingVpOf(5, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.05263157894736842, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0184
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0184
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=105) returns 0.047619047619047616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0184 begin`);
      const actual: number = bottomPaddingVpOf(5, 105);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.047619047619047616, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0185
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0185
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=110) returns 0.045454545454545456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0185 begin`);
      const actual: number = bottomPaddingVpOf(5, 110);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.045454545454545456, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0186
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0186
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=115) returns 0.043478260869565216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0186 begin`);
      const actual: number = bottomPaddingVpOf(5, 115);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.043478260869565216, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0187
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0187
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=78) returns 0.0641025641025641
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0187 begin`);
      const actual: number = bottomPaddingVpOf(5, 78);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.0641025641025641, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0188
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0188
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=5, density=174) returns 0.028735632183908046
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0188 begin`);
      const actual: number = bottomPaddingVpOf(5, 174);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=5, de...: actual=${actual}`);
      expect(actual).assertClose(0.028735632183908046, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0189
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0189
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=1) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0189 begin`);
      const actual: number = bottomPaddingVpOf(15, 1);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0190
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0190
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=2) returns 7.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0190 begin`);
      const actual: number = bottomPaddingVpOf(15, 2);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0191
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0191
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=20) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0191 begin`);
      const actual: number = bottomPaddingVpOf(15, 20);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0192
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0192
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=35) returns 0.42857142857142855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0192 begin`);
      const actual: number = bottomPaddingVpOf(15, 35);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.42857142857142855, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0192 end`);
    });
  });
}
