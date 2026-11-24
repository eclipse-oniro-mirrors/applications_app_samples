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
    it('Camera_AnimateModeSwitch_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0007 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("onModeChange x1 back=true preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0008
     * @tc.name      Camera_AnimateModeSwitch_0008
     * @tc.desc      onModeChange repeated 1 times after a frame start a capture emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0008 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("onModeChange x1 back=true preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0009
     * @tc.name      Camera_AnimateModeSwitch_0009
     * @tc.desc      onModeChange repeated 2 times after emits 6 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0009 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=false preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0010
     * @tc.name      Camera_AnimateModeSwitch_0010
     * @tc.desc      onModeChange repeated 2 times after a capture emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0010 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=false preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0011
     * @tc.name      Camera_AnimateModeSwitch_0011
     * @tc.desc      onModeChange repeated 2 times after a frame start emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0011 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=false preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0012
     * @tc.name      Camera_AnimateModeSwitch_0012
     * @tc.desc      onModeChange repeated 2 times after a frame start a capture emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateModeSwitch_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0012 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=false preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0013
     * @tc.name      Camera_AnimateModeSwitch_0013
     * @tc.desc      onModeChange repeated 2 times after emits 6 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0013 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=true preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0014
     * @tc.name      Camera_AnimateModeSwitch_0014
     * @tc.desc      onModeChange repeated 2 times after a capture emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0014 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=true preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0015
     * @tc.name      Camera_AnimateModeSwitch_0015
     * @tc.desc      onModeChange repeated 2 times after a frame start emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0015 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=true preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0016
     * @tc.name      Camera_AnimateModeSwitch_0016
     * @tc.desc      onModeChange repeated 2 times after a frame start a capture emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0016 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x2 back=true preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0017
     * @tc.name      Camera_AnimateModeSwitch_0017
     * @tc.desc      onModeChange repeated 3 times after emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0017 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x3 back=false preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0018
     * @tc.name      Camera_AnimateModeSwitch_0018
     * @tc.desc      onModeChange repeated 3 times after a capture emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateModeSwitch_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0018 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x3 back=false preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0019
     * @tc.name      Camera_AnimateModeSwitch_0019
     * @tc.desc      onModeChange repeated 3 times after a frame start emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0019 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x3 back=false preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0020
     * @tc.name      Camera_AnimateModeSwitch_0020
     * @tc.desc      onModeChange repeated 3 times after a frame start a capture emits 15 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0020 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x3 back=false preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0021
     * @tc.name      Camera_AnimateModeSwitch_0021
     * @tc.desc      onModeChange repeated 3 times after emits 9 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0021 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x3 back=true preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0022
     * @tc.name      Camera_AnimateModeSwitch_0022
     * @tc.desc      onModeChange repeated 3 times after a capture emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0022 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x3 back=true preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0023
     * @tc.name      Camera_AnimateModeSwitch_0023
     * @tc.desc      onModeChange repeated 3 times after a frame start emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateModeSwitch_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0023 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x3 back=true preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0024
     * @tc.name      Camera_AnimateModeSwitch_0024
     * @tc.desc      onModeChange repeated 4 times after emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0024 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=false preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0025
     * @tc.name      Camera_AnimateModeSwitch_0025
     * @tc.desc      onModeChange repeated 4 times after a capture emits 15 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0025 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=false preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0026
     * @tc.name      Camera_AnimateModeSwitch_0026
     * @tc.desc      onModeChange repeated 4 times after a frame start emits 15 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0026 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=false preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0027
     * @tc.name      Camera_AnimateModeSwitch_0027
     * @tc.desc      onModeChange repeated 4 times after a frame start a capture emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0027 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=false preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0028
     * @tc.name      Camera_AnimateModeSwitch_0028
     * @tc.desc      onModeChange repeated 4 times after emits 12 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0028 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=true preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0029
     * @tc.name      Camera_AnimateModeSwitch_0029
     * @tc.desc      onModeChange repeated 4 times after a capture emits 15 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0029 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=true preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0030
     * @tc.name      Camera_AnimateModeSwitch_0030
     * @tc.desc      onModeChange repeated 4 times after a frame start emits 15 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0030 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=true preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0031
     * @tc.name      Camera_AnimateModeSwitch_0031
     * @tc.desc      onModeChange repeated 4 times after a frame start a capture emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0031 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x4 back=true preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0032
     * @tc.name      Camera_AnimateModeSwitch_0032
     * @tc.desc      onModeChange repeated 5 times after emits 15 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0032 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=false preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0033
     * @tc.name      Camera_AnimateModeSwitch_0033
     * @tc.desc      onModeChange repeated 5 times after a capture emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0033 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=false preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0034
     * @tc.name      Camera_AnimateModeSwitch_0034
     * @tc.desc      onModeChange repeated 5 times after a frame start emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateModeSwitch_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0034 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=false preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0035
     * @tc.name      Camera_AnimateModeSwitch_0035
     * @tc.desc      onModeChange repeated 5 times after a frame start a capture emits 21 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateModeSwitch_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0035 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=false preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0036
     * @tc.name      Camera_AnimateModeSwitch_0036
     * @tc.desc      onModeChange repeated 5 times after emits 15 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0036 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=true preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0037
     * @tc.name      Camera_AnimateModeSwitch_0037
     * @tc.desc      onModeChange repeated 5 times after a capture emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0037 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=true preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0038
     * @tc.name      Camera_AnimateModeSwitch_0038
     * @tc.desc      onModeChange repeated 5 times after a frame start emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0038 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=true preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0039
     * @tc.name      Camera_AnimateModeSwitch_0039
     * @tc.desc      onModeChange repeated 5 times after a frame start a capture emits 21 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0039 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x5 back=true preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0040
     * @tc.name      Camera_AnimateModeSwitch_0040
     * @tc.desc      onModeChange repeated 6 times after emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0040 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x6 back=false preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0041
     * @tc.name      Camera_AnimateModeSwitch_0041
     * @tc.desc      onModeChange repeated 6 times after a capture emits 21 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0041 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x6 back=false preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0042
     * @tc.name      Camera_AnimateModeSwitch_0042
     * @tc.desc      onModeChange repeated 6 times after a frame start emits 21 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0042 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x6 back=false preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0043
     * @tc.name      Camera_AnimateModeSwitch_0043
     * @tc.desc      onModeChange repeated 6 times after a frame start a capture emits 24 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0043 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x6 back=false preFrame=true preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0044
     * @tc.name      Camera_AnimateModeSwitch_0044
     * @tc.desc      onModeChange repeated 6 times after emits 18 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0044 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x6 back=true preFrame=false preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0045
     * @tc.name      Camera_AnimateModeSwitch_0045
     * @tc.desc      onModeChange repeated 6 times after a capture emits 21 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateModeSwitch_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0045 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x6 back=true preFrame=false preCapture=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_MODE_SWITCH_0046
     * @tc.name      Camera_AnimateModeSwitch_0046
     * @tc.desc      onModeChange repeated 6 times after a frame start emits 21 steps and keeps blur 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateModeSwitch_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateModeSwitch_0046 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("onModeChange x6 back=true preFrame=true preCapture=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateModeSwitch_0046 end`);
    });
  });
}
