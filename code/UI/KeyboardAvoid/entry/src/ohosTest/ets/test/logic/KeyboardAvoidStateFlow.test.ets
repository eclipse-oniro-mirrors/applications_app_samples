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

/** Logic checks for KeyboardAvoidState flow (54 cases). */
export default function keyboardAvoidStateFlowTest(): void {
  describe('KeyboardAvoidStateFlowTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0001
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0001
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0001 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1440);
      logInfo(`step1 onKeyboardHeightChange(1440): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(2);
      logInfo(`step2 setAvoidAreaBottom(2): step2=${step2}`);
      expect(step2).assertClose(0.6666666666666666, PRECISION);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(480);
      logInfo(`onKeyboardHeightChange>setAvoidAreaBottom...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0002
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0002
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > onKeyboardHeightChange > setAvoidArea...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0002 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3);
      logInfo(`step1 contentHeight(3): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(950);
      logInfo(`step3 onKeyboardHeightChange(950): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(188);
      logInfo(`step4 setAvoidAreaBottom(188): step4=${step4}`);
      expect(step4).assertClose(62.666666666666664, PRECISION);
      const step5: number = subject.setAvoidAreaBottom(-6);
      logInfo(`step5 setAvoidAreaBottom(-6): step5=${step5}`);
      expect(step5).assertEqual(-2);
      logInfo(`contentHeight>pressLiftUp>onKeyboardHeigh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(316.6666666666667, PRECISION);
      logInfo(`contentHeight>pressLiftUp>onKeyboardHeigh...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-6);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0003
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0003
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom > onKeyboardHeightChange > setAvoi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0003 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(2);
      logInfo(`step2 setAvoidAreaBottom(2): step2=${step2}`);
      expect(step2).assertClose(0.6666666666666666, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(739);
      logInfo(`step3 onKeyboardHeightChange(739): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(95);
      logInfo(`step4 setAvoidAreaBottom(95): step4=${step4}`);
      expect(step4).assertClose(31.666666666666668, PRECISION);
      const step5: number = subject.onKeyboardHeightChange(13.04);
      logInfo(`step5 onKeyboardHeightChange(13.04): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`pressLiftUp>setAvoidAreaBottom>onKeyboard...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(4.346666666666667, PRECISION);
      logInfo(`pressLiftUp>setAvoidAreaBottom>onKeyboard...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(95);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0004
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0004
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange > contentHeight > setAvoidArea...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0004 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(2737);
      logInfo(`step2 onKeyboardHeightChange(2737): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.contentHeight(1344);
      logInfo(`step3 contentHeight(1344): step3=${step3}`);
      expect(step3).assertClose(375.66666666666663, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(10);
      logInfo(`step4 setAvoidAreaBottom(10): step4=${step4}`);
      expect(step4).assertClose(3.3333333333333335, PRECISION);
      const step5: number = subject.onKeyboardHeightChange(762.23);
      logInfo(`step5 onKeyboardHeightChange(762.23): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange>conten...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(254.07666666666668, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange>conten...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(10);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0005
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0005
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0005 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(-40);
      logInfo(`step2 contentHeight(-40): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pressScaling>contentHeight final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0006
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0006
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0006 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(2592);
      logInfo(`step1 contentHeight(2592): step1=${step1}`);
      expect(step1).assertEqual(2536);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`contentHeight>pressScaling>pressScaling f...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling>pressScaling f...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0007
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0007
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > setAvoidAreaBottom > pressSc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0007 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(762.23);
      logInfo(`step1 onKeyboardHeightChange(762.23): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(1);
      logInfo(`step3 setAvoidAreaBottom(1): step3=${step3}`);
      expect(step3).assertClose(0.3333333333333333, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(254.07666666666668, PRECISION);
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0008
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0008
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0008 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(288);
      logInfo(`step1 onKeyboardHeightChange(288): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(96);
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0009
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0009
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange > contentHeight > pressScaling...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0009 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(1951);
      logInfo(`step2 onKeyboardHeightChange(1951): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.contentHeight(192);
      logInfo(`step3 contentHeight(192): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pressLiftUp>onKeyboardHeightChange>conten...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(650.3333333333334, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange>conten...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>onKeyboardHeightChange>conten...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0010
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0010
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange > pressLiftUp keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0010 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(3648);
      logInfo(`step2 onKeyboardHeightChange(3648): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pressLiftUp>onKeyboardHeightChange>pressL...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1216);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0011
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0011
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0011 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(394.32);
      logInfo(`step1 contentHeight(394.32): step1=${step1}`);
      expect(step1).assertClose(338.32, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`contentHeight>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0012
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0012
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0012 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(-1883);
      logInfo(`step1 contentHeight(-1883): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.setAvoidAreaBottom(40);
      logInfo(`step2 setAvoidAreaBottom(40): step2=${step2}`);
      expect(step2).assertClose(13.333333333333334, PRECISION);
      logInfo(`contentHeight>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(40);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0013
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0013
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0013 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(187);
      logInfo(`step2 setAvoidAreaBottom(187): step2=${step2}`);
      expect(step2).assertClose(62.333333333333336, PRECISION);
      logInfo(`pressLiftUp>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(187);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0014
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0014
     * @tc.desc      KeyboardAvoidState call flow contentHeight > contentHeight > onKeyboardHeightChange > setAvoidAr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0014 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(2400);
      logInfo(`step1 contentHeight(2400): step1=${step1}`);
      expect(step1).assertEqual(2344);
      const step2: number = subject.contentHeight(1827);
      logInfo(`step2 contentHeight(1827): step2=${step2}`);
      expect(step2).assertEqual(1771);
      const step3: number = subject.onKeyboardHeightChange(3264);
      logInfo(`step3 onKeyboardHeightChange(3264): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.setAvoidAreaBottom(181);
      logInfo(`step4 setAvoidAreaBottom(181): step4=${step4}`);
      expect(step4).assertClose(60.333333333333336, PRECISION);
      const step5: boolean = subject.pressLiftUp();
      logInfo(`step5 pressLiftUp(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`contentHeight>contentHeight>onKeyboardHei...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1088);
      logInfo(`contentHeight>contentHeight>onKeyboardHei...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(181);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0015
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0015
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressScaling > onKeyboardHeightChange > co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0015 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(3648);
      logInfo(`step1 onKeyboardHeightChange(3648): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(1920);
      logInfo(`step3 onKeyboardHeightChange(1920): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.contentHeight(1318);
      logInfo(`step4 contentHeight(1318): step4=${step4}`);
      expect(step4).assertEqual(622);
      logInfo(`onKeyboardHeightChange>pressScaling>onKey...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(640);
      logInfo(`onKeyboardHeightChange>pressScaling>onKey...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>pressScaling>onKey...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0016
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0016
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > onKeyboardHeightC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0016 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-569);
      logInfo(`step1 onKeyboardHeightChange(-569): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.onKeyboardHeightChange(-115);
      logInfo(`step2 onKeyboardHeightChange(-115): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.onKeyboardHeightChange(2121);
      logInfo(`step3 onKeyboardHeightChange(2121): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(864);
      logInfo(`step4 onKeyboardHeightChange(864): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(288);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0017
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0017
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > contentHeight > setAvoidAreaBottom > pressScaling kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0017 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(3051);
      logInfo(`step2 contentHeight(3051): step2=${step2}`);
      expect(step2).assertEqual(2995);
      const step3: number = subject.setAvoidAreaBottom(90);
      logInfo(`step3 setAvoidAreaBottom(90): step3=${step3}`);
      expect(step3).assertEqual(30);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pressLiftUp>contentHeight>setAvoidAreaBot...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>contentHeight>setAvoidAreaBot...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressLiftUp>contentHeight>setAvoidAreaBot...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(90);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0018
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0018
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > pressScaling > pressLiftUp > pressSc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0018 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(1752);
      logInfo(`step2 contentHeight(1752): step2=${step2}`);
      expect(step2).assertEqual(1696);
      const step3: boolean = subject.pressScaling();
      logInfo(`step3 pressScaling(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pressScaling>contentHeight>pressScaling>p...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight>pressScaling>p...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0019
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0019
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > contentHeight > contentHeight > press...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0019 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(225);
      logInfo(`step1 contentHeight(225): step1=${step1}`);
      expect(step1).assertEqual(169);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(56);
      logInfo(`step3 contentHeight(56): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.contentHeight(323.3);
      logInfo(`step4 contentHeight(323.3): step4=${step4}`);
      expect(step4).assertClose(267.3, PRECISION);
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`contentHeight>pressLiftUp>contentHeight>c...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressLiftUp>contentHeight>c...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0020
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0020
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0020 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`pressScaling>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0021
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0021
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > setAvoidAreaBottom > pressS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0021 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(1);
      logInfo(`step2 onKeyboardHeightChange(1): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(34.68);
      logInfo(`step3 setAvoidAreaBottom(34.68): step3=${step3}`);
      expect(step3).assertClose(11.56, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(0.3333333333333333, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(34.68, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0022
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0022
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressScaling > setAvoidAreaBottom > pressLiftUp > set...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0022 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(170);
      logInfo(`step3 setAvoidAreaBottom(170): step3=${step3}`);
      expect(step3).assertClose(56.666666666666664, PRECISION);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.setAvoidAreaBottom(43.17);
      logInfo(`step5 setAvoidAreaBottom(43.17): step5=${step5}`);
      expect(step5).assertClose(14.39, PRECISION);
      logInfo(`pressLiftUp>pressScaling>setAvoidAreaBott...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(43.17, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0023
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0023
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > onKeyboardHeightChange > setAvoidAreaBottom > onKeybo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0023 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(-1);
      logInfo(`step2 onKeyboardHeightChange(-1): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.setAvoidAreaBottom(3);
      logInfo(`step3 setAvoidAreaBottom(3): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.onKeyboardHeightChange(317.84);
      logInfo(`step4 onKeyboardHeightChange(317.84): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: number = subject.onKeyboardHeightChange(1951);
      logInfo(`step5 onKeyboardHeightChange(1951): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange>setAvo...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(650.3333333333334, PRECISION);
      logInfo(`pressLiftUp>onKeyboardHeightChange>setAvo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0024
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0024
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > pressLiftUp keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0024 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(-569);
      logInfo(`step2 onKeyboardHeightChange(-569): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`pressScaling>onKeyboardHeightChange>press...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-189.66666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0025
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0025
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > setAvoidAreaBottom keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0025 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(8.1);
      logInfo(`step2 setAvoidAreaBottom(8.1): step2=${step2}`);
      expect(step2).assertClose(2.6999999999999997, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(63);
      logInfo(`step3 setAvoidAreaBottom(63): step3=${step3}`);
      expect(step3).assertEqual(21);
      logInfo(`pressScaling>setAvoidAreaBottom>setAvoidA...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom>setAvoidA...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>setAvoidA...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(63);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0026
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0026
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0026 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(49);
      logInfo(`step1 setAvoidAreaBottom(49): step1=${step1}`);
      expect(step1).assertClose(16.333333333333332, PRECISION);
      const step2: number = subject.setAvoidAreaBottom(188);
      logInfo(`step2 setAvoidAreaBottom(188): step2=${step2}`);
      expect(step2).assertClose(62.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom>setAvoidAreaBottom final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(188);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0027
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0027
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > setAvoidAreaBottom keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0027 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(3);
      logInfo(`step2 onKeyboardHeightChange(3): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(115);
      logInfo(`step3 setAvoidAreaBottom(115): step3=${step3}`);
      expect(step3).assertClose(38.333333333333336, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1);
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>onKeyboardHeightChange>setAv...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(115);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0028
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0028
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0028 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3360);
      logInfo(`step1 contentHeight(3360): step1=${step1}`);
      expect(step1).assertEqual(3304);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`contentHeight>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0029
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0029
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > onKeyboardHeightChange > onKeyboardH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0029 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(2844);
      logInfo(`step2 contentHeight(2844): step2=${step2}`);
      expect(step2).assertEqual(2788);
      const step3: number = subject.onKeyboardHeightChange(3360);
      logInfo(`step3 onKeyboardHeightChange(3360): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.onKeyboardHeightChange(1728);
      logInfo(`step4 onKeyboardHeightChange(1728): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(576);
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight>onKeyboardHeig...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0030
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0030
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > onKeyboardHeightChange keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0030 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(2017);
      logInfo(`step2 onKeyboardHeightChange(2017): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.onKeyboardHeightChange(2400);
      logInfo(`step3 onKeyboardHeightChange(2400): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>onKey...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(800);
      logInfo(`pressScaling>onKeyboardHeightChange>onKey...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>onKeyboardHeightChange>onKey...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0031
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0031
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0031 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(-46);
      logInfo(`step1 setAvoidAreaBottom(-46): step1=${step1}`);
      expect(step1).assertClose(-15.333333333333334, PRECISION);
      const step2: number = subject.contentHeight(65);
      logInfo(`step2 contentHeight(65): step2=${step2}`);
      expect(step2).assertClose(24.33333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom>contentHeight final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-46);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0032
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0032
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > contentHeight > setAvoidAreaBottom > contentHe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0032 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(8.1);
      logInfo(`step1 setAvoidAreaBottom(8.1): step1=${step1}`);
      expect(step1).assertClose(2.6999999999999997, PRECISION);
      const step2: number = subject.contentHeight(720);
      logInfo(`step2 contentHeight(720): step2=${step2}`);
      expect(step2).assertClose(661.3, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(40);
      logInfo(`step3 setAvoidAreaBottom(40): step3=${step3}`);
      expect(step3).assertClose(13.333333333333334, PRECISION);
      const step4: number = subject.contentHeight(504.23);
      logInfo(`step4 contentHeight(504.23): step4=${step4}`);
      expect(step4).assertClose(434.8966666666667, PRECISION);
      logInfo(`setAvoidAreaBottom>contentHeight>setAvoid...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(40);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0033
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0033
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressLiftUp > contentHeight > contentHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0033 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3456);
      logInfo(`step1 contentHeight(3456): step1=${step1}`);
      expect(step1).assertEqual(3400);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(1318);
      logInfo(`step3 contentHeight(1318): step3=${step3}`);
      expect(step3).assertEqual(1262);
      const step4: number = subject.contentHeight(1824);
      logInfo(`step4 contentHeight(1824): step4=${step4}`);
      expect(step4).assertEqual(1768);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0034
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0034
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > pressLiftUp > pressLiftUp >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0034 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.onKeyboardHeightChange(3648);
      logInfo(`step2 onKeyboardHeightChange(3648): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.contentHeight(1080);
      logInfo(`step5 contentHeight(1080): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pressScaling>onKeyboardHeightChange>press...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1216);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0035
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0035
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0035 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(57);
      logInfo(`step2 contentHeight(57): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`pressScaling>contentHeight final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0036
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0036
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange > contentHeight > s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0036 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(1);
      logInfo(`step1 onKeyboardHeightChange(1): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(1028.52);
      logInfo(`step2 onKeyboardHeightChange(1028.52): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.contentHeight(-1489);
      logInfo(`step3 contentHeight(-1489): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.setAvoidAreaBottom(49);
      logInfo(`step4 setAvoidAreaBottom(49): step4=${step4}`);
      expect(step4).assertClose(16.333333333333332, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(342.84, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(49);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0037
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0037
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0037 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(2496);
      logInfo(`step2 contentHeight(2496): step2=${step2}`);
      expect(step2).assertEqual(2440);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0038
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0038
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressScaling > onKeyboardHeightChange > pressScaling ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0038 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(2016);
      logInfo(`step3 onKeyboardHeightChange(2016): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressScaling();
      logInfo(`step4 pressScaling(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`pressLiftUp>pressScaling>onKeyboardHeight...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(672);
      logInfo(`pressLiftUp>pressScaling>onKeyboardHeight...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>pressScaling>onKeyboardHeight...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0039
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0039
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressScaling > onKeyboardHeightChange > pressLiftUp >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0039 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.onKeyboardHeightChange(317.84);
      logInfo(`step3 onKeyboardHeightChange(317.84): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pressLiftUp>pressScaling>onKeyboardHeight...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(105.94666666666666, PRECISION);
      logInfo(`pressLiftUp>pressScaling>onKeyboardHeight...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressLiftUp>pressScaling>onKeyboardHeight...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0040
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0040
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0040 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(63);
      logInfo(`step1 setAvoidAreaBottom(63): step1=${step1}`);
      expect(step1).assertEqual(21);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`setAvoidAreaBottom>pressLiftUp final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(63);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0041
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0041
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0041 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(150);
      logInfo(`step1 setAvoidAreaBottom(150): step1=${step1}`);
      expect(step1).assertEqual(50);
      const step2: number = subject.onKeyboardHeightChange(1080);
      logInfo(`step2 onKeyboardHeightChange(1080): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(360);
      logInfo(`setAvoidAreaBottom>onKeyboardHeightChange...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(150);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0042
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0042
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > onKeyboardHeightChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0042 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(-1298);
      logInfo(`step1 onKeyboardHeightChange(-1298): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.onKeyboardHeightChange(1536);
      logInfo(`step2 onKeyboardHeightChange(1536): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange>onKeyboardHeightCh...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(512);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0043
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0043
     * @tc.desc      KeyboardAvoidState call flow pressScaling > pressLiftUp > setAvoidAreaBottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0043 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(6);
      logInfo(`step3 setAvoidAreaBottom(6): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`pressScaling>pressLiftUp>setAvoidAreaBott...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(6);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0044
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0044
     * @tc.desc      KeyboardAvoidState call flow contentHeight > onKeyboardHeightChange > setAvoidAreaBottom > onKey...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0044 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1002.5);
      logInfo(`step1 contentHeight(1002.5): step1=${step1}`);
      expect(step1).assertClose(946.5, PRECISION);
      const step2: number = subject.onKeyboardHeightChange(3840);
      logInfo(`step2 onKeyboardHeightChange(3840): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.setAvoidAreaBottom(78);
      logInfo(`step3 setAvoidAreaBottom(78): step3=${step3}`);
      expect(step3).assertEqual(26);
      const step4: number = subject.onKeyboardHeightChange(3582);
      logInfo(`step4 onKeyboardHeightChange(3582): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1194);
      logInfo(`contentHeight>onKeyboardHeightChange>setA...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(78);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0045
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0045
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0045 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(159);
      logInfo(`step1 setAvoidAreaBottom(159): step1=${step1}`);
      expect(step1).assertEqual(53);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`setAvoidAreaBottom>pressLiftUp final: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(159);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0046
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0046
     * @tc.desc      KeyboardAvoidState call flow pressScaling > contentHeight > setAvoidAreaBottom keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0046 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.contentHeight(960);
      logInfo(`step2 contentHeight(960): step2=${step2}`);
      expect(step2).assertEqual(904);
      const step3: number = subject.setAvoidAreaBottom(110);
      logInfo(`step3 setAvoidAreaBottom(110): step3=${step3}`);
      expect(step3).assertClose(36.666666666666664, PRECISION);
      logInfo(`pressScaling>contentHeight>setAvoidAreaBo...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>contentHeight>setAvoidAreaBo...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>contentHeight>setAvoidAreaBo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(110);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0047
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0047
     * @tc.desc      KeyboardAvoidState call flow contentHeight > pressScaling keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0047 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(1152);
      logInfo(`step1 contentHeight(1152): step1=${step1}`);
      expect(step1).assertEqual(1096);
      const step2: boolean = subject.pressScaling();
      logInfo(`step2 pressScaling(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`contentHeight>pressScaling final: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`contentHeight>pressScaling final: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0048
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0048
     * @tc.desc      KeyboardAvoidState call flow contentHeight > setAvoidAreaBottom > pressLiftUp > pressLiftUp keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0048 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(-213);
      logInfo(`step1 contentHeight(-213): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.setAvoidAreaBottom(-73);
      logInfo(`step2 setAvoidAreaBottom(-73): step2=${step2}`);
      expect(step2).assertClose(-24.333333333333332, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`contentHeight>setAvoidAreaBottom>pressLif...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-73);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0049
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0049
     * @tc.desc      KeyboardAvoidState call flow pressLiftUp > pressLiftUp > pressLiftUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0049 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressLiftUp();
      logInfo(`step1 pressLiftUp(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0050
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0050
     * @tc.desc      KeyboardAvoidState call flow pressScaling > onKeyboardHeightChange > pressLiftUp > pressLiftUp >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0050 begin`);
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
      const step4: boolean = subject.pressLiftUp();
      logInfo(`step4 pressLiftUp(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.onKeyboardHeightChange(855);
      logInfo(`step5 onKeyboardHeightChange(855): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`pressScaling>onKeyboardHeightChange>press...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(285);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0051
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0051
     * @tc.desc      KeyboardAvoidState call flow setAvoidAreaBottom > pressLiftUp > contentHeight > contentHeight ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0051 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.setAvoidAreaBottom(195);
      logInfo(`step1 setAvoidAreaBottom(195): step1=${step1}`);
      expect(step1).assertEqual(65);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.contentHeight(-1758);
      logInfo(`step3 contentHeight(-1758): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.contentHeight(1827);
      logInfo(`step4 contentHeight(1827): step4=${step4}`);
      expect(step4).assertEqual(1706);
      logInfo(`setAvoidAreaBottom>pressLiftUp>contentHei...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(195);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0052
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0052
     * @tc.desc      KeyboardAvoidState call flow onKeyboardHeightChange > pressLiftUp > setAvoidAreaBottom > content...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0052 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.onKeyboardHeightChange(762.23);
      logInfo(`step1 onKeyboardHeightChange(762.23): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.pressLiftUp();
      logInfo(`step2 pressLiftUp(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.setAvoidAreaBottom(54);
      logInfo(`step3 setAvoidAreaBottom(54): step3=${step3}`);
      expect(step3).assertEqual(18);
      const step4: number = subject.contentHeight(1411.25);
      logInfo(`step4 contentHeight(1411.25): step4=${step4}`);
      expect(step4).assertClose(1083.1733333333334, PRECISION);
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(254.07666666666668, PRECISION);
      logInfo(`onKeyboardHeightChange>pressLiftUp>setAvo...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(54);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0053
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0053
     * @tc.desc      KeyboardAvoidState call flow contentHeight > contentHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0053 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: number = subject.contentHeight(3552);
      logInfo(`step1 contentHeight(3552): step1=${step1}`);
      expect(step1).assertEqual(3496);
      const step2: number = subject.contentHeight(3051);
      logInfo(`step2 contentHeight(3051): step2=${step2}`);
      expect(step2).assertEqual(2995);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_FLOW_0054
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateFlow_0054
     * @tc.desc      KeyboardAvoidState call flow pressScaling > setAvoidAreaBottom > pressLiftUp > onKeyboardHeightC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0054 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const step1: boolean = subject.pressScaling();
      logInfo(`step1 pressScaling(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.setAvoidAreaBottom(65);
      logInfo(`step2 setAvoidAreaBottom(65): step2=${step2}`);
      expect(step2).assertClose(21.666666666666668, PRECISION);
      const step3: boolean = subject.pressLiftUp();
      logInfo(`step3 pressLiftUp(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.onKeyboardHeightChange(196.35);
      logInfo(`step4 onKeyboardHeightChange(196.35): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: boolean = subject.pressScaling();
      logInfo(`step5 pressScaling(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>pressLift...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(65.45, PRECISION);
      logInfo(`pressScaling>setAvoidAreaBottom>pressLift...: subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertFalse();
      logInfo(`pressScaling>setAvoidAreaBottom>pressLift...: subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertTrue();
      logInfo(`pressScaling>setAvoidAreaBottom>pressLift...: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(65);
      logInfo(`${BUNDLE}KeyboardAvoidStateFlow_0054 end`);
    });
  });
}
