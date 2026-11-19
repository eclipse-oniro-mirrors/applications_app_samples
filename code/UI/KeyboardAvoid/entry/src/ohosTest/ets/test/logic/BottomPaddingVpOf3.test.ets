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

/** Logic checks for bottomPaddingVpOf (20 cases). */
export default function bottomPaddingVpOf3Test(): void {
  describe('BottomPaddingVpOf3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0193
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0193
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=40) returns 0.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0193 begin`);
      const actual: number = bottomPaddingVpOf(15, 40);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.375, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0194
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0194
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=55) returns 0.2727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0194 begin`);
      const actual: number = bottomPaddingVpOf(15, 55);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.2727272727272727, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0195
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0195
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=65) returns 0.23076923076923078
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0195 begin`);
      const actual: number = bottomPaddingVpOf(15, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.23076923076923078, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0196
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0196
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=70) returns 0.21428571428571427
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0196 begin`);
      const actual: number = bottomPaddingVpOf(15, 70);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.21428571428571427, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0197
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0197
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=80) returns 0.1875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0197 begin`);
      const actual: number = bottomPaddingVpOf(15, 80);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.1875, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0198
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0198
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=85) returns 0.17647058823529413
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0198 begin`);
      const actual: number = bottomPaddingVpOf(15, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.17647058823529413, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0199
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0199
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=95) returns 0.15789473684210525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0199 begin`);
      const actual: number = bottomPaddingVpOf(15, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.15789473684210525, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0200
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0200
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=110) returns 0.13636363636363635
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0200 begin`);
      const actual: number = bottomPaddingVpOf(15, 110);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.13636363636363635, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0201
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0201
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=115) returns 0.13043478260869565
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0201 begin`);
      const actual: number = bottomPaddingVpOf(15, 115);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.13043478260869565, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0202
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0202
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=78) returns 0.19230769230769232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0202 begin`);
      const actual: number = bottomPaddingVpOf(15, 78);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.19230769230769232, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0203
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0203
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=15, density=174) returns 0.08620689655172414
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0203 begin`);
      const actual: number = bottomPaddingVpOf(15, 174);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=15, d...: actual=${actual}`);
      expect(actual).assertClose(0.08620689655172414, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0204
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0204
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=25) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0204 begin`);
      const actual: number = bottomPaddingVpOf(20, 25);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0205
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0205
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=35) returns 0.5714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0205 begin`);
      const actual: number = bottomPaddingVpOf(20, 35);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.5714285714285714, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0206
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0206
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=45) returns 0.4444444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0206 begin`);
      const actual: number = bottomPaddingVpOf(20, 45);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.4444444444444444, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0207
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0207
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=55) returns 0.36363636363636365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0207 begin`);
      const actual: number = bottomPaddingVpOf(20, 55);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.36363636363636365, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0208
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0208
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=65) returns 0.3076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0208 begin`);
      const actual: number = bottomPaddingVpOf(20, 65);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.3076923076923077, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0209
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0209
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=75) returns 0.26666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0209 begin`);
      const actual: number = bottomPaddingVpOf(20, 75);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.26666666666666666, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0210
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0210
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=85) returns 0.23529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0210 begin`);
      const actual: number = bottomPaddingVpOf(20, 85);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.23529411764705882, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0211
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0211
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=95) returns 0.21052631578947367
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0211 begin`);
      const actual: number = bottomPaddingVpOf(20, 95);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.21052631578947367, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0211 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BOTTOM_PADDING_VP_OF_0212
     * @tc.name      KeyboardAvoid_BottomPaddingVpOf_0212
     * @tc.desc      bottomPaddingVpOf(avoidAreaBottomPx=20, density=105) returns 0.19047619047619047
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_BottomPaddingVpOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}BottomPaddingVpOf_0212 begin`);
      const actual: number = bottomPaddingVpOf(20, 105);
      logInfo(`bottomPaddingVpOf(avoidAreaBottomPx=20, d...: actual=${actual}`);
      expect(actual).assertClose(0.19047619047619047, PRECISION);
      logInfo(`${BUNDLE}BottomPaddingVpOf_0212 end`);
    });
  });
}
