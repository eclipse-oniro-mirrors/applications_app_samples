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
import { logInfo, BUNDLE } from '../common/CameraTestSupport';
import {
  AnimateModel,
} from '../model/CameraLogic';

/** AnimateModeSwitchTest logic checks (46 cases). */
export default function animateModeSwitchTest(): void {
  describe('AnimateModeSwitchTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0001
     * @tc.name      Camera_AnimateModeSwitch_0001
     * @tc.desc      onModeChange repeated 1 times after emits 3 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateModeSwitch_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0001 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      logInfo("onModeChange x1 back=false preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0002
     * @tc.name      Camera_AnimateModeSwitch_0002
     * @tc.desc      onModeChange repeated 1 times after a capture emits 6 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0002 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("onModeChange x1 back=false preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0003
     * @tc.name      Camera_AnimateModeSwitch_0003
     * @tc.desc      onModeChange repeated 1 times after a frame start emits 6 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0003 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("onModeChange x1 back=false preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0004
     * @tc.name      Camera_AnimateModeSwitch_0004
     * @tc.desc      onModeChange repeated 1 times after a frame start a capture emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0004 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("onModeChange x1 back=false preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0005
     * @tc.name      Camera_AnimateModeSwitch_0005
     * @tc.desc      onModeChange repeated 1 times after emits 3 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0005 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      logInfo("onModeChange x1 back=true preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0006
     * @tc.name      Camera_AnimateModeSwitch_0006
     * @tc.desc      onModeChange repeated 1 times after a capture emits 6 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0006 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("onModeChange x1 back=true preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0007
     * @tc.name      Camera_AnimateModeSwitch_0007
     * @tc.desc      onModeChange repeated 1 times after a frame start emits 6 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
