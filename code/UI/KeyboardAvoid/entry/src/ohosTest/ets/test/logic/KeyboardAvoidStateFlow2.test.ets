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

/** Logic checks for KeyboardAvoidState flow (53 cases). */
export default function keyboardAvoidStateFlow2Test(): void {
  describe('KeyboardAvoidStateFlow2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0055
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0055
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom > onKeyboardHeightChange > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0055 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(175);
      logInfo(`step1 setAvoidAreaBottom(175): step1=${step1}`);
      expect(step1).assertClose(58.333333333333336, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(75.68);
      logInfo(`step2 setAvoidAreaBottom(75.68): step2=${step2}`);
      expect(step2).assertClose(25.22666666666667, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(642.09);
      logInfo(`step3 onKeyboardHeightChange(642.09): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>onK...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(214.03, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>onK...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(75.68, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0056
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0056
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressLiftUp > pressScaling > pressLiftUp > pressLiftU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0056 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0057
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0057
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0057 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(720);
      logInfo(`step1 onKeyboardHeightChange(720): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(2629);
      logInfo(`step2 onKeyboardHeightChange(2629): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(876.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0058
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0058
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling > pressScaling > onKeyboardHeightChang...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0058 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(0);
      logInfo(`step1 contentHeight(0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(642.09);
      logInfo(`step4 onKeyboardHeightChange(642.09): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.setAvoidAreaBottom(105);
      logInfo(`step5 setAvoidAreaBottom(105): step5=${step5}`);
      expect(step5).assertEqual(35);
      logInfo(`contentHeight>pressScaling>pressScaling>o...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(214.03, PRECISION);
      logInfo(`contentHeight>pressScaling>pressScaling>o...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling>pressScaling>o...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`contentHeight>pressScaling>pressScaling>o...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(105);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0059
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0059
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom > contentHeight > pressLiftUp > pr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0059 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(15);
      logInfo(`step2 setAvoidAreaBottom(15): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.contentHeight(695);
      logInfo(`step3 contentHeight(695): step3=${step3}`);
      expect(step3).assertEqual(634);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pressLiftUp>setAvoidAreaBottom>contentHei...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>setAvoidAreaBottom>contentHei...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressLiftUp>setAvoidAreaBottom>contentHei...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(15);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0060
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0060
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > contentHeight > contentHeig...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0060 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(1080);
      logInfo(`step2 onKeyboardHeightChange(1080): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.contentHeight(-213);
      logInfo(`step3 contentHeight(-213): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.contentHeight(-820);
      logInfo(`step4 contentHeight(-820): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(360);
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0061
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0061
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > pressScaling > pressLiftUp > content...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0061 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(504.23);
      logInfo(`step2 contentHeight(504.23): step2=${step2}`);
      expect(step2).assertClose(448.23, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.contentHeight(-56);
      logInfo(`step5 contentHeight(-56): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0062
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0062
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > pressLiftUp keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0062 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(96);
      logInfo(`step1 onKeyboardHeightChange(96): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(15);
      logInfo(`step2 setAvoidAreaBottom(15): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(32);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(15);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0063
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0063
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight > onKeyboardHeightChange > setAv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0063 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(3);
      logInfo(`step1 setAvoidAreaBottom(3): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.contentHeight(-1758);
      logInfo(`step2 contentHeight(-1758): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.onKeyboardHeightChange(1080);
      logInfo(`step3 onKeyboardHeightChange(1080): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(151);
      logInfo(`step4 setAvoidAreaBottom(151): step4=${step4}`);
      expect(step4).assertClose(50.333333333333336, PRECISION);
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>contentHeight>onKeyboa...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(360);
      logInfo(`setAvoidAreaBottom>contentHeight>onKeyboa...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(151);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0064
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0064
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > pressScaling keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0064 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1150);
      logInfo(`step1 contentHeight(1150): step1=${step1}`);
      expect(step1).assertEqual(1094);
      const step2: number = subject.setAvoidAreaBottom(64.44);
      logInfo(`step2 setAvoidAreaBottom(64.44): step2=${step2}`);
      expect(step2).assertClose(21.48, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`contentHeight>setAvoidAreaBottom>pressSca...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>setAvoidAreaBottom>pressSca...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`contentHeight>setAvoidAreaBottom>pressSca...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(64.44, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0065
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0065
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0065 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0066
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0066
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > contentHeight > pressScaling ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0066 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(166);
      logInfo(`step1 setAvoidAreaBottom(166): step1=${step1}`);
      expect(step1).assertClose(55.333333333333336, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(28);
      logInfo(`step3 contentHeight(28): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>contentHe...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling>contentHe...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>contentHe...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(166);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0067
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0067
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > setAvoidAreaBottom > setAvoidAr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0067 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(-65);
      logInfo(`step2 setAvoidAreaBottom(-65): step2=${step2}`);
      expect(step2).assertClose(-21.666666666666668, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(49);
      logInfo(`step3 setAvoidAreaBottom(49): step3=${step3}`);
      expect(step3).assertClose(16.333333333333332, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(151);
      logInfo(`step4 setAvoidAreaBottom(151): step4=${step4}`);
      expect(step4).assertClose(50.333333333333336, PRECISION);
      logInfo(`pressScaling>setAvoidAreaBottom>setAvoidA...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom>setAvoidA...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>setAvoidA...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(151);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0068
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0068
     * @tc.desc      KeyboardAvoidState call flow contentHeight > onKeyboardHeightChange > setAvoidAreaBottom > setAv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0068 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(-1611);
      logInfo(`step1 contentHeight(-1611): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.onKeyboardHeightChange(1253.82);
      logInfo(`step2 onKeyboardHeightChange(1253.82): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(63);
      logInfo(`step3 setAvoidAreaBottom(63): step3=${step3}`);
      expect(step3).assertEqual(21);
      const step4: number = subject.setAvoidAreaBottom(-85);
      logInfo(`step4 setAvoidAreaBottom(-85): step4=${step4}`);
      expect(step4).assertClose(-28.333333333333332, PRECISION);
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(417.94, PRECISION);
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-85);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0069
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0069
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > contentHeight > setAv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0069 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1920);
      logInfo(`step1 onKeyboardHeightChange(1920): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(10);
      logInfo(`step2 setAvoidAreaBottom(10): step2=${step2}`);
      expect(step2).assertClose(3.3333333333333335, PRECISION);
      const step3: number = subject.contentHeight(3072);
      logInfo(`step3 contentHeight(3072): step3=${step3}`);
      expect(step3).assertClose(2372.6666666666665, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(-8);
      logInfo(`step4 setAvoidAreaBottom(-8): step4=${step4}`);
      expect(step4).assertClose(-2.6666666666666665, PRECISION);
      const step5: number = subject.setAvoidAreaBottom(46);
      logInfo(`step5 setAvoidAreaBottom(46): step5=${step5}`);
      expect(step5).assertClose(15.333333333333334, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(640);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(46);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0070
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0070
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0070 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(0);
      logInfo(`step2 onKeyboardHeightChange(0): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0071
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0071
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight > contentHeight > onKeyboardHeig...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0071 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(30.01);
      logInfo(`step1 setAvoidAreaBottom(30.01): step1=${step1}`);
      expect(step1).assertClose(10.003333333333334, PRECISION);
      const step2: number = subject.contentHeight(3305);
      logInfo(`step2 contentHeight(3305): step2=${step2}`);
      expect(step2).assertClose(3238.9966666666664, PRECISION);
      const step3: number = subject.contentHeight(3264);
      logInfo(`step3 contentHeight(3264): step3=${step3}`);
      expect(step3).assertClose(3197.9966666666664, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(768);
      logInfo(`step4 onKeyboardHeightChange(768): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.contentHeight(-492);
      logInfo(`step5 contentHeight(-492): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`setAvoidAreaBottom>contentHeight>contentH...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(256);
      logInfo(`setAvoidAreaBottom>contentHeight>contentH...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(30.01, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0072
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0072
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressLiftUp > onKeyboardHeightChange > setAvoidAreaB...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0072 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(476);
      logInfo(`step3 onKeyboardHeightChange(476): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(-53);
      logInfo(`step4 setAvoidAreaBottom(-53): step4=${step4}`);
      expect(step4).assertClose(-17.666666666666668, PRECISION);
      logInfo(`pressScaling>pressLiftUp>onKeyboardHeight...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(158.66666666666666, PRECISION);
      logInfo(`pressScaling>pressLiftUp>onKeyboardHeight...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-53);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0073
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0073
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > pressLiftUp keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0073 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(576);
      logInfo(`step1 onKeyboardHeightChange(576): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(3744);
      logInfo(`step2 onKeyboardHeightChange(3744): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1248);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0074
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0074
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0074 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(-858);
      logInfo(`step2 onKeyboardHeightChange(-858): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`pressScaling>onKeyboardHeightChange final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-286);
      logInfo(`pressScaling>onKeyboardHeightChange final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0075
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0075
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0075 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(170);
      logInfo(`step2 setAvoidAreaBottom(170): step2=${step2}`);
      expect(step2).assertClose(56.666666666666664, PRECISION);
      logInfo(`pressLiftUp>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(170);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0076
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0076
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0076 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(1.48);
      logInfo(`step2 setAvoidAreaBottom(1.48): step2=${step2}`);
      expect(step2).assertClose(0.49333333333333335, PRECISION);
      logInfo(`pressLiftUp>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(1.48, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0077
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0077
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0077 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(151);
      logInfo(`step1 setAvoidAreaBottom(151): step1=${step1}`);
      expect(step1).assertClose(50.333333333333336, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(151);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0078
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0078
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > pressLiftUp > pressScaling k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0078 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(3360);
      logInfo(`step1 onKeyboardHeightChange(3360): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressL...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1120);
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressL...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressL...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0079
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0079
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0079 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(175);
      logInfo(`step1 setAvoidAreaBottom(175): step1=${step1}`);
      expect(step1).assertClose(58.333333333333336, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>pressLift...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(175);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0080
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0080
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > contentHeight > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0080 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(2880);
      logInfo(`step2 contentHeight(2880): step2=${step2}`);
      expect(step2).assertEqual(2824);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0081
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0081
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > setAvoidAreaBottom keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0081 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(1746.16);
      logInfo(`step2 onKeyboardHeightChange(1746.16): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(84.93);
      logInfo(`step3 setAvoidAreaBottom(84.93): step3=${step3}`);
      expect(step3).assertClose(28.310000000000002, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(582.0533333333334, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(84.93, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0082
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0082
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0082 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(3168);
      logInfo(`step1 onKeyboardHeightChange(3168): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1056);
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0083
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0083
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressScaling > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0083 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(-6);
      logInfo(`step3 setAvoidAreaBottom(-6): step3=${step3}`);
      expect(step3).assertEqual(-2);
      logInfo(`pressLiftUp>pressScaling>setAvoidAreaBott...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>pressScaling>setAvoidAreaBott...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressLiftUp>pressScaling>setAvoidAreaBott...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-6);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0084
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0084
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0084 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(-820);
      logInfo(`step1 contentHeight(-820): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.setAvoidAreaBottom(78);
      logInfo(`step2 setAvoidAreaBottom(78): step2=${step2}`);
      expect(step2).assertEqual(26);
      logInfo(`contentHeight>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(78);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0085
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0085
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > pressScaling > pressLiftUp k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0085 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(284);
      logInfo(`step1 onKeyboardHeightChange(284): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressS...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(94.66666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0086
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0086
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > pressScaling keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0086 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(-15);
      logInfo(`step1 setAvoidAreaBottom(-15): step1=${step1}`);
      expect(step1).assertEqual(-5);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-15);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0087
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0087
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight > contentHeight keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0087 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(166);
      logInfo(`step1 setAvoidAreaBottom(166): step1=${step1}`);
      expect(step1).assertClose(55.333333333333336, PRECISION);
      const step2: number = subject.contentHeight(1132);
      logInfo(`step2 contentHeight(1132): step2=${step2}`);
      expect(step2).assertClose(1020.6666666666667, PRECISION);
      const step3: number = subject.contentHeight(2669);
      logInfo(`step3 contentHeight(2669): step3=${step3}`);
      expect(step3).assertClose(2557.6666666666665, PRECISION);
      logInfo(`setAvoidAreaBottom>contentHeight>contentH...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(166);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0088
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0088
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp > contentHeight > contentHeight > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0088 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(65);
      logInfo(`step1 setAvoidAreaBottom(65): step1=${step1}`);
      expect(step1).assertClose(21.666666666666668, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(384);
      logInfo(`step3 contentHeight(384): step3=${step3}`);
      expect(step3).assertClose(306.3333333333333, PRECISION);
      const step4: number = subject.contentHeight(288);
      logInfo(`step4 contentHeight(288): step4=${step4}`);
      expect(step4).assertClose(210.33333333333331, PRECISION);
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>pressLiftUp>contentHei...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(65);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0089
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0089
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0089 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(576);
      logInfo(`step1 onKeyboardHeightChange(576): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(73);
      logInfo(`step2 setAvoidAreaBottom(73): step2=${step2}`);
      expect(step2).assertClose(24.333333333333332, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(192);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(73);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0090
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0090
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0090 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(90);
      logInfo(`step1 setAvoidAreaBottom(90): step1=${step1}`);
      expect(step1).assertEqual(30);
      const step2: number = subject.setAvoidAreaBottom(115);
      logInfo(`step2 setAvoidAreaBottom(115): step2=${step2}`);
      expect(step2).assertClose(38.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(115);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0091
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0091
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressScaling > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0091 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(228.94);
      logInfo(`step3 contentHeight(228.94): step3=${step3}`);
      expect(step3).assertClose(172.94, PRECISION);
      logInfo(`pressScaling>pressScaling>contentHeight f...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>pressScaling>contentHeight f...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0092
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0092
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > onKeyboardHeightChang...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0092 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(3168);
      logInfo(`step1 onKeyboardHeightChange(3168): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(2);
      logInfo(`step2 setAvoidAreaBottom(2): step2=${step2}`);
      expect(step2).assertClose(0.6666666666666666, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(1551);
      logInfo(`step3 onKeyboardHeightChange(1551): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(-53);
      logInfo(`step4 setAvoidAreaBottom(-53): step4=${step4}`);
      expect(step4).assertClose(-17.666666666666668, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(517);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-53);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0093
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0093
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > contentHeight > contentHeight keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0093 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-378);
      logInfo(`step1 onKeyboardHeightChange(-378): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.contentHeight(3089);
      logInfo(`step2 contentHeight(3089): step2=${step2}`);
      expect(step2).assertEqual(3159);
      const step3: number = subject.contentHeight(-40);
      logInfo(`step3 contentHeight(-40): step3=${step3}`);
      expect(step3).assertEqual(30);
      logInfo(`onKeyboardHeightChange>contentHeight>cont...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-126);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0094
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0094
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > contentHeight > pressScaling > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0094 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(-17);
      logInfo(`step1 setAvoidAreaBottom(-17): step1=${step1}`);
      expect(step1).assertClose(-5.666666666666667, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(556.05);
      logInfo(`step3 contentHeight(556.05): step3=${step3}`);
      expect(step3).assertClose(505.7166666666666, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.contentHeight(-271);
      logInfo(`step5 contentHeight(-271): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`setAvoidAreaBottom>pressScaling>contentHe...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling>contentHe...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>contentHe...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-17);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0095
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0095
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling > pressScaling keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0095 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(100);
      logInfo(`step1 onKeyboardHeightChange(100): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`onKeyboardHeightChange>pressScaling>press...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(33.333333333333336, PRECISION);
      logInfo(`onKeyboardHeightChange>pressScaling>press...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressScaling>press...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0096
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0096
     * @tc.desc      KeyboardAvoidState call flow contentHeight > onKeyboardHeightChange > pressScaling keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0096 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(995.75);
      logInfo(`step1 contentHeight(995.75): step1=${step1}`);
      expect(step1).assertClose(939.75, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(10);
      logInfo(`step2 onKeyboardHeightChange(10): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`contentHeight>onKeyboardHeightChange>pres...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(3.3333333333333335, PRECISION);
      logInfo(`contentHeight>onKeyboardHeightChange>pres...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>onKeyboardHeightChange>pres...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0097
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0097
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange > pressScaling keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0097 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(3744);
      logInfo(`step2 onKeyboardHeightChange(3744): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressS...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1248);
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressS...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressS...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0098
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0098
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > setAvoidAreaBotto...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0098 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1299);
      logInfo(`step1 onKeyboardHeightChange(1299): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(960);
      logInfo(`step2 onKeyboardHeightChange(960): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(3);
      logInfo(`step3 setAvoidAreaBottom(3): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.contentHeight(-1611);
      logInfo(`step4 contentHeight(-1611): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(320);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0099
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0099
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom > setAvoidAreaBottom > pres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0099 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(110);
      logInfo(`step1 setAvoidAreaBottom(110): step1=${step1}`);
      expect(step1).assertClose(36.666666666666664, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(185);
      logInfo(`step2 setAvoidAreaBottom(185): step2=${step2}`);
      expect(step2).assertClose(61.666666666666664, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(140);
      logInfo(`step3 setAvoidAreaBottom(140): step3=${step3}`);
      expect(step3).assertClose(46.666666666666664, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.onKeyboardHeightChange(100);
      logInfo(`step5 onKeyboardHeightChange(100): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(33.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(140);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0100
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0100
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0100 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(394.32);
      logInfo(`step2 contentHeight(394.32): step2=${step2}`);
      expect(step2).assertClose(338.32, PRECISION);
      logInfo(`pressScaling>contentHeight final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0101
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0101
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > pressLiftUp > onKeyboardHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0101 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1132);
      logInfo(`step1 contentHeight(1132): step1=${step1}`);
      expect(step1).assertEqual(1076);
      const step2: number = subject.setAvoidAreaBottom(-27);
      logInfo(`step2 setAvoidAreaBottom(-27): step2=${step2}`);
      expect(step2).assertEqual(-9);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(2121);
      logInfo(`step4 onKeyboardHeightChange(2121): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`contentHeight>setAvoidAreaBottom>pressLif...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(707);
      logInfo(`contentHeight>setAvoidAreaBottom>pressLif...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-27);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0102
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0102
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > pressScaling > contentHeight >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0102 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1907);
      logInfo(`step1 contentHeight(1907): step1=${step1}`);
      expect(step1).assertEqual(1851);
      const step2: number = subject.setAvoidAreaBottom(-11);
      logInfo(`step2 setAvoidAreaBottom(-11): step2=${step2}`);
      expect(step2).assertClose(-3.6666666666666665, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.contentHeight(10);
      logInfo(`step4 contentHeight(10): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`contentHeight>setAvoidAreaBottom>pressSca...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>setAvoidAreaBottom>pressSca...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`contentHeight>setAvoidAreaBottom>pressSca...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-11);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0103
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0103
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > onKeyboardHeightChang...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0103 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(385.71);
      logInfo(`step1 onKeyboardHeightChange(385.71): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(81);
      logInfo(`step2 setAvoidAreaBottom(81): step2=${step2}`);
      expect(step2).assertEqual(27);
      const step3: number = subject.onKeyboardHeightChange(480);
      logInfo(`step3 onKeyboardHeightChange(480): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.contentHeight(922);
      logInfo(`step5 contentHeight(922): step5=${step5}`);
      expect(step5).assertEqual(679);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(160);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(81);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0104
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0104
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > contentHeight > pressLiftUp > onKeybo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0104 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3552);
      logInfo(`step1 contentHeight(3552): step1=${step1}`);
      expect(step1).assertEqual(3496);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(3089);
      logInfo(`step3 contentHeight(3089): step3=${step3}`);
      expect(step3).assertEqual(3033);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.onKeyboardHeightChange(-219);
      logInfo(`step5 onKeyboardHeightChange(-219): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`contentHeight>pressLiftUp>contentHeight>p...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-73);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0105
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0105
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > contentHeight > pressLiftUp ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0105 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-1518);
      logInfo(`step1 onKeyboardHeightChange(-1518): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(1752);
      logInfo(`step3 contentHeight(1752): step3=${step3}`);
      expect(step3).assertEqual(2202);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp>conten...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-506);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0106
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0106
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom > onKeyboardHeightChange > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0106 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(159);
      logInfo(`step1 setAvoidAreaBottom(159): step1=${step1}`);
      expect(step1).assertEqual(53);
      const step2: number = subject.setAvoidAreaBottom(180);
      logInfo(`step2 setAvoidAreaBottom(180): step2=${step2}`);
      expect(step2).assertEqual(60);
      const step3: number = subject.onKeyboardHeightChange(192);
      logInfo(`step3 onKeyboardHeightChange(192): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.contentHeight(1113.46);
      logInfo(`step4 contentHeight(1113.46): step4=${step4}`);
      expect(step4).assertClose(933.46, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>onK...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(64);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>onK...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(180);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0107
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0107
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom > setAvoidAreaBottom > pres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0107 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(-1);
      logInfo(`step1 setAvoidAreaBottom(-1): step1=${step1}`);
      expect(step1).assertClose(-0.3333333333333333, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(45);
      logInfo(`step2 setAvoidAreaBottom(45): step2=${step2}`);
      expect(step2).assertEqual(15);
      const step3: number = subject.setAvoidAreaBottom(121);
      logInfo(`step3 setAvoidAreaBottom(121): step3=${step3}`);
      expect(step3).assertClose(40.333333333333336, PRECISION);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(121);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0107 end`);
    });
  });
}
