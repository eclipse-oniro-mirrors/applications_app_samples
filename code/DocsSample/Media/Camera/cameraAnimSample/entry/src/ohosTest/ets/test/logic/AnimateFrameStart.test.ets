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

/** AnimateFrameStartTest logic checks (46 cases). */
export default function animateFrameStartTest(): void {
  describe('AnimateFrameStartTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0001
     * @tc.name      Camera_AnimateFrameStart_0001
     * @tc.desc      onFrameStart repeated 1 times emits 3 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateFrameStart_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0001 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=false preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0002
     * @tc.name      Camera_AnimateFrameStart_0002
     * @tc.desc      onFrameStart repeated 1 times emits 12 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0002 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=false preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0003
     * @tc.name      Camera_AnimateFrameStart_0003
     * @tc.desc      onFrameStart repeated 1 times emits 6 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0003 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=false preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0004
     * @tc.name      Camera_AnimateFrameStart_0004
     * @tc.desc      onFrameStart repeated 1 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0004 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=false preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0005
     * @tc.name      Camera_AnimateFrameStart_0005
     * @tc.desc      onFrameStart repeated 1 times emits 3 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0005 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=true preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0006
     * @tc.name      Camera_AnimateFrameStart_0006
     * @tc.desc      onFrameStart repeated 1 times emits 12 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0006 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=true preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0007
     * @tc.name      Camera_AnimateFrameStart_0007
     * @tc.desc      onFrameStart repeated 1 times emits 6 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0007 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=true preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0008
     * @tc.name      Camera_AnimateFrameStart_0008
     * @tc.desc      onFrameStart repeated 1 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0008 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      logInfo("onFrameStart x1 back=true preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0009
     * @tc.name      Camera_AnimateFrameStart_0009
     * @tc.desc      onFrameStart repeated 2 times emits 6 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0009 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=false preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0010
     * @tc.name      Camera_AnimateFrameStart_0010
     * @tc.desc      onFrameStart repeated 2 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0010 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=false preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0011
     * @tc.name      Camera_AnimateFrameStart_0011
     * @tc.desc      onFrameStart repeated 2 times emits 9 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0011 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=false preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0012
     * @tc.name      Camera_AnimateFrameStart_0012
     * @tc.desc      onFrameStart repeated 2 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateFrameStart_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0012 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=false preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0013
     * @tc.name      Camera_AnimateFrameStart_0013
     * @tc.desc      onFrameStart repeated 2 times emits 6 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0013 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=true preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0014
     * @tc.name      Camera_AnimateFrameStart_0014
     * @tc.desc      onFrameStart repeated 2 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0014 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=true preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0015
     * @tc.name      Camera_AnimateFrameStart_0015
     * @tc.desc      onFrameStart repeated 2 times emits 9 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0015 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=true preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0016
     * @tc.name      Camera_AnimateFrameStart_0016
     * @tc.desc      onFrameStart repeated 2 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0016 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x2 back=true preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0017
     * @tc.name      Camera_AnimateFrameStart_0017
     * @tc.desc      onFrameStart repeated 3 times emits 9 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0017 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x3 back=false preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0018
     * @tc.name      Camera_AnimateFrameStart_0018
     * @tc.desc      onFrameStart repeated 3 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateFrameStart_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0018 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x3 back=false preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0019
     * @tc.name      Camera_AnimateFrameStart_0019
     * @tc.desc      onFrameStart repeated 3 times emits 12 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0019 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x3 back=false preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0020
     * @tc.name      Camera_AnimateFrameStart_0020
     * @tc.desc      onFrameStart repeated 3 times emits 21 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0020 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x3 back=false preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0021
     * @tc.name      Camera_AnimateFrameStart_0021
     * @tc.desc      onFrameStart repeated 3 times emits 9 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0021 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x3 back=true preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0022
     * @tc.name      Camera_AnimateFrameStart_0022
     * @tc.desc      onFrameStart repeated 3 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0022 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x3 back=true preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0023
     * @tc.name      Camera_AnimateFrameStart_0023
     * @tc.desc      onFrameStart repeated 3 times emits 12 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateFrameStart_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0023 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x3 back=true preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0024
     * @tc.name      Camera_AnimateFrameStart_0024
     * @tc.desc      onFrameStart repeated 4 times emits 12 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0024 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=false preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0025
     * @tc.name      Camera_AnimateFrameStart_0025
     * @tc.desc      onFrameStart repeated 4 times emits 21 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0025 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=false preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0026
     * @tc.name      Camera_AnimateFrameStart_0026
     * @tc.desc      onFrameStart repeated 4 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0026 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=false preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0027
     * @tc.name      Camera_AnimateFrameStart_0027
     * @tc.desc      onFrameStart repeated 4 times emits 24 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0027 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=false preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0028
     * @tc.name      Camera_AnimateFrameStart_0028
     * @tc.desc      onFrameStart repeated 4 times emits 12 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0028 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=true preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0029
     * @tc.name      Camera_AnimateFrameStart_0029
     * @tc.desc      onFrameStart repeated 4 times emits 21 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0029 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=true preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0030
     * @tc.name      Camera_AnimateFrameStart_0030
     * @tc.desc      onFrameStart repeated 4 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0030 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=true preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0031
     * @tc.name      Camera_AnimateFrameStart_0031
     * @tc.desc      onFrameStart repeated 4 times emits 24 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0031 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x4 back=true preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0032
     * @tc.name      Camera_AnimateFrameStart_0032
     * @tc.desc      onFrameStart repeated 5 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0032 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=false preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0033
     * @tc.name      Camera_AnimateFrameStart_0033
     * @tc.desc      onFrameStart repeated 5 times emits 24 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0033 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=false preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0034
     * @tc.name      Camera_AnimateFrameStart_0034
     * @tc.desc      onFrameStart repeated 5 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateFrameStart_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0034 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=false preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0035
     * @tc.name      Camera_AnimateFrameStart_0035
     * @tc.desc      onFrameStart repeated 5 times emits 27 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateFrameStart_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0035 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=false preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "27");
      expect(actual).assertEqual(27);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0036
     * @tc.name      Camera_AnimateFrameStart_0036
     * @tc.desc      onFrameStart repeated 5 times emits 15 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0036 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=true preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0037
     * @tc.name      Camera_AnimateFrameStart_0037
     * @tc.desc      onFrameStart repeated 5 times emits 24 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0037 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=true preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0038
     * @tc.name      Camera_AnimateFrameStart_0038
     * @tc.desc      onFrameStart repeated 5 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0038 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=true preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0039
     * @tc.name      Camera_AnimateFrameStart_0039
     * @tc.desc      onFrameStart repeated 5 times emits 27 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0039 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x5 back=true preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "27");
      expect(actual).assertEqual(27);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0040
     * @tc.name      Camera_AnimateFrameStart_0040
     * @tc.desc      onFrameStart repeated 6 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0040 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x6 back=false preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0041
     * @tc.name      Camera_AnimateFrameStart_0041
     * @tc.desc      onFrameStart repeated 6 times emits 27 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0041 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x6 back=false preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "27");
      expect(actual).assertEqual(27);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0042
     * @tc.name      Camera_AnimateFrameStart_0042
     * @tc.desc      onFrameStart repeated 6 times emits 21 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0042 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x6 back=false preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0043
     * @tc.name      Camera_AnimateFrameStart_0043
     * @tc.desc      onFrameStart repeated 6 times emits 30 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0043 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x6 back=false preMode=true preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0044
     * @tc.name      Camera_AnimateFrameStart_0044
     * @tc.desc      onFrameStart repeated 6 times emits 18 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0044 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x6 back=true preMode=false preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0045
     * @tc.name      Camera_AnimateFrameStart_0045
     * @tc.desc      onFrameStart repeated 6 times emits 27 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateFrameStart_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0045 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x6 back=true preMode=false preSwitch=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "27");
      expect(actual).assertEqual(27);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_FRAME_START_0046
     * @tc.name      Camera_AnimateFrameStart_0046
     * @tc.desc      onFrameStart repeated 6 times emits 21 steps and leaves blur off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateFrameStart_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateFrameStart_0046 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("onFrameStart x6 back=true preMode=true preSwitch=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateFrameStart_0046 end`);
    });
  });
}
