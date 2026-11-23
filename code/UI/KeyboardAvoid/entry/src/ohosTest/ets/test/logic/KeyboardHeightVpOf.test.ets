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
export default function keyboardHeightVpOfTest(): void {
  describe('KeyboardHeightVpOfTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0001
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0001
     * @tc.desc      keyboardHeightVpOf(heightPx=0, density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0001 begin`);
      const actual: number = keyboardHeightVpOf(0, 0);
      logInfo(`keyboardHeightVpOf(heightPx=0, density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0002
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0002
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0002 begin`);
      const actual: number = keyboardHeightVpOf(1, 1);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0003
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0003
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0003 begin`);
      const actual: number = keyboardHeightVpOf(1, 2);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=2): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0004
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0004
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=3) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0004 begin`);
      const actual: number = keyboardHeightVpOf(1, 3);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=3): actual=${actual}`);
      expect(actual).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0005
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0005
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=10) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0005 begin`);
      const actual: number = keyboardHeightVpOf(1, 10);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=10): actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0006
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0006
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=100) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0006 begin`);
      const actual: number = keyboardHeightVpOf(1, 100);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=100): actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0007
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0007
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=5) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0007 begin`);
      const actual: number = keyboardHeightVpOf(1, 5);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=5): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0008
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0008
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=15) returns 0.06666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0008 begin`);
      const actual: number = keyboardHeightVpOf(1, 15);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=15): actual=${actual}`);
      expect(actual).assertClose(0.06666666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0009
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0009
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=20) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0009 begin`);
      const actual: number = keyboardHeightVpOf(1, 20);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=20): actual=${actual}`);
      expect(actual).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0010
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0010
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=25) returns 0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0010 begin`);
      const actual: number = keyboardHeightVpOf(1, 25);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=25): actual=${actual}`);
      expect(actual).assertClose(0.04, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0011
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0011
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=30) returns 0.03333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0011 begin`);
      const actual: number = keyboardHeightVpOf(1, 30);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=30): actual=${actual}`);
      expect(actual).assertClose(0.03333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0012
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0012
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=35) returns 0.02857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0012 begin`);
      const actual: number = keyboardHeightVpOf(1, 35);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=35): actual=${actual}`);
      expect(actual).assertClose(0.02857142857142857, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0013
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0013
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=40) returns 0.025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0013 begin`);
      const actual: number = keyboardHeightVpOf(1, 40);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=40): actual=${actual}`);
      expect(actual).assertClose(0.025, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0014
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0014
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=45) returns 0.022222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0014 begin`);
      const actual: number = keyboardHeightVpOf(1, 45);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=45): actual=${actual}`);
      expect(actual).assertClose(0.022222222222222223, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0015
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0015
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=50) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0015 begin`);
      const actual: number = keyboardHeightVpOf(1, 50);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=50): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0016
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0016
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=55) returns 0.01818181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0016 begin`);
      const actual: number = keyboardHeightVpOf(1, 55);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=55): actual=${actual}`);
      expect(actual).assertClose(0.01818181818181818, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0017
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0017
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=60) returns 0.016666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0017 begin`);
      const actual: number = keyboardHeightVpOf(1, 60);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=60): actual=${actual}`);
      expect(actual).assertClose(0.016666666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0018
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0018
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=65) returns 0.015384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0018 begin`);
      const actual: number = keyboardHeightVpOf(1, 65);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=65): actual=${actual}`);
      expect(actual).assertClose(0.015384615384615385, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0019
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0019
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=70) returns 0.014285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0019 begin`);
      const actual: number = keyboardHeightVpOf(1, 70);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=70): actual=${actual}`);
      expect(actual).assertClose(0.014285714285714285, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0020
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0020
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=75) returns 0.013333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0020 begin`);
      const actual: number = keyboardHeightVpOf(1, 75);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=75): actual=${actual}`);
      expect(actual).assertClose(0.013333333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0021
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0021
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=80) returns 0.0125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0021 begin`);
      const actual: number = keyboardHeightVpOf(1, 80);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=80): actual=${actual}`);
      expect(actual).assertClose(0.0125, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0022
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0022
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=85) returns 0.011764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0022 begin`);
      const actual: number = keyboardHeightVpOf(1, 85);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=85): actual=${actual}`);
      expect(actual).assertClose(0.011764705882352941, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0023
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0023
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=90) returns 0.011111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0023 begin`);
      const actual: number = keyboardHeightVpOf(1, 90);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=90): actual=${actual}`);
      expect(actual).assertClose(0.011111111111111112, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0024
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0024
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=95) returns 0.010526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0024 begin`);
      const actual: number = keyboardHeightVpOf(1, 95);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=95): actual=${actual}`);
      expect(actual).assertClose(0.010526315789473684, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0025
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0025
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=105) returns 0.009523809523809525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0025 begin`);
      const actual: number = keyboardHeightVpOf(1, 105);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=105): actual=${actual}`);
      expect(actual).assertClose(0.009523809523809525, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0026
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0026
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=110) returns 0.00909090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0026 begin`);
      const actual: number = keyboardHeightVpOf(1, 110);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=110): actual=${actual}`);
      expect(actual).assertClose(0.00909090909090909, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0027
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0027
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=115) returns 0.008695652173913044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0027 begin`);
      const actual: number = keyboardHeightVpOf(1, 115);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=115): actual=${actual}`);
      expect(actual).assertClose(0.008695652173913044, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0028
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0028
     * @tc.desc      keyboardHeightVpOf(heightPx=1, density=22.44) returns 0.044563279857397504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0028 begin`);
      const actual: number = keyboardHeightVpOf(1, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=1, density=22...: actual=${actual}`);
      expect(actual).assertClose(0.044563279857397504, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0029
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0029
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0029 begin`);
      const actual: number = keyboardHeightVpOf(-1, 1);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0030
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0030
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=2) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0030 begin`);
      const actual: number = keyboardHeightVpOf(-1, 2);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=2): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0031
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0031
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=3) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0031 begin`);
      const actual: number = keyboardHeightVpOf(-1, 3);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=3): actual=${actual}`);
      expect(actual).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0032
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0032
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=10) returns -0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0032 begin`);
      const actual: number = keyboardHeightVpOf(-1, 10);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=10): actual=${actual}`);
      expect(actual).assertClose(-0.1, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0033
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0033
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=100) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0033 begin`);
      const actual: number = keyboardHeightVpOf(-1, 100);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=100): actual=${actual}`);
      expect(actual).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0034
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0034
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=5) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0034 begin`);
      const actual: number = keyboardHeightVpOf(-1, 5);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=5): actual=${actual}`);
      expect(actual).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0035
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0035
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=15) returns -0.06666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0035 begin`);
      const actual: number = keyboardHeightVpOf(-1, 15);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=15): actual=${actual}`);
      expect(actual).assertClose(-0.06666666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0036
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0036
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=20) returns -0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0036 begin`);
      const actual: number = keyboardHeightVpOf(-1, 20);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=20): actual=${actual}`);
      expect(actual).assertClose(-0.05, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0037
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0037
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=25) returns -0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0037 begin`);
      const actual: number = keyboardHeightVpOf(-1, 25);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=25): actual=${actual}`);
      expect(actual).assertClose(-0.04, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0038
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0038
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=30) returns -0.03333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0038 begin`);
      const actual: number = keyboardHeightVpOf(-1, 30);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=30): actual=${actual}`);
      expect(actual).assertClose(-0.03333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0039
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0039
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=35) returns -0.02857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0039 begin`);
      const actual: number = keyboardHeightVpOf(-1, 35);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=35): actual=${actual}`);
      expect(actual).assertClose(-0.02857142857142857, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0040
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0040
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=40) returns -0.025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0040 begin`);
      const actual: number = keyboardHeightVpOf(-1, 40);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=40): actual=${actual}`);
      expect(actual).assertClose(-0.025, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0041
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0041
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=45) returns -0.022222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0041 begin`);
      const actual: number = keyboardHeightVpOf(-1, 45);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=45): actual=${actual}`);
      expect(actual).assertClose(-0.022222222222222223, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0042
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0042
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=50) returns -0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0042 begin`);
      const actual: number = keyboardHeightVpOf(-1, 50);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=50): actual=${actual}`);
      expect(actual).assertClose(-0.02, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0043
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0043
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=55) returns -0.01818181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0043 begin`);
      const actual: number = keyboardHeightVpOf(-1, 55);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=55): actual=${actual}`);
      expect(actual).assertClose(-0.01818181818181818, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0044
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0044
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=60) returns -0.016666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0044 begin`);
      const actual: number = keyboardHeightVpOf(-1, 60);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=60): actual=${actual}`);
      expect(actual).assertClose(-0.016666666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0045
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0045
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=65) returns -0.015384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0045 begin`);
      const actual: number = keyboardHeightVpOf(-1, 65);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=65): actual=${actual}`);
      expect(actual).assertClose(-0.015384615384615385, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0046
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0046
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=70) returns -0.014285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0046 begin`);
      const actual: number = keyboardHeightVpOf(-1, 70);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=70): actual=${actual}`);
      expect(actual).assertClose(-0.014285714285714285, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0047
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0047
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=75) returns -0.013333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0047 begin`);
      const actual: number = keyboardHeightVpOf(-1, 75);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=75): actual=${actual}`);
      expect(actual).assertClose(-0.013333333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0048
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0048
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=80) returns -0.0125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0048 begin`);
      const actual: number = keyboardHeightVpOf(-1, 80);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=80): actual=${actual}`);
      expect(actual).assertClose(-0.0125, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0049
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0049
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=85) returns -0.011764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0049 begin`);
      const actual: number = keyboardHeightVpOf(-1, 85);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=85): actual=${actual}`);
      expect(actual).assertClose(-0.011764705882352941, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0050
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0050
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=90) returns -0.011111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0050 begin`);
      const actual: number = keyboardHeightVpOf(-1, 90);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=90): actual=${actual}`);
      expect(actual).assertClose(-0.011111111111111112, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0051
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0051
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=95) returns -0.010526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0051 begin`);
      const actual: number = keyboardHeightVpOf(-1, 95);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=95): actual=${actual}`);
      expect(actual).assertClose(-0.010526315789473684, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0052
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0052
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=105) returns -0.009523809523809525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0052 begin`);
      const actual: number = keyboardHeightVpOf(-1, 105);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=105): actual=${actual}`);
      expect(actual).assertClose(-0.009523809523809525, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0053
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0053
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=110) returns -0.00909090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0053 begin`);
      const actual: number = keyboardHeightVpOf(-1, 110);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=110): actual=${actual}`);
      expect(actual).assertClose(-0.00909090909090909, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0054
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0054
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=115) returns -0.008695652173913044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0054 begin`);
      const actual: number = keyboardHeightVpOf(-1, 115);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=115): actual=${actual}`);
      expect(actual).assertClose(-0.008695652173913044, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0055
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0055
     * @tc.desc      keyboardHeightVpOf(heightPx=-1, density=22.44) returns -0.044563279857397504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0055 begin`);
      const actual: number = keyboardHeightVpOf(-1, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=-1, density=2...: actual=${actual}`);
      expect(actual).assertClose(-0.044563279857397504, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0056
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0056
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0056 begin`);
      const actual: number = keyboardHeightVpOf(100, 1);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0057
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0057
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=2) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0057 begin`);
      const actual: number = keyboardHeightVpOf(100, 2);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=2): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0058
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0058
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=3) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0058 begin`);
      const actual: number = keyboardHeightVpOf(100, 3);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=3): actual=${actual}`);
      expect(actual).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0059
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0059
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0059 begin`);
      const actual: number = keyboardHeightVpOf(100, 10);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0060
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0060
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0060 begin`);
      const actual: number = keyboardHeightVpOf(100, 5);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=5): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0061
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0061
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=15) returns 6.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0061 begin`);
      const actual: number = keyboardHeightVpOf(100, 15);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=15): actual=${actual}`);
      expect(actual).assertClose(6.666666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0062
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0062
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=20) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0062 begin`);
      const actual: number = keyboardHeightVpOf(100, 20);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=20): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0063
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0063
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=25) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0063 begin`);
      const actual: number = keyboardHeightVpOf(100, 25);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=25): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0064
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0064
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=30) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0064 begin`);
      const actual: number = keyboardHeightVpOf(100, 30);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=30): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0065
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0065
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=35) returns 2.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0065 begin`);
      const actual: number = keyboardHeightVpOf(100, 35);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=35): actual=${actual}`);
      expect(actual).assertClose(2.857142857142857, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0066
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0066
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=40) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0066 begin`);
      const actual: number = keyboardHeightVpOf(100, 40);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=40): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0067
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0067
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=45) returns 2.2222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0067 begin`);
      const actual: number = keyboardHeightVpOf(100, 45);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=45): actual=${actual}`);
      expect(actual).assertClose(2.2222222222222223, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0068
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0068
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=50) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0068 begin`);
      const actual: number = keyboardHeightVpOf(100, 50);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=50): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0069
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0069
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=55) returns 1.8181818181818181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0069 begin`);
      const actual: number = keyboardHeightVpOf(100, 55);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=55): actual=${actual}`);
      expect(actual).assertClose(1.8181818181818181, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0070
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0070
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=60) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0070 begin`);
      const actual: number = keyboardHeightVpOf(100, 60);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=60): actual=${actual}`);
      expect(actual).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0071
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0071
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=65) returns 1.5384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0071 begin`);
      const actual: number = keyboardHeightVpOf(100, 65);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=65): actual=${actual}`);
      expect(actual).assertClose(1.5384615384615385, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0072
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0072
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=70) returns 1.4285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0072 begin`);
      const actual: number = keyboardHeightVpOf(100, 70);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=70): actual=${actual}`);
      expect(actual).assertClose(1.4285714285714286, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0073
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0073
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=75) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0073 begin`);
      const actual: number = keyboardHeightVpOf(100, 75);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=75): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0074
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0074
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=80) returns 1.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0074 begin`);
      const actual: number = keyboardHeightVpOf(100, 80);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=80): actual=${actual}`);
      expect(actual).assertClose(1.25, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0075
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0075
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=85) returns 1.1764705882352942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0075 begin`);
      const actual: number = keyboardHeightVpOf(100, 85);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=85): actual=${actual}`);
      expect(actual).assertClose(1.1764705882352942, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0076
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0076
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=90) returns 1.1111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0076 begin`);
      const actual: number = keyboardHeightVpOf(100, 90);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=90): actual=${actual}`);
      expect(actual).assertClose(1.1111111111111112, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0077
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0077
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=95) returns 1.0526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0077 begin`);
      const actual: number = keyboardHeightVpOf(100, 95);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=95): actual=${actual}`);
      expect(actual).assertClose(1.0526315789473684, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0078
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0078
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=105) returns 0.9523809523809523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0078 begin`);
      const actual: number = keyboardHeightVpOf(100, 105);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=...: actual=${actual}`);
      expect(actual).assertClose(0.9523809523809523, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0079
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0079
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=110) returns 0.9090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0079 begin`);
      const actual: number = keyboardHeightVpOf(100, 110);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=...: actual=${actual}`);
      expect(actual).assertClose(0.9090909090909091, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0080
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0080
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=115) returns 0.8695652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0080 begin`);
      const actual: number = keyboardHeightVpOf(100, 115);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=...: actual=${actual}`);
      expect(actual).assertClose(0.8695652173913043, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0081
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0081
     * @tc.desc      keyboardHeightVpOf(heightPx=100, density=22.44) returns 4.45632798573975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0081 begin`);
      const actual: number = keyboardHeightVpOf(100, 22.44);
      logInfo(`keyboardHeightVpOf(heightPx=100, density=...: actual=${actual}`);
      expect(actual).assertClose(4.45632798573975, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0082
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0082
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0082 begin`);
      const actual: number = keyboardHeightVpOf(360, 1);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=1): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0083
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0083
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=2) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0083 begin`);
      const actual: number = keyboardHeightVpOf(360, 2);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=2): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0084
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0084
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=3) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0084 begin`);
      const actual: number = keyboardHeightVpOf(360, 3);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=3): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0085
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0085
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=10) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0085 begin`);
      const actual: number = keyboardHeightVpOf(360, 10);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=10): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0086
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0086
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=100) returns 3.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0086 begin`);
      const actual: number = keyboardHeightVpOf(360, 100);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=...: actual=${actual}`);
      expect(actual).assertClose(3.6, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0087
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0087
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=5) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0087 begin`);
      const actual: number = keyboardHeightVpOf(360, 5);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=5): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0088
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0088
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=15) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0088 begin`);
      const actual: number = keyboardHeightVpOf(360, 15);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=15): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0089
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0089
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=20) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0089 begin`);
      const actual: number = keyboardHeightVpOf(360, 20);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=20): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0090
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0090
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=25) returns 14.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0090 begin`);
      const actual: number = keyboardHeightVpOf(360, 25);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=25): actual=${actual}`);
      expect(actual).assertClose(14.4, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0091
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0091
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=30) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0091 begin`);
      const actual: number = keyboardHeightVpOf(360, 30);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=30): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0092
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0092
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=35) returns 10.285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0092 begin`);
      const actual: number = keyboardHeightVpOf(360, 35);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=35): actual=${actual}`);
      expect(actual).assertClose(10.285714285714286, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0093
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0093
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=40) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0093 begin`);
      const actual: number = keyboardHeightVpOf(360, 40);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=40): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0094
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0094
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=45) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0094 begin`);
      const actual: number = keyboardHeightVpOf(360, 45);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=45): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0095
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0095
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=50) returns 7.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0095 begin`);
      const actual: number = keyboardHeightVpOf(360, 50);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=50): actual=${actual}`);
      expect(actual).assertClose(7.2, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_HEIGHT_VP_OF_0096
     * @tc.name      KeyboardAvoid_KeyboardHeightVpOf_0096
     * @tc.desc      keyboardHeightVpOf(heightPx=360, density=55) returns 6.545454545454546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardHeightVpOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0096 begin`);
      const actual: number = keyboardHeightVpOf(360, 55);
      logInfo(`keyboardHeightVpOf(heightPx=360, density=55): actual=${actual}`);
      expect(actual).assertClose(6.545454545454546, PRECISION);
      logInfo(`${BUNDLE}KeyboardHeightVpOf_0096 end`);
    });
  });
}
