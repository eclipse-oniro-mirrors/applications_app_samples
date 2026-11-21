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

/** AnimateSequenceTest logic checks (35 cases). */
export default function animateSequenceTest(): void {
  describe('AnimateSequenceTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0001
     * @tc.name      Camera_AnimateSequence_0001
     * @tc.desc      animate ops mode>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateSequence_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateSequence_0001 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onModeChange();
      logInfo("steps after mode>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0002
     * @tc.name      Camera_AnimateSequence_0002
     * @tc.desc      animate ops mode>mode>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0002 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("steps after mode>mode>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0003
     * @tc.name      Camera_AnimateSequence_0003
     * @tc.desc      animate ops frame emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0003 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      logInfo("steps after frame");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "frame:hide,frame:fade,frame:done");
      expect(actual).assertEqual("frame:hide,frame:fade,frame:done");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0004
     * @tc.name      Camera_AnimateSequence_0004
     * @tc.desc      animate ops frame>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0004 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("steps after frame>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "frame:hide,frame:fade,frame:done,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("frame:hide,frame:fade,frame:done,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0005
     * @tc.name      Camera_AnimateSequence_0005
     * @tc.desc      animate ops frame>mode>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0005 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("steps after frame>mode>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "frame:hide,frame:fade,frame:done,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("frame:hide,frame:fade,frame:done,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0006
     * @tc.name      Camera_AnimateSequence_0006
     * @tc.desc      animate ops switch emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0006 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      logInfo("steps after switch");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "switch:blurFirst,switch:blurFirst-anim,switch:blurSecond,switch:blurSecond-anim,switch:rotateFirst,switch:rotateFirst-anim,switch:rotateSecond,switch:rotateSecond-anim,switch:rotateSecond-done");
      expect(actual).assertEqual("switch:blurFirst,switch:blurFirst-anim,switch:blurSecond,switch:blurSecond-anim,switch:rotateFirst,switch:rotateFirst-anim,switch:rotateSecond,switch:rotateSecond-anim,switch:rotateSecond-done");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0007
     * @tc.name      Camera_AnimateSequence_0007
     * @tc.desc      animate ops switch>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0007 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onModeChange();
      logInfo("steps after switch>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "switch:blurFirst,switch:blurFirst-anim,switch:blurSecond,switch:blurSecond-anim,switch:rotateFirst,switch:rotateFirst-anim,switch:rotateSecond,switch:rotateSecond-anim,switch:rotateSecond-done,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("switch:blurFirst,switch:blurFirst-anim,switch:blurSecond,switch:blurSecond-anim,switch:rotateFirst,switch:rotateFirst-anim,switch:rotateSecond,switch:rotateSecond-anim,switch:rotateSecond-done,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0008
     * @tc.name      Camera_AnimateSequence_0008
     * @tc.desc      animate ops switch>mode>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0008 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("steps after switch>mode>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "switch:blurFirst,switch:blurFirst-anim,switch:blurSecond,switch:blurSecond-anim,switch:rotateFirst,switch:rotateFirst-anim,switch:rotateSecond,switch:rotateSecond-anim,switch:rotateSecond-done,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("switch:blurFirst,switch:blurFirst-anim,switch:blurSecond,switch:blurSecond-anim,switch:rotateFirst,switch:rotateFirst-anim,switch:rotateSecond,switch:rotateSecond-anim,switch:rotateSecond-done,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0009
     * @tc.name      Camera_AnimateSequence_0009
     * @tc.desc      animate ops capture emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0009 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      logInfo("steps after capture");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "capture:flash,capture:black,capture:done");
      expect(actual).assertEqual("capture:flash,capture:black,capture:done");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0010
     * @tc.name      Camera_AnimateSequence_0010
     * @tc.desc      animate ops capture>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0010 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("steps after capture>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "capture:flash,capture:black,capture:done,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("capture:flash,capture:black,capture:done,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0011
     * @tc.name      Camera_AnimateSequence_0011
     * @tc.desc      animate ops capture>mode>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0011 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("steps after capture>mode>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "capture:flash,capture:black,capture:done,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("capture:flash,capture:black,capture:done,mode:shot,mode:show,mode:blur,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0012
     * @tc.name      Camera_AnimateSequence_0012
     * @tc.desc      animate ops mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateSequence_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateSequence_0012 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      logInfo("steps after mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0013
     * @tc.name      Camera_AnimateSequence_0013
     * @tc.desc      animate ops mode>frame emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0013 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      logInfo("steps after mode>frame");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "mode:shot,mode:show,mode:blur,frame:hide,frame:fade,frame:done");
      expect(actual).assertEqual("mode:shot,mode:show,mode:blur,frame:hide,frame:fade,frame:done");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0014
     * @tc.name      Camera_AnimateSequence_0014
     * @tc.desc      animate ops mode>frame>mode emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0014 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("steps after mode>frame>mode");
      const actual: string = subject.steps();
      logInfo('actual=' + String(actual) + ', expected=' + "mode:shot,mode:show,mode:blur,frame:hide,frame:fade,frame:done,mode:shot,mode:show,mode:blur");
      expect(actual).assertEqual("mode:shot,mode:show,mode:blur,frame:hide,frame:fade,frame:done,mode:shot,mode:show,mode:blur");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSequence_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SEQUENCE_0015
     * @tc.name      Camera_AnimateSequence_0015
     * @tc.desc      animate ops frame>frame emit the documented callback order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSequence_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSequence_0015 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onFrameStart();
