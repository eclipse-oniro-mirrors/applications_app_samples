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

/** Logic checks for keyboardHeightVpOf (20 cases). */
export default function keyboardHeightVpOf3Test(): void {
  describe('KeyboardHeightVpOf3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0193
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0193
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=70) returns 0.04285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0193 begin`);
      const actual: number = keyboardHeightVpOf(3, 70);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=70): actual=${actual}`);
      expect(actual).assertClose(0.04285714285714286, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0194
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0194
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=80) returns 0.0375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0194 begin`);
      const actual: number = keyboardHeightVpOf(3, 80);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=80): actual=${actual}`);
      expect(actual).assertClose(0.0375, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0195
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0195
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=85) returns 0.03529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0195 begin`);
      const actual: number = keyboardHeightVpOf(3, 85);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=85): actual=${actual}`);
      expect(actual).assertClose(0.03529411764705882, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0196
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0196
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=95) returns 0.031578947368421054
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0196 begin`);
      const actual: number = keyboardHeightVpOf(3, 95);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=95): actual=${actual}`);
      expect(actual).assertClose(0.031578947368421054, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0197
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0197
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=110) returns 0.02727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0197 begin`);
      const actual: number = keyboardHeightVpOf(3, 110);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=110): actual=${actual}`);
      expect(actual).assertClose(0.02727272727272727, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0198
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0198
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=115) returns 0.02608695652173913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0198 begin`);
      const actual: number = keyboardHeightVpOf(3, 115);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=115): actual=${actual}`);
      expect(actual).assertClose(0.02608695652173913, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0199
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0199
     * @tc.desc      keyboardHeightVpOf(heightPx=3, density=22.44) returns 0.1336898395721925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0199 begin`);
      const actual: number = keyboardHeightVpOf(3, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=3, density=22...: actual=${actual}`);
      expect(actual).assertClose(0.1336898395721925, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0200
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0200
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=35) returns 0.2857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0200 begin`);
      const actual: number = keyboardHeightVpOf(10, 35);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=35): actual=${actual}`);
      expect(actual).assertClose(0.2857142857142857, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0201
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0201
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=40) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0201 begin`);
      const actual: number = keyboardHeightVpOf(10, 40);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=40): actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0202
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0202
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=45) returns 0.2222222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0202 begin`);
      const actual: number = keyboardHeightVpOf(10, 45);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=45): actual=${actual}`);
      expect(actual).assertClose(0.2222222222222222, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0203
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0203
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=55) returns 0.18181818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0203 begin`);
      const actual: number = keyboardHeightVpOf(10, 55);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=55): actual=${actual}`);
      expect(actual).assertClose(0.18181818181818182, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0204
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0204
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=60) returns 0.16666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0204 begin`);
      const actual: number = keyboardHeightVpOf(10, 60);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=60): actual=${actual}`);
      expect(actual).assertClose(0.16666666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0205
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0205
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=65) returns 0.15384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0205 begin`);
      const actual: number = keyboardHeightVpOf(10, 65);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=65): actual=${actual}`);
      expect(actual).assertClose(0.15384615384615385, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0206
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0206
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=70) returns 0.14285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0206 begin`);
      const actual: number = keyboardHeightVpOf(10, 70);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=70): actual=${actual}`);
      expect(actual).assertClose(0.14285714285714285, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0207
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0207
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=80) returns 0.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0207 begin`);
      const actual: number = keyboardHeightVpOf(10, 80);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=80): actual=${actual}`);
      expect(actual).assertClose(0.125, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0208
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0208
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=85) returns 0.11764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0208 begin`);
      const actual: number = keyboardHeightVpOf(10, 85);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=85): actual=${actual}`);
      expect(actual).assertClose(0.11764705882352941, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0209
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0209
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=90) returns 0.1111111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0209 begin`);
      const actual: number = keyboardHeightVpOf(10, 90);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=90): actual=${actual}`);
      expect(actual).assertClose(0.1111111111111111, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0210
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0210
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=95) returns 0.10526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0210 begin`);
      const actual: number = keyboardHeightVpOf(10, 95);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=95): actual=${actual}`);
      expect(actual).assertClose(0.10526315789473684, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0211
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0211
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=105) returns 0.09523809523809523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0211 begin`);
      const actual: number = keyboardHeightVpOf(10, 105);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=105): actual=${actual}`);
      expect(actual).assertClose(0.09523809523809523, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0211 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0212
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0212
     * @tc.desc      keyboardHeightVpOf(heightPx=10, density=110) returns 0.09090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0212 begin`);
      const actual: number = keyboardHeightVpOf(10, 110);
      logInfo(`keyboardHeightVpOf(heightPx=10, density=110): actual=${actual}`);
      expect(actual).assertClose(0.09090909090909091, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0212 end`);
    });
  });
}
