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
import { KeyboardAvoidState } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for KeyboardAvoidState.setAvoidAreaBottom (77 cases). */
export default function keyboardAvoidStateSetAvoidAreaBottomTest(): void {
  describe('KeyboardAvoidStateSetAvoidAreaBottomTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0001
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0001
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=56) yields 18.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0001 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(56);
      logInfo(`setAvoidAreaBottom(px=56): actual=${actual}`);
      expect(actual).assertClose(18.666666666666668, PRECISION);
      logInfo(`setAvoidAreaBottom(px=56) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(56);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0001 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0002
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0002
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=55) yields 18.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0002 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(55);
      logInfo(`setAvoidAreaBottom(px=55): actual=${actual}`);
      expect(actual).assertClose(18.333333333333332, PRECISION);
      logInfo(`setAvoidAreaBottom(px=55) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(55);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0002 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0003
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0003
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=57) yields 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0003 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(57);
      logInfo(`setAvoidAreaBottom(px=57): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`setAvoidAreaBottom(px=57) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(57);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0003 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0004
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0004
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=112) yields 37.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0004 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(112);
      logInfo(`setAvoidAreaBottom(px=112): actual=${actual}`);
      expect(actual).assertClose(37.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=112) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(112);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0004 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0005
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0005
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=28) yields 9.333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0005 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(28);
      logInfo(`setAvoidAreaBottom(px=28): actual=${actual}`);
      expect(actual).assertClose(9.333333333333334, PRECISION);
      logInfo(`setAvoidAreaBottom(px=28) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(28);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0005 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0006
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0006
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0006 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(0);
      logInfo(`setAvoidAreaBottom(px=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0006 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0007
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0007
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=1) yields 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0007 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(1);
      logInfo(`setAvoidAreaBottom(px=1): actual=${actual}`);
      expect(actual).assertClose(0.3333333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=1) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0007 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0008
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0008
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-1) yields -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0008 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-1);
      logInfo(`setAvoidAreaBottom(px=-1): actual=${actual}`);
      expect(actual).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-1) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-1);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0008 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0009
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0009
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=2) yields 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0009 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(2);
      logInfo(`setAvoidAreaBottom(px=2): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`setAvoidAreaBottom(px=2) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0009 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0010
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0010
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0010 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(3);
      logInfo(`setAvoidAreaBottom(px=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`setAvoidAreaBottom(px=3) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0010 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0011
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0011
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=10) yields 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0011 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(10);
      logInfo(`setAvoidAreaBottom(px=10): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`setAvoidAreaBottom(px=10) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(10);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0011 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0012
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0012
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=100) yields 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0012 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(100);
      logInfo(`setAvoidAreaBottom(px=100): actual=${actual}`);
      expect(actual).assertClose(33.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=100) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(100);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0012 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0013
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0013
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=6) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0013 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(6);
      logInfo(`setAvoidAreaBottom(px=6): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`setAvoidAreaBottom(px=6) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(6);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0013 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0014
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0014
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=12) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0014 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(12);
      logInfo(`setAvoidAreaBottom(px=12): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`setAvoidAreaBottom(px=12) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(12);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0014 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0015
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0015
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=18) yields 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0015 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(18);
      logInfo(`setAvoidAreaBottom(px=18): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`setAvoidAreaBottom(px=18) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(18);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0015 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0016
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0016
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=24) yields 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0016 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(24);
      logInfo(`setAvoidAreaBottom(px=24): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`setAvoidAreaBottom(px=24) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(24);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0016 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0017
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0017
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=30) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0017 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(30);
      logInfo(`setAvoidAreaBottom(px=30): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`setAvoidAreaBottom(px=30) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(30);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0017 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0018
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0018
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=36) yields 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0018 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(36);
      logInfo(`setAvoidAreaBottom(px=36): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`setAvoidAreaBottom(px=36) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(36);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0018 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0019
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0019
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=42) yields 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0019 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(42);
      logInfo(`setAvoidAreaBottom(px=42): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`setAvoidAreaBottom(px=42) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(42);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0019 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0020
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0020
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=48) yields 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0020 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(48);
      logInfo(`setAvoidAreaBottom(px=48): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`setAvoidAreaBottom(px=48) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(48);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0020 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0021
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0021
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=54) yields 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0021 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(54);
      logInfo(`setAvoidAreaBottom(px=54): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`setAvoidAreaBottom(px=54) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(54);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0021 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0022
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0022
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=60) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0022 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(60);
      logInfo(`setAvoidAreaBottom(px=60): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`setAvoidAreaBottom(px=60) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(60);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0022 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0023
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0023
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=66) yields 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0023 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(66);
      logInfo(`setAvoidAreaBottom(px=66): actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`setAvoidAreaBottom(px=66) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(66);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0023 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0024
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0024
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=72) yields 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0024 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(72);
      logInfo(`setAvoidAreaBottom(px=72): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`setAvoidAreaBottom(px=72) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(72);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0024 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0025
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0025
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=78) yields 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0025 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(78);
      logInfo(`setAvoidAreaBottom(px=78): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`setAvoidAreaBottom(px=78) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(78);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0025 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0026
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0026
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=84) yields 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0026 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(84);
      logInfo(`setAvoidAreaBottom(px=84): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`setAvoidAreaBottom(px=84) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(84);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0026 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0027
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0027
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=90) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0027 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(90);
      logInfo(`setAvoidAreaBottom(px=90): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`setAvoidAreaBottom(px=90) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(90);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0027 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0028
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0028
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=96) yields 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0028 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(96);
      logInfo(`setAvoidAreaBottom(px=96): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`setAvoidAreaBottom(px=96) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(96);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0028 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0029
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0029
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=102) yields 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0029 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(102);
      logInfo(`setAvoidAreaBottom(px=102): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`setAvoidAreaBottom(px=102) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(102);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0029 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0030
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0030
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=108) yields 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0030 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(108);
      logInfo(`setAvoidAreaBottom(px=108): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`setAvoidAreaBottom(px=108) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(108);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0030 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0031
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0031
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=114) yields 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0031 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(114);
      logInfo(`setAvoidAreaBottom(px=114): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`setAvoidAreaBottom(px=114) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(114);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0031 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0032
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0032
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=120) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0032 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(120);
      logInfo(`setAvoidAreaBottom(px=120): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`setAvoidAreaBottom(px=120) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(120);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0032 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0033
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0033
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=126) yields 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0033 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(126);
      logInfo(`setAvoidAreaBottom(px=126): actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`setAvoidAreaBottom(px=126) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(126);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0033 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0034
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0034
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=132) yields 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0034 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(132);
      logInfo(`setAvoidAreaBottom(px=132): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`setAvoidAreaBottom(px=132) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(132);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0034 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0035
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0035
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=138) yields 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0035 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(138);
      logInfo(`setAvoidAreaBottom(px=138): actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`setAvoidAreaBottom(px=138) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(138);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0035 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0036
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0036
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=144) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0036 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(144);
      logInfo(`setAvoidAreaBottom(px=144): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`setAvoidAreaBottom(px=144) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(144);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0036 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0037
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0037
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=150) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0037 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(150);
      logInfo(`setAvoidAreaBottom(px=150): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`setAvoidAreaBottom(px=150) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(150);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0037 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0038
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0038
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=156) yields 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0038 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(156);
      logInfo(`setAvoidAreaBottom(px=156): actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`setAvoidAreaBottom(px=156) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(156);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0038 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0039
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0039
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=162) yields 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0039 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(162);
      logInfo(`setAvoidAreaBottom(px=162): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`setAvoidAreaBottom(px=162) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(162);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0039 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0040
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0040
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=168) yields 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0040 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(168);
      logInfo(`setAvoidAreaBottom(px=168): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`setAvoidAreaBottom(px=168) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(168);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0040 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0041
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0041
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=174) yields 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0041 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(174);
      logInfo(`setAvoidAreaBottom(px=174): actual=${actual}`);
      expect(actual).assertEqual(58);
      logInfo(`setAvoidAreaBottom(px=174) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(174);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0041 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0042
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0042
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=180) yields 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0042 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(180);
      logInfo(`setAvoidAreaBottom(px=180): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`setAvoidAreaBottom(px=180) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(180);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0042 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0043
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0043
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=186) yields 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0043 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(186);
      logInfo(`setAvoidAreaBottom(px=186): actual=${actual}`);
      expect(actual).assertEqual(62);
      logInfo(`setAvoidAreaBottom(px=186) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(186);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0043 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0044
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0044
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=192) yields 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0044 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(192);
      logInfo(`setAvoidAreaBottom(px=192): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`setAvoidAreaBottom(px=192) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(192);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0044 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0045
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0045
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=198) yields 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0045 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(198);
      logInfo(`setAvoidAreaBottom(px=198): actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`setAvoidAreaBottom(px=198) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(198);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0045 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0046
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0046
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=204) yields 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0046 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(204);
      logInfo(`setAvoidAreaBottom(px=204): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`setAvoidAreaBottom(px=204) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(204);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0046 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0047
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0047
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=210) yields 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0047 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(210);
      logInfo(`setAvoidAreaBottom(px=210): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`setAvoidAreaBottom(px=210) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(210);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0047 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0048
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0048
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=216) yields 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0048 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(216);
      logInfo(`setAvoidAreaBottom(px=216): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`setAvoidAreaBottom(px=216) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(216);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0048 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0049
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0049
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=222) yields 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0049 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(222);
      logInfo(`setAvoidAreaBottom(px=222): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`setAvoidAreaBottom(px=222) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(222);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0049 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0050
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0050
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=228) yields 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0050 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(228);
      logInfo(`setAvoidAreaBottom(px=228): actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`setAvoidAreaBottom(px=228) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(228);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0050 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0051
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0051
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=234) yields 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0051 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(234);
      logInfo(`setAvoidAreaBottom(px=234): actual=${actual}`);
      expect(actual).assertEqual(78);
      logInfo(`setAvoidAreaBottom(px=234) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(234);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0051 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0052
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0052
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=240) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0052 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(240);
      logInfo(`setAvoidAreaBottom(px=240): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`setAvoidAreaBottom(px=240) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(240);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0052 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0053
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0053
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=110.77) yields 36.92333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0053 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(110.77);
      logInfo(`setAvoidAreaBottom(px=110.77): actual=${actual}`);
      expect(actual).assertClose(36.92333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=110.77) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(110.77, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0053 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0054
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0054
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=22) yields 7.333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0054 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(22);
      logInfo(`setAvoidAreaBottom(px=22): actual=${actual}`);
      expect(actual).assertClose(7.333333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=22) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(22);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0054 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0055
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0055
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=51) yields 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0055 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(51);
      logInfo(`setAvoidAreaBottom(px=51): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`setAvoidAreaBottom(px=51) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(51);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0055 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0056
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0056
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-5) yields -1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0056 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-5);
      logInfo(`setAvoidAreaBottom(px=-5): actual=${actual}`);
      expect(actual).assertClose(-1.6666666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-5) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-5);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0056 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0057
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0057
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=178) yields 59.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0057 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(178);
      logInfo(`setAvoidAreaBottom(px=178): actual=${actual}`);
      expect(actual).assertClose(59.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=178) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(178);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0057 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0058
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0058
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=115) yields 38.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0058 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(115);
      logInfo(`setAvoidAreaBottom(px=115): actual=${actual}`);
      expect(actual).assertClose(38.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=115) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(115);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0058 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0059
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0059
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=34.87) yields 11.623333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0059 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(34.87);
      logInfo(`setAvoidAreaBottom(px=34.87): actual=${actual}`);
      expect(actual).assertClose(11.623333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=34.87) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(34.87, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0059 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0060
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0060
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=84.77) yields 28.256666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0060 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(84.77);
      logInfo(`setAvoidAreaBottom(px=84.77): actual=${actual}`);
      expect(actual).assertClose(28.256666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=84.77) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(84.77, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0060 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0061
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0061
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=128) yields 42.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0061 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(128);
      logInfo(`setAvoidAreaBottom(px=128): actual=${actual}`);
      expect(actual).assertClose(42.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=128) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(128);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0061 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0062
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0062
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=61) yields 20.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0062 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(61);
      logInfo(`setAvoidAreaBottom(px=61): actual=${actual}`);
      expect(actual).assertClose(20.333333333333332, PRECISION);
      logInfo(`setAvoidAreaBottom(px=61) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(61);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0062 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0063
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0063
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=158) yields 52.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0063 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(158);
      logInfo(`setAvoidAreaBottom(px=158): actual=${actual}`);
      expect(actual).assertClose(52.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=158) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(158);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0063 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0064
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0064
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=161) yields 53.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0064 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(161);
      logInfo(`setAvoidAreaBottom(px=161): actual=${actual}`);
      expect(actual).assertClose(53.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=161) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(161);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0064 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0065
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0065
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=107) yields 35.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0065 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(107);
      logInfo(`setAvoidAreaBottom(px=107): actual=${actual}`);
      expect(actual).assertClose(35.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=107) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(107);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0065 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0066
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0066
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-30) yields -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0066 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-30);
      logInfo(`setAvoidAreaBottom(px=-30): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`setAvoidAreaBottom(px=-30) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-30);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0066 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0067
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0067
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-96) yields -32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0067 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-96);
      logInfo(`setAvoidAreaBottom(px=-96): actual=${actual}`);
      expect(actual).assertEqual(-32);
      logInfo(`setAvoidAreaBottom(px=-96) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-96);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0067 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0068
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0068
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-18) yields -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0068 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-18);
      logInfo(`setAvoidAreaBottom(px=-18): actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`setAvoidAreaBottom(px=-18) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-18);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0068 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0069
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0069
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=215) yields 71.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0069 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(215);
      logInfo(`setAvoidAreaBottom(px=215): actual=${actual}`);
      expect(actual).assertClose(71.66666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom(px=215) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(215);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0069 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0070
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0070
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-26) yields -8.666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0070 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-26);
      logInfo(`setAvoidAreaBottom(px=-26): actual=${actual}`);
      expect(actual).assertClose(-8.666666666666666, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-26) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-26);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0070 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0071
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0071
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-6) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0071 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-6);
      logInfo(`setAvoidAreaBottom(px=-6): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`setAvoidAreaBottom(px=-6) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-6);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0071 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0072
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0072
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=48.35) yields 16.116666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0072 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(48.35);
      logInfo(`setAvoidAreaBottom(px=48.35): actual=${actual}`);
      expect(actual).assertClose(16.116666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom(px=48.35) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(48.35, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0072 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0073
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0073
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-19) yields -6.333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0073 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-19);
      logInfo(`setAvoidAreaBottom(px=-19): actual=${actual}`);
      expect(actual).assertClose(-6.333333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-19) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-19);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0073 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0074
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0074
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-81) yields -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0074 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-81);
      logInfo(`setAvoidAreaBottom(px=-81): actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`setAvoidAreaBottom(px=-81) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-81);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0074 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0075
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0075
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=131) yields 43.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0075 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(131);
      logInfo(`setAvoidAreaBottom(px=131): actual=${actual}`);
      expect(actual).assertClose(43.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=131) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(131);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0075 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0076
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0076
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=67.47) yields 22.49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0076 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(67.47);
      logInfo(`setAvoidAreaBottom(px=67.47): actual=${actual}`);
      expect(actual).assertClose(22.49, PRECISION);
      logInfo(`setAvoidAreaBottom(px=67.47) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(67.47, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0076 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0077
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0077
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=173) yields 57.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0077 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(173);
      logInfo(`setAvoidAreaBottom(px=173): actual=${actual}`);
      expect(actual).assertClose(57.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=173) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(173);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0077 end`);
      });
  });
}
