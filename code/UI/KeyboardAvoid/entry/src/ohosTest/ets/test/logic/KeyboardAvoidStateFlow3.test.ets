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
export default function keyboardAvoidStateFlow3Test(): void {
  describe('KeyboardAvoidStateFlow3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0108
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0108
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > contentHeight keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0108 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(49);
      logInfo(`step2 setAvoidAreaBottom(49): step2=${step2}`);
      expect(step2).assertClose(16.333333333333332, PRECISION);
      const step3: number = subject.contentHeight(3168);
      logInfo(`step3 contentHeight(3168): step3=${step3}`);
      expect(step3).assertClose(3095.6666666666665, PRECISION);
      logInfo(`pressScaling>setAvoidAreaBottom>contentHe...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom>contentHe...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>contentHe...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(49);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0109
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0109
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > pressLiftUp > onKeyboardHeig...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0109 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(636.09);
      logInfo(`step1 onKeyboardHeightChange(636.09): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(642.09);
      logInfo(`step4 onKeyboardHeightChange(642.09): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressL...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(214.03, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0110
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0110
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0110 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(476);
      logInfo(`step1 onKeyboardHeightChange(476): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(2208);
      logInfo(`step2 onKeyboardHeightChange(2208): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(736);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0111
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0111
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0111 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(117);
      logInfo(`step1 setAvoidAreaBottom(117): step1=${step1}`);
      expect(step1).assertEqual(39);
      const step2: number = subject.onKeyboardHeightChange(855);
      logInfo(`step2 onKeyboardHeightChange(855): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(285);
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(117);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0112
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0112
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > setAvoidAreaBottom > contentHei...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0112 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(140);
      logInfo(`step1 setAvoidAreaBottom(140): step1=${step1}`);
      expect(step1).assertClose(46.666666666666664, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(121);
      logInfo(`step3 setAvoidAreaBottom(121): step3=${step3}`);
      expect(step3).assertClose(40.333333333333336, PRECISION);
      const step4: number = subject.contentHeight(960);
      logInfo(`step4 contentHeight(960): step4=${step4}`);
      expect(step4).assertClose(863.6666666666666, PRECISION);
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>setAvoidA...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(121);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0113
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0113
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp > onKeyboardHeightChange keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0113 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(-27);
      logInfo(`step1 setAvoidAreaBottom(-27): step1=${step1}`);
      expect(step1).assertEqual(-9);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(1728);
      logInfo(`step3 onKeyboardHeightChange(1728): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>pressLiftUp>onKeyboard...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(576);
      logInfo(`setAvoidAreaBottom>pressLiftUp>onKeyboard...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-27);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0114
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0114
     * @tc.desc      KeyboardAvoidState call flow contentHeight > contentHeight > contentHeight > pressLiftUp > setAv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0114 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1337);
      logInfo(`step1 contentHeight(1337): step1=${step1}`);
      expect(step1).assertEqual(1281);
      const step2: number = subject.contentHeight(1);
      logInfo(`step2 contentHeight(1): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.contentHeight(3648);
      logInfo(`step3 contentHeight(3648): step3=${step3}`);
      expect(step3).assertEqual(3592);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.setAvoidAreaBottom(-4);
      logInfo(`step5 setAvoidAreaBottom(-4): step5=${step5}`);
      expect(step5).assertClose(-1.3333333333333333, PRECISION);
      logInfo(`contentHeight>contentHeight>contentHeight...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-4);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0115
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0115
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > onKeyboardHeightChange > pressScalin...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0115 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(1632);
      logInfo(`step2 contentHeight(1632): step2=${step2}`);
      expect(step2).assertEqual(1576);
      const step3: number = subject.onKeyboardHeightChange(1152);
      logInfo(`step3 onKeyboardHeightChange(1152): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(384);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0116
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0116
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling > setAvoidAreaBottom keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0116 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(-935);
      logInfo(`step1 contentHeight(-935): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(155);
      logInfo(`step3 setAvoidAreaBottom(155): step3=${step3}`);
      expect(step3).assertClose(51.666666666666664, PRECISION);
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(155);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0117
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0117
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > pressScaling > onKeyboardHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0117 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(64.44);
      logInfo(`step1 setAvoidAreaBottom(64.44): step1=${step1}`);
      expect(step1).assertClose(21.48, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(480);
      logInfo(`step4 onKeyboardHeightChange(480): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.setAvoidAreaBottom(54);
      logInfo(`step5 setAvoidAreaBottom(54): step5=${step5}`);
      expect(step5).assertEqual(18);
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(160);
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(54);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0118
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0118
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0118 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(2737);
      logInfo(`step1 onKeyboardHeightChange(2737): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(912.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0119
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0119
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > onKeyboardHeightChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0119 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(57);
      logInfo(`step2 contentHeight(57): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.onKeyboardHeightChange(2976);
      logInfo(`step3 onKeyboardHeightChange(2976): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(992);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0120
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0120
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > setAvoidAreaBottom > pressLiftUp > on...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0120 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1002.5);
      logInfo(`step1 contentHeight(1002.5): step1=${step1}`);
      expect(step1).assertClose(946.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(20.88);
      logInfo(`step3 setAvoidAreaBottom(20.88): step3=${step3}`);
      expect(step3).assertClose(6.96, PRECISION);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.onKeyboardHeightChange(3648);
      logInfo(`step5 onKeyboardHeightChange(3648): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`contentHeight>pressLiftUp>setAvoidAreaBot...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1216);
      logInfo(`contentHeight>pressLiftUp>setAvoidAreaBot...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(20.88, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0121
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0121
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > onKeyboardHeightChange > pressLiftUp ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0121 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(918);
      logInfo(`step1 contentHeight(918): step1=${step1}`);
      expect(step1).assertEqual(862);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(2466);
      logInfo(`step3 onKeyboardHeightChange(2466): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.onKeyboardHeightChange(576);
      logInfo(`step5 onKeyboardHeightChange(576): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`contentHeight>pressLiftUp>onKeyboardHeigh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(192);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0122
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0122
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > onKeyboardHeightChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0122 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(1002.5);
      logInfo(`step2 contentHeight(1002.5): step2=${step2}`);
      expect(step2).assertClose(946.5, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(2592);
      logInfo(`step3 onKeyboardHeightChange(2592): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(864);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0123
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0123
     * @tc.desc      KeyboardAvoidState call flow contentHeight > contentHeight > pressLiftUp > pressLiftUp keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0123 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3168);
      logInfo(`step1 contentHeight(3168): step1=${step1}`);
      expect(step1).assertEqual(3112);
      const step2: number = subject.contentHeight(2669);
      logInfo(`step2 contentHeight(2669): step2=${step2}`);
      expect(step2).assertEqual(2613);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0124
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0124
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > setAvoidAreaBottom > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0124 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(13.04);
      logInfo(`step1 onKeyboardHeightChange(13.04): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(181);
      logInfo(`step2 setAvoidAreaBottom(181): step2=${step2}`);
      expect(step2).assertClose(60.333333333333336, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(180);
      logInfo(`step3 setAvoidAreaBottom(180): step3=${step3}`);
      expect(step3).assertEqual(60);
      const step4: number = subject.onKeyboardHeightChange(13.04);
      logInfo(`step4 onKeyboardHeightChange(13.04): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.contentHeight(2208);
      logInfo(`step5 contentHeight(2208): step5=${step5}`);
      expect(step5).assertClose(2087.653333333333, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(4.346666666666667, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(180);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0125
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0125
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > setAvoidAreaBottom > pressLift...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0125 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1907);
      logInfo(`step1 contentHeight(1907): step1=${step1}`);
      expect(step1).assertEqual(1851);
      const step2: number = subject.setAvoidAreaBottom(98.9);
      logInfo(`step2 setAvoidAreaBottom(98.9): step2=${step2}`);
      expect(step2).assertClose(32.96666666666667, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(0);
      logInfo(`step3 setAvoidAreaBottom(0): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.contentHeight(1536);
      logInfo(`step5 contentHeight(1536): step5=${step5}`);
      expect(step5).assertEqual(1480);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0126
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0126
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > pressLiftUp > setAvoidAreaBotto...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0126 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(70);
      logInfo(`step1 setAvoidAreaBottom(70): step1=${step1}`);
      expect(step1).assertClose(23.333333333333332, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.setAvoidAreaBottom(140);
      logInfo(`step4 setAvoidAreaBottom(140): step4=${step4}`);
      expect(step4).assertClose(46.666666666666664, PRECISION);
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>pressLift...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(140);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0127
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0127
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling > contentHeight > pressLiftUp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0127 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-516);
      logInfo(`step1 onKeyboardHeightChange(-516): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(-56);
      logInfo(`step3 contentHeight(-56): step3=${step3}`);
      expect(step3).assertEqual(60);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>pressScaling>conte...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-172);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0128
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0128
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0128 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(64.44);
      logInfo(`step1 setAvoidAreaBottom(64.44): step1=${step1}`);
      expect(step1).assertClose(21.48, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`setAvoidAreaBottom>pressLiftUp>pressLiftU...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(64.44, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0129
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0129
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressLiftUp > onKeyboardHeightChange keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0129 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(950);
      logInfo(`step3 onKeyboardHeightChange(950): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>pressLiftUp>onKeyboardHeight...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(316.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0130
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0130
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0130 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(98.9);
      logInfo(`step2 setAvoidAreaBottom(98.9): step2=${step2}`);
      expect(step2).assertClose(32.96666666666667, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pressLiftUp>setAvoidAreaBottom>pressLiftU...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(98.9, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0131
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0131
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom > setAvoidAreaBottom > pres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0131 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(75.68);
      logInfo(`step1 setAvoidAreaBottom(75.68): step1=${step1}`);
      expect(step1).assertClose(25.22666666666667, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(-52);
      logInfo(`step2 setAvoidAreaBottom(-52): step2=${step2}`);
      expect(step2).assertClose(-17.333333333333332, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(100);
      logInfo(`step3 setAvoidAreaBottom(100): step3=${step3}`);
      expect(step3).assertClose(33.333333333333336, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.contentHeight(3);
      logInfo(`step5 contentHeight(3): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>set...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(100);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0132
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0132
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0132 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(185);
      logInfo(`step1 setAvoidAreaBottom(185): step1=${step1}`);
      expect(step1).assertClose(61.666666666666664, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(185);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0133
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0133
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0133 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(110);
      logInfo(`step2 setAvoidAreaBottom(110): step2=${step2}`);
      expect(step2).assertClose(36.666666666666664, PRECISION);
      logInfo(`pressLiftUp>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(110);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0134
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0134
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > contentHeight > contentHeight keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0134 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(284);
      logInfo(`step1 onKeyboardHeightChange(284): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.contentHeight(-1);
      logInfo(`step2 contentHeight(-1): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.contentHeight(504.23);
      logInfo(`step3 contentHeight(504.23): step3=${step3}`);
      expect(step3).assertClose(353.56333333333333, PRECISION);
      logInfo(`onKeyboardHeightChange>contentHeight>cont...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(94.66666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0135
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0135
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressScaling > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0135 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pressLiftUp>pressScaling>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>pressScaling>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0136
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0136
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0136 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(-77);
      logInfo(`step2 setAvoidAreaBottom(-77): step2=${step2}`);
      expect(step2).assertClose(-25.666666666666668, PRECISION);
      logInfo(`pressScaling>setAvoidAreaBottom final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-77);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0137
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0137
     * @tc.desc      KeyboardAvoidState call flow contentHeight > onKeyboardHeightChange > setAvoidAreaBottom > press...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0137 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3168);
      logInfo(`step1 contentHeight(3168): step1=${step1}`);
      expect(step1).assertEqual(3112);
      const step2: number = subject.onKeyboardHeightChange(2017);
      logInfo(`step2 onKeyboardHeightChange(2017): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(45);
      logInfo(`step3 setAvoidAreaBottom(45): step3=${step3}`);
      expect(step3).assertEqual(15);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(672.3333333333334, PRECISION);
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(45);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0138
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0138
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressScaling > onKeyboardHeightChange > onKeyboardHe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0138 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(132.61);
      logInfo(`step3 onKeyboardHeightChange(132.61): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(1152);
      logInfo(`step4 onKeyboardHeightChange(1152): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.contentHeight(0);
      logInfo(`step5 contentHeight(0): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pressScaling>pressScaling>onKeyboardHeigh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(384);
      logInfo(`pressScaling>pressScaling>onKeyboardHeigh...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>pressScaling>onKeyboardHeigh...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0139
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0139
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom > onKeyboardHeightChange ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0139 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(166);
      logInfo(`step1 setAvoidAreaBottom(166): step1=${step1}`);
      expect(step1).assertClose(55.333333333333336, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(108);
      logInfo(`step2 setAvoidAreaBottom(108): step2=${step2}`);
      expect(step2).assertEqual(36);
      const step3: number = subject.onKeyboardHeightChange(654.88);
      logInfo(`step3 onKeyboardHeightChange(654.88): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>onK...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(218.29333333333332, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>onK...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(108);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0140
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0140
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling > setAvoidAreaBottom keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0140 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1440);
      logInfo(`step1 contentHeight(1440): step1=${step1}`);
      expect(step1).assertEqual(1384);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(181);
      logInfo(`step3 setAvoidAreaBottom(181): step3=${step3}`);
      expect(step3).assertClose(60.333333333333336, PRECISION);
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(181);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0141
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0141
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0141 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(167);
      logInfo(`step1 setAvoidAreaBottom(167): step1=${step1}`);
      expect(step1).assertClose(55.666666666666664, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`setAvoidAreaBottom>pressLiftUp>pressLiftU...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(167);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0142
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0142
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange > setAvoidAreaBottom > onKeybo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0142 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(576);
      logInfo(`step2 onKeyboardHeightChange(576): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(6);
      logInfo(`step3 setAvoidAreaBottom(6): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.onKeyboardHeightChange(1920);
      logInfo(`step4 onKeyboardHeightChange(1920): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.setAvoidAreaBottom(63);
      logInfo(`step5 setAvoidAreaBottom(63): step5=${step5}`);
      expect(step5).assertEqual(21);
      logInfo(`pressLiftUp>onKeyboardHeightChange>setAvo...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(640);
      logInfo(`pressLiftUp>onKeyboardHeightChange>setAvo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(63);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0143
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0143
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > pressScaling > onKeyboardHeightChange...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0143 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(709.03);
      logInfo(`step1 contentHeight(709.03): step1=${step1}`);
      expect(step1).assertClose(653.03, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(96);
      logInfo(`step4 onKeyboardHeightChange(96): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`contentHeight>pressLiftUp>pressScaling>on...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(32);
      logInfo(`contentHeight>pressLiftUp>pressScaling>on...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressLiftUp>pressScaling>on...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0144
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0144
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > contentHeight > onKeyboardHeightChange > p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0144 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-927);
      logInfo(`step1 onKeyboardHeightChange(-927): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.contentHeight(1080);
      logInfo(`step2 contentHeight(1080): step2=${step2}`);
      expect(step2).assertEqual(1333);
      const step3: number = subject.onKeyboardHeightChange(2208);
      logInfo(`step3 onKeyboardHeightChange(2208): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>contentHeight>onKe...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(736);
      logInfo(`onKeyboardHeightChange>contentHeight>onKe...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>contentHeight>onKe...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0145
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0145
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > contentHeight kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0145 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1028.52);
      logInfo(`step1 onKeyboardHeightChange(1028.52): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(2017);
      logInfo(`step2 onKeyboardHeightChange(2017): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.contentHeight(1827);
      logInfo(`step3 contentHeight(1827): step3=${step3}`);
      expect(step3).assertClose(1098.6666666666665, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(672.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0146
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0146
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > setAvoidAreaBottom > onKeybo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0146 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(762.23);
      logInfo(`step1 onKeyboardHeightChange(762.23): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(-23);
      logInfo(`step3 setAvoidAreaBottom(-23): step3=${step3}`);
      expect(step3).assertClose(-7.666666666666667, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(1196.57);
      logInfo(`step4 onKeyboardHeightChange(1196.57): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(398.8566666666666, PRECISION);
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-23);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0147
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0147
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0147 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(3108);
      logInfo(`step2 onKeyboardHeightChange(3108): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1036);
      logInfo(`pressScaling>onKeyboardHeightChange final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0148
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0148
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > onKeyboardHeightChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0148 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(1411.25);
      logInfo(`step2 contentHeight(1411.25): step2=${step2}`);
      expect(step2).assertClose(1355.25, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(3456);
      logInfo(`step3 onKeyboardHeightChange(3456): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1152);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0149
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0149
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressLiftUp > onKeyboardHeightChange keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0149 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(284);
      logInfo(`step3 onKeyboardHeightChange(284): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>pressLiftUp>onKeyboardHeight...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(94.66666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0150
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0150
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > contentHeight > pressScalin...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0150 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(1551);
      logInfo(`step2 onKeyboardHeightChange(1551): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.contentHeight(1344);
      logInfo(`step3 contentHeight(1344): step3=${step3}`);
      expect(step3).assertEqual(771);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(517);
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0151
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0151
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressLiftUp > onKeyboardHeightChange > onKeyboardHei...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0151 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(2976);
      logInfo(`step3 onKeyboardHeightChange(2976): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(1444.2);
      logInfo(`step4 onKeyboardHeightChange(1444.2): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>pressLiftUp>onKeyboardHeight...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(481.40000000000003, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0152
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0152
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > pressLiftUp > onKeyboardHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0152 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(360);
      logInfo(`step1 contentHeight(360): step1=${step1}`);
      expect(step1).assertEqual(304);
      const step2: number = subject.setAvoidAreaBottom(-53);
      logInfo(`step2 setAvoidAreaBottom(-53): step2=${step2}`);
      expect(step2).assertClose(-17.666666666666668, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(654.88);
      logInfo(`step4 onKeyboardHeightChange(654.88): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.setAvoidAreaBottom(1);
      logInfo(`step5 setAvoidAreaBottom(1): step5=${step5}`);
      expect(step5).assertClose(0.3333333333333333, PRECISION);
      logInfo(`contentHeight>setAvoidAreaBottom>pressLif...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(218.29333333333332, PRECISION);
      logInfo(`contentHeight>setAvoidAreaBottom>pressLif...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0153
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0153
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp > contentHeight > pressLiftUp > on...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0153 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(2);
      logInfo(`step1 setAvoidAreaBottom(2): step1=${step1}`);
      expect(step1).assertClose(0.6666666666666666, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(709.03);
      logInfo(`step3 contentHeight(709.03): step3=${step3}`);
      expect(step3).assertClose(652.3633333333333, PRECISION);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.onKeyboardHeightChange(1080);
      logInfo(`step5 onKeyboardHeightChange(1080): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>pressLiftUp>contentHei...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(360);
      logInfo(`setAvoidAreaBottom>pressLiftUp>contentHei...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0154
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0154
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling > pressLiftUp keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0154 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(2985);
      logInfo(`step1 onKeyboardHeightChange(2985): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`onKeyboardHeightChange>pressScaling>press...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(995);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0155
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0155
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > setAvoidAreaBottom > contentHe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0155 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(225);
      logInfo(`step1 contentHeight(225): step1=${step1}`);
      expect(step1).assertEqual(169);
      const step2: number = subject.setAvoidAreaBottom(65);
      logInfo(`step2 setAvoidAreaBottom(65): step2=${step2}`);
      expect(step2).assertClose(21.666666666666668, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(140);
      logInfo(`step3 setAvoidAreaBottom(140): step3=${step3}`);
      expect(step3).assertClose(46.666666666666664, PRECISION);
      const step4: number = subject.contentHeight(-40);
      logInfo(`step4 contentHeight(-40): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`contentHeight>setAvoidAreaBottom>setAvoid...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(140);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0156
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0156
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > pressScaling > pressScaling > p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0156 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(63);
      logInfo(`step1 setAvoidAreaBottom(63): step1=${step1}`);
      expect(step1).assertEqual(21);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>pressScal...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(63);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0157
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0157
     * @tc.desc      KeyboardAvoidState call flow contentHeight > contentHeight > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0157 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(709.03);
      logInfo(`step1 contentHeight(709.03): step1=${step1}`);
      expect(step1).assertClose(653.03, PRECISION);
      const step2: number = subject.contentHeight(1002.5);
      logInfo(`step2 contentHeight(1002.5): step2=${step2}`);
      expect(step2).assertClose(946.5, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0158
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0158
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0158 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(1827);
      logInfo(`step2 contentHeight(1827): step2=${step2}`);
      expect(step2).assertEqual(1771);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pressScaling>contentHeight>pressScaling f...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight>pressScaling f...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0159
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0159
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > pressLiftUp keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0159 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(476);
      logInfo(`step1 onKeyboardHeightChange(476): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(-741);
      logInfo(`step2 onKeyboardHeightChange(-741): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-247);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0160
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0160
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom > contentHeight keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0160 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(186);
      logInfo(`step1 setAvoidAreaBottom(186): step1=${step1}`);
      expect(step1).assertEqual(62);
      const step2: number = subject.setAvoidAreaBottom(-23);
      logInfo(`step2 setAvoidAreaBottom(-23): step2=${step2}`);
      expect(step2).assertClose(-7.666666666666667, PRECISION);
      const step3: number = subject.contentHeight(1632);
      logInfo(`step3 contentHeight(1632): step3=${step3}`);
      expect(step3).assertClose(1583.6666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom>con...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-23);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0160 end`);
    });
  });
}
