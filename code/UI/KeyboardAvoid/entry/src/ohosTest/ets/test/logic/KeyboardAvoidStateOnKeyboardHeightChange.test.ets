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

/** Logic checks for KeyboardAvoidState.onKeyboardHeightChange (77 cases). */
export default function keyboardAvoidStateOnKeyboardHeightChangeTest(): void {
  describe('KeyboardAvoidStateOnKeyboardHeightChangeTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0001
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0001
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0001 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(0);
      logInfo(`onKeyboardHeightChange(heightPx=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0001 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0002
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0002
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0002 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1);
      logInfo(`onKeyboardHeightChange(heightPx=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0002 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0003
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0003
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=56) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0003 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(56);
      logInfo(`onKeyboardHeightChange(heightPx=56): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=56) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(18.666666666666668, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0003 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0004
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0004
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=55) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0004 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(55);
      logInfo(`onKeyboardHeightChange(heightPx=55): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=55) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(18.333333333333332, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0004 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0005
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0005
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=57) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0005 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(57);
      logInfo(`onKeyboardHeightChange(heightPx=57): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=57) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(19);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0005 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0006
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0006
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=112) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0006 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(112);
      logInfo(`onKeyboardHeightChange(heightPx=112): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=112) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(37.333333333333336, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0006 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0007
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0007
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=28) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0007 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(28);
      logInfo(`onKeyboardHeightChange(heightPx=28): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=28) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(9.333333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0007 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0008
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0008
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=100) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0008 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(100);
      logInfo(`onKeyboardHeightChange(heightPx=100): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=100) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0008 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0009
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0009
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=360) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0009 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(360);
      logInfo(`onKeyboardHeightChange(heightPx=360): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=360) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(120);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0009 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0010
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0010
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=720) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0010 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(720);
      logInfo(`onKeyboardHeightChange(heightPx=720): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=720) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(240);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0010 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0011
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0011
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1080) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0011 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1080);
      logInfo(`onKeyboardHeightChange(heightPx=1080): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1080) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(360);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0011 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0012
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0012
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1920) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0012 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1920);
      logInfo(`onKeyboardHeightChange(heightPx=1920): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1920) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(640);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0012 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0013
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0013
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0013 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-1);
      logInfo(`onKeyboardHeightChange(heightPx=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-1) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0013 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0014
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0014
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0014 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2);
      logInfo(`onKeyboardHeightChange(heightPx=2): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0014 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0015
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0015
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0015 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3);
      logInfo(`onKeyboardHeightChange(heightPx=3): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0015 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0016
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0016
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=10) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0016 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(10);
      logInfo(`onKeyboardHeightChange(heightPx=10): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=10) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0016 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0017
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0017
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=96) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0017 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(96);
      logInfo(`onKeyboardHeightChange(heightPx=96): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=96) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(32);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0017 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0018
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0018
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=192) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0018 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(192);
      logInfo(`onKeyboardHeightChange(heightPx=192): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=192) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(64);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0018 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0019
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0019
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=288) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0019 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(288);
      logInfo(`onKeyboardHeightChange(heightPx=288): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=288) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(96);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0019 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0020
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0020
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=384) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0020 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(384);
      logInfo(`onKeyboardHeightChange(heightPx=384): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=384) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(128);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0020 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0021
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0021
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=480) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0021 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(480);
      logInfo(`onKeyboardHeightChange(heightPx=480): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=480) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(160);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0021 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0022
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0022
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=576) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0022 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(576);
      logInfo(`onKeyboardHeightChange(heightPx=576): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=576) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(192);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0022 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0023
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0023
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=672) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0023 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(672);
      logInfo(`onKeyboardHeightChange(heightPx=672): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=672) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(224);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0023 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0024
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0024
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=768) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0024 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(768);
      logInfo(`onKeyboardHeightChange(heightPx=768): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=768) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(256);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0024 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0025
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0025
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=864) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0025 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(864);
      logInfo(`onKeyboardHeightChange(heightPx=864): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=864) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(288);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0025 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0026
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0026
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=960) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0026 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(960);
      logInfo(`onKeyboardHeightChange(heightPx=960): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=960) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(320);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0026 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0027
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0027
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1056) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0027 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1056);
      logInfo(`onKeyboardHeightChange(heightPx=1056): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1056) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(352);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0027 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0028
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0028
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1152) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0028 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1152);
      logInfo(`onKeyboardHeightChange(heightPx=1152): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1152) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(384);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0028 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0029
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0029
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1248) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0029 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1248);
      logInfo(`onKeyboardHeightChange(heightPx=1248): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1248) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(416);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0029 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0030
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0030
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1344) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0030 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1344);
      logInfo(`onKeyboardHeightChange(heightPx=1344): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1344) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(448);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0030 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0031
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0031
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1440) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0031 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1440);
      logInfo(`onKeyboardHeightChange(heightPx=1440): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1440) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(480);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0031 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0032
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0032
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1536) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0032 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1536);
      logInfo(`onKeyboardHeightChange(heightPx=1536): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1536) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(512);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0032 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0033
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0033
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1632) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0033 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1632);
      logInfo(`onKeyboardHeightChange(heightPx=1632): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1632) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(544);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0033 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0034
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0034
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1728) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0034 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1728);
      logInfo(`onKeyboardHeightChange(heightPx=1728): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1728) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(576);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0034 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0035
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0035
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1824) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0035 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1824);
      logInfo(`onKeyboardHeightChange(heightPx=1824): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1824) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(608);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0035 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0036
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0036
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2016) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0036 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2016);
      logInfo(`onKeyboardHeightChange(heightPx=2016): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2016) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(672);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0036 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0037
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0037
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2112) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0037 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2112);
      logInfo(`onKeyboardHeightChange(heightPx=2112): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2112) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(704);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0037 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0038
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0038
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2208) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0038 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2208);
      logInfo(`onKeyboardHeightChange(heightPx=2208): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2208) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(736);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0038 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0039
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0039
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2304) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0039 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2304);
      logInfo(`onKeyboardHeightChange(heightPx=2304): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2304) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(768);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0039 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0040
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0040
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2400) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0040 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2400);
      logInfo(`onKeyboardHeightChange(heightPx=2400): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2400) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(800);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0040 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0041
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0041
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2496) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0041 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2496);
      logInfo(`onKeyboardHeightChange(heightPx=2496): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2496) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(832);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0041 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0042
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0042
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2592) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0042 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2592);
      logInfo(`onKeyboardHeightChange(heightPx=2592): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2592) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(864);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0042 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0043
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0043
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2688) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0043 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2688);
      logInfo(`onKeyboardHeightChange(heightPx=2688): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2688) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(896);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0043 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0044
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0044
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2784) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0044 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2784);
      logInfo(`onKeyboardHeightChange(heightPx=2784): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2784) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(928);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0044 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0045
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0045
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2880) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0045 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2880);
      logInfo(`onKeyboardHeightChange(heightPx=2880): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2880) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(960);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0045 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0046
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0046
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2976) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0046 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2976);
      logInfo(`onKeyboardHeightChange(heightPx=2976): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2976) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(992);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0046 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0047
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0047
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3072) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0047 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3072);
      logInfo(`onKeyboardHeightChange(heightPx=3072): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3072) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1024);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0047 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0048
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0048
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3168) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0048 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3168);
      logInfo(`onKeyboardHeightChange(heightPx=3168): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3168) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1056);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0048 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0049
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0049
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3264) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0049 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3264);
      logInfo(`onKeyboardHeightChange(heightPx=3264): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3264) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1088);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0049 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0050
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0050
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3360) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0050 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3360);
      logInfo(`onKeyboardHeightChange(heightPx=3360): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3360) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1120);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0050 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0051
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0051
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3456) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0051 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3456);
      logInfo(`onKeyboardHeightChange(heightPx=3456): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3456) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1152);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0051 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0052
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0052
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3552) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0052 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3552);
      logInfo(`onKeyboardHeightChange(heightPx=3552): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3552) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1184);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0052 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0053
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0053
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3648) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0053 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3648);
      logInfo(`onKeyboardHeightChange(heightPx=3648): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3648) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1216);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0053 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0054
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0054
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3744) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0054 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3744);
      logInfo(`onKeyboardHeightChange(heightPx=3744): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3744) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1248);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0054 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0055
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0055
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3840) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0055 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3840);
      logInfo(`onKeyboardHeightChange(heightPx=3840): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3840) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1280);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0055 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0056
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0056
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=284) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0056 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(284);
      logInfo(`onKeyboardHeightChange(heightPx=284): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=284) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(94.66666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0056 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0057
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0057
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1731.69) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0057 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1731.69);
      logInfo(`onKeyboardHeightChange(heightPx=1731.69): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1731.69) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(577.23, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0057 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0058
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0058
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=476) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0058 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(476);
      logInfo(`onKeyboardHeightChange(heightPx=476): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=476) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(158.66666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0058 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0059
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0059
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-1376) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0059 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-1376);
      logInfo(`onKeyboardHeightChange(heightPx=-1376): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-1376) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-458.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0059 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0060
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0060
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3582) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0060 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3582);
      logInfo(`onKeyboardHeightChange(heightPx=3582): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3582) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1194);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0060 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0061
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0061
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1028.52) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0061 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1028.52);
      logInfo(`onKeyboardHeightChange(heightPx=1028.52): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1028.52) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(342.84, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0061 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0062
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0062
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=469.73) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0062 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(469.73);
      logInfo(`onKeyboardHeightChange(heightPx=469.73): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=469.73) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(156.57666666666668, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0062 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0063
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0063
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=964.12) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0063 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(964.12);
      logInfo(`onKeyboardHeightChange(heightPx=964.12): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=964.12) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(321.37333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0063 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0064
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0064
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1746.16) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0064 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1746.16);
      logInfo(`onKeyboardHeightChange(heightPx=1746.16): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1746.16) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(582.0533333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0064 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0065
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0065
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-569) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0065 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-569);
      logInfo(`onKeyboardHeightChange(heightPx=-569): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-569) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-189.66666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0065 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0066
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0066
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=733.32) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0066 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(733.32);
      logInfo(`onKeyboardHeightChange(heightPx=733.32): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=733.32) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(244.44000000000003, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0066 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0067
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0067
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2155) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0067 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2155);
      logInfo(`onKeyboardHeightChange(heightPx=2155): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2155) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(718.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0067 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0068
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0068
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=739) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0068 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(739);
      logInfo(`onKeyboardHeightChange(heightPx=739): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=739) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(246.33333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0068 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0069
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0069
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-1783) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0069 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-1783);
      logInfo(`onKeyboardHeightChange(heightPx=-1783): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-1783) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-594.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0069 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0070
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0070
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=762.23) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0070 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(762.23);
      logInfo(`onKeyboardHeightChange(heightPx=762.23): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=762.23) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(254.07666666666668, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0070 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0071
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0071
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=317.84) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0071 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(317.84);
      logInfo(`onKeyboardHeightChange(heightPx=317.84): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=317.84) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(105.94666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0071 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0072
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0072
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=950) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0072 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(950);
      logInfo(`onKeyboardHeightChange(heightPx=950): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=950) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(316.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0072 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0073
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0073
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=722) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0073 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(722);
      logInfo(`onKeyboardHeightChange(heightPx=722): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=722) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(240.66666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0073 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0074
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0074
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=528.91) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0074 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(528.91);
      logInfo(`onKeyboardHeightChange(heightPx=528.91): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=528.91) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(176.3033333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0074 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0075
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0075
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=636.09) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0075 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(636.09);
      logInfo(`onKeyboardHeightChange(heightPx=636.09): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=636.09) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(212.03, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0075 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0076
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0076
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3564) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0076 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3564);
      logInfo(`onKeyboardHeightChange(heightPx=3564): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3564) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1188);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0076 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0077
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0077
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-927) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0077 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-927);
      logInfo(`onKeyboardHeightChange(heightPx=-927): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-927) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-309);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0077 end`);
      });
  });
}
