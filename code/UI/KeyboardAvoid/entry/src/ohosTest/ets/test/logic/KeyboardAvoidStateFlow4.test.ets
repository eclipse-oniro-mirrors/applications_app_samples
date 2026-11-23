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

/** Logic checks for KeyboardAvoidState flow (51 cases). */
export default function keyboardAvoidStateFlow4Test(): void {
  describe('KeyboardAvoidStateFlow4Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0161
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0161
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight > onKeyboardHeightChange > setAv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0161 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(35);
      logInfo(`step1 setAvoidAreaBottom(35): step1=${step1}`);
      expect(step1).assertClose(11.666666666666666, PRECISION);
      const step2: number = subject.contentHeight(360);
      logInfo(`step2 contentHeight(360): step2=${step2}`);
      expect(step2).assertClose(292.3333333333333, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(-1109);
      logInfo(`step3 onKeyboardHeightChange(-1109): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.setAvoidAreaBottom(140);
      logInfo(`step4 setAvoidAreaBottom(140): step4=${step4}`);
      expect(step4).assertClose(46.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom>contentHeight>onKeyboa...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-369.6666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom>contentHeight>onKeyboa...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(140);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0162
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0162
     * @tc.desc      KeyboardAvoidState call flow contentHeight > contentHeight > onKeyboardHeightChange > contentHei...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0162 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3347);
      logInfo(`step1 contentHeight(3347): step1=${step1}`);
      expect(step1).assertEqual(3291);
      const step2: number = subject.contentHeight(2);
      logInfo(`step2 contentHeight(2): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.onKeyboardHeightChange(3808);
      logInfo(`step3 onKeyboardHeightChange(3808): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.contentHeight(2616);
      logInfo(`step4 contentHeight(2616): step4=${step4}`);
      expect(step4).assertClose(1290.6666666666667, PRECISION);
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`contentHeight>contentHeight>onKeyboardHei...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(1269.3333333333333, PRECISION);
      logInfo(`contentHeight>contentHeight>onKeyboardHei...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>contentHeight>onKeyboardHei...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0163
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0163
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0163 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(165);
      logInfo(`step2 setAvoidAreaBottom(165): step2=${step2}`);
      expect(step2).assertEqual(55);
      logInfo(`pressLiftUp>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(165);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0164
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0164
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight > pressScaling > contentHeight >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0164 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(22);
      logInfo(`step1 setAvoidAreaBottom(22): step1=${step1}`);
      expect(step1).assertClose(7.333333333333333, PRECISION);
      const step2: number = subject.contentHeight(1827);
      logInfo(`step2 contentHeight(1827): step2=${step2}`);
      expect(step2).assertClose(1763.6666666666667, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.contentHeight(147);
      logInfo(`step4 contentHeight(147): step4=${step4}`);
      expect(step4).assertClose(83.66666666666666, PRECISION);
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>contentHeight>pressSca...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>contentHeight>pressSca...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>contentHeight>pressSca...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(22);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0165
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0165
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0165 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(2592);
      logInfo(`step1 contentHeight(2592): step1=${step1}`);
      expect(step1).assertEqual(2536);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0166
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0166
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > onKeyboardHeightC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0166 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1705.72);
      logInfo(`step1 onKeyboardHeightChange(1705.72): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(2592);
      logInfo(`step2 onKeyboardHeightChange(2592): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(-1109);
      logInfo(`step3 onKeyboardHeightChange(-1109): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-369.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0167
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0167
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressScaling > pressScaling > pressScaling keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0167 begin`);
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
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pressLiftUp>pressScaling>pressScaling>pre...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>pressScaling>pressScaling>pre...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0168
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0168
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > pressScaling keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0168 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(-17);
      logInfo(`step1 setAvoidAreaBottom(-17): step1=${step1}`);
      expect(step1).assertClose(-5.666666666666667, PRECISION);
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
      expect(subject.avoidAreaBottom).assertEqual(-17);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0169
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0169
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > setAvoidAreaBotto...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0169 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(2496);
      logInfo(`step1 onKeyboardHeightChange(2496): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(636.09);
      logInfo(`step2 onKeyboardHeightChange(636.09): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(200);
      logInfo(`step3 setAvoidAreaBottom(200): step3=${step3}`);
      expect(step3).assertClose(66.66666666666667, PRECISION);
      const step4: number = subject.contentHeight(918);
      logInfo(`step4 contentHeight(918): step4=${step4}`);
      expect(step4).assertClose(583.3033333333334, PRECISION);
      const step5: number = subject.onKeyboardHeightChange(950);
      logInfo(`step5 onKeyboardHeightChange(950): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(316.6666666666667, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(200);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0170
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0170
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > contentHeight > pressLiftUp > setAvoidAreaBottom > se...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0170 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(2664);
      logInfo(`step2 contentHeight(2664): step2=${step2}`);
      expect(step2).assertEqual(2608);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.setAvoidAreaBottom(187);
      logInfo(`step4 setAvoidAreaBottom(187): step4=${step4}`);
      expect(step4).assertClose(62.333333333333336, PRECISION);
      const step5: number = subject.setAvoidAreaBottom(53.96);
      logInfo(`step5 setAvoidAreaBottom(53.96): step5=${step5}`);
      expect(step5).assertClose(17.986666666666668, PRECISION);
      logInfo(`pressLiftUp>contentHeight>pressLiftUp>set...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(53.96, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0171
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0171
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0171 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(-11);
      logInfo(`step1 setAvoidAreaBottom(-11): step1=${step1}`);
      expect(step1).assertClose(-3.6666666666666665, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-11);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0172
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0172
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > pressLiftUp > setAvoidAreaBotto...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0172 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(43.17);
      logInfo(`step1 setAvoidAreaBottom(43.17): step1=${step1}`);
      expect(step1).assertClose(14.39, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.setAvoidAreaBottom(140);
      logInfo(`step4 setAvoidAreaBottom(140): step4=${step4}`);
      expect(step4).assertClose(46.666666666666664, PRECISION);
      const step5: number = subject.onKeyboardHeightChange(384);
      logInfo(`step5 onKeyboardHeightChange(384): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>pressScaling>pressLift...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(128);
      logInfo(`setAvoidAreaBottom>pressScaling>pressLift...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(140);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0173
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0173
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling > onKeyboardHeightChange > onKeyb...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0173 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(50);
      logInfo(`step1 setAvoidAreaBottom(50): step1=${step1}`);
      expect(step1).assertClose(16.666666666666668, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(385.71);
      logInfo(`step3 onKeyboardHeightChange(385.71): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(1536);
      logInfo(`step4 onKeyboardHeightChange(1536): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling>onKeyboar...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(512);
      logInfo(`setAvoidAreaBottom>pressScaling>onKeyboar...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(50);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0174
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0174
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0174 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1056);
      logInfo(`step1 onKeyboardHeightChange(1056): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(13.04);
      logInfo(`step2 onKeyboardHeightChange(13.04): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(4.346666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0175
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0175
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > onKeyboardHeightChange > onKeyb...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0175 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(99.54);
      logInfo(`step2 setAvoidAreaBottom(99.54): step2=${step2}`);
      expect(step2).assertClose(33.18, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(2976);
      logInfo(`step3 onKeyboardHeightChange(2976): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(2304);
      logInfo(`step4 onKeyboardHeightChange(2304): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.onKeyboardHeightChange(1920);
      logInfo(`step5 onKeyboardHeightChange(1920): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(640);
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(99.54, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0176
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0176
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0176 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(137);
      logInfo(`step1 setAvoidAreaBottom(137): step1=${step1}`);
      expect(step1).assertClose(45.666666666666664, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(46);
      logInfo(`step2 setAvoidAreaBottom(46): step2=${step2}`);
      expect(step2).assertClose(15.333333333333334, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(46);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0177
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0177
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling > onKeyboardHeightChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0177 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(57);
      logInfo(`step1 contentHeight(57): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(384);
      logInfo(`step3 onKeyboardHeightChange(384): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`contentHeight>pressScaling>onKeyboardHeig...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(128);
      logInfo(`contentHeight>pressScaling>onKeyboardHeig...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling>onKeyboardHeig...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0178
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0178
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0178 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(160);
      logInfo(`step1 setAvoidAreaBottom(160): step1=${step1}`);
      expect(step1).assertClose(53.333333333333336, PRECISION);
      const step2: number = subject.contentHeight(323.3);
      logInfo(`step2 contentHeight(323.3): step2=${step2}`);
      expect(step2).assertClose(213.9666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom>contentHeight final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(160);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0179
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0179
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > contentHeight > onKeyboardHeightChange > p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0179 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-1298);
      logInfo(`step1 onKeyboardHeightChange(-1298): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.contentHeight(-112);
      logInfo(`step2 contentHeight(-112): step2=${step2}`);
      expect(step2).assertClose(264.6666666666667, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(3072);
      logInfo(`step3 onKeyboardHeightChange(3072): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.onKeyboardHeightChange(3759);
      logInfo(`step5 onKeyboardHeightChange(3759): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>contentHeight>onKe...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1253);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0180
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0180
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > contentHeight > pressScaling > contentHeight keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0180 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(504.23);
      logInfo(`step2 contentHeight(504.23): step2=${step2}`);
      expect(step2).assertClose(448.23, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.contentHeight(3456);
      logInfo(`step4 contentHeight(3456): step4=${step4}`);
      expect(step4).assertEqual(3400);
      logInfo(`pressLiftUp>contentHeight>pressScaling>co...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>contentHeight>pressScaling>co...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0181
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0181
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0181 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(642.09);
      logInfo(`step1 onKeyboardHeightChange(642.09): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(3);
      logInfo(`step2 setAvoidAreaBottom(3): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(214.03, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0182
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0182
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling > setAvoidAreaBottom > pressScaling > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0182 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(10);
      logInfo(`step1 contentHeight(10): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(194);
      logInfo(`step3 setAvoidAreaBottom(194): step3=${step3}`);
      expect(step3).assertClose(64.66666666666667, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.setAvoidAreaBottom(-52);
      logInfo(`step5 setAvoidAreaBottom(-52): step5=${step5}`);
      expect(step5).assertClose(-17.333333333333332, PRECISION);
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`contentHeight>pressScaling>setAvoidAreaBo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-52);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0183
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0183
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > pressLiftUp > setAvoidAreaBotto...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0183 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(145);
      logInfo(`step2 setAvoidAreaBottom(145): step2=${step2}`);
      expect(step2).assertClose(48.333333333333336, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.setAvoidAreaBottom(141);
      logInfo(`step4 setAvoidAreaBottom(141): step4=${step4}`);
      expect(step4).assertEqual(47);
      logInfo(`pressScaling>setAvoidAreaBottom>pressLift...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(141);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0184
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0184
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0184 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(65);
      logInfo(`step1 setAvoidAreaBottom(65): step1=${step1}`);
      expect(step1).assertClose(21.666666666666668, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(2208);
      logInfo(`step2 onKeyboardHeightChange(2208): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(736);
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(65);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0185
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0185
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > pressLiftUp > onKeyboardHei...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0185 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(720);
      logInfo(`step2 onKeyboardHeightChange(720): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(3759);
      logInfo(`step4 onKeyboardHeightChange(3759): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>press...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1253);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0186
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0186
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > onKeyboardHeightChange keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0186 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(385.71);
      logInfo(`step1 onKeyboardHeightChange(385.71): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(528.91);
      logInfo(`step3 onKeyboardHeightChange(528.91): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>pressLiftUp>onKeyb...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(176.3033333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0187
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0187
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0187 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(187);
      logInfo(`step1 setAvoidAreaBottom(187): step1=${step1}`);
      expect(step1).assertClose(62.333333333333336, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>pressScaling final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(187);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0188
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0188
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > contentHeight > conte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0188 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(3168);
      logInfo(`step1 onKeyboardHeightChange(3168): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(114);
      logInfo(`step2 setAvoidAreaBottom(114): step2=${step2}`);
      expect(step2).assertEqual(38);
      const step3: number = subject.contentHeight(-213);
      logInfo(`step3 contentHeight(-213): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.contentHeight(960);
      logInfo(`step4 contentHeight(960): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1056);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(114);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0189
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0189
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > contentHeight > contentHeig...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0189 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(13.04);
      logInfo(`step2 onKeyboardHeightChange(13.04): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.contentHeight(556.05);
      logInfo(`step3 contentHeight(556.05): step3=${step3}`);
      expect(step3).assertClose(495.70333333333326, PRECISION);
      const step4: number = subject.contentHeight(1337);
      logInfo(`step4 contentHeight(1337): step4=${step4}`);
      expect(step4).assertClose(1276.6533333333334, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(4.346666666666667, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>conte...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0190
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0190
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > pressLiftUp > pressLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0190 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1028.52);
      logInfo(`step1 onKeyboardHeightChange(1028.52): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(100);
      logInfo(`step2 setAvoidAreaBottom(100): step2=${step2}`);
      expect(step2).assertClose(33.333333333333336, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(342.84, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(100);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0191
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0191
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > contentHeight > contentHeight > setAv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0191 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(-361);
      logInfo(`step1 contentHeight(-361): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(360);
      logInfo(`step3 contentHeight(360): step3=${step3}`);
      expect(step3).assertEqual(304);
      const step4: number = subject.contentHeight(2616);
      logInfo(`step4 contentHeight(2616): step4=${step4}`);
      expect(step4).assertEqual(2560);
      const step5: number = subject.setAvoidAreaBottom(195);
      logInfo(`step5 setAvoidAreaBottom(195): step5=${step5}`);
      expect(step5).assertEqual(65);
      logInfo(`contentHeight>pressLiftUp>contentHeight>c...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(195);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0192
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0192
     * @tc.desc      KeyboardAvoidState call flow contentHeight > contentHeight > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0192 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3380);
      logInfo(`step1 contentHeight(3380): step1=${step1}`);
      expect(step1).assertEqual(3324);
      const step2: number = subject.contentHeight(2112);
      logInfo(`step2 contentHeight(2112): step2=${step2}`);
      expect(step2).assertEqual(2056);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0193
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0193
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressScaling > pressScaling > setAvoidAreaBottom > pr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0193 begin`);
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
      const step4: number = subject.setAvoidAreaBottom(151);
      logInfo(`step4 setAvoidAreaBottom(151): step4=${step4}`);
      expect(step4).assertClose(50.333333333333336, PRECISION);
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pressLiftUp>pressScaling>pressScaling>set...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>pressScaling>pressScaling>set...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressLiftUp>pressScaling>pressScaling>set...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(151);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0194
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0194
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > onKeyboardHeightChange keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0194 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(1632);
      logInfo(`step2 onKeyboardHeightChange(1632): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(1196.57);
      logInfo(`step3 onKeyboardHeightChange(1196.57): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>onKey...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(398.8566666666666, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>onKey...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>onKey...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0195
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0195
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > onKeyboardHeightC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0195 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(2466);
      logInfo(`step1 onKeyboardHeightChange(2466): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(3744);
      logInfo(`step2 onKeyboardHeightChange(3744): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(1536.42);
      logInfo(`step3 onKeyboardHeightChange(1536.42): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(1070.49);
      logInfo(`step4 onKeyboardHeightChange(1070.49): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.onKeyboardHeightChange(1070.49);
      logInfo(`step5 onKeyboardHeightChange(1070.49): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(356.83, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0196
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0196
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0196 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(762.23);
      logInfo(`step2 onKeyboardHeightChange(762.23): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(254.07666666666668, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0197
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0197
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0197 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1536.42);
      logInfo(`step1 onKeyboardHeightChange(1536.42): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(512.14, PRECISION);
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0198
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0198
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > contentHeight > onKeyboardHeightChange > p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0198 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-1371);
      logInfo(`step1 onKeyboardHeightChange(-1371): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.contentHeight(-935);
      logInfo(`step2 contentHeight(-935): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.onKeyboardHeightChange(762.23);
      logInfo(`step3 onKeyboardHeightChange(762.23): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>contentHeight>onKe...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(254.07666666666668, PRECISION);
      logInfo(`onKeyboardHeightChange>contentHeight>onKe...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>contentHeight>onKe...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0199
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0199
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling > setAvoidAreaBottom > pressL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0199 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1951);
      logInfo(`step1 onKeyboardHeightChange(1951): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(-15);
      logInfo(`step3 setAvoidAreaBottom(-15): step3=${step3}`);
      expect(step3).assertEqual(-5);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.contentHeight(-1758);
      logInfo(`step5 contentHeight(-1758): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`onKeyboardHeightChange>pressScaling>setAv...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(650.3333333333334, PRECISION);
      logInfo(`onKeyboardHeightChange>pressScaling>setAv...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-15);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0200
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0200
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0200 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(904);
      logInfo(`step1 contentHeight(904): step1=${step1}`);
      expect(step1).assertEqual(848);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0201
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0201
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0201 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(3264);
      logInfo(`step2 contentHeight(3264): step2=${step2}`);
      expect(step2).assertEqual(3208);
      logInfo(`pressScaling>contentHeight final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0202
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0202
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > contentHeight > pressScaling ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0202 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(166);
      logInfo(`step2 setAvoidAreaBottom(166): step2=${step2}`);
      expect(step2).assertClose(55.333333333333336, PRECISION);
      const step3: number = subject.contentHeight(225);
      logInfo(`step3 contentHeight(225): step3=${step3}`);
      expect(step3).assertClose(113.66666666666666, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>contentHe...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom>contentHe...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>contentHe...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(166);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0203
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0203
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > onKeyboardHeightChange > setAvo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0203 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(187);
      logInfo(`step2 setAvoidAreaBottom(187): step2=${step2}`);
      expect(step2).assertClose(62.333333333333336, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(720);
      logInfo(`step3 onKeyboardHeightChange(720): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(22);
      logInfo(`step4 setAvoidAreaBottom(22): step4=${step4}`);
      expect(step4).assertClose(7.333333333333333, PRECISION);
      const step5: number = subject.contentHeight(719);
      logInfo(`step5 contentHeight(719): step5=${step5}`);
      expect(step5).assertClose(415.6666666666667, PRECISION);
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(240);
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>onKeyboar...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(22);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0204
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0204
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > pressScaling > pressScaling ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0204 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(733.32);
      logInfo(`step1 onKeyboardHeightChange(733.32): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressS...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(244.44000000000003, PRECISION);
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressS...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressLiftUp>pressS...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0205
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0205
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0205 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(-8);
      logInfo(`step2 setAvoidAreaBottom(-8): step2=${step2}`);
      expect(step2).assertClose(-2.6666666666666665, PRECISION);
      logInfo(`pressScaling>setAvoidAreaBottom final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-8);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0206
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0206
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > onKeyboardHeightChange > conte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0206 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(2496);
      logInfo(`step1 contentHeight(2496): step1=${step1}`);
      expect(step1).assertEqual(2440);
      const step2: number = subject.setAvoidAreaBottom(44);
      logInfo(`step2 setAvoidAreaBottom(44): step2=${step2}`);
      expect(step2).assertClose(14.666666666666666, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(-741);
      logInfo(`step3 onKeyboardHeightChange(-741): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.contentHeight(3380);
      logInfo(`step4 contentHeight(3380): step4=${step4}`);
      expect(step4).assertClose(3556.3333333333335, PRECISION);
      logInfo(`contentHeight>setAvoidAreaBottom>onKeyboa...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-247);
      logInfo(`contentHeight>setAvoidAreaBottom>onKeyboa...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(44);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0207
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0207
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange > pressScaling > setAvoidAreaB...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0207 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(2737);
      logInfo(`step2 onKeyboardHeightChange(2737): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.setAvoidAreaBottom(120);
      logInfo(`step4 setAvoidAreaBottom(120): step4=${step4}`);
      expect(step4).assertEqual(40);
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressS...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(912.3333333333334, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressS...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressS...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressS...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(120);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0208
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0208
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressScaling > contentHeight > contentHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0208 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(709.03);
      logInfo(`step3 contentHeight(709.03): step3=${step3}`);
      expect(step3).assertClose(653.03, PRECISION);
      const step4: number = subject.contentHeight(3648);
      logInfo(`step4 contentHeight(3648): step4=${step4}`);
      expect(step4).assertEqual(3592);
      logInfo(`pressScaling>pressScaling>contentHeight>c...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>pressScaling>contentHeight>c...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0209
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0209
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0209 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(2976);
      logInfo(`step2 onKeyboardHeightChange(2976): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(992);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0210
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0210
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom > setAvoidAreaBottom > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0210 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(3108);
      logInfo(`step1 onKeyboardHeightChange(3108): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(143);
      logInfo(`step2 setAvoidAreaBottom(143): step2=${step2}`);
      expect(step2).assertClose(47.666666666666664, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(-23);
      logInfo(`step3 setAvoidAreaBottom(-23): step3=${step3}`);
      expect(step3).assertClose(-7.666666666666667, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(553);
      logInfo(`step4 onKeyboardHeightChange(553): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.contentHeight(3305);
      logInfo(`step5 contentHeight(3305): step5=${step5}`);
      expect(step5).assertClose(3072.333333333333, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(184.33333333333334, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-23);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0211
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0211
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > onKeyboardHeightChange > onKeyboardHeightChang...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0211 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(75);
      logInfo(`step1 setAvoidAreaBottom(75): step1=${step1}`);
      expect(step1).assertEqual(25);
      const step2: number = subject.onKeyboardHeightChange(739);
      logInfo(`step2 onKeyboardHeightChange(739): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(739);
      logInfo(`step3 onKeyboardHeightChange(739): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(246.33333333333334, PRECISION);
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(75);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0211 end`);
    });
  });
}
