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
import { keyboardHeightVpOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for keyboardHeightVpOf (96 cases). */
export default function keyboardHeightVpOf2Test(): void {
  describe('KeyboardHeightVpOf2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0097
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0097
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=60) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0097 begin`);
      const actual: number = keyboardHeightVpOf(360, 60);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=60): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0098
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0098
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=65) returns 5.538461538461538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0098 begin`);
      const actual: number = keyboardHeightVpOf(360, 65);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=65): actual=${actual}`);
      expect(actual).assertClose(5.538461538461538, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0099
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0099
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=70) returns 5.142857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0099 begin`);
      const actual: number = keyboardHeightVpOf(360, 70);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=70): actual=${actual}`);
      expect(actual).assertClose(5.142857142857143, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0100
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0100
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=75) returns 4.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0100 begin`);
      const actual: number = keyboardHeightVpOf(360, 75);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=75): actual=${actual}`);
      expect(actual).assertClose(4.8, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0101
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0101
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=80) returns 4.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0101 begin`);
      const actual: number = keyboardHeightVpOf(360, 80);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=80): actual=${actual}`);
      expect(actual).assertClose(4.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0102
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0102
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=85) returns 4.235294117647059
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0102 begin`);
      const actual: number = keyboardHeightVpOf(360, 85);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=85): actual=${actual}`);
      expect(actual).assertClose(4.235294117647059, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0103
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0103
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=95) returns 3.789473684210526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0103 begin`);
      const actual: number = keyboardHeightVpOf(360, 95);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=95): actual=${actual}`);
      expect(actual).assertClose(3.789473684210526, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0104
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0104
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=105) returns 3.4285714285714284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0104 begin`);
      const actual: number = keyboardHeightVpOf(360, 105);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=...: actual=${actual}`);
      expect(actual).assertClose(3.4285714285714284, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0105
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0105
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=110) returns 3.272727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0105 begin`);
      const actual: number = keyboardHeightVpOf(360, 110);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=...: actual=${actual}`);
      expect(actual).assertClose(3.272727272727273, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0106
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0106
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=115) returns 3.130434782608696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0106 begin`);
      const actual: number = keyboardHeightVpOf(360, 115);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=...: actual=${actual}`);
      expect(actual).assertClose(3.130434782608696, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0107
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0107
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=22.44) returns 16.0427807486631
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0107 begin`);
      const actual: number = keyboardHeightVpOf(360, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=...: actual=${actual}`);
      expect(actual).assertClose(16.0427807486631, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0108
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0108
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=1) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0108 begin`);
      const actual: number = keyboardHeightVpOf(720, 1);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=1): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0109
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0109
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=3) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0109 begin`);
      const actual: number = keyboardHeightVpOf(720, 3);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=3): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0110
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0110
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=5) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0110 begin`);
      const actual: number = keyboardHeightVpOf(720, 5);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=5): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0111
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0111
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=15) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0111 begin`);
      const actual: number = keyboardHeightVpOf(720, 15);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=15): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0112
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0112
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=25) returns 28.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0112 begin`);
      const actual: number = keyboardHeightVpOf(720, 25);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=25): actual=${actual}`);
      expect(actual).assertClose(28.8, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0113
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0113
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=35) returns 20.571428571428573
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0113 begin`);
      const actual: number = keyboardHeightVpOf(720, 35);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=35): actual=${actual}`);
      expect(actual).assertClose(20.571428571428573, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0114
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0114
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=45) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0114 begin`);
      const actual: number = keyboardHeightVpOf(720, 45);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=45): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0115
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0115
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=55) returns 13.090909090909092
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0115 begin`);
      const actual: number = keyboardHeightVpOf(720, 55);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=55): actual=${actual}`);
      expect(actual).assertClose(13.090909090909092, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0116
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0116
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=65) returns 11.076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0116 begin`);
      const actual: number = keyboardHeightVpOf(720, 65);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=65): actual=${actual}`);
      expect(actual).assertClose(11.076923076923077, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0117
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0117
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=75) returns 9.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0117 begin`);
      const actual: number = keyboardHeightVpOf(720, 75);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=75): actual=${actual}`);
      expect(actual).assertClose(9.6, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0118
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0118
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=85) returns 8.470588235294118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0118 begin`);
      const actual: number = keyboardHeightVpOf(720, 85);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=85): actual=${actual}`);
      expect(actual).assertClose(8.470588235294118, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0119
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0119
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=95) returns 7.578947368421052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0119 begin`);
      const actual: number = keyboardHeightVpOf(720, 95);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=95): actual=${actual}`);
      expect(actual).assertClose(7.578947368421052, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0120
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0120
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=105) returns 6.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0120 begin`);
      const actual: number = keyboardHeightVpOf(720, 105);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=...: actual=${actual}`);
      expect(actual).assertClose(6.857142857142857, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0121
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0121
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=115) returns 6.260869565217392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0121 begin`);
      const actual: number = keyboardHeightVpOf(720, 115);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=...: actual=${actual}`);
      expect(actual).assertClose(6.260869565217392, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0122
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0122
     * @tc.desc      keyboardHeightVpOf(heightPx=720, density=22.44) returns 32.0855614973262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0122 begin`);
      const actual: number = keyboardHeightVpOf(720, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=720, density=...: actual=${actual}`);
      expect(actual).assertClose(32.0855614973262, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0123
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0123
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=1) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0123 begin`);
      const actual: number = keyboardHeightVpOf(1080, 1);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density=1): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0124
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0124
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=2) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0124 begin`);
      const actual: number = keyboardHeightVpOf(1080, 2);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density=2): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0125
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0125
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=10) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0125 begin`);
      const actual: number = keyboardHeightVpOf(1080, 10);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0126
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0126
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=100) returns 10.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0126 begin`);
      const actual: number = keyboardHeightVpOf(1080, 100);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(10.8, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0127
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0127
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=5) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0127 begin`);
      const actual: number = keyboardHeightVpOf(1080, 5);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density=5): actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0128
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0128
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=20) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0128 begin`);
      const actual: number = keyboardHeightVpOf(1080, 20);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0129
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0129
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=25) returns 43.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0129 begin`);
      const actual: number = keyboardHeightVpOf(1080, 25);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(43.2, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0130
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0130
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=35) returns 30.857142857142858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0130 begin`);
      const actual: number = keyboardHeightVpOf(1080, 35);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(30.857142857142858, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0131
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0131
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=40) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0131 begin`);
      const actual: number = keyboardHeightVpOf(1080, 40);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0132
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0132
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=50) returns 21.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0132 begin`);
      const actual: number = keyboardHeightVpOf(1080, 50);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(21.6, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0133
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0133
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=55) returns 19.636363636363637
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0133 begin`);
      const actual: number = keyboardHeightVpOf(1080, 55);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(19.636363636363637, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0134
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0134
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=65) returns 16.615384615384617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0134 begin`);
      const actual: number = keyboardHeightVpOf(1080, 65);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(16.615384615384617, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0135
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0135
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=70) returns 15.428571428571429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0135 begin`);
      const actual: number = keyboardHeightVpOf(1080, 70);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(15.428571428571429, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0136
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0136
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=80) returns 13.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0136 begin`);
      const actual: number = keyboardHeightVpOf(1080, 80);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(13.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0137
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0137
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=85) returns 12.705882352941176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0137 begin`);
      const actual: number = keyboardHeightVpOf(1080, 85);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(12.705882352941176, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0138
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0138
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=95) returns 11.368421052631579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0138 begin`);
      const actual: number = keyboardHeightVpOf(1080, 95);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(11.368421052631579, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0139
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0139
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=110) returns 9.818181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0139 begin`);
      const actual: number = keyboardHeightVpOf(1080, 110);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(9.818181818181818, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0140
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0140
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=115) returns 9.391304347826088
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0140 begin`);
      const actual: number = keyboardHeightVpOf(1080, 115);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(9.391304347826088, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0141
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0141
     * @tc.desc      keyboardHeightVpOf(heightPx=1080, density=22.44) returns 48.1283422459893
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0141 begin`);
      const actual: number = keyboardHeightVpOf(1080, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=1080, density...: actual=${actual}`);
      expect(actual).assertClose(48.1283422459893, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0142
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0142
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=1) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0142 begin`);
      const actual: number = keyboardHeightVpOf(1920, 1);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density=1): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0143
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0143
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=2) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0143 begin`);
      const actual: number = keyboardHeightVpOf(1920, 2);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density=2): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0144
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0144
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=3) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0144 begin`);
      const actual: number = keyboardHeightVpOf(1920, 3);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density=3): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0145
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0145
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=10) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0145 begin`);
      const actual: number = keyboardHeightVpOf(1920, 10);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0146
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0146
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=100) returns 19.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0146 begin`);
      const actual: number = keyboardHeightVpOf(1920, 100);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(19.2, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0147
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0147
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=5) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0147 begin`);
      const actual: number = keyboardHeightVpOf(1920, 5);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density=5): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0148
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0148
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=15) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0148 begin`);
      const actual: number = keyboardHeightVpOf(1920, 15);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0149
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0149
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=20) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0149 begin`);
      const actual: number = keyboardHeightVpOf(1920, 20);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0149 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0150
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0150
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=25) returns 76.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0150 begin`);
      const actual: number = keyboardHeightVpOf(1920, 25);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(76.8, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0151
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0151
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=30) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0151 begin`);
      const actual: number = keyboardHeightVpOf(1920, 30);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0152
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0152
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=35) returns 54.857142857142854
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0152 begin`);
      const actual: number = keyboardHeightVpOf(1920, 35);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(54.857142857142854, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0153
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0153
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=45) returns 42.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0153 begin`);
      const actual: number = keyboardHeightVpOf(1920, 45);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(42.666666666666664, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0154
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0154
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=50) returns 38.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0154 begin`);
      const actual: number = keyboardHeightVpOf(1920, 50);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(38.4, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0155
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0155
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=55) returns 34.90909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0155 begin`);
      const actual: number = keyboardHeightVpOf(1920, 55);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(34.90909090909091, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0156
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0156
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=60) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0156 begin`);
      const actual: number = keyboardHeightVpOf(1920, 60);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0157
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0157
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=65) returns 29.53846153846154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0157 begin`);
      const actual: number = keyboardHeightVpOf(1920, 65);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(29.53846153846154, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0158
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0158
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=70) returns 27.428571428571427
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0158 begin`);
      const actual: number = keyboardHeightVpOf(1920, 70);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(27.428571428571427, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0159
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0159
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=75) returns 25.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0159 begin`);
      const actual: number = keyboardHeightVpOf(1920, 75);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(25.6, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0160
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0160
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=85) returns 22.58823529411765
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0160 begin`);
      const actual: number = keyboardHeightVpOf(1920, 85);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(22.58823529411765, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0160 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0161
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0161
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=90) returns 21.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0161 begin`);
      const actual: number = keyboardHeightVpOf(1920, 90);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(21.333333333333332, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0162
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0162
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=95) returns 20.210526315789473
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0162 begin`);
      const actual: number = keyboardHeightVpOf(1920, 95);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(20.210526315789473, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0163
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0163
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=105) returns 18.285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0163 begin`);
      const actual: number = keyboardHeightVpOf(1920, 105);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(18.285714285714285, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0164
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0164
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=110) returns 17.454545454545453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0164 begin`);
      const actual: number = keyboardHeightVpOf(1920, 110);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(17.454545454545453, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0165
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0165
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=115) returns 16.695652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0165 begin`);
      const actual: number = keyboardHeightVpOf(1920, 115);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(16.695652173913043, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0166
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0166
     * @tc.desc      keyboardHeightVpOf(heightPx=1920, density=22.44) returns 85.56149732620321
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0166 begin`);
      const actual: number = keyboardHeightVpOf(1920, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=1920, density...: actual=${actual}`);
      expect(actual).assertClose(85.56149732620321, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0167
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0167
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=3) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0167 begin`);
      const actual: number = keyboardHeightVpOf(2, 3);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=3): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0168
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0168
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=5) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0168 begin`);
      const actual: number = keyboardHeightVpOf(2, 5);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=5): actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0169
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0169
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=15) returns 0.13333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0169 begin`);
      const actual: number = keyboardHeightVpOf(2, 15);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=15): actual=${actual}`);
      expect(actual).assertClose(0.13333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0170
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0170
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=25) returns 0.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0170 begin`);
      const actual: number = keyboardHeightVpOf(2, 25);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=25): actual=${actual}`);
      expect(actual).assertClose(0.08, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0171
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0171
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=35) returns 0.05714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0171 begin`);
      const actual: number = keyboardHeightVpOf(2, 35);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=35): actual=${actual}`);
      expect(actual).assertClose(0.05714285714285714, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0172
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0172
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=45) returns 0.044444444444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0172 begin`);
      const actual: number = keyboardHeightVpOf(2, 45);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=45): actual=${actual}`);
      expect(actual).assertClose(0.044444444444444446, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0173
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0173
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=55) returns 0.03636363636363636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0173 begin`);
      const actual: number = keyboardHeightVpOf(2, 55);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=55): actual=${actual}`);
      expect(actual).assertClose(0.03636363636363636, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0174
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0174
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=65) returns 0.03076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0174 begin`);
      const actual: number = keyboardHeightVpOf(2, 65);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=65): actual=${actual}`);
      expect(actual).assertClose(0.03076923076923077, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0175
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0175
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=75) returns 0.02666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0175 begin`);
      const actual: number = keyboardHeightVpOf(2, 75);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=75): actual=${actual}`);
      expect(actual).assertClose(0.02666666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0176
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0176
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=85) returns 0.023529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0176 begin`);
      const actual: number = keyboardHeightVpOf(2, 85);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=85): actual=${actual}`);
      expect(actual).assertClose(0.023529411764705882, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0177
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0177
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=95) returns 0.021052631578947368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0177 begin`);
      const actual: number = keyboardHeightVpOf(2, 95);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=95): actual=${actual}`);
      expect(actual).assertClose(0.021052631578947368, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0178
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0178
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=105) returns 0.01904761904761905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0178 begin`);
      const actual: number = keyboardHeightVpOf(2, 105);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=105): actual=${actual}`);
      expect(actual).assertClose(0.01904761904761905, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0179
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0179
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=115) returns 0.017391304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0179 begin`);
      const actual: number = keyboardHeightVpOf(2, 115);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=115): actual=${actual}`);
      expect(actual).assertClose(0.017391304347826087, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0180
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0180
     * @tc.desc      keyboardHeightVpOf(heightPx=2, density=22.44) returns 0.08912655971479501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0180 begin`);
      const actual: number = keyboardHeightVpOf(2, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=2, density=22...: actual=${actual}`);
      expect(actual).assertClose(0.08912655971479501, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0181
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0181
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0181 begin`);
      const actual: number = keyboardHeightVpOf(3, 1);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0182
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0182
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=2) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0182 begin`);
      const actual: number = keyboardHeightVpOf(3, 2);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=2): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0183
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0183
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=10) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0183 begin`);
      const actual: number = keyboardHeightVpOf(3, 10);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=10): actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0184
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0184
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0184 begin`);
      const actual: number = keyboardHeightVpOf(3, 100);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=100): actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0185
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0185
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=5) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0185 begin`);
      const actual: number = keyboardHeightVpOf(3, 5);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=5): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0186
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0186
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=20) returns 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0186 begin`);
      const actual: number = keyboardHeightVpOf(3, 20);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=20): actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0187
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0187
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=25) returns 0.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0187 begin`);
      const actual: number = keyboardHeightVpOf(3, 25);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=25): actual=${actual}`);
      expect(actual).assertClose(0.12, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0188
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0188
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=35) returns 0.08571428571428572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0188 begin`);
      const actual: number = keyboardHeightVpOf(3, 35);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=35): actual=${actual}`);
      expect(actual).assertClose(0.08571428571428572, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0189
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0189
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=40) returns 0.075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0189 begin`);
      const actual: number = keyboardHeightVpOf(3, 40);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=40): actual=${actual}`);
      expect(actual).assertClose(0.075, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0190
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0190
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=50) returns 0.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0190 begin`);
      const actual: number = keyboardHeightVpOf(3, 50);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=50): actual=${actual}`);
      expect(actual).assertClose(0.06, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0191
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0191
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=55) returns 0.05454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0191 begin`);
      const actual: number = keyboardHeightVpOf(3, 55);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=55): actual=${actual}`);
      expect(actual).assertClose(0.05454545454545454, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0192
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0192
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=65) returns 0.046153846153846156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0192 begin`);
      const actual: number = keyboardHeightVpOf(3, 65);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=65): actual=${actual}`);
      expect(actual).assertClose(0.046153846153846156, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0192 end`);
    });
  });
}
