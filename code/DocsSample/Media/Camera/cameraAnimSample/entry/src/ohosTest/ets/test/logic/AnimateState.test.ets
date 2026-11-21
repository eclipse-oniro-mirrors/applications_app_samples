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

/** AnimateStateTest logic checks (34 cases). */
export default function animateStateTest(): void {
  describe('AnimateStateTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0001
     * @tc.name      Camera_AnimateState_0001
     * @tc.desc      animate ops mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateState_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateState_0001 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      logInfo("state after mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0002
     * @tc.name      Camera_AnimateState_0002
     * @tc.desc      animate ops mode>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0002 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onModeChange();
      logInfo("state after mode>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0003
     * @tc.name      Camera_AnimateState_0003
     * @tc.desc      animate ops mode>mode>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0003 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("state after mode>mode>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0004
     * @tc.name      Camera_AnimateState_0004
     * @tc.desc      animate ops frame leave state "--:0:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0004 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      logInfo("state after frame");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "--:0:1:1:0");
      expect(actual).assertEqual("--:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0005
     * @tc.name      Camera_AnimateState_0005
     * @tc.desc      animate ops frame>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0005 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("state after frame>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0006
     * @tc.name      Camera_AnimateState_0006
     * @tc.desc      animate ops frame>mode>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0006 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("state after frame>mode>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0007
     * @tc.name      Camera_AnimateState_0007
     * @tc.desc      animate ops switch leave state "BK:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0007 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      logInfo("state after switch");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:0");
      expect(actual).assertEqual("BK:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0008
     * @tc.name      Camera_AnimateState_0008
     * @tc.desc      animate ops switch>mode leave state "BK:48:1:1:180".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0008 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onModeChange();
      logInfo("state after switch>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:180");
      expect(actual).assertEqual("BK:48:1:1:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0009
     * @tc.name      Camera_AnimateState_0009
     * @tc.desc      animate ops switch>mode>mode leave state "BK:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0009 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("state after switch>mode>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:0");
      expect(actual).assertEqual("BK:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0010
     * @tc.name      Camera_AnimateState_0010
     * @tc.desc      animate ops capture leave state "--:0:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0010 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      logInfo("state after capture");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "--:0:1:1:0");
      expect(actual).assertEqual("--:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0011
     * @tc.name      Camera_AnimateState_0011
     * @tc.desc      animate ops capture>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0011 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("state after capture>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0012
     * @tc.name      Camera_AnimateState_0012
     * @tc.desc      animate ops capture>mode>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateState_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateState_0012 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onModeChange();
      subject.onModeChange();
      logInfo("state after capture>mode>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0013
     * @tc.name      Camera_AnimateState_0013
     * @tc.desc      animate ops mode>frame leave state "--:0:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0013 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      logInfo("state after mode>frame");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "--:0:1:1:0");
      expect(actual).assertEqual("--:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0014
     * @tc.name      Camera_AnimateState_0014
     * @tc.desc      animate ops mode>frame>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0014 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("state after mode>frame>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0015
     * @tc.name      Camera_AnimateState_0015
     * @tc.desc      animate ops frame>frame leave state "--:0:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0015 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onFrameStart();
      logInfo("state after frame>frame");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "--:0:1:1:0");
      expect(actual).assertEqual("--:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0016
     * @tc.name      Camera_AnimateState_0016
     * @tc.desc      animate ops frame>frame>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0016 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("state after frame>frame>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0017
     * @tc.name      Camera_AnimateState_0017
     * @tc.desc      animate ops switch>frame leave state "--:0:1:1:180".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0017 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onFrameStart();
      logInfo("state after switch>frame");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "--:0:1:1:180");
      expect(actual).assertEqual("--:0:1:1:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0018
     * @tc.name      Camera_AnimateState_0018
     * @tc.desc      animate ops switch>frame>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateState_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateState_0018 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("state after switch>frame>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0019
     * @tc.name      Camera_AnimateState_0019
     * @tc.desc      animate ops capture>frame leave state "--:0:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0019 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onFrameStart();
      logInfo("state after capture>frame");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "--:0:1:1:0");
      expect(actual).assertEqual("--:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0020
     * @tc.name      Camera_AnimateState_0020
     * @tc.desc      animate ops capture>frame>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0020 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onFrameStart();
      subject.onModeChange();
      logInfo("state after capture>frame>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0021
     * @tc.name      Camera_AnimateState_0021
     * @tc.desc      animate ops mode>switch leave state "BK:48:1:1:180".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0021 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      logInfo("state after mode>switch");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:180");
      expect(actual).assertEqual("BK:48:1:1:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0022
     * @tc.name      Camera_AnimateState_0022
     * @tc.desc      animate ops mode>switch>mode leave state "BK:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0022 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onModeChange();
      logInfo("state after mode>switch>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:0");
      expect(actual).assertEqual("BK:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0023
     * @tc.name      Camera_AnimateState_0023
     * @tc.desc      animate ops frame>switch leave state "BK:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateState_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateState_0023 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onSwitchCamera();
      logInfo("state after frame>switch");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:0");
      expect(actual).assertEqual("BK:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0024
     * @tc.name      Camera_AnimateState_0024
     * @tc.desc      animate ops frame>switch>mode leave state "BK:48:1:1:180".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0024 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onModeChange();
      logInfo("state after frame>switch>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:180");
      expect(actual).assertEqual("BK:48:1:1:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0025
     * @tc.name      Camera_AnimateState_0025
     * @tc.desc      animate ops switch>switch leave state "BK:48:1:1:180".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0025 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("state after switch>switch");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:180");
      expect(actual).assertEqual("BK:48:1:1:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0026
     * @tc.name      Camera_AnimateState_0026
     * @tc.desc      animate ops switch>switch>mode leave state "BK:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0026 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onModeChange();
      logInfo("state after switch>switch>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:0");
      expect(actual).assertEqual("BK:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0027
     * @tc.name      Camera_AnimateState_0027
     * @tc.desc      animate ops capture>switch leave state "BK:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0027 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onSwitchCamera();
      logInfo("state after capture>switch");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:0");
      expect(actual).assertEqual("BK:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0028
     * @tc.name      Camera_AnimateState_0028
     * @tc.desc      animate ops capture>switch>mode leave state "BK:48:1:1:180".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0028 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onSwitchCamera();
      subject.onModeChange();
      logInfo("state after capture>switch>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "BK:48:1:1:180");
      expect(actual).assertEqual("BK:48:1:1:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0029
     * @tc.name      Camera_AnimateState_0029
     * @tc.desc      animate ops mode>capture leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0029 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onCaptureClick();
      logInfo("state after mode>capture");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0030
     * @tc.name      Camera_AnimateState_0030
     * @tc.desc      animate ops mode>capture>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0030 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("state after mode>capture>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0031
     * @tc.name      Camera_AnimateState_0031
     * @tc.desc      animate ops frame>capture leave state "--:0:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0031 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      logInfo("state after frame>capture");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "--:0:1:1:0");
      expect(actual).assertEqual("--:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0032
     * @tc.name      Camera_AnimateState_0032
     * @tc.desc      animate ops frame>capture>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0032 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("state after frame>capture>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0033
     * @tc.name      Camera_AnimateState_0033
     * @tc.desc      animate ops switch>capture leave state "B-:48:1:1:180".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateState_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateState_0033 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onCaptureClick();
      logInfo("state after switch>capture");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:180");
      expect(actual).assertEqual("B-:48:1:1:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_STATE_0034
     * @tc.name      Camera_AnimateState_0034
     * @tc.desc      animate ops switch>capture>mode leave state "B-:48:1:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateState_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateState_0034 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onCaptureClick();
      subject.onModeChange();
      logInfo("state after switch>capture>mode");
      const actual: string = subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "B-:48:1:1:0");
      expect(actual).assertEqual("B-:48:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateState_0034 end`);
    });
  });
}
